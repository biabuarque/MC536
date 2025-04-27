DROP TABLE IF EXISTS situacao;
DROP TABLE IF EXISTS materia;
DROP TABLE IF EXISTS aluno;
DROP TABLE IF EXISTS turma;
DROP TABLE IF EXISTS turno;
DROP TABLE IF EXISTS serie;
DROP TABLE IF EXISTS escola;
DROP TABLE IF EXISTS parceria;
DROP TABLE IF EXISTS osc;
DROP TABLE IF EXISTS ambiente;
DROP TABLE IF EXISTS distrito;

CREATE TABLE distrito (
  nome_distrito VARCHAR(30) PRIMARY KEY,
  dre            VARCHAR(10) NOT NULL,
  subpref        VARCHAR(20) NOT NULL
);

CREATE TABLE ambiente (
  cod_amb   INTEGER PRIMARY KEY,
  desc_amb  VARCHAR(50) NOT NULL,
  capacidade VARCHAR(50) NOT NULL,
  metragem  VARCHAR(50) NOT NULL
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
  data_inicio        DATE NOT NULL,
  data_termino       DATE NOT NULL,
  CONSTRAINT fk_parceria_osc
    FOREIGN KEY (osc_cnpj) REFERENCES osc(cnpj)
);

CREATE TABLE escola (
  cod_inep        INTEGER PRIMARY KEY,
  nome_distrito   VARCHAR(30) NOT NULL,
  cod_amb         INTEGER NOT NULL,
  protocolo       VARCHAR(50),
  tipo_esc        VARCHAR(10)  NOT NULL,
  nome_esc        VARCHAR(50)  NOT NULL,
  rede            VARCHAR(5)   NOT NULL,
  CONSTRAINT fk_escola_distrito
    FOREIGN KEY (nome_distrito) REFERENCES distrito(nome_distrito),
  CONSTRAINT fk_escola_ambiente
    FOREIGN KEY (cod_amb)        REFERENCES ambiente(cod_amb),
  CONSTRAINT fk_escola_parceria
    FOREIGN KEY (protocolo)      REFERENCES parceria(protocolo)
);

CREATE TABLE serie (
  cod_serie      INTEGER PRIMARY KEY,
  descricao_serie VARCHAR(10) NOT NULL,
  modalidade     VARCHAR(30) NOT NULL
);

CREATE TABLE turno (
  cod_turno      INTEGER PRIMARY KEY,
  descricao_turno VARCHAR(10) NOT NULL,
  periodo        VARCHAR(10) NOT NULL
);

CREATE TABLE turma (
  nome_turma     INTEGER PRIMARY KEY,
  cd_inep_escola INTEGER NOT NULL,
  cod_turno      INTEGER NOT NULL,
  cod_serie      INTEGER NOT NULL,
  matriculados   INTEGER NOT NULL,
  vagas          INTEGER NOT NULL,
  tipo_turma     VARCHAR(50) NOT NULL,
  etapa_ensino   VARCHAR(50) NOT NULL,
  ciclo_ensino   VARCHAR(50) NOT NULL,
  CONSTRAINT fk_turma_escola
    FOREIGN KEY (cd_inep_escola) REFERENCES escola(cod_inep),
  CONSTRAINT fk_turma_turno
    FOREIGN KEY (cod_turno)       REFERENCES turno(cod_turno),
  CONSTRAINT fk_turma_serie
    FOREIGN KEY (cod_serie)       REFERENCES serie(cod_serie)
);

CREATE TABLE aluno (
  id_aluno    INTEGER PRIMARY KEY,
  nome_turma  INTEGER NOT NULL,
  nee         VARCHAR(50),
  raca_cor    VARCHAR(50),
  sexo        CHAR NOT NULL,
  pais_nasc   VARCHAR(100) NOT NULL,
  nascimento  DATE NOT NULL,
  CONSTRAINT fk_aluno_turma
    FOREIGN KEY (nome_turma) REFERENCES turma(nome_turma)
);

CREATE TABLE materia (
  cd_materia  INTEGER PRIMARY KEY,
  data_inicio DATE NOT NULL,
  data_final  DATE NOT NULL
);

CREATE TABLE situacao (
  id_aluno       INTEGER NOT NULL,
  cd_materia     INTEGER NOT NULL,
  desc_situacao  VARCHAR(50) NOT NULL,
  data_coleta    DATE NOT NULL,
  CONSTRAINT fk_situacao_aluno
    FOREIGN KEY (id_aluno)    REFERENCES aluno(id_aluno),
  CONSTRAINT fk_situacao_materia
    FOREIGN KEY (cd_materia)  REFERENCES materia(cd_materia)
);
