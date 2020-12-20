--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

-- Started on 2020-12-20 14:22:26

CREATE DATABASE test_db;
\c test_db

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 16443)
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
                                 id integer NOT NULL,
                                 balance integer DEFAULT 0,
                                 client_id integer NOT NULL,
                                 closed boolean DEFAULT false NOT NULL
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16447)
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO postgres;

--
-- TOC entry 2843 (class 0 OID 0)
-- Dependencies: 197
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- TOC entry 198 (class 1259 OID 16449)
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
                                id integer NOT NULL,
                                name character varying(255),
                                email character varying(255),
                                phone character varying(255)
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16455)
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO postgres;

--
-- TOC entry 2844 (class 0 OID 0)
-- Dependencies: 199
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- TOC entry 200 (class 1259 OID 16457)
-- Name: money_changes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.money_changes (
                                      id integer NOT NULL,
                                      operation character varying NOT NULL,
                                      account_id integer NOT NULL,
                                      amount integer NOT NULL,
                                      transaction_id integer NOT NULL
);


ALTER TABLE public.money_changes OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16463)
-- Name: money_changes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.money_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.money_changes_id_seq OWNER TO postgres;

--
-- TOC entry 2845 (class 0 OID 0)
-- Dependencies: 201
-- Name: money_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.money_changes_id_seq OWNED BY public.money_changes.id;


--
-- TOC entry 202 (class 1259 OID 16465)
-- Name: transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transactions (
                                     id integer NOT NULL,
                                     message character varying(255) NOT NULL,
                                     error character varying(255)
);


ALTER TABLE public.transactions OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16471)
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_id_seq OWNER TO postgres;

--
-- TOC entry 2846 (class 0 OID 0)
-- Dependencies: 203
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;


--
-- TOC entry 2692 (class 2604 OID 16473)
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- TOC entry 2694 (class 2604 OID 16474)
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- TOC entry 2695 (class 2604 OID 16475)
-- Name: money_changes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.money_changes ALTER COLUMN id SET DEFAULT nextval('public.money_changes_id_seq'::regclass);


--
-- TOC entry 2696 (class 2604 OID 16476)
-- Name: transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);


--
-- TOC entry 2829 (class 0 OID 16443)
-- Dependencies: 196
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts (id, balance, client_id, closed) FROM stdin;
182	225	97	f
175	80	94	f
176	265	94	f
181	160	97	f
177	110	95	f
178	225	95	f
179	110	96	f
180	225	96	f
\.


--
-- TOC entry 2831 (class 0 OID 16449)
-- Dependencies: 198
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, name, email, phone) FROM stdin;
94	client1	mail@mail.com	phone712313
95	client1	mail@mail.com	phone712313
96	client1	mail@mail.com	phone712313
97	client1	mail@mail.com	phone712313
\.


--
-- TOC entry 2833 (class 0 OID 16457)
-- Dependencies: 200
-- Data for Name: money_changes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.money_changes (id, operation, account_id, amount, transaction_id) FROM stdin;
287	ADD	175	15	269
288	ADD	176	25	270
289	ADD	176	5	271
290	WITHDRAW	175	5	271
291	WITHDRAW	176	5	272
292	ADD	177	15	273
293	ADD	178	25	274
294	ADD	178	5	275
295	WITHDRAW	177	5	275
296	WITHDRAW	178	5	276
297	ADD	179	15	277
298	ADD	180	25	278
299	ADD	180	5	279
300	WITHDRAW	179	5	279
301	WITHDRAW	180	5	280
302	ADD	175	5	281
303	ADD	175	5	282
304	ADD	175	5	283
305	ADD	175	5	284
306	WITHDRAW	175	5	285
307	WITHDRAW	175	5	286
308	ADD	176	5	287
309	WITHDRAW	175	5	287
310	ADD	176	5	288
311	WITHDRAW	175	5	288
312	ADD	176	5	289
313	WITHDRAW	175	5	289
314	ADD	176	5	290
315	WITHDRAW	175	5	290
316	ADD	176	5	291
317	WITHDRAW	175	5	291
318	ADD	181	15	292
319	ADD	182	25	293
320	ADD	182	5	294
321	WITHDRAW	181	5	294
322	WITHDRAW	182	5	295
323	ADD	176	5	296
324	WITHDRAW	175	5	296
325	ADD	176	5	297
326	WITHDRAW	175	5	297
327	ADD	176	5	299
328	WITHDRAW	175	5	299
\.


