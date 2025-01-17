PGDMP                         |            punto_venta    12.16    12.16 2    D           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            E           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            F           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            G           1262    16650    punto_venta    DATABASE     �   CREATE DATABASE punto_venta WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Mexico.1252' LC_CTYPE = 'Spanish_Mexico.1252';
    DROP DATABASE punto_venta;
                postgres    false                        2615    16688    pos    SCHEMA        CREATE SCHEMA pos;
    DROP SCHEMA pos;
                postgres    false            �            1259    24845 
   categorias    TABLE     �   CREATE TABLE pos.categorias (
    id integer NOT NULL,
    nombre character varying(200),
    activo bit(1) DEFAULT '1'::"bit",
    fecha_alta timestamp without time zone NOT NULL,
    fecha_edit timestamp without time zone
);
    DROP TABLE pos.categorias;
       pos         heap    postgres    false    8            �            1259    24843    categorias_id_seq    SEQUENCE     �   CREATE SEQUENCE pos.categorias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE pos.categorias_id_seq;
       pos          postgres    false    212    8            H           0    0    categorias_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE pos.categorias_id_seq OWNED BY pos.categorias.id;
          pos          postgres    false    211            �            1259    24854 	   productos    TABLE     �  CREATE TABLE pos.productos (
    id integer NOT NULL,
    codigo character varying(20),
    nombre character varying(200),
    precio_venta numeric(10,0),
    precio_compra numeric(10,0),
    existencias integer,
    stock_minimo integer,
    inventariable boolean,
    id_categoria integer,
    id_unidad integer,
    activo bit(1),
    fecha_alta timestamp with time zone NOT NULL,
    fecha_edit timestamp with time zone
);
    DROP TABLE pos.productos;
       pos         heap    postgres    false    8            �            1259    24852    productos_id_seq    SEQUENCE     �   CREATE SEQUENCE pos.productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE pos.productos_id_seq;
       pos          postgres    false    8    214            I           0    0    productos_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE pos.productos_id_seq OWNED BY pos.productos.id;
          pos          postgres    false    213            �            1259    16691    unidades    TABLE       CREATE TABLE pos.unidades (
    id integer NOT NULL,
    nombre character varying(100),
    nombre_corto character varying(100),
    activo bit(1) DEFAULT '1'::"bit",
    fecha_alta timestamp with time zone NOT NULL,
    fecha_edit timestamp with time zone
);
    DROP TABLE pos.unidades;
       pos         heap    postgres    false    8            �            1259    16689    unidades _id_seq    SEQUENCE     �   CREATE SEQUENCE pos."unidades _id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE pos."unidades _id_seq";
       pos          postgres    false    8    210            J           0    0    unidades _id_seq    SEQUENCE OWNED BY     @   ALTER SEQUENCE pos."unidades _id_seq" OWNED BY pos.unidades.id;
          pos          postgres    false    209            �            1259    16662 
   categorias    TABLE     �   CREATE TABLE public.categorias (
    id integer NOT NULL,
    nombre character varying(100),
    activo bit(1) DEFAULT '1'::"bit"
);
    DROP TABLE public.categorias;
       public         heap    postgres    false            �            1259    16660    categorias_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categorias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categorias_id_seq;
       public          postgres    false    206            K           0    0    categorias_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;
          public          postgres    false    205            �            1259    16671 	   productos    TABLE     o  CREATE TABLE public.productos (
    id integer NOT NULL,
    codigo character varying(20),
    nombre character varying(200),
    precio_venta numeric(10,0),
    precio_compra numeric(10,0),
    existencias integer,
    stock_minimo integer,
    inventariable boolean,
    id_categoria integer NOT NULL,
    id_unidad integer,
    activo bit(1) DEFAULT '1'::"bit"
);
    DROP TABLE public.productos;
       public         heap    postgres    false            �            1259    16669    productos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.productos_id_seq;
       public          postgres    false    208            L           0    0    productos_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;
          public          postgres    false    207            �            1259    16653 	   unidades     TABLE     �   CREATE TABLE public."unidades " (
    id integer NOT NULL,
    nombre character varying(100),
    nombre_corto character varying(100),
    activo bit(1) DEFAULT '1'::"bit",
    fecha_alta date,
    fecha_edit date NOT NULL
);
    DROP TABLE public."unidades ";
       public         heap    postgres    false            �            1259    16651    unidades _id_seq    SEQUENCE     �   CREATE SEQUENCE public."unidades _id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."unidades _id_seq";
       public          postgres    false    204            M           0    0    unidades _id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."unidades _id_seq" OWNED BY public."unidades ".id;
          public          postgres    false    203            �
           2604    24848    categorias id    DEFAULT     h   ALTER TABLE ONLY pos.categorias ALTER COLUMN id SET DEFAULT nextval('pos.categorias_id_seq'::regclass);
 9   ALTER TABLE pos.categorias ALTER COLUMN id DROP DEFAULT;
       pos          postgres    false    211    212    212            �
           2604    24857    productos id    DEFAULT     f   ALTER TABLE ONLY pos.productos ALTER COLUMN id SET DEFAULT nextval('pos.productos_id_seq'::regclass);
 8   ALTER TABLE pos.productos ALTER COLUMN id DROP DEFAULT;
       pos          postgres    false    214    213    214            �
           2604    16694    unidades id    DEFAULT     g   ALTER TABLE ONLY pos.unidades ALTER COLUMN id SET DEFAULT nextval('pos."unidades _id_seq"'::regclass);
 7   ALTER TABLE pos.unidades ALTER COLUMN id DROP DEFAULT;
       pos          postgres    false    210    209    210            �
           2604    16665    categorias id    DEFAULT     n   ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);
 <   ALTER TABLE public.categorias ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    205    206            �
           2604    16674    productos id    DEFAULT     l   ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);
 ;   ALTER TABLE public.productos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    208    208            �
           2604    16656    unidades  id    DEFAULT     p   ALTER TABLE ONLY public."unidades " ALTER COLUMN id SET DEFAULT nextval('public."unidades _id_seq"'::regclass);
 =   ALTER TABLE public."unidades " ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    203    204            ?          0    24845 
   categorias 
   TABLE DATA           M   COPY pos.categorias (id, nombre, activo, fecha_alta, fecha_edit) FROM stdin;
    pos          postgres    false    212   M9       A          0    24854 	   productos 
   TABLE DATA           �   COPY pos.productos (id, codigo, nombre, precio_venta, precio_compra, existencias, stock_minimo, inventariable, id_categoria, id_unidad, activo, fecha_alta, fecha_edit) FROM stdin;
    pos          postgres    false    214   �9       =          0    16691    unidades 
   TABLE DATA           Y   COPY pos.unidades (id, nombre, nombre_corto, activo, fecha_alta, fecha_edit) FROM stdin;
    pos          postgres    false    210   �9       9          0    16662 
   categorias 
   TABLE DATA           8   COPY public.categorias (id, nombre, activo) FROM stdin;
    public          postgres    false    206   �:       ;          0    16671 	   productos 
   TABLE DATA           �   COPY public.productos (id, codigo, nombre, precio_venta, precio_compra, existencias, stock_minimo, inventariable, id_categoria, id_unidad, activo) FROM stdin;
    public          postgres    false    208   �:       7          0    16653 	   unidades  
   TABLE DATA           _   COPY public."unidades " (id, nombre, nombre_corto, activo, fecha_alta, fecha_edit) FROM stdin;
    public          postgres    false    204   �:       N           0    0    categorias_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('pos.categorias_id_seq', 4, true);
          pos          postgres    false    211            O           0    0    productos_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('pos.productos_id_seq', 1, true);
          pos          postgres    false    213            P           0    0    unidades _id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('pos."unidades _id_seq"', 4, true);
          pos          postgres    false    209            Q           0    0    categorias_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.categorias_id_seq', 1, false);
          public          postgres    false    205            R           0    0    productos_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.productos_id_seq', 1, false);
          public          postgres    false    207            S           0    0    unidades _id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."unidades _id_seq"', 1, false);
          public          postgres    false    203            �
           2606    24851    categorias categorias_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY pos.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY pos.categorias DROP CONSTRAINT categorias_pkey;
       pos            postgres    false    212            �
           2606    16696    unidades unidades _pkey 
   CONSTRAINT     T   ALTER TABLE ONLY pos.unidades
    ADD CONSTRAINT "unidades _pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY pos.unidades DROP CONSTRAINT "unidades _pkey";
       pos            postgres    false    210            �
           2606    16668    categorias categorias_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categorias DROP CONSTRAINT categorias_pkey;
       public            postgres    false    206            �
           2606    16677    productos productos_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id_categoria);
 B   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pkey;
       public            postgres    false    208            �
           2606    16659    unidades  unidades _pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."unidades "
    ADD CONSTRAINT "unidades _pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."unidades " DROP CONSTRAINT "unidades _pkey";
       public            postgres    false    204            �
           2606    24858    productos fk_producto_categoria    FK CONSTRAINT     �   ALTER TABLE ONLY pos.productos
    ADD CONSTRAINT fk_producto_categoria FOREIGN KEY (id_categoria) REFERENCES pos.categorias(id);
 F   ALTER TABLE ONLY pos.productos DROP CONSTRAINT fk_producto_categoria;
       pos          postgres    false    2739    212    214            �
           2606    24863    productos fk_producto_unidad    FK CONSTRAINT     z   ALTER TABLE ONLY pos.productos
    ADD CONSTRAINT fk_producto_unidad FOREIGN KEY (id_unidad) REFERENCES pos.unidades(id);
 C   ALTER TABLE ONLY pos.productos DROP CONSTRAINT fk_producto_unidad;
       pos          postgres    false    2737    210    214            �
           2606    16678    productos fk_producto_categoria    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_producto_categoria FOREIGN KEY (id_categoria) REFERENCES public.categorias(id);
 I   ALTER TABLE ONLY public.productos DROP CONSTRAINT fk_producto_categoria;
       public          postgres    false    208    2733    206            �
           2606    16683    productos fk_producto_unidad    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_producto_unidad FOREIGN KEY (id_unidad) REFERENCES public."unidades "(id);
 F   ALTER TABLE ONLY public.productos DROP CONSTRAINT fk_producto_unidad;
       public          postgres    false    2731    208    204            ?   �   x�]�M
�@�ur�\���$���� nF����P��S7��,��]��	m86"$�����֭��T��}�z��S��q����	����v��H�=J�	�P���s�5�����qC�/D�t,.�      A      x������ � �      =   v   x�m�A
�0����)r���d�ٺo�&�H����]����{/e��Z��	����F}c]�e1x֦H5s�~ڷ�~��"76)�Ij�'�X�hH*�J�~^'�| ��&U      9      x������ � �      ;      x������ � �      7      x������ � �     