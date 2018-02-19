BULK INSERT a1207543.a1207543.Proyectos
   FROM 'e:\wwwroot\a1207543\proyectos.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )