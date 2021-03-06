# --- !Ups

CREATE OR REPLACE FUNCTION SET_UPDATE_DATE()	
RETURNS TRIGGER AS $$
BEGIN
    NEW.updateDate = CURRENT_TIMESTAMP;;
    RETURN NEW;;
END;;
$$ language 'plpgsql';


DROP SEQUENCE IF EXISTS USER_ID_SEQUENCE;

CREATE SEQUENCE USER_ID_SEQUENCE INCREMENT BY 1 START WITH 1 NO CYCLE;

DROP TABLE IF EXISTS "USERS" CASCADE;

CREATE TABLE "USERS" (
    id           INTEGER      NOT NULL PRIMARY KEY DEFAULT NEXTVAL('USER_ID_SEQUENCE'),
    email        VARCHAR(255) NOT NULL,
    username     VARCHAR(100) NOT NULL,
    password     VARCHAR(255) NOT NULL,
    admin        INTEGER      NOT NULL default 0,
    createDate   TIMESTAMP    NOT NULL default CURRENT_TIMESTAMP,
    updateDate   TIMESTAMP    NOT NULL default CURRENT_TIMESTAMP
);

CREATE UNIQUE INDEX i_users_email on "USERS" (email);
CREATE UNIQUE INDEX i_username on "USERS" (username);

CREATE TRIGGER SET_USERS_UPDATE_DATE BEFORE UPDATE ON "USERS"
  FOR EACH ROW EXECUTE PROCEDURE SET_UPDATE_DATE();

# --- !Downs
 
DROP TABLE "USERS" CASCADE;
DROP SEQUENCE USER_ID_SEQUENCE;
DROP FUNCTION SET_UPDATE_DATE;
