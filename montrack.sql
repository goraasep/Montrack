-- DROP SCHEMA montrack;

CREATE SCHEMA montrack AUTHORIZATION postgres;

-- DROP SEQUENCE montrack.goal_history_id_seq;

CREATE SEQUENCE montrack.goal_history_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE montrack.goals_id_seq;

CREATE SEQUENCE montrack.goals_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE montrack.language_id_seq;

CREATE SEQUENCE montrack.language_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE montrack.notification_id_seq;

CREATE SEQUENCE montrack.notification_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE montrack.pocket_id_seq;

CREATE SEQUENCE montrack.pocket_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE montrack.transaction_history_id_seq;

CREATE SEQUENCE montrack.transaction_history_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE montrack.user_id_seq;

CREATE SEQUENCE montrack.user_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE montrack.wallet_id_seq;

CREATE SEQUENCE montrack.wallet_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;-- montrack."language" definition

-- Drop table

-- DROP TABLE montrack."language";

CREATE TABLE montrack."language" (
	id serial4 NOT NULL,
	"name" varchar NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	deleted_at timestamp NULL,
	CONSTRAINT language_pkey PRIMARY KEY (id)
);


-- montrack."user" definition

-- Drop table

-- DROP TABLE montrack."user";

CREATE TABLE montrack."user" (
	id serial4 NOT NULL,
	"name" varchar(255) NOT NULL,
	email varchar(255) NOT NULL,
	"password" varchar(255) NOT NULL,
	pin int4 NOT NULL,
	"quote" text NULL,
	image_url text NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	deleted_at timestamp NULL,
	language_id int4 NULL,
	CONSTRAINT user_pkey PRIMARY KEY (id),
	CONSTRAINT user_language_id_fkey FOREIGN KEY (language_id) REFERENCES montrack."language"(id)
);


-- montrack.wallet definition

-- Drop table

-- DROP TABLE montrack.wallet;

CREATE TABLE montrack.wallet (
	id serial4 NOT NULL,
	user_id int4 NOT NULL,
	"name" varchar(255) NOT NULL,
	balance float8 DEFAULT 0 NOT NULL,
	is_active bool NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	deleted_at timestamp NULL,
	CONSTRAINT wallet_pkey PRIMARY KEY (id),
	CONSTRAINT wallet_user_id_fkey FOREIGN KEY (user_id) REFERENCES montrack."user"(id)
);


-- montrack.goal definition

-- Drop table

-- DROP TABLE montrack.goal;

CREATE TABLE montrack.goal (
	id int4 DEFAULT nextval('montrack.goals_id_seq'::regclass) NOT NULL,
	wallet_id int4 NOT NULL,
	"name" varchar(255) NOT NULL,
	amount float8 NOT NULL,
	description text NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	deleted_at timestamp NULL,
	image_url text NULL,
	CONSTRAINT goals_pkey PRIMARY KEY (id),
	CONSTRAINT goals_wallet_id_fkey FOREIGN KEY (wallet_id) REFERENCES montrack.wallet(id)
);


-- montrack.goal_history definition

-- Drop table

-- DROP TABLE montrack.goal_history;

CREATE TABLE montrack.goal_history (
	id serial4 NOT NULL,
	goal_id int4 NOT NULL,
	"name" varchar(255) NOT NULL,
	amount float8 NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	deleted_at timestamp NULL,
	CONSTRAINT goal_history_pkey PRIMARY KEY (id),
	CONSTRAINT goal_history_goal_id_fkey FOREIGN KEY (goal_id) REFERENCES montrack.goal(id)
);


-- montrack.notification definition

-- Drop table

-- DROP TABLE montrack.notification;

CREATE TABLE montrack.notification (
	id serial4 NOT NULL,
	user_id int4 NOT NULL,
	title varchar(255) NOT NULL,
	description text NOT NULL,
	is_read bool DEFAULT false NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	deleted_at timestamp NULL,
	CONSTRAINT notification_pkey PRIMARY KEY (id),
	CONSTRAINT notification_user_id_fkey FOREIGN KEY (user_id) REFERENCES montrack."user"(id)
);


-- montrack.pocket definition

-- Drop table

-- DROP TABLE montrack.pocket;

CREATE TABLE montrack.pocket (
	id serial4 NOT NULL,
	wallet_id int4 NOT NULL,
	"name" varchar(255) NOT NULL,
	balance float8 NOT NULL,
	description text NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	deleted_at timestamp NULL,
	emoji varchar(255) NULL,
	CONSTRAINT pocket_pkey PRIMARY KEY (id),
	CONSTRAINT pocket_wallet_id_fkey FOREIGN KEY (wallet_id) REFERENCES montrack.wallet(id)
);


-- montrack.transaction_history definition

-- Drop table

-- DROP TABLE montrack.transaction_history;

CREATE TABLE montrack.transaction_history (
	id serial4 NOT NULL,
	wallet_id int4 NOT NULL,
	amount float8 NOT NULL,
	is_income bool NOT NULL,
	description text NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	deleted_at timestamp NULL,
	pocket_id int4 NULL,
	transaction_date timestamp NOT NULL,
	CONSTRAINT transaction_history_pkey PRIMARY KEY (id),
	CONSTRAINT transaction_history_pocket_id_fkey FOREIGN KEY (pocket_id) REFERENCES montrack.pocket(id),
	CONSTRAINT transaction_history_wallet_id_fkey FOREIGN KEY (wallet_id) REFERENCES montrack.wallet(id)
);