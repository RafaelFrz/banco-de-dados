--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Ubuntu 14.4-1.pgdg22.04+1)
-- Dumped by pg_dump version 14.4 (Ubuntu 14.4-1.pgdg22.04+1)

-- Started on 2022-07-01 17:56:35 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 17250)
-- Name: despesas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.despesas (
    id integer NOT NULL,
    valor numeric NOT NULL,
    data date,
    observacao character varying(200),
    pago boolean DEFAULT false NOT NULL,
    id_fornecedor integer,
    id_usuario integer NOT NULL
);


ALTER TABLE public.despesas OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17249)
-- Name: despesas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.despesas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.despesas_id_seq OWNER TO postgres;

--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 221
-- Name: despesas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.despesas_id_seq OWNED BY public.despesas.id;


--
-- TOC entry 212 (class 1259 OID 17191)
-- Name: endereco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.endereco (
    id integer NOT NULL,
    bairro character varying(200) NOT NULL,
    rua character varying(200) NOT NULL,
    numero integer NOT NULL,
    cidade character varying(200) NOT NULL,
    logradouro character varying(200),
    cep character varying(9)
);


ALTER TABLE public.endereco OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17265)
-- Name: endereco_fornecedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.endereco_fornecedor (
    id integer NOT NULL,
    id_fornecedor integer NOT NULL,
    id_endereco integer NOT NULL
);


ALTER TABLE public.endereco_fornecedor OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17264)
-- Name: endereco_fornecedor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.endereco_fornecedor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.endereco_fornecedor_id_seq OWNER TO postgres;

--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 223
-- Name: endereco_fornecedor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.endereco_fornecedor_id_seq OWNED BY public.endereco_fornecedor.id;


--
-- TOC entry 211 (class 1259 OID 17190)
-- Name: endereco_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.endereco_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.endereco_id_seq OWNER TO postgres;

--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 211
-- Name: endereco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.endereco_id_seq OWNED BY public.endereco.id;


--
-- TOC entry 226 (class 1259 OID 17282)
-- Name: endereco_pagador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.endereco_pagador (
    id integer NOT NULL,
    id_pagador integer NOT NULL,
    id_endereco integer NOT NULL
);


ALTER TABLE public.endereco_pagador OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17281)
-- Name: endereco_pagador_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.endereco_pagador_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.endereco_pagador_id_seq OWNER TO postgres;

--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 225
-- Name: endereco_pagador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.endereco_pagador_id_seq OWNED BY public.endereco_pagador.id;


--
-- TOC entry 218 (class 1259 OID 17222)
-- Name: fornecedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fornecedor (
    id integer NOT NULL,
    nome character varying(200) NOT NULL,
    telefone character varying(16),
    email character varying(200),
    cpf_cnpj character varying(18) NOT NULL
);


ALTER TABLE public.fornecedor OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17221)
-- Name: fornecedor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fornecedor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fornecedor_id_seq OWNER TO postgres;

--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 217
-- Name: fornecedor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fornecedor_id_seq OWNED BY public.fornecedor.id;


--
-- TOC entry 216 (class 1259 OID 17213)
-- Name: pagador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pagador (
    id integer NOT NULL,
    nome character varying(200) NOT NULL,
    telefone character varying(16),
    email character varying(200),
    cpf_cnpj character varying(18) NOT NULL
);


ALTER TABLE public.pagador OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17212)
-- Name: pagador_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pagador_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pagador_id_seq OWNER TO postgres;

--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 215
-- Name: pagador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pagador_id_seq OWNED BY public.pagador.id;


--
-- TOC entry 220 (class 1259 OID 17231)
-- Name: receitas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.receitas (
    id integer NOT NULL,
    valor numeric NOT NULL,
    data date,
    observacao character varying(200),
    id_pagador integer,
    id_tipo integer NOT NULL,
    id_usuario integer NOT NULL
);


ALTER TABLE public.receitas OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17230)
-- Name: receitas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.receitas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.receitas_id_seq OWNER TO postgres;

--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 219
-- Name: receitas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.receitas_id_seq OWNED BY public.receitas.id;


--
-- TOC entry 214 (class 1259 OID 17206)
-- Name: tipo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo (
    id integer NOT NULL,
    nome character varying(200) NOT NULL
);


ALTER TABLE public.tipo OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17205)
-- Name: tipo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_id_seq OWNER TO postgres;

--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 213
-- Name: tipo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_id_seq OWNED BY public.tipo.id;


--
-- TOC entry 210 (class 1259 OID 17180)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    nome character varying(200) NOT NULL,
    cpf character varying(14) NOT NULL,
    email character varying(200) NOT NULL,
    telefone character varying(16)
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17179)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_seq OWNER TO postgres;

--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 209
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- TOC entry 231 (class 1259 OID 17326)
-- Name: vw_cadastro_fornecedores; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_cadastro_fornecedores AS
 SELECT fornecedor.nome,
        CASE
            WHEN (length((fornecedor.cpf_cnpj)::text) > 14) THEN 'CNPJ'::text
            ELSE 'CPF'::text
        END AS tipo,
    fornecedor.cpf_cnpj
   FROM public.fornecedor;


ALTER TABLE public.vw_cadastro_fornecedores OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17322)
-- Name: vw_cadastro_pagadores; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_cadastro_pagadores AS
 SELECT pagador.nome,
        CASE
            WHEN (length((pagador.cpf_cnpj)::text) > 14) THEN 'CNPJ'::text
            ELSE 'CPF'::text
        END AS tipo,
    pagador.cpf_cnpj
   FROM public.pagador;


ALTER TABLE public.vw_cadastro_pagadores OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17308)
-- Name: vw_movimentacoes; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_movimentacoes AS
 SELECT r.id_usuario,
    'R'::text AS tipo,
    r.valor
   FROM public.receitas r
UNION ALL
 SELECT d.id_usuario,
    'D'::text AS tipo,
    d.valor
   FROM public.despesas d;


ALTER TABLE public.vw_movimentacoes OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17312)
-- Name: vw_saldo_usuarios; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_saldo_usuarios AS
 SELECT m.id_usuario,
    u.nome,
    sum(
        CASE
            WHEN (m.tipo = 'R'::text) THEN m.valor
            ELSE NULL::numeric
        END) AS receitas,
    sum(
        CASE
            WHEN (m.tipo = 'D'::text) THEN m.valor
            ELSE NULL::numeric
        END) AS despesas,
    sum(
        CASE
            WHEN (m.tipo = 'R'::text) THEN m.valor
            ELSE (m.valor * ('-1'::integer)::numeric)
        END) AS saldo
   FROM (public.vw_movimentacoes m
     JOIN public.usuario u ON ((u.id = m.id_usuario)))
  GROUP BY m.id_usuario, u.nome;


ALTER TABLE public.vw_saldo_usuarios OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17317)
-- Name: vw_tipos_por_usuario; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_tipos_por_usuario AS
SELECT
    NULL::character varying(200) AS nome,
    NULL::character varying(200) AS tipo,
    NULL::bigint AS quantidade_tipos;


ALTER TABLE public.vw_tipos_por_usuario OWNER TO postgres;

--
-- TOC entry 3275 (class 2604 OID 17253)
-- Name: despesas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.despesas ALTER COLUMN id SET DEFAULT nextval('public.despesas_id_seq'::regclass);


--
-- TOC entry 3270 (class 2604 OID 17194)
-- Name: endereco id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco ALTER COLUMN id SET DEFAULT nextval('public.endereco_id_seq'::regclass);


--
-- TOC entry 3277 (class 2604 OID 17268)
-- Name: endereco_fornecedor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco_fornecedor ALTER COLUMN id SET DEFAULT nextval('public.endereco_fornecedor_id_seq'::regclass);


