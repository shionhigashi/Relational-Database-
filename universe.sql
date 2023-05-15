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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(200) NOT NULL,
    size integer,
    description text,
    active boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: imaginary; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.imaginary (
    imaginary_id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_in_dream boolean
);


ALTER TABLE public.imaginary OWNER TO freecodecamp;

--
-- Name: imaginary_imaginary_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.imaginary_imaginary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.imaginary_imaginary_id_seq OWNER TO freecodecamp;

--
-- Name: imaginary_imaginary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.imaginary_imaginary_id_seq OWNED BY public.imaginary.imaginary_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(200) NOT NULL,
    planet_id integer,
    distance integer,
    has_animals boolean,
    has_atmosphere boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(200) NOT NULL,
    star_id integer,
    mass numeric,
    radius integer,
    has_plants boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(200) NOT NULL,
    galaxy_id integer,
    temperature numeric,
    age integer,
    sequence boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: imaginary imaginary_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.imaginary ALTER COLUMN imaginary_id SET DEFAULT nextval('public.imaginary_imaginary_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'pinwheel', 1, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'milky', 2, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'cartwheel', 3, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'sunflower', 4, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'cigar', 5, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'rose', 6, NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'needle', 7, NULL, NULL);
INSERT INTO public.galaxy VALUES (8, 'sculptor', 8, NULL, NULL);
INSERT INTO public.galaxy VALUES (9, 'tulip', 9, NULL, NULL);
INSERT INTO public.galaxy VALUES (10, 'canes', 10, NULL, NULL);
INSERT INTO public.galaxy VALUES (11, 'ruel', 10, NULL, NULL);
INSERT INTO public.galaxy VALUES (12, 'whirlpool', 12, NULL, NULL);
INSERT INTO public.galaxy VALUES (13, 'birth', 13, NULL, NULL);
INSERT INTO public.galaxy VALUES (14, 'chif', 14, NULL, NULL);
INSERT INTO public.galaxy VALUES (15, 'faith', 15, NULL, NULL);
INSERT INTO public.galaxy VALUES (16, 'mule', 16, NULL, NULL);
INSERT INTO public.galaxy VALUES (17, 'miss', 17, NULL, NULL);
INSERT INTO public.galaxy VALUES (18, 'posh', 18, NULL, NULL);
INSERT INTO public.galaxy VALUES (19, 'wool', 19, NULL, NULL);
INSERT INTO public.galaxy VALUES (20, 'lolly', 20, NULL, NULL);


--
-- Data for Name: imaginary; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.imaginary VALUES (1, 'x', NULL);
INSERT INTO public.imaginary VALUES (2, 'y', NULL);
INSERT INTO public.imaginary VALUES (3, 'z', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'elara', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'atlas', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'helene', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'ariel', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'dione', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'portia', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'phoebe', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'rachel', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'chloe', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'lila', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'apollo', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'artemis', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'druca', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'athena', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'ares', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'wolf', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'snow', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'hunter', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'corn', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'polly', NULL, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'venus', 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'earth', 2, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'neptune', 3, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'saturn', 4, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'pluto', 5, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'jupiter', 6, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'mars', 7, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'ceres', 8, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'eris', 9, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'uranus', 10, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'planetx', 11, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'planety', 12, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'planetz', 13, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (14, 'lalaland', 14, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (15, 'smurfland', 15, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (16, 'dreamland', 16, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (17, 'heaven', 17, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (18, 'hell', 18, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (19, 'imaginary', 19, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (20, 'real', 20, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'kiki', 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES (2, 'lala', 2, NULL, NULL, NULL);
INSERT INTO public.star VALUES (3, 'mimi', 3, NULL, NULL, NULL);
INSERT INTO public.star VALUES (4, 'sasa', 4, NULL, NULL, NULL);
INSERT INTO public.star VALUES (5, 'fufu', 5, NULL, NULL, NULL);
INSERT INTO public.star VALUES (6, 'bibi', 6, NULL, NULL, NULL);
INSERT INTO public.star VALUES (7, 'fifi', 7, NULL, NULL, NULL);
INSERT INTO public.star VALUES (8, 'riri', 8, NULL, NULL, NULL);
INSERT INTO public.star VALUES (9, 'rarar', 9, NULL, NULL, NULL);
INSERT INTO public.star VALUES (10, 'coco', 10, NULL, NULL, NULL);
INSERT INTO public.star VALUES (11, 'susu', 11, NULL, NULL, NULL);
INSERT INTO public.star VALUES (12, 'tutu', 12, NULL, NULL, NULL);
INSERT INTO public.star VALUES (13, 'qiqi', 13, NULL, NULL, NULL);
INSERT INTO public.star VALUES (14, 'momo', 14, NULL, NULL, NULL);
INSERT INTO public.star VALUES (15, 'bobo', 15, NULL, NULL, NULL);
INSERT INTO public.star VALUES (16, 'dodo', 16, NULL, NULL, NULL);
INSERT INTO public.star VALUES (17, 'yoyo', 17, NULL, NULL, NULL);
INSERT INTO public.star VALUES (18, 'mama', 18, NULL, NULL, NULL);
INSERT INTO public.star VALUES (19, 'kaka', 19, NULL, NULL, NULL);
INSERT INTO public.star VALUES (20, 'hehe', 20, NULL, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: imaginary_imaginary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.imaginary_imaginary_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: imaginary imaginary_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.imaginary
    ADD CONSTRAINT imaginary_name_key UNIQUE (name);


--
-- Name: imaginary imaginary_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.imaginary
    ADD CONSTRAINT imaginary_pkey PRIMARY KEY (imaginary_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

