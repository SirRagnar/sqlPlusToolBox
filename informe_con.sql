SET LINES  100
SET PAGES  50000
SET HEADING ON
SET VERIFY OFF
-------------------------
-- Definici�n de columnas
-------------------------
COLUMN TABLA_FORANEA    FORMAT A20
COLUMN TABLE_NAME       FORMAT A20
COLUMN CONSTRAINT_NAME  FORMAT A20
COLUMN COLUMN_NAME      FORMAT A20
COLUMN SEARCH_CONDITION FORMAT A40
----------
-- Selects
----------
PROMPT CLAVES FOR�NEAS...
BREAK ON TABLE_NAME ON CONSTRAINT_NAME ON TABLA_FORANEA
SELECT A.TABLE_NAME, A.CONSTRAINT_NAME, 
       B.TABLE_NAME TABLA_FORANEA, C.COLUMN_NAME
FROM   USER_CONS_COLUMNS C, USER_CONSTRAINTS A, USER_CONSTRAINTS B
WHERE  A.R_CONSTRAINT_NAME = B.CONSTRAINT_NAME
  AND  A.CONSTRAINT_NAME   = C.CONSTRAINT_NAME
  AND  A.CONSTRAINT_TYPE   = 'R'
ORDER BY A.TABLE_NAME, A.CONSTRAINT_NAME, B.TABLE_NAME, C.POSITION
/
PROMPT ************************************************************
PROMPT CHECKS
SELECT TABLE_NAME, CONSTRAINT_NAME, SEARCH_CONDITION
FROM   USER_CONSTRAINTS
WHERE  CONSTRAINT_TYPE = 'C'
ORDER BY TABLE_NAME, CONSTRAINT_NAME
/
PROMPT ************************************************************
PROMPT CLAVES �NICAS
SELECT A.TABLE_NAME, A.CONSTRAINT_NAME, C.COLUMN_NAME
FROM   USER_CONS_COLUMNS C, USER_CONSTRAINTS A
WHERE  A.CONSTRAINT_NAME   = C.CONSTRAINT_NAME
  AND  A.CONSTRAINT_TYPE   = 'U'
ORDER BY A.TABLE_NAME, A.CONSTRAINT_NAME, C.POSITION
/
PROMPT ************************************************************
PROMPT �NDICES
SELECT A.TABLE_NAME, A.INDEX_NAME, C.COLUMN_NAME
FROM   USER_IND_COLUMNS C, USER_INDEXES A
WHERE  A.INDEX_NAME   = C.INDEX_NAME
--  AND  A.CONSTRAINT_TYPE   = 'U'
ORDER BY A.TABLE_NAME, A.INDEX_NAME, C.COLUMN_POSITION
/