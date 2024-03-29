--
-- PostgreSQL database for pact broker and sonar.
--

BEGIN;

SET client_encoding = 'LATIN1';

CREATE USER pactbroker WITH ENCRYPTED PASSWORD 'pactbroker';
CREATE USER sonar WITH ENCRYPTED PASSWORD 'sonar';
CREATE USER apiuser WITH ENCRYPTED PASSWORD 'apiuser';

END;

CREATE DATABASE sonardb;
CREATE DATABASE pactbrokerdb;
CREATE DATABASE apidb;

BEGIN;
GRANT ALL PRIVILEGES ON DATABASE sonardb TO sonar;
GRANT ALL PRIVILEGES ON DATABASE pactbrokerdb TO pactbroker;
GRANT ALL PRIVILEGES ON DATABASE apidb TO apiuser;
GRANT ALL PRIVILEGES ON DATABASE sonardb TO root;
GRANT ALL PRIVILEGES ON DATABASE pactbrokerdb TO root;
GRANT ALL PRIVILEGES ON DATABASE apidb TO root;
END;