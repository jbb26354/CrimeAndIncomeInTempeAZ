/****** Add right edges */
select t.*, e.objectid, e.tlid, e.tfidl, e.tfidr, e.mtfcc, e.fullname, e.smid, 
       e.lfromadd, ltoadd, e.rfromadd, e.rtoadd, e.zipl, e.zipr, e.featcat, 
       e.roadflg, e.exttyp, e.tnidf, e.tnidt
into dbo.TempeFacesAndEdges
from dbo.edges e
inner join dbo.tempefaces t 
on t.tfid = e.tfidr
order by t.tract, t.block;

/* Add left edges */
insert into dbo.TempeFacesAndEdges
select t.*, e.objectid, e.tlid, e.tfidl, e.tfidr, e.mtfcc, e.fullname, e.smid, 
       e.lfromadd, ltoadd, e.rfromadd, e.rtoadd, e.zipl, e.zipr, e.featcat, 
       e.roadflg, e.exttyp, e.tnidf, e.tnidt
from dbo.edges e
inner join dbo.tempefaces t 
on t.tfid = e.tfidl
order by t.tract, t.block;

Select * from dbo.TempeFacesAndEdges 
order by tract, block;

delete
FROM [Census].[dbo].[TempeFacesAndEdges] 
where LTRIM(rtrim(fullname)) = '';

update [Census].[dbo].[TempeFacesAndEdges] 
set fullname = upper(LTRIM(rtrim(fullname)));