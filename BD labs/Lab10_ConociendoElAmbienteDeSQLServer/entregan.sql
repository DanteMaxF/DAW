SET DATEFORMAT dmy

BULK INSERT a1207543.a1207543.Entregan
   FROM 'e:\wwwroot\a1207543\entregan.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )