--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    name text,
    surname text,
    joining_date date,
    gender text,
    mentor_id integer
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: customerstrainings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customerstrainings (
    customer_id integer NOT NULL,
    training_id integer NOT NULL
);


ALTER TABLE public.customerstrainings OWNER TO postgres;

--
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    id integer NOT NULL,
    name text,
    city text
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.departments_id_seq OWNER TO postgres;

--
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;


--
-- Name: invoices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoices (
    id integer NOT NULL,
    name text,
    date date,
    amount double precision,
    customer_id integer
);


ALTER TABLE public.invoices OWNER TO postgres;

--
-- Name: invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.invoices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.invoices_id_seq OWNER TO postgres;

--
-- Name: invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.invoices_id_seq OWNED BY public.invoices.id;


--
-- Name: mentors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mentors (
    id integer NOT NULL,
    name text,
    surname text,
    joining_date date,
    department_id integer
);


ALTER TABLE public.mentors OWNER TO postgres;

--
-- Name: mentors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mentors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mentors_id_seq OWNER TO postgres;

--
-- Name: mentors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mentors_id_seq OWNED BY public.mentors.id;


--
-- Name: mentorstrainings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mentorstrainings (
    mentor_id integer NOT NULL,
    training_id integer NOT NULL
);


ALTER TABLE public.mentorstrainings OWNER TO postgres;

--
-- Name: notes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notes (
    id integer NOT NULL,
    date date,
    content text,
    trainings_history_id integer
);


ALTER TABLE public.notes OWNER TO postgres;

--
-- Name: notes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notes_id_seq OWNER TO postgres;

--
-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notes_id_seq OWNED BY public.notes.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    date date,
    amount double precision,
    invoice_id integer
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_id_seq OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- Name: payrolls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payrolls (
    id integer NOT NULL,
    date date,
    amount double precision,
    mentor_id integer
);


ALTER TABLE public.payrolls OWNER TO postgres;

--
-- Name: payrolls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payrolls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payrolls_id_seq OWNER TO postgres;

--
-- Name: payrolls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payrolls_id_seq OWNED BY public.payrolls.id;


--
-- Name: trainingmaterials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trainingmaterials (
    id integer NOT NULL,
    materials_link text
);


ALTER TABLE public.trainingmaterials OWNER TO postgres;

--
-- Name: trainingmaterials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trainingmaterials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.trainingmaterials_id_seq OWNER TO postgres;

--
-- Name: trainingmaterials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trainingmaterials_id_seq OWNED BY public.trainingmaterials.id;


--
-- Name: trainings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trainings (
    id integer NOT NULL,
    training_name text,
    price double precision,
    duration interval,
    training_material_id integer
);


ALTER TABLE public.trainings OWNER TO postgres;

--
-- Name: trainings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trainings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.trainings_id_seq OWNER TO postgres;

--
-- Name: trainings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trainings_id_seq OWNED BY public.trainings.id;


--
-- Name: trainingshistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trainingshistory (
    id integer NOT NULL,
    date_start date,
    date_end date,
    training_id integer,
    customer_id integer,
    mentor_id integer
);


ALTER TABLE public.trainingshistory OWNER TO postgres;

--
-- Name: trainingshistory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trainingshistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.trainingshistory_id_seq OWNER TO postgres;

--
-- Name: trainingshistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trainingshistory_id_seq OWNED BY public.trainingshistory.id;


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- Name: invoices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices ALTER COLUMN id SET DEFAULT nextval('public.invoices_id_seq'::regclass);


--
-- Name: mentors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mentors ALTER COLUMN id SET DEFAULT nextval('public.mentors_id_seq'::regclass);


--
-- Name: notes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notes ALTER COLUMN id SET DEFAULT nextval('public.notes_id_seq'::regclass);


--
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- Name: payrolls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payrolls ALTER COLUMN id SET DEFAULT nextval('public.payrolls_id_seq'::regclass);


--
-- Name: trainingmaterials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainingmaterials ALTER COLUMN id SET DEFAULT nextval('public.trainingmaterials_id_seq'::regclass);


--
-- Name: trainings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainings ALTER COLUMN id SET DEFAULT nextval('public.trainings_id_seq'::regclass);


--
-- Name: trainingshistory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainingshistory ALTER COLUMN id SET DEFAULT nextval('public.trainingshistory_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, name, surname, joining_date, gender, mentor_id) FROM stdin;
1	Alice	Johnson	2021-05-10	female	1
2	Bob	Smith	2021-06-15	male	2
3	Carol	Williams	2022-04-20	female	3
4	David	Brown	2023-07-01	male	1
\.


--
-- Data for Name: customerstrainings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customerstrainings (customer_id, training_id) FROM stdin;
1	1
1	2
2	2
2	3
3	1
3	3
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (id, name, city) FROM stdin;
1	HR	Warszawa
2	IT	Gdynia
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoices (id, name, date, amount, customer_id) FROM stdin;
1	FV/001	2023-05-20	1250.75	1
2	FV/002	2023-06-25	1450.5	2
3	FV/003	2023-04-30	1300	3
4	FV/004	2023-07-10	1150.25	1
\.


--
-- Data for Name: mentors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mentors (id, name, surname, joining_date, department_id) FROM stdin;
1	John	Doe	2023-01-15	1
2	Jane	Smith	2022-11-30	2
3	Michael	Johnson	2023-02-28	1
4	Emily	Brown	2022-10-20	2
\.


--
-- Data for Name: mentorstrainings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mentorstrainings (mentor_id, training_id) FROM stdin;
1	1
1	2
2	2
2	3
3	1
3	3
\.


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notes (id, date, content, trainings_history_id) FROM stdin;
1	2023-01-16	Day 1: Introduction to SQL and basic queries.	1
2	2023-01-17	Day 2: Advanced SQL techniques.	1
3	2023-02-02	Python basics and data analysis libraries.	2
4	2023-02-03	Data visualization with Python.	2
5	2023-03-11	Introduction to machine learning concepts.	3
6	2023-03-12	Supervised vs unsupervised learning.	3
7	2023-04-02	Setting up Django and creating models.	1
8	2023-04-03	Django views and templates.	3
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, date, amount, invoice_id) FROM stdin;
1	2023-06-11	1250.75	1
2	2023-06-30	1450.5	2
3	2023-05-11	700	3
4	2023-08-11	600	3
\.