--
-- TOC entry 3278 (class 2604 OID 17285)
-- Name: endereco_pagador id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco_pagador ALTER COLUMN id SET DEFAULT nextval('public.endereco_pagador_id_seq'::regclass);


--
-- TOC entry 3273 (class 2604 OID 17225)
-- Name: fornecedor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedor ALTER COLUMN id SET DEFAULT nextval('public.fornecedor_id_seq'::regclass);


--
-- TOC entry 3272 (class 2604 OID 17216)
-- Name: pagador id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagador ALTER COLUMN id SET DEFAULT nextval('public.pagador_id_seq'::regclass);


--
-- TOC entry 3274 (class 2604 OID 17234)
-- Name: receitas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receitas ALTER COLUMN id SET DEFAULT nextval('public.receitas_id_seq'::regclass);


--
-- TOC entry 3271 (class 2604 OID 17209)
-- Name: tipo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo ALTER COLUMN id SET DEFAULT nextval('public.tipo_id_seq'::regclass);


--
-- TOC entry 3269 (class 2604 OID 17183)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- TOC entry 3471 (class 0 OID 17250)
-- Dependencies: 222
-- Data for Name: despesas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.despesas VALUES (1, 200.00, '2022-05-15', 'Parcela telefone', true, 1, 1);
INSERT INTO public.despesas VALUES (3, 800.00, '2022-05-20', 'Entrada carteira', true, 2, 4);
INSERT INTO public.despesas VALUES (5, 500.00, '2022-05-06', 'Luz, água, internet', true, NULL, 2);
INSERT INTO public.despesas VALUES (6, 500.00, '2022-05-06', 'Aluguel', true, NULL, 2);
INSERT INTO public.despesas VALUES (7, 1200.00, '2022-05-20', 'Financiamento moto', false, NULL, 2);
INSERT INTO public.despesas VALUES (8, 50.00, '2022-05-07', 'RP no LoL', true, NULL, 1);
INSERT INTO public.despesas VALUES (9, 140.00, '2022-05-10', 'Rodizio de Sushi', true, NULL, 1);


--
-- TOC entry 3461 (class 0 OID 17191)
-- Dependencies: 212
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.endereco VALUES (6, 'Santo Antônio', 'Airton Senna', 228, 'Chapecó', 'da Paz', '64534-317');
INSERT INTO public.endereco VALUES (7, 'São Cristóvão', 'Dom Pedro I', 6236, 'Chapecó', 'Belo Horizonte', '29316-527');
INSERT INTO public.endereco VALUES (8, 'Vila Nova', 'Getulio Nunes', 538, 'Chapecó', 'Belo Horizonte', '76844-090');
INSERT INTO public.endereco VALUES (9, 'Industrial', 'Padre João Castro', 593, 'Chapecó', 'Quatorze', '37899-771');
INSERT INTO public.endereco VALUES (10, 'Industrial', 'Bispo José', 1592, 'Chapecó', 'Belo Horizonte', '69095-447');
INSERT INTO public.endereco VALUES (11, 'Boa Vista', 'Barão de Mauá', 8027, 'Chapecó', 'Castro Alves', '64039-348');


