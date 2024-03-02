-- 生成者Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   时间:        2024-03-02 15:44:16 EST
--   站点:      Oracle Database 11g
--   类型:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE yjj_application (
    aid           INTEGER NOT NULL,
    adate         DATE,
    astatus       VARCHAR2(20 CHAR),
    aacceptance   CLOB,
    candidate_cid INTEGER NOT NULL,
    job_jid       INTEGER NOT NULL
);

ALTER TABLE yjj_application ADD CONSTRAINT application_pk PRIMARY KEY ( aid );

CREATE TABLE yjj_candidate (
    cid      INTEGER NOT NULL,
    cfname   VARCHAR2(20 CHAR),
    clname   VARCHAR2(20 CHAR),
    caddress CLOB,
    cemail   CLOB,
    cgender  CHAR(1),
    cage     INTEGER,
    cskill   CLOB,
    cpref    CLOB
);

ALTER TABLE yjj_candidate ADD CONSTRAINT candidate_pk PRIMARY KEY ( cid );

CREATE TABLE yjj_certification (
    certid         INTEGER NOT NULL,
    ccert_date     DATE,
    ccert_number   INTEGER,
    ccert_org      CLOB,
    ccert_end_date DATE,
    candidate_cid  INTEGER NOT NULL
);

ALTER TABLE yjj_certification ADD CONSTRAINT certification_pk PRIMARY KEY ( certid );

CREATE TABLE yjj_job (
    jid        INTEGER NOT NULL,
    jname      VARCHAR2(20 CHAR),
    jcompany   CLOB,
    jcity      VARCHAR2(20 CHAR),
    jstate     VARCHAR2(20 CHAR),
    jminsal    FLOAT,
    jmaxsal    FLOAT,
    jopendate  DATE,
    jclosedate DATE,
    jtype      VARCHAR2(20 CHAR),
    jterm      VARCHAR2(20 CHAR)
);

ALTER TABLE yjj_job ADD CONSTRAINT job_pk PRIMARY KEY ( jid );

CREATE TABLE yjj_job_state (
    job_jid   INTEGER NOT NULL,
    state_sid INTEGER NOT NULL
);

ALTER TABLE yjj_job_state ADD CONSTRAINT relation_4_pk PRIMARY KEY ( job_jid,
                                                                     state_sid );

CREATE TABLE yjj_state (
    sid   INTEGER NOT NULL,
    sname VARCHAR2(20 CHAR)
);

ALTER TABLE yjj_state ADD CONSTRAINT state_pk PRIMARY KEY ( sid );

ALTER TABLE yjj_application
    ADD CONSTRAINT application_candidate_fk FOREIGN KEY ( candidate_cid )
        REFERENCES yjj_candidate ( cid );

ALTER TABLE yjj_application
    ADD CONSTRAINT application_job_fk FOREIGN KEY ( job_jid )
        REFERENCES yjj_job ( jid );

ALTER TABLE yjj_certification
    ADD CONSTRAINT certification_candidate_fk FOREIGN KEY ( candidate_cid )
        REFERENCES yjj_candidate ( cid );

ALTER TABLE yjj_job_state
    ADD CONSTRAINT relation_4_job_fk FOREIGN KEY ( job_jid )
        REFERENCES yjj_job ( jid );

ALTER TABLE yjj_job_state
    ADD CONSTRAINT relation_4_state_fk FOREIGN KEY ( state_sid )
        REFERENCES yjj_state ( sid );



-- Oracle SQL Developer Data Modeler 概要报告: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             11
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
