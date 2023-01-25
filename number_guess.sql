--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guessing_game;
--
-- Name: number_guessing_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guessing_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guessing_game OWNER TO freecodecamp;

\connect number_guessing_game

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'nicofrancone', 4, 3);
INSERT INTO public.users VALUES (2, 'user_1674686588700', 1, 224);
INSERT INTO public.users VALUES (3, 'user_1674686588699', 1, 761);
INSERT INTO public.users VALUES (6, 'user_1674686911311', 2, 298);
INSERT INTO public.users VALUES (5, 'user_1674686911312', 5, 165);
INSERT INTO public.users VALUES (4, 'nico', 3, 1);
INSERT INTO public.users VALUES (8, 'user_1674687042663', 2, 103);
INSERT INTO public.users VALUES (7, 'user_1674687042664', 5, 81);
INSERT INTO public.users VALUES (10, 'user_1674687150262', 2, 304);
INSERT INTO public.users VALUES (9, 'user_1674687150263', 5, 374);
INSERT INTO public.users VALUES (12, 'user_1674687163039', 2, 193);
INSERT INTO public.users VALUES (11, 'user_1674687163040', 5, 101);
INSERT INTO public.users VALUES (13, 'h', 2, 2);
INSERT INTO public.users VALUES (15, 'user_1674687265844', 2, 378);
INSERT INTO public.users VALUES (14, 'user_1674687265845', 5, 396);
INSERT INTO public.users VALUES (17, 'user_1674687273990', 2, 390);
INSERT INTO public.users VALUES (16, 'user_1674687273991', 5, 206);
INSERT INTO public.users VALUES (19, 'user_1674687368036', 2, 751);
INSERT INTO public.users VALUES (18, 'user_1674687368037', 5, 212);
INSERT INTO public.users VALUES (20, 'florfrancone', 3, 3);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 20, true);


--
-- PostgreSQL database dump complete
--