--
-- TOC entry 3473 (class 0 OID 17265)
-- Dependencies: 224
-- Data for Name: endereco_fornecedor; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3475 (class 0 OID 17282)
-- Dependencies: 226
-- Data for Name: endereco_pagador; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3467 (class 0 OID 17222)
-- Dependencies: 218
-- Data for Name: fornecedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fornecedor VALUES (1, 'Telefones S/A', '(83) 3943-9693', 'telefones@gmail.com.br', '57.161.649/0001-01');
INSERT INTO public.fornecedor VALUES (2, 'Havana', '(89) 2723-0980', 'josefa.carla.dasilva@gmail.com.br', '06.469.767/0001-40');
INSERT INTO public.fornecedor VALUES (3, 'Saúde.com', '(42) 3546-0376', 'saúde.com@gmail.com.br', '91.647.822/0001-14');
INSERT INTO public.fornecedor VALUES (4, 'Breno André Murilo Lopes', '(67) 98159-7915', 'breno-lopes72@centroin.com.br', '664.839.255-06');
INSERT INTO public.fornecedor VALUES (5, 'Sophia Emanuelly Nascimento', '(71) 98634-5762', 'sophia_emanuelly_nascimento@india.com', '667.599.259-71');
INSERT INTO public.fornecedor VALUES (6, 'Hugo Kauê Pinto', '(21) 99500-3666', 'hugo_kaue_pinto@oticascarol.com.br', '837.802.365-67');


--
-- TOC entry 3465 (class 0 OID 17213)
-- Dependencies: 216
-- Data for Name: pagador; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pagador VALUES (1, 'Heitor Danilo Araújo', '(61) 98453-4052', 'heitor-araujo78@recatec.com.br', '067.889.566-00');
INSERT INTO public.pagador VALUES (2, 'Priscila Renata Elisa Gonçalves', '(79) 99466-6684', 'priscila-goncalves77@accent.com.br', '985.491.964-10');
INSERT INTO public.pagador VALUES (3, 'Aurora Sophia Cavalcanti', '(65) 99920-8494', 'aurorasophiacavalcanti@gripoantonin.com', '355.262.619-05');
INSERT INTO public.pagador VALUES (4, 'Telefones S/A', '(83) 3943-9693', 'telefones@gmail.com.br', '57.161.649/0001-01');
INSERT INTO public.pagador VALUES (5, 'Havana', '(89) 2723-0980', 'josefa.carla.dasilva@gmail.com.br', '06.469.767/0001-40');
INSERT INTO public.pagador VALUES (6, 'Saúde.com', '(42) 3546-0376', 'saúde.com@gmail.com.br', '91.647.822/0001-14');


--
-- TOC entry 3469 (class 0 OID 17231)
-- Dependencies: 220
-- Data for Name: receitas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.receitas VALUES (1, 1800.00, '2022-05-05', 'Salário', 4, 1, 1);
INSERT INTO public.receitas VALUES (2, 200.00, '2022-05-02', 'Venda jogos', 1, 3, 4);
INSERT INTO public.receitas VALUES (4, 150.00, '2022-05-10', 'Venda jogos', 2, 3, 4);
INSERT INTO public.receitas VALUES (5, 400.00, '2022-05-13', 'Venda jogos', 3, 3, 4);
INSERT INTO public.receitas VALUES (7, 500.00, '2022-05-01', 'Saldo abril', NULL, 4, 4);
INSERT INTO public.receitas VALUES (8, 3000.00, '2022-05-05', 'Salário', 6, 1, 2);


--
-- TOC entry 3463 (class 0 OID 17206)
-- Dependencies: 214
-- Data for Name: tipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo VALUES (1, 'Salário');
INSERT INTO public.tipo VALUES (2, 'Investimentos');
INSERT INTO public.tipo VALUES (3, 'Vendas pessoais');
INSERT INTO public.tipo VALUES (4, 'Outros');


