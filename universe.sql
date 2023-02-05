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
    name character varying(60) NOT NULL,
    other_name text,
    mass_comp_sun_10_12 numeric(5,2),
    distance_kpc integer,
    diameter_kpc numeric(5,2),
    is_it_spiral boolean,
    is_it_elliptical boolean,
    is_it_irregular boolean
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    number integer,
    radius_km numeric(7,2),
    planet_id integer NOT NULL,
    moon_specify_id integer NOT NULL
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
-- Name: moon_specify; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_specify (
    moon_specify_id integer NOT NULL,
    name character varying(60) NOT NULL,
    other_name text
);


ALTER TABLE public.moon_specify OWNER TO freecodecamp;

--
-- Name: moon_specify_moon_specify_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_specify_moon_specify_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_specify_moon_specify_id_seq OWNER TO freecodecamp;

--
-- Name: moon_specify_moon_specify_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_specify_moon_specify_id_seq OWNED BY public.moon_specify.moon_specify_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    temperature_k integer,
    distance text,
    star_id integer NOT NULL,
    constellation text
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
    name character varying(60) NOT NULL,
    other_name text,
    stage text,
    radius_comp_sun numeric(5,2),
    temperature_k integer,
    constellation text,
    galaxy_id integer NOT NULL
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon_specify moon_specify_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_specify ALTER COLUMN moon_specify_id SET DEFAULT nextval('public.moon_specify_moon_specify_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', '-', 1.15, 8, 26.00, true, false, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'M31', 1.50, 765, 46.00, true, false, false);
INSERT INTO public.galaxy VALUES (3, 'the Large Magellanic Cloud', 'Nubecula Major', 0.38, 50, 10.00, false, false, true);
INSERT INTO public.galaxy VALUES (4, 'the Whirlpool Galaxy', 'M51a', NULL, 9498, 23.58, true, false, false);
INSERT INTO public.galaxy VALUES (5, 'the Sombrero Galaxy', 'M104', NULL, 9550, 15.00, false, false, true);
INSERT INTO public.galaxy VALUES (6, 'Hercules A', '3C 348', NULL, 643900, NULL, false, true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (3, 'Moon', 1, 1738.00, 3, 1);
INSERT INTO public.moon VALUES (4, 'Phobos', 1, 11.27, 4, 7);
INSERT INTO public.moon VALUES (5, 'Deimos', 2, 6.20, 4, 7);
INSERT INTO public.moon VALUES (6, 'Io', 1, 1821.60, 5, 1);
INSERT INTO public.moon VALUES (7, 'Europa', 2, 1560.80, 5, 1);
INSERT INTO public.moon VALUES (8, 'Ganymede', 3, 2634.10, 5, 1);
INSERT INTO public.moon VALUES (9, 'Callisto', 4, 2410.30, 5, 1);
INSERT INTO public.moon VALUES (10, 'Amalthea', 5, 83.50, 5, 1);
INSERT INTO public.moon VALUES (11, 'Himalia', 6, 69.80, 5, 4);
INSERT INTO public.moon VALUES (12, 'Elara', 7, 43.00, 5, 4);
INSERT INTO public.moon VALUES (13, 'Pasiphae', 8, 30.00, 5, 4);
INSERT INTO public.moon VALUES (14, 'Sinope', 9, 19.00, 5, 4);
INSERT INTO public.moon VALUES (16, 'Lysithea', 10, 18.00, 5, 4);
INSERT INTO public.moon VALUES (17, 'Mimas', 1, 198.20, 6, 1);
INSERT INTO public.moon VALUES (19, 'Rhea', 5, 763.80, 6, 1);
INSERT INTO public.moon VALUES (20, 'Titan', 6, 2574.73, 6, 1);
INSERT INTO public.moon VALUES (21, 'Ariel', 1, 578.90, 7, 1);
INSERT INTO public.moon VALUES (22, 'Umbriel', 2, 584.70, 7, 1);
INSERT INTO public.moon VALUES (23, 'Triton', 1, 1353.40, 8, 4);
INSERT INTO public.moon VALUES (18, 'Tethys', 3, 533.10, 6, 1);


--
-- Data for Name: moon_specify; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_specify VALUES (1, 'inner moon', 'inner natural satellite');
INSERT INTO public.moon_specify VALUES (2, 'outer moon', NULL);
INSERT INTO public.moon_specify VALUES (3, 'trojan', NULL);
INSERT INTO public.moon_specify VALUES (4, 'irregular moon', 'irregular natural satellite');
INSERT INTO public.moon_specify VALUES (5, 'alkyonide moon', 'co-orbital object');
INSERT INTO public.moon_specify VALUES (6, 'unconfirmed moon', NULL);
INSERT INTO public.moon_specify VALUES (7, 'unknown', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 437, '0.3 AU', 2, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 232, '0.72 AU', 2, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 255, '0', 2, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 209, '1.4 AU', 2, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 88, '5 AU', 2, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 97, '9 AU', 2, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 76, '18 AU', 2, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 72, '30 AU', 2, NULL);
INSERT INTO public.planet VALUES (9, 'Kepler-10b', 1833, '187 ps', 8, 'Draco');
INSERT INTO public.planet VALUES (10, 'Kepler-20b', 1014, '285 ps', 9, 'Lyra');
INSERT INTO public.planet VALUES (11, 'Kepler-20e', 1040, '285 ps', 9, 'Lyra');
INSERT INTO public.planet VALUES (12, 'Kepler-20f', 705, '285 ps', 9, 'Lyra');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'SP77 46-44', NULL, 'Red supergiant', 1.28, 3500, NULL, 3);
INSERT INTO public.star VALUES (2, 'Sun', NULL, 'Yellow dwarf', 1.00, 5772, NULL, 1);
INSERT INTO public.star VALUES (3, 'Polaris Aa', 'Polar star', 'Yellow supergiant', 1.04, 6015, 'Ursa Minor', 1);
INSERT INTO public.star VALUES (4, 'Epsilon Cassiopeiae', 'Segin', 'Blue giant', 6.10, 15174, 'Cassiopeia', 1);
INSERT INTO public.star VALUES (5, 'Altair', 'Alpha Aquilae', 'White dwarf', 1.75, 6800, 'Aquilla', 1);
INSERT INTO public.star VALUES (6, 'Gamma Cephei A', 'Errai', 'Orange giant', 4.93, 4792, 'Cepheus', 1);
INSERT INTO public.star VALUES (7, 'Alpha Scorpii', 'Antares', 'Red supergiant', 5.20, 18500, 'Scorpius', 1);
INSERT INTO public.star VALUES (8, 'Kepler-10', NULL, 'Yellow dwarf', 1.07, 5708, 'Draco', 1);
INSERT INTO public.star VALUES (9, 'Kepler-20', NULL, 'Yellow dwarf', 0.94, 5466, 'Lyra', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: moon_specify_moon_specify_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_specify_moon_specify_id_seq', 7, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


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
-- Name: moon_specify moon_specify_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_specify
    ADD CONSTRAINT moon_specify_name_key UNIQUE (name);


--
-- Name: moon_specify moon_specify_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_specify
    ADD CONSTRAINT moon_specify_pkey PRIMARY KEY (moon_specify_id);


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
-- Name: moon moon_moon_specify_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_specify_id_fkey FOREIGN KEY (moon_specify_id) REFERENCES public.moon_specify(moon_specify_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

