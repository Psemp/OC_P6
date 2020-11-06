--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

-- Started on 2020-11-04 19:16:03

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

--
-- TOC entry 7 (class 2615 OID 34943)
-- Name: oc_p6_test; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA oc_p6_test;


ALTER SCHEMA oc_p6_test OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 34997)
-- Name: account; Type: TABLE; Schema: oc_p6_test; Owner: postgres
--

CREATE TABLE oc_p6_test.account (
    id integer NOT NULL,
    type character varying NOT NULL,
    phone_number character varying NOT NULL,
    email character varying NOT NULL,
    password_hash text NOT NULL
);


ALTER TABLE oc_p6_test.account OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 34944)
-- Name: address; Type: TABLE; Schema: oc_p6_test; Owner: postgres
--

CREATE TABLE oc_p6_test.address (
    id integer NOT NULL,
    street_name character varying NOT NULL,
    street_number integer NOT NULL,
    city character varying NOT NULL,
    zip_code integer NOT NULL,
    is_restaurant boolean NOT NULL,
    comment character varying
);


ALTER TABLE oc_p6_test.address OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 35018)
-- Name: customer; Type: TABLE; Schema: oc_p6_test; Owner: postgres
--

CREATE TABLE oc_p6_test.customer (
    id integer NOT NULL,
    address_id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL
);


ALTER TABLE oc_p6_test.customer OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 34960)
-- Name: ingredients; Type: TABLE; Schema: oc_p6_test; Owner: postgres
--

CREATE TABLE oc_p6_test.ingredients (
    id integer NOT NULL,
    name character varying NOT NULL,
    price real NOT NULL
);


ALTER TABLE oc_p6_test.ingredients OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 34989)
-- Name: order; Type: TABLE; Schema: oc_p6_test; Owner: postgres
--

CREATE TABLE oc_p6_test."order" (
    id integer NOT NULL,
    pizza_id character varying NOT NULL,
    date_ordered timestamp without time zone NOT NULL,
    is_paid boolean NOT NULL,
    is_delivery boolean NOT NULL,
    stage character varying NOT NULL,
    cx_comment character varying
);


ALTER TABLE oc_p6_test."order" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 35005)
-- Name: order_history; Type: TABLE; Schema: oc_p6_test; Owner: postgres
--

CREATE TABLE oc_p6_test.order_history (
    id integer NOT NULL,
    order_number integer NOT NULL
);


ALTER TABLE oc_p6_test.order_history OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 34973)
-- Name: pizza; Type: TABLE; Schema: oc_p6_test; Owner: postgres
--

CREATE TABLE oc_p6_test.pizza (
    id character varying NOT NULL,
    name character varying NOT NULL,
    price real NOT NULL
);


ALTER TABLE oc_p6_test.pizza OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 34968)
-- Name: quantity_stocks; Type: TABLE; Schema: oc_p6_test; Owner: postgres
--

CREATE TABLE oc_p6_test.quantity_stocks (
    restaurant_id integer NOT NULL,
    ingredient_id integer NOT NULL
);


ALTER TABLE oc_p6_test.quantity_stocks OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 34981)
-- Name: recipe; Type: TABLE; Schema: oc_p6_test; Owner: postgres
--

CREATE TABLE oc_p6_test.recipe (
    pizza_id character varying NOT NULL,
    recipe_webpage character varying NOT NULL,
    ingredient_list character varying NOT NULL
);


ALTER TABLE oc_p6_test.recipe OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 34952)
-- Name: restaurant; Type: TABLE; Schema: oc_p6_test; Owner: postgres
--

CREATE TABLE oc_p6_test.restaurant (
    id integer NOT NULL,
    address_id integer NOT NULL,
    name character varying NOT NULL,
    phone_number character varying NOT NULL,
    is_open boolean NOT NULL
);


ALTER TABLE oc_p6_test.restaurant OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 35010)
-- Name: staff; Type: TABLE; Schema: oc_p6_test; Owner: postgres
--

CREATE TABLE oc_p6_test.staff (
    id integer NOT NULL,
    place_of_work_id integer NOT NULL,
    role character varying NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    is_on_shift boolean NOT NULL
);