--
-- TOC entry 3459 (class 0 OID 17180)
-- Dependencies: 210
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuario VALUES (1, 'Enrico Fábio Novaes', '760.003.383-68', 'enricofabionovaes@nonesiglio.com.br', '(11) 99869-4111');
INSERT INTO public.usuario VALUES (2, 'Sérgio Antonio Elias Caldeira', '556.537.891-51', 'sergio.antonio.caldeira@alstom.com', '(95) 98625-1678');
INSERT INTO public.usuario VALUES (3, 'Yasmin Isadora Emily Castro', '118.565.924-21', 'yasmin_castro@eyejoy.com.br', '(31) 98796-5075');
INSERT INTO public.usuario VALUES (4, 'Sabrina Márcia Nunes', '013.085.503-08', 'sabrina.marcia.nunes@ipk.org.br', '(32) 98692-3405');
INSERT INTO public.usuario VALUES (5, 'Hadassa Camila Pereira', '886.258.496-28', 'hadassa_pereira@nogueiramoura.adv.br', '(91) 98703-5098');
INSERT INTO public.usuario VALUES (6, 'Gabriela Aline da Conceição', '089.306.318-51', 'gabriela-daconceicao82@sabesp.com.br', '(91) 99638-4811');
INSERT INTO public.usuario VALUES (7, 'Iago Jorge da Cruz', '520.365.406-94', 'iago.jorge.dacruz@rebecacometerra.com.br', '(82) 99470-3438');
INSERT INTO public.usuario VALUES (8, 'Sophia Tânia Melissa Souza', '980.241.562-61', 'sophia_souza@distribuidorapetfarm.com.br', '(47) 99515-5386');
INSERT INTO public.usuario VALUES (9, 'Bruno Raul Joaquim Mendes', '163.583.235-71', 'bruno_raul_mendes@orteca.com.br', '(93) 99659-1573');
INSERT INTO public.usuario VALUES (10, 'Giovana Fernanda Carla da Silva', '933.844.280-21', 'giovana_dasilva@supergasbras.com.br', '(96) 98125-9016');


--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 221
-- Name: despesas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.despesas_id_seq', 9, true);


--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 223
-- Name: endereco_fornecedor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.endereco_fornecedor_id_seq', 1, false);


--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 211
-- Name: endereco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.endereco_id_seq', 11, true);


--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 225
-- Name: endereco_pagador_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.endereco_pagador_id_seq', 1, false);


--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 217
-- Name: fornecedor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fornecedor_id_seq', 6, true);


--
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 215
-- Name: pagador_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pagador_id_seq', 6, true);


--
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 219
-- Name: receitas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.receitas_id_seq', 8, true);


--
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 213
-- Name: tipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_id_seq', 4, true);


--
-- TOC entry 3498 (class 0 OID 0)
-- Dependencies: 209
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_seq', 10, true);


--
-- TOC entry 3300 (class 2606 OID 17258)
-- Name: despesas despesas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.despesas
    ADD CONSTRAINT despesas_pkey PRIMARY KEY (id);


--
-- TOC entry 3302 (class 2606 OID 17270)
-- Name: endereco_fornecedor endereco_fornecedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco_fornecedor
    ADD CONSTRAINT endereco_fornecedor_pkey PRIMARY KEY (id);


--
-- TOC entry 3304 (class 2606 OID 17287)
-- Name: endereco_pagador endereco_pagador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco_pagador
    ADD CONSTRAINT endereco_pagador_pkey PRIMARY KEY (id);


--
-- TOC entry 3286 (class 2606 OID 17198)
-- Name: endereco endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id);


--
-- TOC entry 3294 (class 2606 OID 17229)
-- Name: fornecedor fornecedor_cpf_cnpj_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT fornecedor_cpf_cnpj_key UNIQUE (cpf_cnpj);


--
-- TOC entry 3296 (class 2606 OID 17227)
-- Name: fornecedor fornecedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT fornecedor_pkey PRIMARY KEY (id);


--
-- TOC entry 3290 (class 2606 OID 17220)
-- Name: pagador pagador_cpf_cnpj_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagador
    ADD CONSTRAINT pagador_cpf_cnpj_key UNIQUE (cpf_cnpj);


--
-- TOC entry 3292 (class 2606 OID 17218)
-- Name: pagador pagador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagador
    ADD CONSTRAINT pagador_pkey PRIMARY KEY (id);


--
-- TOC entry 3298 (class 2606 OID 17238)
-- Name: receitas receitas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receitas
    ADD CONSTRAINT receitas_pkey PRIMARY KEY (id);