--
-- Data for Name: payrolls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payrolls (id, date, amount, mentor_id) FROM stdin;
1	2024-01-25	1000	1
2	2024-02-24	1500	2
3	2024-03-01	1000	3
4	2024-03-14	2000	4
5	2024-05-25	3000	1
\.


--
-- Data for Name: trainingmaterials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trainingmaterials (id, materials_link) FROM stdin;
1	www.sample-url-1.com
2	www.sample-url-2.com
3	www.sample-url-3.com
\.


--
-- Data for Name: trainings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trainings (id, training_name, price, duration, training_material_id) FROM stdin;
1	Advanced SQL	199.99	20:00:00	1
2	Data Analysis with Python	299.99	60:00:00	2
3	Machine Learning Basics	399.99	40:00:00	3
\.


--
-- Data for Name: trainingshistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trainingshistory (id, date_start, date_end, training_id, customer_id, mentor_id) FROM stdin;
1	2023-01-15	2023-01-20	1	1	1
2	2023-02-01	2023-02-05	2	2	2
3	2023-03-10	2023-03-15	3	3	3
4	2023-04-01	2023-04-05	3	1	1
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 4, true);


--
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departments_id_seq', 2, true);


--
-- Name: invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.invoices_id_seq', 4, true);


--
-- Name: mentors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mentors_id_seq', 4, true);


--
-- Name: notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notes_id_seq', 8, true);


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 4, true);


--
-- Name: payrolls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payrolls_id_seq', 5, true);


--
-- Name: trainingmaterials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trainingmaterials_id_seq', 3, true);


--
-- Name: trainings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trainings_id_seq', 3, true);


--
-- Name: trainingshistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trainingshistory_id_seq', 4, true);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: customerstrainings customerstrainings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customerstrainings
    ADD CONSTRAINT customerstrainings_pkey PRIMARY KEY (customer_id, training_id);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: invoices invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);


--
-- Name: mentors mentors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mentors
    ADD CONSTRAINT mentors_pkey PRIMARY KEY (id);


--
-- Name: mentorstrainings mentorstrainings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mentorstrainings
    ADD CONSTRAINT mentorstrainings_pkey PRIMARY KEY (mentor_id, training_id);


--
-- Name: notes notes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: payrolls payrolls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payrolls
    ADD CONSTRAINT payrolls_pkey PRIMARY KEY (id);


--
-- Name: trainingmaterials trainingmaterials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainingmaterials
    ADD CONSTRAINT trainingmaterials_pkey PRIMARY KEY (id);


--
-- Name: trainings trainings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainings
    ADD CONSTRAINT trainings_pkey PRIMARY KEY (id);


--
-- Name: trainingshistory trainingshistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainingshistory
    ADD CONSTRAINT trainingshistory_pkey PRIMARY KEY (id);


--
-- Name: customers customers_mentor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_mentor_id_fkey FOREIGN KEY (mentor_id) REFERENCES public.mentors(id);


--
-- Name: customerstrainings customerstrainings_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customerstrainings
    ADD CONSTRAINT customerstrainings_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: customerstrainings customerstrainings_training_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customerstrainings
    ADD CONSTRAINT customerstrainings_training_id_fkey FOREIGN KEY (training_id) REFERENCES public.trainings(id);


--
-- Name: invoices invoices_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: mentors mentors_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mentors
    ADD CONSTRAINT mentors_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: mentorstrainings mentorstrainings_mentor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mentorstrainings
    ADD CONSTRAINT mentorstrainings_mentor_id_fkey FOREIGN KEY (mentor_id) REFERENCES public.mentors(id);


--
-- Name: mentorstrainings mentorstrainings_training_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mentorstrainings
    ADD CONSTRAINT mentorstrainings_training_id_fkey FOREIGN KEY (training_id) REFERENCES public.trainings(id);


--
-- Name: notes notes_trainings_history_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_trainings_history_id_fkey FOREIGN KEY (trainings_history_id) REFERENCES public.trainingshistory(id);


--
-- Name: payments payments_invoice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES public.invoices(id);


--
-- Name: payrolls payrolls_mentor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payrolls
    ADD CONSTRAINT payrolls_mentor_id_fkey FOREIGN KEY (mentor_id) REFERENCES public.mentors(id);


--
-- Name: trainings trainings_training_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainings
    ADD CONSTRAINT trainings_training_material_id_fkey FOREIGN KEY (training_material_id) REFERENCES public.trainingmaterials(id);


--
-- Name: trainingshistory trainingshistory_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainingshistory
    ADD CONSTRAINT trainingshistory_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: trainingshistory trainingshistory_mentor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainingshistory
    ADD CONSTRAINT trainingshistory_mentor_id_fkey FOREIGN KEY (mentor_id) REFERENCES public.mentors(id);


--
-- Name: trainingshistory trainingshistory_training_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainingshistory
    ADD CONSTRAINT trainingshistory_training_id_fkey FOREIGN KEY (training_id) REFERENCES public.trainings(id);


--
-- PostgreSQL database dump complete
--

