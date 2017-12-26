select 'ALTER TABLE '||'"'||table_name||'"'||' RENAME COLUMN '||'"'||column_name||'"'||' TO ' || lower(column_name)||';' 
from information_schema.columns 
where table_schema = 'public' and lower(column_name) != column_name