ALTER TABLE oc_p6_test.staff OWNER TO postgres;

--
-- TOC entry 2901 (class 0 OID 34997)
-- Dependencies: 210
-- Data for Name: account; Type: TABLE DATA; Schema: oc_p6_test; Owner: postgres
--

COPY oc_p6_test.account (id, type, phone_number, email, password_hash) FROM stdin;
1	Cx	630-555-1087	james.cole@somemail.com	some_hash_software_created
2	Staff	630-555-1319	kyle.slade@mental.com	some_hash_software_created
3	Cx	101-555-1399	jennifer.goines@primary.com	some_hash_software_created
4	Cx	630-555-1663	katarina.wagner@something.ger	some_hash_software_created
5	Staff	510-555-1951	olivia.kirschner@witness.com	some_hash_software_created
6	Staff	101-555-1453	leland.frost@markridge.gouv	some_hash_software_created
7	Staff	510-555-9109	mantis@fakemail.com	some_hash_software_created
8	Staff	101-555-1301	julian.adler@mit-edu.com	some_hash_software_created
9	Staff	510-555-9973	marker.aaron@fake-senate.gouv	some_hash_software_created
10	Staff	630-555-1949	robet_gale@fbi.gouv	some_hash_software_created
11	Cx	510-555-9059	sen.royce@senate.gouv	some_hash_software_created
12	Staff	510-555-2003	henri_toussaint@cdc.org	some_hash_software_created
13	Staff	101-555-9511	hannah_jones@zeit.ger	some_hash_software_created
14	Cx	101-555-9743	cassie@cdc.org	some_hash_software_created
15	Staff	630-555-1811	peters.o@markridge.gouv	some_hash_software_created
16	Staff	630-555-9199	deacon@west7.com	some_hash_software_created
17	Staff	630-555-9391	ssg.whitley@spearhead.org	some_hash_software_created
18	Staff	101-555-1997	col.jonathan_foster@spearhead.com	some_hash_software_created
19	Staff	101-555-1787	jose_ramse@bff.com	some_hash_software_created
\.


--
-- TOC entry 2894 (class 0 OID 34944)
-- Dependencies: 203
-- Data for Name: address; Type: TABLE DATA; Schema: oc_p6_test; Owner: postgres
--

COPY oc_p6_test.address (id, street_name, street_number, city, zip_code, is_restaurant, comment) FROM stdin;
1	Emerson Plaza	31	New-York	7630	f	Emerson Hotel - Room 607
2	5th Ave At 23rd St	175	New-York	7630	t	West VII Pizza
3	Milburn ave.	39000	Philadelphia	42101	f	J.D. Peoples Mental Hospital
4	New Brunswick ave.	530	New-York	7630	f	Raritan Research Laboratory
5	Elfreths Aly	126	Philadelphia	42101	t	Markridge-Group_Pizza
6	Jefferson Dr SW	1000	Washington DC	20510	t	Titan_Pizzeria
7	Capitol Driveway NW	1	Washington DC	20510	f	Senator Royce office
8	South 52nd Street	113	Philadelphia	42101	f	
\.


--
-- TOC entry 2904 (class 0 OID 35018)
-- Dependencies: 213
-- Data for Name: customer; Type: TABLE DATA; Schema: oc_p6_test; Owner: postgres
--

COPY oc_p6_test.customer (id, address_id, first_name, last_name) FROM stdin;
1	1	James	Cole
14	8	Cassandra	Railly
4	4	Katarina	Jones
3	3	Jennifer	Goines
11	7	William	Royce
\.


--
-- TOC entry 2896 (class 0 OID 34960)
-- Dependencies: 205
-- Data for Name: ingredients; Type: TABLE DATA; Schema: oc_p6_test; Owner: postgres
--

COPY oc_p6_test.ingredients (id, name, price) FROM stdin;
1	tomato_sauce	1
2	cheese	1.2
3	ham	1.6
4	olives	1.5
5	cream	1.9
\.