--
-- TOC entry 3288 (class 2606 OID 17211)
-- Name: tipo tipo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo
    ADD CONSTRAINT tipo_pkey PRIMARY KEY (id);


--
-- TOC entry 3280 (class 2606 OID 17187)
-- Name: usuario usuario_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_cpf_key UNIQUE (cpf);


--
-- TOC entry 3282 (class 2606 OID 17189)
-- Name: usuario usuario_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_email_key UNIQUE (email);


--
-- TOC entry 3284 (class 2606 OID 17185)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 3455 (class 2618 OID 17320)
-- Name: vw_tipos_por_usuario _RETURN; Type: RULE; Schema: public; Owner: postgres
--

CREATE OR REPLACE VIEW public.vw_tipos_por_usuario AS
 SELECT usr.nome,
    tp.nome AS tipo,
    count(tp.id) AS quantidade_tipos
   FROM (((public.usuario usr
     JOIN public.receitas rct ON ((usr.id = rct.id_usuario)))
     JOIN public.despesas dps ON ((usr.id = dps.id_usuario)))
     JOIN public.tipo tp ON ((tp.id = rct.id_tipo)))
  GROUP BY usr.id, tp.nome, tp.id
  ORDER BY tp.id;


--
-- TOC entry 3311 (class 2606 OID 17276)
-- Name: endereco_fornecedor fk_endereco_to_endereco_fornecedor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco_fornecedor
    ADD CONSTRAINT fk_endereco_to_endereco_fornecedor FOREIGN KEY (id_endereco) REFERENCES public.endereco(id);


--
-- TOC entry 3313 (class 2606 OID 17293)
-- Name: endereco_pagador fk_endereco_to_endereco_pagador; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco_pagador
    ADD CONSTRAINT fk_endereco_to_endereco_pagador FOREIGN KEY (id_endereco) REFERENCES public.endereco(id);


--
-- TOC entry 3308 (class 2606 OID 17259)
-- Name: despesas fk_fonecedor_to_despesas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.despesas
    ADD CONSTRAINT fk_fonecedor_to_despesas FOREIGN KEY (id_fornecedor) REFERENCES public.fornecedor(id);


--
-- TOC entry 3310 (class 2606 OID 17271)
-- Name: endereco_fornecedor fk_fornecedor_to_endereco_fornecedor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco_fornecedor
    ADD CONSTRAINT fk_fornecedor_to_endereco_fornecedor FOREIGN KEY (id_fornecedor) REFERENCES public.fornecedor(id);


--
-- TOC entry 3312 (class 2606 OID 17288)
-- Name: endereco_pagador fk_pagador_to_endereco_pagador; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco_pagador
    ADD CONSTRAINT fk_pagador_to_endereco_pagador FOREIGN KEY (id_pagador) REFERENCES public.pagador(id);


--
-- TOC entry 3305 (class 2606 OID 17239)
-- Name: receitas fk_pagador_to_receitas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receitas
    ADD CONSTRAINT fk_pagador_to_receitas FOREIGN KEY (id_pagador) REFERENCES public.pagador(id);


--
-- TOC entry 3306 (class 2606 OID 17244)
-- Name: receitas fk_tipo_to_receitas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receitas
    ADD CONSTRAINT fk_tipo_to_receitas FOREIGN KEY (id_tipo) REFERENCES public.tipo(id);


--
-- TOC entry 3309 (class 2606 OID 17303)
-- Name: despesas fk_usuario_to_despesas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.despesas
    ADD CONSTRAINT fk_usuario_to_despesas FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 3307 (class 2606 OID 17298)
-- Name: receitas fk_usuario_to_pagador; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receitas
    ADD CONSTRAINT fk_usuario_to_pagador FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


-- Completed on 2022-07-01 17:56:37 -03

--
-- PostgreSQL database dump complete
--

