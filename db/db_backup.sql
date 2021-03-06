PGDMP     !    &                x           postgres    12.4    12.4 D    k           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            l           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            m           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            n           1262    13318    postgres    DATABASE     �   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE postgres;
                postgres    false            o           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    2926                        2615    24646    auth    SCHEMA        CREATE SCHEMA auth;
    DROP SCHEMA auth;
                postgres    false            
            2615    24674    client    SCHEMA        CREATE SCHEMA client;
    DROP SCHEMA client;
                postgres    false                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            p           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    1            �            1259    24671 
   user_login    TABLE     "   CREATE TABLE auth.user_login (
);
    DROP TABLE auth.user_login;
       auth         heap    postgres    false    7            �            1259    24647    user_type_id_seq    SEQUENCE     w   CREATE SEQUENCE auth.user_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE auth.user_type_id_seq;
       auth          postgres    false    7            �            1259    24649 	   user_type    TABLE     �   CREATE TABLE auth.user_type (
    id integer DEFAULT nextval('auth.user_type_id_seq'::regclass) NOT NULL,
    user_type character varying(25),
    description character varying(55)
);
    DROP TABLE auth.user_type;
       auth         heap    postgres    false    205    7            �            1259    24656    users_id_seq    SEQUENCE     s   CREATE SEQUENCE auth.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE auth.users_id_seq;
       auth          postgres    false    7            �            1259    24658    users    TABLE     �   CREATE TABLE auth.users (
    id bigint DEFAULT nextval('auth.users_id_seq'::regclass) NOT NULL,
    sgid character varying(8) NOT NULL,
    password character varying(50),
    user_type_id integer,
    is_deleted boolean
);
    DROP TABLE auth.users;
       auth         heap    postgres    false    207    7            �            1259    24707    description_id_seq    SEQUENCE     {   CREATE SEQUENCE client.description_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE client.description_id_seq;
       client          postgres    false    10            �            1259    24709    descriptions    TABLE       CREATE TABLE client.descriptions (
    id bigint DEFAULT nextval('client.description_id_seq'::regclass) NOT NULL,
    description character varying(255),
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    is_deleted boolean
);
     DROP TABLE client.descriptions;
       client         heap    postgres    false    216    10            �            1259    24675    intervals_id_seq    SEQUENCE     y   CREATE SEQUENCE client.intervals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE client.intervals_id_seq;
       client          postgres    false    10            �            1259    24677 	   intervals    TABLE     �   CREATE TABLE client.intervals (
    id bigint DEFAULT nextval('client.intervals_id_seq'::regclass) NOT NULL,
    interval_time_hrs integer,
    interval_desc character varying(50)
);
    DROP TABLE client.intervals;
       client         heap    postgres    false    210    10            �            1259    24698    machine_id_seq    SEQUENCE     w   CREATE SEQUENCE client.machine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE client.machine_id_seq;
       client          postgres    false    10            �            1259    24700    machines    TABLE     �   CREATE TABLE client.machines (
    id integer DEFAULT nextval('client.machine_id_seq'::regclass) NOT NULL,
    machine_name character varying(100),
    description character varying(55)
);
    DROP TABLE client.machines;
       client         heap    postgres    false    214    10            �            1259    24684    shifts_id_seq    SEQUENCE     v   CREATE SEQUENCE client.shifts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE client.shifts_id_seq;
       client          postgres    false    10            �            1259    24692    shifts    TABLE     �   CREATE TABLE client.shifts (
    id integer DEFAULT nextval('client.shifts_id_seq'::regclass) NOT NULL,
    shift_name character varying(25),
    start_time timestamp without time zone,
    end_time timestamp without time zone
);
    DROP TABLE client.shifts;
       client         heap    postgres    false    212    10            �            1259    24719    task_id_seq    SEQUENCE     t   CREATE SEQUENCE client.task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE client.task_id_seq;
       client          postgres    false    10            �            1259    24739    task_intervals_id_seq    SEQUENCE     ~   CREATE SEQUENCE client.task_intervals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE client.task_intervals_id_seq;
       client          postgres    false    10            �            1259    24721    tasks    TABLE     n  CREATE TABLE client.tasks (
    id bigint DEFAULT nextval('client.description_id_seq'::regclass) NOT NULL,
    task_name character varying(255),
    task_description character varying(255),
    image_link character varying(255),
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    modifiedby_id integer,
    is_deleted boolean
);
    DROP TABLE client.tasks;
       client         heap    postgres    false    216    10            �            1259    24741    tasks_intervals    TABLE     �   CREATE TABLE client.tasks_intervals (
    id bigint DEFAULT nextval('client.task_intervals_id_seq'::regclass) NOT NULL,
    task_id bigint,
    interval_id bigint
);
 #   DROP TABLE client.tasks_intervals;
       client         heap    postgres    false    220    10            \          0    24671 
   user_login 
   TABLE DATA           "   COPY auth.user_login  FROM stdin;
    auth          postgres    false    209   �H       Y          0    24649 	   user_type 
   TABLE DATA           =   COPY auth.user_type (id, user_type, description) FROM stdin;
    auth          postgres    false    206   I       [          0    24658    users 
   TABLE DATA           K   COPY auth.users (id, sgid, password, user_type_id, is_deleted) FROM stdin;
    auth          postgres    false    208   (I       d          0    24709    descriptions 
   TABLE DATA           W   COPY client.descriptions (id, description, date_from, date_to, is_deleted) FROM stdin;
    client          postgres    false    217   EI       ^          0    24677 	   intervals 
   TABLE DATA           I   COPY client.intervals (id, interval_time_hrs, interval_desc) FROM stdin;
    client          postgres    false    211   bI       b          0    24700    machines 
   TABLE DATA           A   COPY client.machines (id, machine_name, description) FROM stdin;
    client          postgres    false    215   I       `          0    24692    shifts 
   TABLE DATA           F   COPY client.shifts (id, shift_name, start_time, end_time) FROM stdin;
    client          postgres    false    213   �I       f          0    24721    tasks 
   TABLE DATA           {   COPY client.tasks (id, task_name, task_description, image_link, date_from, date_to, modifiedby_id, is_deleted) FROM stdin;
    client          postgres    false    219   �I       h          0    24741    tasks_intervals 
   TABLE DATA           C   COPY client.tasks_intervals (id, task_id, interval_id) FROM stdin;
    client          postgres    false    221   �I       q           0    0    user_type_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('auth.user_type_id_seq', 1, false);
          auth          postgres    false    205            r           0    0    users_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('auth.users_id_seq', 1, false);
          auth          postgres    false    207            s           0    0    description_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('client.description_id_seq', 1, false);
          client          postgres    false    216            t           0    0    intervals_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('client.intervals_id_seq', 1, false);
          client          postgres    false    210            u           0    0    machine_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('client.machine_id_seq', 1, false);
          client          postgres    false    214            v           0    0    shifts_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('client.shifts_id_seq', 1, false);
          client          postgres    false    212            w           0    0    task_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('client.task_id_seq', 1, false);
          client          postgres    false    218            x           0    0    task_intervals_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('client.task_intervals_id_seq', 1, false);
          client          postgres    false    220            �
           2606    24654    user_type user_type_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY auth.user_type
    ADD CONSTRAINT user_type_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY auth.user_type DROP CONSTRAINT user_type_pkey;
       auth            postgres    false    206            �
           2606    24663    users users_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY auth.users DROP CONSTRAINT users_pkey;
       auth            postgres    false    208            �
           2606    24714    descriptions descriptions_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY client.descriptions
    ADD CONSTRAINT descriptions_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY client.descriptions DROP CONSTRAINT descriptions_pkey;
       client            postgres    false    217            �
           2606    24682    intervals intervals_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY client.intervals
    ADD CONSTRAINT intervals_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY client.intervals DROP CONSTRAINT intervals_pkey;
       client            postgres    false    211            �
           2606    24705    machines machines_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY client.machines
    ADD CONSTRAINT machines_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY client.machines DROP CONSTRAINT machines_pkey;
       client            postgres    false    215            �
           2606    24697    shifts shifts_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY client.shifts
    ADD CONSTRAINT shifts_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY client.shifts DROP CONSTRAINT shifts_pkey;
       client            postgres    false    213            �
           2606    24746 $   tasks_intervals tasks_intervals_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY client.tasks_intervals
    ADD CONSTRAINT tasks_intervals_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY client.tasks_intervals DROP CONSTRAINT tasks_intervals_pkey;
       client            postgres    false    221            �
           2606    24729    tasks tasks_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY client.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY client.tasks DROP CONSTRAINT tasks_pkey;
       client            postgres    false    219            �
           1259    24655    user_type_id_idx    INDEX     B   CREATE INDEX user_type_id_idx ON auth.user_type USING btree (id);
 "   DROP INDEX auth.user_type_id_idx;
       auth            postgres    false    206            �
           1259    24669    users_id_idx    INDEX     :   CREATE INDEX users_id_idx ON auth.users USING btree (id);
    DROP INDEX auth.users_id_idx;
       auth            postgres    false    208            �
           1259    24670    users_sgid_idx    INDEX     >   CREATE INDEX users_sgid_idx ON auth.users USING btree (sgid);
     DROP INDEX auth.users_sgid_idx;
       auth            postgres    false    208            �
           1259    24715    description_id_idx    INDEX     I   CREATE INDEX description_id_idx ON client.descriptions USING btree (id);
 &   DROP INDEX client.description_id_idx;
       client            postgres    false    217            �
           1259    24716    descriptions_date_from_idx    INDEX     X   CREATE INDEX descriptions_date_from_idx ON client.descriptions USING btree (date_from);
 .   DROP INDEX client.descriptions_date_from_idx;
       client            postgres    false    217            �
           1259    24717    descriptions_date_to_idx    INDEX     T   CREATE INDEX descriptions_date_to_idx ON client.descriptions USING btree (date_to);
 ,   DROP INDEX client.descriptions_date_to_idx;
       client            postgres    false    217            �
           1259    24718    descriptions_is_deleted_idx    INDEX     Z   CREATE INDEX descriptions_is_deleted_idx ON client.descriptions USING btree (is_deleted);
 /   DROP INDEX client.descriptions_is_deleted_idx;
       client            postgres    false    217            �
           1259    24683    intervals_id_idx    INDEX     D   CREATE INDEX intervals_id_idx ON client.intervals USING btree (id);
 $   DROP INDEX client.intervals_id_idx;
       client            postgres    false    211            �
           1259    24706    machine_id_idx    INDEX     A   CREATE INDEX machine_id_idx ON client.machines USING btree (id);
 "   DROP INDEX client.machine_id_idx;
       client            postgres    false    215            �
           1259    24736    tasks_date_from_idx    INDEX     J   CREATE INDEX tasks_date_from_idx ON client.tasks USING btree (date_from);
 '   DROP INDEX client.tasks_date_from_idx;
       client            postgres    false    219            �
           1259    24737    tasks_date_to_idx    INDEX     F   CREATE INDEX tasks_date_to_idx ON client.tasks USING btree (date_to);
 %   DROP INDEX client.tasks_date_to_idx;
       client            postgres    false    219            �
           1259    24735    tasks_id_idx    INDEX     <   CREATE INDEX tasks_id_idx ON client.tasks USING btree (id);
     DROP INDEX client.tasks_id_idx;
       client            postgres    false    219            �
           1259    24738    tasks_is_deleted_idx    INDEX     L   CREATE INDEX tasks_is_deleted_idx ON client.tasks USING btree (is_deleted);
 (   DROP INDEX client.tasks_is_deleted_idx;
       client            postgres    false    219            �
           2606    24664    users users_user_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_user_type_id_fkey FOREIGN KEY (user_type_id) REFERENCES auth.user_type(id);
 E   ALTER TABLE ONLY auth.users DROP CONSTRAINT users_user_type_id_fkey;
       auth          postgres    false    206    208    2747            �
           2606    24752 0   tasks_intervals tasks_intervals_interval_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY client.tasks_intervals
    ADD CONSTRAINT tasks_intervals_interval_id_fkey FOREIGN KEY (interval_id) REFERENCES client.intervals(id);
 Z   ALTER TABLE ONLY client.tasks_intervals DROP CONSTRAINT tasks_intervals_interval_id_fkey;
       client          postgres    false    211    221    2754            �
           2606    24747 ,   tasks_intervals tasks_intervals_task_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY client.tasks_intervals
    ADD CONSTRAINT tasks_intervals_task_id_fkey FOREIGN KEY (task_id) REFERENCES client.tasks(id);
 V   ALTER TABLE ONLY client.tasks_intervals DROP CONSTRAINT tasks_intervals_task_id_fkey;
       client          postgres    false    221    219    2771            �
           2606    24730    tasks tasks_modifiedby_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY client.tasks
    ADD CONSTRAINT tasks_modifiedby_id_fkey FOREIGN KEY (modifiedby_id) REFERENCES auth.users(id);
 H   ALTER TABLE ONLY client.tasks DROP CONSTRAINT tasks_modifiedby_id_fkey;
       client          postgres    false    2750    219    208            \      x������ � �      Y      x������ � �      [      x������ � �      d      x������ � �      ^      x������ � �      b      x������ � �      `      x������ � �      f      x������ � �      h      x������ � �     