--
-- TOC entry 2900 (class 0 OID 34989)
-- Dependencies: 209
-- Data for Name: order; Type: TABLE DATA; Schema: oc_p6_test; Owner: postgres
--

COPY oc_p6_test."order" (id, pizza_id, date_ordered, is_paid, is_delivery, stage, cx_comment) FROM stdin;
1	2	2015-01-16 00:00:00	t	t	Delivered	
2	4	2015-01-23 00:00:00	t	t	Delivered	Add 13 olives
3	1	1947-03-13 00:00:00	t	t	Delivered	Pick me a pack of cigarrettes please
4	5	1961-06-20 00:00:00	t	t	Delivered	Send me a whiskey sour as well, thanks
5	4	2015-01-16 00:00:00	t	t	Delivered	Leave order at secretary desk
6	3	2020-10-07 00:00:00	t	f	Delivered	
7	1	1957-02-06 00:00:00	f	f	Unclaimed	No olives
8	4	2014-01-01 00:00:00	t	t	Delivered	
9	4	2015-03-20 00:00:00	t	t	Delivered	
10	5	1975-05-23 00:00:00	t	t	Delivered	Whiskey sour and make the margherita extra spicy for my friend Ramse
11	4	2043-02-22 00:00:00	f	t	Pre-Ordered	2 packs of smokes, and have Hannah deliver it please
\.


--
-- TOC entry 2902 (class 0 OID 35005)
-- Dependencies: 211
-- Data for Name: order_history; Type: TABLE DATA; Schema: oc_p6_test; Owner: postgres
--

COPY oc_p6_test.order_history (id, order_number) FROM stdin;
4	3
19	7
1	4
1	10
3	8
8	1
3	2
7	9
7	5
10	6
4	11
\.


--
-- TOC entry 2898 (class 0 OID 34973)
-- Dependencies: 207
-- Data for Name: pizza; Type: TABLE DATA; Schema: oc_p6_test; Owner: postgres
--

COPY oc_p6_test.pizza (id, name, price) FROM stdin;
1	Margherita	7
2	4 seasons	11
3	Veggie	13
4	Reina	13
5	4 fromaggi	11
\.


--
-- TOC entry 2897 (class 0 OID 34968)
-- Dependencies: 206
-- Data for Name: quantity_stocks; Type: TABLE DATA; Schema: oc_p6_test; Owner: postgres
--

COPY oc_p6_test.quantity_stocks (restaurant_id, ingredient_id) FROM stdin;
1	1
1	2
1	3
1	4
1	5
2	1
2	2
2	3
2	4
2	5
3	1
3	2
3	3
3	4
3	5
\.


--
-- TOC entry 2899 (class 0 OID 34981)
-- Dependencies: 208
-- Data for Name: recipe; Type: TABLE DATA; Schema: oc_p6_test; Owner: postgres
--

COPY oc_p6_test.recipe (pizza_id, recipe_webpage, ingredient_list) FROM stdin;
1	https://www.seashepherd.fr/	1;2
2	https://www.seashepherd.fr/	1;2;3;4
3	https://www.seashepherd.fr/	1;4
4	https://www.seashepherd.fr/	1;2;3
5	https://www.seashepherd.fr/	1;2
\.


--
-- TOC entry 2895 (class 0 OID 34952)
-- Dependencies: 204
-- Data for Name: restaurant; Type: TABLE DATA; Schema: oc_p6_test; Owner: postgres
--

COPY oc_p6_test.restaurant (id, address_id, name, phone_number, is_open) FROM stdin;
1	2	West-VII_OCP	630-555-1511	t
2	5	Markridge-Group_Pizza	101-555-1579	t
3	6	Titan_OCP	510-555-1709	f
\.


--
-- TOC entry 2903 (class 0 OID 35010)
-- Dependencies: 212
-- Data for Name: staff; Type: TABLE DATA; Schema: oc_p6_test; Owner: postgres
--

