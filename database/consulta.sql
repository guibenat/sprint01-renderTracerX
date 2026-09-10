USE render_trace;

-- exibir quais sensores não possuem tanques
SELECT id,
codigo,
CASE
	WHEN tanque_id IS NULL THEN 'Sem Monitoramento'
	END AS monitoramento
FROM sensor
WHERE tanque_id IS NULL;

-- Exibir os sensores com leituras criticas e a data de leitura
SELECT id,
sensor_id,
estado,
dt_leitura
FROM leitura_sensor
WHERE estado = 'critico';

-- Relatorio de entrada e saida do residuo
SELECT id,
tanque_id,
dt_entrada,
IFNULL(dt_saida, 'Residuo no tanque. Sem registro de saída') AS relatorio_saida
FROM periodo_armazenamento;


-- USUARIOS 
-- Exibir as informações dos usuários
SELECT id,
nome,
email,
dt_cadastro,
tipo,
CASE
	WHEN status = 1 THEN 'Ativo'
    WHEN status = 0 THEN 'Inativo'
END AS status
FROM usuario;

-- Exibir as informações de um usuário específico
SELECT id,
nome,
email,
dt_cadastro,
tipo,
CASE
	WHEN status = 1 THEN 'Ativo'
    WHEN status = 0 THEN 'Inativo'
END AS status
FROM usuario
WHERE id = 1;

-- EMPRESAS 
-- Exibir as infos das empresas ativas e inativas
SELECT id,
razao_social,
cnpj,
dt_cadastro,
CASE
	WHEN status = 1 THEN 'Ativo'
    WHEN status = 0 THEN 'Inativo'
END AS status
FROM empresa;

-- UNIDADES
-- Exibir as unidades de uma empresa especifica
SELECT * FROM unidade
WHERE empresa_id = 1;

-- Exibir dias, meses, anos da empresa cadastrado
SELECT id,
razao_social,
cnpj,
dt_cadastro,
 CASE
	WHEN status = 1 THEN 'Ativo'
    WHEN status = 0 THEN 'Inativo'
END AS status,
TIMESTAMPDIFF(DAY, dt_cadastro, NOW()) as dias_cadastrado,
TIMESTAMPDIFF(MONTH, dt_cadastro, NOW()) as meses_cadastrado,
TIMESTAMPDIFF(YEAR, dt_cadastro, NOW()) as anos_cadastrado
from empresa;


-- TANQUE -- 
-- Exibir a quantidade de tanques de uma unidade especifica
SELECT * 
FROM tanque
WHERE unidade_id = 2;

-- Exibir a altura e capacidade de cada tanque
SELECT id, 
altura,
capacidade
FROM tanque;

-- Exibir a altura e capacidade de cada tanque de uma unidade especifica
SELECT id,
altura,
capacidade
FROM tanque
WHERE unidade_id = 1;

-- Qual o tipo de residuo que cada tanque armazena
SELECT 
CONCAT('O tanque ', id, ' armazena: ', residuo) AS tipo
FROM tanque;

-- Exibir qual tanque está ativo ou inativo
SELECT id,
CASE	
	WHEN status = 1 THEN 'Ativo'
	WHEN status = 0 THEN 'Inativo'
END AS disponibilidade
FROM tanque;

-- Exibir localização do tanque
SELECT id,
unidade_id
FROM tanque;

-- SENSORES
-- Exibir qual sensor está instalado em cada tanque
SELECT id,
tanque_id
FROM sensor;

-- Exibir o codigo de cada sensor
SELECT id,
codigo
FROM sensor;

-- Exibir quando foi cadastrado
SELECT id,
codigo, 
dt_instalacao
FROM sensor;

-- Exibir a quantidade de dias e meses operante
SELECT id,
codigo,
TIMESTAMPDIFF(DAY, dt_instalacao, NOW()) AS dias_operando,
TIMESTAMPDIFF(MONTH, dt_instalacao, NOW()) AS meses_operando
FROM sensor;



-- LEITURA -- 
-- Exibir informações de leitura sobre o sensor 1
SELECT *
FROM leitura_sensor
WHERE sensor_id = 1;


-- Exibir ocorrencias criticas antes do dia 22-08-2026
SELECT * 
FROM leitura_sensor
WHERE estado = 'critico' AND
dt_leitura < '2026-08-22';

-- Exibir leitura do sensor 2 
SELECT 
CONCAT('O sensor ', sensor_id, ', apresenta um nível de: ', nivel_percentual,
'%, e o estado apresentado é: ', estado) AS relatorio
FROM leitura_sensor
WHERE sensor_id = 2;

-- Rastreabilidade de leituras do sensor 2
SELECT id,
sensor_id,
estado,
dt_leitura
FROM leitura_sensor
WHERE sensor_id = 2 AND 
estado = 'critico';

-- Exibir periodo de entrada de saida dos tanques
SELECT *,
IFNULL(dt_saida, 'Sem saída identificada') AS 'Monitoramento E/S'
FROM periodo_armazenamento;

-- Exibir quais periodos estão em andamento
SELECT * FROM periodo_armazenamento
WHERE dt_saida IS NULL;

-- Quando começou o periodo armazenamento 
SELECT id, 
tanque_id,
dt_entrada
FROM periodo_armazenamento;

