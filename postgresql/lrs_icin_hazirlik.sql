select st_length(intersection(y.poly, k.poly)), y.objectid, st_length(y.poly), k.koy_adi from geoyol y, geokoy_201802051522  k where st_intersects(y.poly, k.poly)

limit 100
