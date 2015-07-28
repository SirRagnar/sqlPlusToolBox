COLUMN COMMENTS FORMAT A60
SELECT V.VIEW_NAME, C.COMMENTS 
FROM   USER_VIEWS V, USER_TAB_COMMENTS C
WHERE  V.VIEW_NAME = C.TABLE_NAME (+)  
ORDER BY VIEW_NAME
/