--
-- TOC entry 2835 (class 0 OID 16465)
-- Dependencies: 202
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transactions (id, message) FROM stdin;
269	Add: 15 to the id(175) account. Current balance: 100
270	Add: 25 to the id(176) account. Current balance: 200
271	Transfer: 5 from {id(175), balance(115)} to {id(176), balance(225)} account
272	Withdraw: 5 from the id(176) account. Current balance: 230
273	Add: 15 to the id(177) account. Current balance: 100
274	Add: 25 to the id(178) account. Current balance: 200
275	Transfer: 5 from {id(177), balance(115)} to {id(178), balance(225)} account
276	Withdraw: 5 from the id(178) account. Current balance: 230
277	Add: 15 to the id(179) account. Current balance: 100
278	Add: 25 to the id(180) account. Current balance: 200
279	Transfer: 5 from {id(179), balance(115)} to {id(180), balance(225)} account
280	Withdraw: 5 from the id(180) account. Current balance: 230
281	Add: 5 to the id(175) account. Current balance: 110
282	Add: 5 to the id(175) account. Current balance: 115
283	Add: 5 to the id(175) account. Current balance: 120
284	Add: 5 to the id(175) account. Current balance: 125
285	Withdraw: 5 from the id(175) account. Current balance: 130
286	Withdraw: 5 from the id(175) account. Current balance: 125
287	Transfer: 5 from {id(175), balance(120)} to {id(176), balance(225)} account
288	Transfer: 5 from {id(175), balance(115)} to {id(176), balance(230)} account
289	Transfer: 5 from {id(175), balance(110)} to {id(176), balance(235)} account
290	Transfer: 5 from {id(175), balance(105)} to {id(176), balance(240)} account
291	Transfer: 5 from {id(175), balance(100)} to {id(176), balance(245)} account
292	Add: 15 to the id(181) account. Current balance: 100
293	Add: 25 to the id(182) account. Current balance: 200
294	Transfer: 5 from {id(181), balance(115)} to {id(182), balance(225)} account
295	Withdraw: 5 from the id(182) account. Current balance: 230
296	Transfer: 5 from {id(175), balance(95)} to {id(176), balance(250)} account
297	Transfer: 5 from {id(175), balance(90)} to {id(176), balance(255)} account
299	Transfer: 5 from {id(175), balance(85)} to {id(176), balance(260)} account
\.


--
-- TOC entry 2847 (class 0 OID 0)
-- Dependencies: 197
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_id_seq', 182, true);


--
-- TOC entry 2848 (class 0 OID 0)
-- Dependencies: 199
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_seq', 97, true);


--
-- TOC entry 2849 (class 0 OID 0)
-- Dependencies: 201
-- Name: money_changes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.money_changes_id_seq', 328, true);


--
-- TOC entry 2850 (class 0 OID 0)
-- Dependencies: 203
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transactions_id_seq', 299, true);


--
-- TOC entry 2698 (class 2606 OID 16478)
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 16480)
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 16482)
-- Name: money_changes money_changes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.money_changes
    ADD CONSTRAINT money_changes_pk PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 16484)
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 16485)
-- Name: accounts accounts_clients_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_clients_fk FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- TOC entry 2706 (class 2606 OID 16490)
-- Name: money_changes money_changes_accounts_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.money_changes
    ADD CONSTRAINT money_changes_accounts_fk FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- TOC entry 2707 (class 2606 OID 16495)
-- Name: money_changes money_changes_transactions_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.money_changes
    ADD CONSTRAINT money_changes_transactions_fk FOREIGN KEY (transaction_id) REFERENCES public.transactions(id);


-- Completed on 2020-12-20 14:22:26

--
-- PostgreSQL database dump complete
--