COPY oc_p6_test.staff (id, place_of_work_id, role, first_name, last_name, is_on_shift) FROM stdin;
16	1	Manager	Theodore	Deacon	t
6	2	Manager	Leland	Frost	t
5	3	Manager	Olivia	Kirschner	f
15	1	Cooks	Oliver	Peter	t
8	2	Cooks	Julian	Adler	t
7	3	Cooks	Vivan	Rutledge	f
9	3	Cashier	Aaron	Marker	f
10	1	Cashier	Robert	Gale	t
19	2	Cashier	Jose	Ramse	f
17	1	Cashier	Marcus	Whitley	f
18	2	Cashier	Jonathan	Foster	t
2	1	Delivery	Kyle	Slade	t
13	2	Delivery	Hannah	Jones	t
12	3	Delivery	Henri	Toussaint	f
\.


--
-- TOC entry 2750 (class 2606 OID 35004)
-- Name: account account_pk; Type: CONSTRAINT; Schema: oc_p6_test; Owner: postgres
--

ALTER TABLE ONLY oc_p6_test.account
    ADD CONSTRAINT account_pk PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 34951)
-- Name: address address_pk; Type: CONSTRAINT; Schema: oc_p6_test; Owner: postgres
--

ALTER TABLE ONLY oc_p6_test.address
    ADD CONSTRAINT address_pk PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 35025)
-- Name: customer customer_pk; Type: CONSTRAINT; Schema: oc_p6_test; Owner: postgres
--

ALTER TABLE ONLY oc_p6_test.customer
    ADD CONSTRAINT customer_pk PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 34967)
-- Name: ingredients ingredients_pk; Type: CONSTRAINT; Schema: oc_p6_test; Owner: postgres
--

ALTER TABLE ONLY oc_p6_test.ingredients
    ADD CONSTRAINT ingredients_pk PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 35009)
-- Name: order_history order_history_pk; Type: CONSTRAINT; Schema: oc_p6_test; Owner: postgres
--

ALTER TABLE ONLY oc_p6_test.order_history
    ADD CONSTRAINT order_history_pk PRIMARY KEY (id, order_number);


--
-- TOC entry 2748 (class 2606 OID 34996)
-- Name: order order_pk; Type: CONSTRAINT; Schema: oc_p6_test; Owner: postgres
--

ALTER TABLE ONLY oc_p6_test."order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 34980)
-- Name: pizza pizza_pk; Type: CONSTRAINT; Schema: oc_p6_test; Owner: postgres
--

ALTER TABLE ONLY oc_p6_test.pizza
    ADD CONSTRAINT pizza_pk PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 34972)
-- Name: quantity_stocks quantity_stocks_pk; Type: CONSTRAINT; Schema: oc_p6_test; Owner: postgres
--

ALTER TABLE ONLY oc_p6_test.quantity_stocks
    ADD CONSTRAINT quantity_stocks_pk PRIMARY KEY (restaurant_id, ingredient_id);


--
-- TOC entry 2746 (class 2606 OID 34988)
-- Name: recipe recipe_pk; Type: CONSTRAINT; Schema: oc_p6_test; Owner: postgres
--

ALTER TABLE ONLY oc_p6_test.recipe
    ADD CONSTRAINT recipe_pk PRIMARY KEY (pizza_id);


--
-- TOC entry 2738 (class 2606 OID 34959)
-- Name: restaurant restaurant_pk; Type: CONSTRAINT; Schema: oc_p6_test; Owner: postgres
--

ALTER TABLE ONLY oc_p6_test.restaurant
    ADD CONSTRAINT restaurant_pk PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 35017)
-- Name: staff staff_pk; Type: CONSTRAINT; Schema: oc_p6_test; Owner: postgres
--

ALTER TABLE ONLY oc_p6_test.staff
    ADD CONSTRAINT staff_pk PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 35071)
-- Name: customer account_customer_fk; Type: FK CONSTRAINT; Schema: oc_p6_test; Owner: postgres
--

ALTER TABLE ONLY oc_p6_test.customer
    ADD CONSTRAINT account_customer_fk FOREIGN KEY (id) REFERENCES oc_p6_test.account(id);


--
-- TOC entry 2763 (class 2606 OID 35076)
-- Name: order_history account_order_history_fk; Type: FK CONSTRAINT; Schema: oc_p6_test; Owner: postgres
--

ALTER TABLE ONLY oc_p6_test.order_history
    ADD CONSTRAINT account_order_history_fk FOREIGN KEY (id) REFERENCES oc_p6_test.account(id);


--
-- TOC entry 2765 (class 2606 OID 35066)
-- Name: staff account_staff_fk; Type: FK CONSTRAINT; Schema: oc_p6_test; Owner: postgres
--

ALTER TABLE ONLY oc_p6_test.staff
    ADD CONSTRAINT account_staff_fk FOREIGN KEY (id) REFERENCES oc_p6_test.account(id);


--
-- TOC entry 2766 (class 2606 OID 35026)
-- Name: customer address_customer_fk; Type: FK CONSTRAINT; Schema: oc_p6_test; Owner: postgres
--

ALTER TABLE ONLY oc_p6_test.customer
    ADD CONSTRAINT address_customer_fk FOREIGN KEY (address_id) REFERENCES oc_p6_test.address(id);


--
-- TOC entry 2757 (class 2606 OID 35031)
-- Name: restaurant address_restaurant_fk; Type: FK CONSTRAINT; Schema: oc_p6_test; Owner: postgres
--

ALTER TABLE ONLY oc_p6_test.restaurant
    ADD CONSTRAINT address_restaurant_fk FOREIGN KEY (address_id) REFERENCES oc_p6_test.address(id);


--
-- TOC entry 2759 (class 2606 OID 35046)
-- Name: quantity_stocks ingredients_quantity_stocks_fk; Type: FK CONSTRAINT; Schema: oc_p6_test; Owner: postgres
--

ALTER TABLE ONLY oc_p6_test.quantity_stocks
    ADD CONSTRAINT ingredients_quantity_stocks_fk FOREIGN KEY (ingredient_id) REFERENCES oc_p6_test.ingredients(id);


--
-- TOC entry 2762 (class 2606 OID 35061)
-- Name: order_history order_order_history_fk; Type: FK CONSTRAINT; Schema: oc_p6_test; Owner: postgres
--

ALTER TABLE ONLY oc_p6_test.order_history
    ADD CONSTRAINT order_order_history_fk FOREIGN KEY (order_number) REFERENCES oc_p6_test."order"(id);


--
-- TOC entry 2761 (class 2606 OID 35056)
-- Name: order pizza_order_fk; Type: FK CONSTRAINT; Schema: oc_p6_test; Owner: postgres
--

ALTER TABLE ONLY oc_p6_test."order"
    ADD CONSTRAINT pizza_order_fk FOREIGN KEY (pizza_id) REFERENCES oc_p6_test.pizza(id);


--
-- TOC entry 2760 (class 2606 OID 35051)
-- Name: recipe pizza_recipe_fk; Type: FK CONSTRAINT; Schema: oc_p6_test; Owner: postgres
--

ALTER TABLE ONLY oc_p6_test.recipe
    ADD CONSTRAINT pizza_recipe_fk FOREIGN KEY (pizza_id) REFERENCES oc_p6_test.pizza(id);


--
-- TOC entry 2758 (class 2606 OID 35041)
-- Name: quantity_stocks restaurant_quantity_stocks_fk; Type: FK CONSTRAINT; Schema: oc_p6_test; Owner: postgres
--

ALTER TABLE ONLY oc_p6_test.quantity_stocks
    ADD CONSTRAINT restaurant_quantity_stocks_fk FOREIGN KEY (restaurant_id) REFERENCES oc_p6_test.restaurant(id);


--
-- TOC entry 2764 (class 2606 OID 35036)
-- Name: staff restaurant_staff_fk; Type: FK CONSTRAINT; Schema: oc_p6_test; Owner: postgres
--

ALTER TABLE ONLY oc_p6_test.staff
    ADD CONSTRAINT restaurant_staff_fk FOREIGN KEY (place_of_work_id) REFERENCES oc_p6_test.restaurant(id);


-- Completed on 2020-11-04 19:16:03

--
-- PostgreSQL database dump complete
--

