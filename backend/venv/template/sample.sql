DROP TABLE IF EXISTS public.user_data;
CREATE TABLE user_data (
    id serial NOT NULL,
    email_address varchar,
    first_name varchar,
    last_name varchar,
);

INSERT INTO user_data VALUES (lazlocz@hotmail.com, laszlo, czinege)