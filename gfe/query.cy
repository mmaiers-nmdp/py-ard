MATCH (n:GFE)-[r]-(a:IPD_Allele)
where  "3350" in r.releases
RETURN n.name, n.locus, a.name
