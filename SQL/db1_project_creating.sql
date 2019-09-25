DELETE FROM spielplan;
DELETE FROM beteiligte;
DELETE FROM veranstaltungsort;
DELETE FROM nutzer;
DELETE FROM verstoss;
DELETE FROM spieler;
DELETE FROM mannschaft;

DROP TABLE spielplan;
DROP TABLE beteiligte;
DROP TABLE veranstaltungsort;
DROP TABLE nutzer;
DROP TABLE verstoss;
DROP TABLE spieler;
DROP TABLE mannschaft;

CREATE TABLE mannschaft(
    name VARCHAR2(32) PRIMARY KEY,
    gruppe CHAR(1) NOT NULL,
    wm_titel INTEGER DEFAULT 0);

CREATE TABLE veranstaltungsort(
    stadionname VARCHAR2(32) PRIMARY KEY,
    ort VARCHAR2(32) NOT NULL,
    zuschauerzahl INTEGER NOT NULL,
    eintrittspreis FLOAT);
    
CREATE TABLE nutzer(
    nutzername VARCHAR2(32) PRIMARY KEY,
    passwort VARCHAR2(32) NOT NULL,
    rolle VARCHAR2(32));
    
CREATE TABLE spieler(
    spieler_id INTEGER PRIMARY KEY,
    name VARCHAR2(32) NOT NULL,
    mannschaft VARCHAR2(32) NOT NULL,
    status VARCHAR2(32),
    CONSTRAINT mannschaftsname_fk FOREIGN KEY (mannschaft) REFERENCES mannschaft(name));
        
CREATE TABLE beteiligte(
    beteiligten_id INTEGER PRIMARY KEY,
    name VARCHAR2(32) NOT NULL,
    rolle VARCHAR2(32) NOT NULL,
    mannschaft VARCHAR2(32),
    CONSTRAINT mannschafts_zugehoerigkeit_fk FOREIGN KEY (mannschaft) REFERENCES mannschaft(name));
    
CREATE TABLE verstoss(
    verstoss_id INTEGER PRIMARY KEY,
    spieler_id INTEGER NOT NULL,
    gelbe_karte INTEGER DEFAULT 0,
    rote_karte INTEGER DEFAULT 0,
    beschreibung VARCHAR(64),    
    CONSTRAINT spieler_id_fk FOREIGN KEY (spieler_id) REFERENCES spieler(spieler_id));
    
CREATE TABLE spielplan(
    spielpaarung_id INTEGER PRIMARY KEY,
    datum DATE NOT NULL,
    veranstaltungsort VARCHAR2(32) NOT NULL,
    heimteam_name VARCHAR2(32) NOT NULL,
    gastteam_name VARCHAR2(32) NOT NULL,
    tore_heimteam INTEGER DEFAULT 0,
    tore_gastteam INTEGER DEFAULT 0,
    CONSTRAINT heimteam_name_fk FOREIGN KEY (heimteam_name) REFERENCES mannschaft(name),
    CONSTRAINT gastteam_name_fk FOREIGN KEY (gastteam_name) REFERENCES mannschaft(name),
    CONSTRAINT veranstaltungsort_fk FOREIGN KEY (veranstaltungsort) REFERENCES veranstaltungsort(stadionname));

create or replace TRIGGER check_verstoss_rote_karte_aiu
AFTER INSERT OR UPDATE OF
gelbe_karte, rote_karte
ON verstoss 
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
WHEN(new.rote_karte >= 0)
BEGIN
    IF :NEW.rote_karte > 0 THEN 
 
    UPDATE spieler SET status = :NEW.beschreibung
    WHERE spieler_id = :new.spieler_id;
    
    DBMS_OUTPUT.PUT_LINE('Spieler Nr. '||:new.spieler_id||' , neuer Status: '||:new.beschreibung||'!');

    END IF;
END;
