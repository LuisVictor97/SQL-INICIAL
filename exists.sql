INSERT INTO TABELA_DE_VENDEDORES_FONTE
VALUES('239', 'Jose Maria', 0.12, TO_DATE('2018-01-01','YYYY-MM-DD'), 1, 'Tijuca');

SELECT V.MATRICULA AS MATRICULA_VENDEDORES
,TVF.MATRICULA AS MATRICULA_FONTE
,V.DE_FERIAS AS FERIAS_VENDEDORES
,TVF.DE_FERIAS AS FERIAS_FONTE
FROM VENDEDORES V RIGHT JOIN TABELA_DE_VENDEDORES_FONTE TVF ON SUBSTR(V.MATRICULA,3,3) = TVF.MATRICULA;

--EXISTS PODE SER UM SUBSTITUTO PARA O INNER JOIN

SELECT V.MATRICULA AS MATRICULA_VENDEDORES
,V.DE_FERIAS AS FERIAS_VENDEDORES
FROM VENDEDORES V
WHERE EXISTS
(SELECT 1 FROM TABELA_DE_VENDEDORES_FONTE TVF
WHERE SUBSTR(V.MATRICULA, 3, 3) = TVF.MATRICULA);

SELECT V.MATRICULA AS MATRICULA_VENDEDORES
,TVF.MATRICULA AS MATRICULA_FONTE
,V.DE_FERIAS AS FERIAS_VENDEDORES
,TVF.DE_FERIAS AS FERIAS_FONTE
FROM VENDEDORES V 
INNER JOIN TABELA_DE_VENDEDORES_FONTE TVF ON SUBSTR(V.MATRICULA,3,3) = TVF.MATRICULA;

UPDATE VENDEDORES V SET V.DE_FERIAS = 
(SELECT TVF.DE_FERIAS FROM TABELA_DE_VENDEDORES_FONTE TVF
WHERE SUBSTR(V.MATRICULA,3,3) = TVF.MATRICULA)
WHERE EXISTS
(SELECT 1 FROM TABELA_DE_VENDEDORES_FONTE TVF
WHERE SUBSTR(V.MATRICULA, 3,3) = TVF.MATRICULA);

UPDATE TABELA_DE_VENDEDORES_FONTE SET DE_FERIAS = 1 WHERE MATRICULA IN ('236','237');
