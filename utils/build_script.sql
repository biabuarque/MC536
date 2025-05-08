DROP TABLE IF EXISTS situacao CASCADE;
DROP TABLE IF EXISTS materia CASCADE;
DROP TABLE IF EXISTS aluno CASCADE;
DROP TABLE IF EXISTS turma CASCADE;
DROP TABLE IF EXISTS turno CASCADE;
DROP TABLE IF EXISTS serie CASCADE;
DROP TABLE IF EXISTS escola CASCADE;
DROP TABLE IF EXISTS parceria CASCADE;
DROP TABLE IF EXISTS osc CASCADE;
DROP TABLE IF EXISTS ambiente CASCADE;
DROP TABLE IF EXISTS distrito CASCADE;

CREATE TABLE distrito (
  nome_distrito VARCHAR(50) PRIMARY KEY,
  dre            VARCHAR(50) NOT NULL,
  subpref        VARCHAR(50) NOT NULL
);

CREATE TABLE osc (
  cnpj VARCHAR(50) PRIMARY KEY,
  nome VARCHAR(100) NOT NULL
);

CREATE TABLE parceria (
  protocolo          VARCHAR(50) PRIMARY KEY,
  osc_cnpj           VARCHAR(50) NOT NULL,
  valor_mensal       DOUBLE PRECISION,
  verba_locacao      DOUBLE PRECISION,
  valor_mensal_iptu  DOUBLE PRECISION,
  data_inicio        DATE,
  data_termino       DATE,
  CONSTRAINT fk_parceria_osc
    FOREIGN KEY (osc_cnpj) REFERENCES osc(cnpj)
);

CREATE TABLE escola (
  cod_inep        BIGINT,
  nome_distrito   VARCHAR(100) NOT NULL,
  protocolo       VARCHAR(100),
  tipo_esc        VARCHAR(100)  NOT NULL,
  nome_esc        VARCHAR(100)  PRIMARY KEY,
  rede            VARCHAR(100)   NOT NULL,
  CONSTRAINT fk_escola_distrito
    FOREIGN KEY (nome_distrito) REFERENCES distrito(nome_distrito),
  CONSTRAINT fk_escola_parceria
    FOREIGN KEY (protocolo)      REFERENCES parceria(protocolo)
);

CREATE TABLE ambiente (
  cod_amb    BIGINT PRIMARY KEY,
  nome_esc   VARCHAR(100) NOT NULL,
  desc_amb   VARCHAR(50) NOT NULL,
  capacidade VARCHAR(50),
  metragem   VARCHAR(50),
  CONSTRAINT fk_nome_esc
    FOREIGN KEY (nome_esc) REFERENCES escola(nome_esc)
);

CREATE TABLE serie (
  cod_serie      BIGINT PRIMARY KEY,
  descricao_serie VARCHAR(50) NOT NULL,
  modalidade     VARCHAR(50) NOT NULL
);

CREATE TABLE turno (
  cod_turno      BIGINT PRIMARY KEY,
  descricao_turno VARCHAR(50) NOT NULL
);

CREATE TABLE turma (
  nome_turma     VARCHAR(50) PRIMARY KEY,
  nome_esc       VARCHAR(100) NOT NULL,
  cod_turno      BIGINT NOT NULL,
  cod_serie      BIGINT NOT NULL,
  matriculados   INTEGER NOT NULL,
  vagas          INTEGER NOT NULL,
  tipo_turma     VARCHAR(50),
  etapa_ensino   VARCHAR(50),
  ciclo_ensino   VARCHAR(50),
  CONSTRAINT fk_turma_escola
    FOREIGN KEY (nome_esc) REFERENCES escola(nome_esc),
  CONSTRAINT fk_turma_turno
    FOREIGN KEY (cod_turno)       REFERENCES turno(cod_turno),
  CONSTRAINT fk_turma_serie
    FOREIGN KEY (cod_serie)       REFERENCES serie(cod_serie)
);

CREATE TABLE aluno (
  id_aluno    BIGINT PRIMARY KEY,
  nome_turma  VARCHAR(50) NOT NULL,
  nee         VARCHAR(50),
  raca_cor    VARCHAR(50),
  sexo        CHAR NOT NULL,
  pais_nasc   VARCHAR(100) NOT NULL,
  nascimento  DATE,
  CONSTRAINT fk_aluno_turma
    FOREIGN KEY (nome_turma) REFERENCES turma(nome_turma)
);

CREATE TABLE materia (
  cd_materia  BIGINT PRIMARY KEY,
  data_inicio DATE NOT NULL,
  data_final  DATE NOT NULL
);

CREATE TABLE situacao (
  id_situacao BIGINT PRIMARY KEY,
  id_aluno       BIGINT NOT NULL,
  cd_materia     BIGINT NOT NULL,
  desc_situacao  VARCHAR(50) NOT NULL,
  data_coleta    DATE,
  CONSTRAINT fk_situacao_aluno
    FOREIGN KEY (id_aluno)    REFERENCES aluno(id_aluno),
  CONSTRAINT fk_situacao_materia
    FOREIGN KEY (cd_materia)  REFERENCES materia(cd_materia)
);
