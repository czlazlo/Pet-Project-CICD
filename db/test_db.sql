PGDMP     )                    {        	   user_data     14.9 (Ubuntu 14.9-1.pgdg22.04+1)     15.4 (Ubuntu 15.4-1.pgdg22.04+1)                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16498 	   user_data    DATABASE     u   CREATE DATABASE user_data WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE user_data;
                lazlo    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false                       0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4            �            1259    16500 	   user_data    TABLE     �   CREATE TABLE public.user_data (
    id integer NOT NULL,
    email_address character varying,
    first_name character varying,
    last_name character varying
);
    DROP TABLE public.user_data;
       public         heap    lazlo    false    4            �            1259    16499    user_data_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.user_data_id_seq;
       public          lazlo    false    4    210                       0    0    user_data_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.user_data_id_seq OWNED BY public.user_data.id;
          public          lazlo    false    209            �           2604    16503    user_data id    DEFAULT     l   ALTER TABLE ONLY public.user_data ALTER COLUMN id SET DEFAULT nextval('public.user_data_id_seq'::regclass);
 ;   ALTER TABLE public.user_data ALTER COLUMN id DROP DEFAULT;
       public          lazlo    false    210    209    210                      0    16500 	   user_data 
   TABLE DATA           M   COPY public.user_data (id, email_address, first_name, last_name) FROM stdin;
    public          lazlo    false    210   �                  0    0    user_data_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.user_data_id_seq', 12, true);
          public          lazlo    false    209            �           2606    16507    user_data user_data_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.user_data
    ADD CONSTRAINT user_data_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.user_data DROP CONSTRAINT user_data_pkey;
       public            lazlo    false    210               V   x�%�A
�0ϛǈ���>ċԥZv��v�L���i�r�8�O�͍�d}J�e�,�6�L�?Q��\Z+��}=R����p:$�     