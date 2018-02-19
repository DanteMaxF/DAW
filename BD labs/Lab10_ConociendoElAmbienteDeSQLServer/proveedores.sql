BULK INSERT a1207543.a1207543.Proveedores
   FROM 'e:\wwwroot\a1207543\proveedores.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )