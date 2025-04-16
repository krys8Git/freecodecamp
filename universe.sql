--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    description text,
    is_spherical boolean,
    name character varying(100) NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    description text,
    age_in_millions_of_years numeric,
    galaxy_type character varying(100),
    name character varying(100) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    distance_to_planet integer,
    planet_id integer,
    age_in_millions_of_years numeric,
    name character varying(100) NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    distance_to_star integer,
    description text,
    has_life boolean,
    has_rings boolean,
    age_in_millions_of_years numeric,
    star_id integer,
    name character varying(100) NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    star_type character varying(100),
    age_in_millions_of_years numeric,
    name character varying(100) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'rock', false, 'asteroid1');
INSERT INTO public.asteroid VALUES (2, 'rock-ish', false, 'asteroid2');
INSERT INTO public.asteroid VALUES (3, 'rocky', true, 'asteroid3');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, NULL, 100, 'cool', 'milky way');
INSERT INTO public.galaxy VALUES (2, NULL, 200, 'not cool', 'watery way');
INSERT INTO public.galaxy VALUES (3, NULL, 200, 'not cool', 'juicy way');
INSERT INTO public.galaxy VALUES (4, NULL, 50, 'not cool', 'the way');
INSERT INTO public.galaxy VALUES (5, NULL, 70, 'cool', 'galaxy lax');
INSERT INTO public.galaxy VALUES (6, NULL, 1000, 'cool', 'galaxy chill');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, NULL, 3, NULL, 'moon1');
INSERT INTO public.moon VALUES (2, NULL, 3, NULL, 'moon2');
INSERT INTO public.moon VALUES (3, NULL, 3, NULL, 'moon3');
INSERT INTO public.moon VALUES (4, NULL, 3, NULL, 'moon4');
INSERT INTO public.moon VALUES (5, NULL, 3, NULL, 'moon5');
INSERT INTO public.moon VALUES (6, NULL, 3, NULL, 'moon6');
INSERT INTO public.moon VALUES (7, NULL, 3, NULL, 'moon7');
INSERT INTO public.moon VALUES (8, NULL, 3, NULL, 'moon8');
INSERT INTO public.moon VALUES (9, NULL, 3, NULL, 'moon9');
INSERT INTO public.moon VALUES (10, NULL, 3, NULL, 'moon10');
INSERT INTO public.moon VALUES (11, NULL, 3, NULL, 'moon11');
INSERT INTO public.moon VALUES (12, NULL, 3, NULL, 'moon12');
INSERT INTO public.moon VALUES (13, NULL, 3, NULL, 'moon13');
INSERT INTO public.moon VALUES (14, NULL, 3, NULL, 'moon14');
INSERT INTO public.moon VALUES (15, NULL, 3, NULL, 'moon15');
INSERT INTO public.moon VALUES (16, NULL, 3, NULL, 'moon16');
INSERT INTO public.moon VALUES (17, NULL, 3, NULL, 'moon17');
INSERT INTO public.moon VALUES (18, NULL, 3, NULL, 'moon18');
INSERT INTO public.moon VALUES (19, NULL, 3, NULL, 'moon19');
INSERT INTO public.moon VALUES (20, NULL, 3, NULL, 'moon20');
INSERT INTO public.moon VALUES (21, NULL, 4, NULL, 'better moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, NULL, NULL, NULL, NULL, NULL, 1, 'mercury');
INSERT INTO public.planet VALUES (2, NULL, NULL, NULL, NULL, NULL, 1, 'venus');
INSERT INTO public.planet VALUES (3, NULL, NULL, NULL, NULL, NULL, 1, 'earth');
INSERT INTO public.planet VALUES (4, NULL, NULL, NULL, NULL, NULL, 1, 'mars');
INSERT INTO public.planet VALUES (5, NULL, NULL, NULL, NULL, NULL, 1, 'jupiter');
INSERT INTO public.planet VALUES (6, NULL, NULL, NULL, NULL, NULL, 1, 'saturn');
INSERT INTO public.planet VALUES (7, NULL, NULL, NULL, NULL, NULL, 1, 'uranus');
INSERT INTO public.planet VALUES (8, NULL, NULL, NULL, NULL, NULL, 1, 'neptune');
INSERT INTO public.planet VALUES (9, NULL, NULL, NULL, NULL, NULL, 1, 'pluto');
INSERT INTO public.planet VALUES (10, NULL, NULL, NULL, NULL, NULL, 2, 'justice for pluto');
INSERT INTO public.planet VALUES (11, NULL, NULL, NULL, NULL, NULL, 2, 'earth but better');
INSERT INTO public.planet VALUES (12, NULL, NULL, NULL, NULL, NULL, 2, 'stupiter');
INSERT INTO public.planet VALUES (13, NULL, NULL, NULL, NULL, NULL, 3, 'not mars');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, NULL, NULL, 'sun');
INSERT INTO public.star VALUES (2, 1, NULL, NULL, 'star power');
INSERT INTO public.star VALUES (3, 1, NULL, NULL, 'star is born');
INSERT INTO public.star VALUES (4, 2, NULL, NULL, 'sunnyD');
INSERT INTO public.star VALUES (5, 3, NULL, NULL, 'star6');
INSERT INTO public.star VALUES (6, 3, NULL, NULL, 'sunny with a chance');


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: moon moon_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

