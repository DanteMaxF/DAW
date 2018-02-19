BULK INSERT a1207543.a1207543.Materiales
   FROM 'e:\wwwroot\a1207543\materiales.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )
