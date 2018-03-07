En Fazla Maliyetli Eksik İndeksler

SELECT  TOP 10 
		[Total Cost]  = ROUND(avg_total_user_cost * avg_user_impact * (user_seeks + user_scans),0) 
		, avg_user_impact -- Query cost would reduce by this amount, on average.
		, TableName = statement
		, [EqualityUsage] = equality_columns 
		, [InequalityUsage] = inequality_columns
		, [Include Cloumns] = included_columns
FROM		sys.dm_db_missing_index_groups g 
INNER JOIN	sys.dm_db_missing_index_group_stats s ON s.group_handle = g.index_group_handle 
INNER JOIN	sys.dm_db_missing_index_details d ON d.index_handle = g.index_handle
ORDER BY [Total Cost] DESC;

En Fazla Maliyetli Kullanılmayan İndeksler

SELECT TOP 25
	o.name AS ObjectName
	, i.name AS IndexName
	, i.index_id AS IndexID
	, dm_ius.user_seeks AS UserSeek
	, dm_ius.user_scans AS UserScans
	, dm_ius.user_lookups AS UserLookups
	, dm_ius.user_updates AS UserUpdates
	, p.TableRows
	, 'DROP INDEX ' + QUOTENAME(i.name)+ ' ON ' + QUOTENAME(s.name) + '.' + QUOTENAME(OBJECT_NAME(dm_ius.OBJECT_ID)) AS 'drop statement'
FROM 
	sys.dm_db_index_usage_stats dm_ius
	INNER JOIN sys.indexes i ON i.index_id = dm_ius.index_id AND dm_ius.OBJECT_ID = i.OBJECT_ID
	INNER JOIN sys.objects o ON dm_ius.OBJECT_ID = o.OBJECT_ID
	INNER JOIN sys.schemas s ON o.schema_id = s.schema_id
	INNER JOIN (SELECT SUM(p.rows) TableRows, p.index_id, p.OBJECT_ID
				FROM sys.partitions p GROUP BY p.index_id, p.OBJECT_ID) p ON p.index_id = dm_ius.index_id AND dm_ius.OBJECT_ID = p.OBJECT_ID
WHERE 
	OBJECTPROPERTY(dm_ius.OBJECT_ID,'IsUserTable') = 1
	AND dm_ius.database_id = DB_ID()
	AND i.type_desc = 'nonclustered'
	AND i.is_primary_key = 0
	AND i.is_unique_constraint = 0
ORDER BY 
	(dm_ius.user_seeks + dm_ius.user_scans + dm_ius.user_lookups) ASC

(Kullanım İstatistiği Oluşmamış Indexler)
SELECT object_name(i.object_id) as tableName, i.name as indexName
FROM sys.indexes i
LEFT JOIN sys.dm_db_index_usage_stats s ON i.object_id = s.object_id AND i.index_id = s.index_id AND s.database_id = db_id()
WHERE objectproperty(i.object_id,'IsUserTable') = 1 and i.index_id> 0
AND s.object_id IS NULL
AND i.is_Primary_Key = 0
AND i.is_unique_constraint = 0
AND i.is_unique = 0
Logically Fragmented Indexes
Bölünmüş (Logically Fragmented) Indeksler
SELECT TOP 1 
		DatbaseName = DB_NAME()
		,TableName = OBJECT_NAME(s.[object_id])
		,IndexName = i.name
		,[Fragmentation %] = ROUND(avg_fragmentation_in_percent,2)
		--, *
INTO #TempFragmentation
FROM sys.dm_db_index_physical_stats(db_id(),null, null, null, null) s
INNER JOIN sys.indexes i ON s.[object_id] = i.[object_id] 
    AND s.index_id = i.index_id 
WHERE s.[object_id] = -999  -- Dummy value, just to get table structure.
;
EXEC sp_MSForEachDB	'USE [?]; 
-- Table already exists.
INSERT INTO #TempFragmentation 
SELECT TOP 10
		DatbaseName = DB_NAME()
		,TableName = OBJECT_NAME(s.[object_id])
		,IndexName = i.name
		,[Fragmentation %] = ROUND(avg_fragmentation_in_percent,2)
		--, *
FROM sys.dm_db_index_physical_stats(db_id(),null, null, null, null) s
INNER JOIN sys.indexes i ON s.[object_id] = i.[object_id] 
    AND s.index_id = i.index_id 
WHERE s.database_id = DB_ID() 
	  AND i.name IS NOT NULL	-- I.e. Ignore HEAP indexes.
    AND OBJECTPROPERTY(s.[object_id], ''IsMsShipped'') = 0
ORDER BY [Fragmentation %] DESC
;'

-- Select records.
SELECT TOP 10 * FROM #TempFragmentation ORDER BY [Fragmentation %] DESC
-- Tidy up.
DROP TABLE #TempFragmentation

En Fazla IO Maliyetli Sorgular
SELECT TOP 10 
        [Average IO] = (total_logical_reads + total_logical_writes) / qs.execution_count
		,[Total IO] = (total_logical_reads + total_logical_writes)
		,[Execution count] = qs.execution_count
        ,[Individual Query] = SUBSTRING (qt.text,qs.statement_start_offset/2, 
         (CASE WHEN qs.statement_end_offset = -1 
			THEN LEN(CONVERT(NVARCHAR(MAX), qt.text)) * 2 
          ELSE qs.statement_end_offset END - qs.statement_start_offset)/2) 
		,[Parent Query] = qt.text
		,DatabaseName = DB_NAME(qt.dbid)
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) as qt
--WHERE DB_NAME(qt.dbid) = 'pnl'  -- Filter on a given database.
ORDER BY [Average IO] DESC;

En Fazla CPU Maliyetli Sorgular


SELECT TOP 10 
		[Average CPU used] = total_worker_time / qs.execution_count
		,[Total CPU used] = total_worker_time
		,[Execution count] = qs.execution_count
        ,[Individual Query] = SUBSTRING (qt.text,qs.statement_start_offset/2, 
         (CASE WHEN qs.statement_end_offset = -1 
			THEN LEN(CONVERT(NVARCHAR(MAX), qt.text)) * 2 
          ELSE qs.statement_end_offset END - qs.statement_start_offset)/2)
		,[Parent Query] = qt.text
		,DatabaseName = DB_NAME(qt.dbid)
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) as qt
--WHERE DB_NAME(qt.dbid) = 'pnl'  -- Filter on a given database.
ORDER BY [Average CPU used] DESC;


En Fazla Çalıştırılan Sorgular
SELECT TOP 10 
		[Execution count] = execution_count
        ,[Individual Query] = SUBSTRING (qt.text,qs.statement_start_offset/2, 
         (CASE WHEN qs.statement_end_offset = -1 
			THEN LEN(CONVERT(NVARCHAR(MAX), qt.text)) * 2 
          ELSE qs.statement_end_offset END - qs.statement_start_offset)/2)
		,[Parent Query] = qt.text
		,DatabaseName = DB_NAME(qt.dbid)
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) as qt
--AND DB_NAME(qt.dbid) = 'pnl'  -- Filter on a given database.
ORDER BY [Execution count] DESC;

En Fazla Tıkanan Sorgular
SELECT TOP 10 
		[Average Time Blocked] = (total_elapsed_time - total_worker_time) / qs.execution_count
		,[Total Time Blocked] = total_elapsed_time - total_worker_time 
		,[Execution count] = qs.execution_count
        ,[Individual Query] = SUBSTRING (qt.text,qs.statement_start_offset/2, 
         (CASE WHEN qs.statement_end_offset = -1 
			THEN LEN(CONVERT(NVARCHAR(MAX), qt.text)) * 2 
          ELSE qs.statement_end_offset END - qs.statement_start_offset)/2) 
		,[Parent Query] = qt.text
		,DatabaseName = DB_NAME(qt.dbid)
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) as qt
--AND DB_NAME(qt.dbid) = 'pnl'  -- Filter on a given database.
ORDER BY [Average Time Blocked] DESC;

