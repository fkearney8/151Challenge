--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: set_update_date(); Type: FUNCTION; Schema: public; Owner: bacardi
--

CREATE FUNCTION set_update_date() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
NEW.updateDate = CURRENT_TIMESTAMP;
RETURN NEW;
END;
$$;


ALTER FUNCTION public.set_update_date() OWNER TO bacardi;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: EXERCISE_ENTRIES_2015; Type: TABLE; Schema: public; Owner: bacardi; Tablespace: 
--

CREATE TABLE "EXERCISE_ENTRIES_2015" (
    id integer NOT NULL,
    exercisetype character varying(64) NOT NULL,
    reps numeric,
    datedone date NOT NULL,
    userid integer NOT NULL,
    comment text
);


ALTER TABLE public."EXERCISE_ENTRIES_2015" OWNER TO bacardi;

--
-- Name: EXERCISE_ENTRIES_2016; Type: TABLE; Schema: public; Owner: bacardi; Tablespace: 
--

CREATE TABLE "EXERCISE_ENTRIES_2016" (
    id integer NOT NULL,
    exercisetype character varying(64) NOT NULL,
    reps numeric,
    datedone date NOT NULL,
    userid integer NOT NULL,
    comment text
);


ALTER TABLE public."EXERCISE_ENTRIES_2016" OWNER TO bacardi;

--
-- Name: EXERCISE_ENTRIES_2016_id_seq; Type: SEQUENCE; Schema: public; Owner: bacardi
--

CREATE SEQUENCE "EXERCISE_ENTRIES_2016_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."EXERCISE_ENTRIES_2016_id_seq" OWNER TO bacardi;

--
-- Name: EXERCISE_ENTRIES_2016_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bacardi
--

ALTER SEQUENCE "EXERCISE_ENTRIES_2016_id_seq" OWNED BY "EXERCISE_ENTRIES_2016".id;


--
-- Name: EXERCISE_ENTRIES_id_seq; Type: SEQUENCE; Schema: public; Owner: bacardi
--

CREATE SEQUENCE "EXERCISE_ENTRIES_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."EXERCISE_ENTRIES_id_seq" OWNER TO bacardi;

--
-- Name: EXERCISE_ENTRIES_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bacardi
--

ALTER SEQUENCE "EXERCISE_ENTRIES_id_seq" OWNED BY "EXERCISE_ENTRIES_2015".id;


--
-- Name: user_id_sequence; Type: SEQUENCE; Schema: public; Owner: bacardi
--

CREATE SEQUENCE user_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_sequence OWNER TO bacardi;

--
-- Name: USERS; Type: TABLE; Schema: public; Owner: bacardi; Tablespace: 
--

CREATE TABLE "USERS" (
    id integer DEFAULT nextval('user_id_sequence'::regclass) NOT NULL,
    email character varying(255) NOT NULL,
    username character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    admin integer DEFAULT 0 NOT NULL,
    createdate timestamp without time zone DEFAULT now() NOT NULL,
    updatedate timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."USERS" OWNER TO bacardi;

--
-- Name: play_evolutions; Type: TABLE; Schema: public; Owner: bacardi; Tablespace: 
--

CREATE TABLE play_evolutions (
    id integer NOT NULL,
    hash character varying(255) NOT NULL,
    applied_at timestamp without time zone NOT NULL,
    apply_script text,
    revert_script text,
    state character varying(255),
    last_problem text
);


ALTER TABLE public.play_evolutions OWNER TO bacardi;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bacardi
--

ALTER TABLE ONLY "EXERCISE_ENTRIES_2015" ALTER COLUMN id SET DEFAULT nextval('"EXERCISE_ENTRIES_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bacardi
--

ALTER TABLE ONLY "EXERCISE_ENTRIES_2016" ALTER COLUMN id SET DEFAULT nextval('"EXERCISE_ENTRIES_2016_id_seq"'::regclass);


--
-- Data for Name: EXERCISE_ENTRIES_2015; Type: TABLE DATA; Schema: public; Owner: bacardi
--

COPY "EXERCISE_ENTRIES_2015" (id, exercisetype, reps, datedone, userid, comment) FROM stdin;
1	Burpees	5	2015-01-12	3	Got to start somewhere
2	SitUps	10	2015-01-12	4	Just to beat Frank
3	Burpees	12	2015-01-12	7	Mam maker mod pushup
4	SitUps	34	2015-01-12	7	
5	Lunges	24	2015-01-12	7	
6	Burpees	15	2015-01-12	8	
7	Lunges	20	2015-01-12	8	
8	SitUps	40	2015-01-12	8	
9	Burpees	15	2015-01-12	9	
10	Lunges	20	2015-01-12	9	
11	SitUps	40	2015-01-12	9	
12	Lunges	40	2015-01-12	12	
13	SitUps	5	2015-01-12	3	
14	SitUps	30	2015-01-12	3	full sit ups
15	Burpees	10	2015-01-12	3	
16	Lunges	20	2015-01-12	3	
17	Miles	0.4	2015-01-12	3	walk from garage to work
18	Lunges	50	2015-01-12	19	It Starts Now!
19	Miles	4.3	2015-01-12	19	
20	SitUps	50	2015-01-12	19	
21	Miles	2.2	2015-01-12	3	
22	SitUps	60	2015-01-12	5	On the board!
23	Miles	3.5	2015-01-12	18	Kick off!
24	Miles	1	2015-01-12	24	walked at lunch
25	Miles	0.68	2015-01-12	7	prod fac w stairs
26	Burpees	10	2015-01-12	25	
27	Miles	0.4	2015-01-12	3	
28	Miles	4.5	2015-01-12	26	
29	Burpees	20	2015-01-12	4	
30	Miles	3	2015-01-12	4	2 SLAC loop with hills, 1 treadmill
31	SitUps	40	2015-01-12	4	
32	Miles	1.4	2015-01-12	9	
33	Miles	0.75	2015-01-12	8	
34	SitUps	64	2015-01-12	26	
35	SitUps	70	2015-01-12	18	
36	Lunges	30	2015-01-12	18	
37	Lunges	50	2015-01-12	26	
38	Miles	2.3	2015-01-12	14	1.2 mile work walk 1,1 mile round trip to ceramics
39	Lunges	45	2015-01-12	14	apartment lunges
40	Burpees	15	2015-01-12	10	I hate these!
41	Lunges	20	2015-01-12	10	Are these bad on your knees?
42	Miles	4.2	2015-01-12	10	Walked to bus stop and took a walk at lunch.
43	SitUps	30	2015-01-12	10	I wanted to get 60 of these today.
44	SitUps	100	2015-01-12	11	
45	SitUps	200	2015-01-12	15	rest day => core
46	Lunges	50	2015-01-12	3	baby lunges
47	Burpees	5	2015-01-12	3	
48	SitUps	36	2015-01-12	12	3 minutes plank
49	Burpees	12	2015-01-13	7	man maker mod pushup
50	SitUps	36	2015-01-13	7	
51	Lunges	24	2015-01-13	7	
52	Burpees	15	2015-01-13	9	
53	Lunges	20	2015-01-13	9	
54	SitUps	40	2015-01-13	9	
55	Burpees	15	2015-01-13	8	
56	Lunges	20	2015-01-13	8	
57	SitUps	40	2015-01-13	8	
58	Miles	2	2015-01-12	5	
59	Lunges	95	2015-01-13	14	apartment lunges
60	Lunges	20	2015-01-13	10	Breakfast
61	SitUps	50	2015-01-13	10	Breakfast
62	Burpees	20	2015-01-13	10	Breakfast
63	Miles	2.3	2015-01-13	10	Walk to and from bus.
64	Burpees	10	2015-01-13	3	Burpees at the gym
65	Lunges	5	2015-01-13	3	
66	Miles	0.8	2015-01-13	3	
67	Miles	1	2015-01-12	16	Soccer 7v7
68	Miles	2	2015-01-12	23	Soccer game
69	Lunges	10	2015-01-13	10	Waiting for code to compile.
70	Miles	3	2015-01-12	22	
71	SitUps	15	2015-01-12	22	
72	Lunges	42	2015-01-12	20	
73	SitUps	30	2015-01-12	20	
74	Lunges	24	2015-01-12	21	
75	SitUps	30	2015-01-12	21	
76	Burpees	35	2015-01-13	19	
77	Lunges	50	2015-01-13	19	
78	Miles	3.2	2015-01-13	19	
79	SitUps	50	2015-01-13	19	
80	Burpees	9	2015-01-13	8	
81	Lunges	188	2015-01-13	8	
82	Miles	1	2015-01-13	8	
83	Burpees	6	2015-01-13	9	
84	Lunges	200	2015-01-13	9	
85	Burpees	25	2015-01-12	13	
86	Lunges	50	2015-01-12	13	
87	SitUps	50	2015-01-12	13	
88	SitUps	10	2015-01-13	13	
89	Lunges	50	2015-01-13	13	
90	Burpees	25	2015-01-12	17	
91	Lunges	50	2015-01-12	17	
92	Miles	1	2015-01-13	17	
93	SitUps	100	2015-01-12	17	
94	Miles	1.75	2015-01-13	24	walked home from work
95	Miles	2	2015-01-13	23	Soccer game
96	Lunges	10	2015-01-13	10	Evening lunges.
97	Burpees	10	2015-01-13	10	Don't do these right after eating!
98	Burpees	10	2015-01-13	13	
99	Lunges	100	2015-01-13	13	
100	SitUps	50	2015-01-13	13	
101	SitUps	50	2015-01-13	24	
102	Miles	2.3	2015-01-13	10	Walking the dog.
103	SitUps	300	2015-01-13	16	
104	Lunges	60	2015-01-13	16	
105	Miles	0.4	2015-01-13	3	
106	Lunges	20	2015-01-13	3	
107	Burpees	50	2015-01-13	30	with lil' Bear!
108	Miles	2	2015-01-13	30	@ 24 Hour Fitness
109	SitUps	100	2015-01-13	30	@ 24 Hour Fitness
110	Burpees	40	2015-01-13	15	
111	Lunges	60	2015-01-13	15	
112	Miles	10.1	2015-01-13	15	
113	SitUps	50	2015-01-13	31	Holla!
114	SitUps	50	2015-01-12	31	
115	Miles	3.7	2015-01-12	31	
116	Miles	2	2015-01-13	5	Tuesday 2hr Pickup
117	Miles	1.5	2015-01-13	11	
118	SitUps	50	2015-01-13	11	
119	SitUps	100	2015-01-13	18	
120	Burpees	25	2015-01-13	18	
121	Lunges	20	2015-01-13	31	
122	SitUps	20	2015-01-13	31	
123	Lunges	20	2015-01-13	24	
124	SitUps	100	2015-01-13	3	
125	Lunges	75	2015-01-13	14	apartment lunges
126	Miles	1.2	2015-01-13	14	work walk
127	Burpees	15	2015-01-13	14	
128	Burpees	15	2015-01-14	14	why am i doing burpees at 12:10 am
129	SitUps	60	2015-01-14	14	40 oblique, 20 regular
130	Burpees	15	2015-01-14	9	
131	Lunges	50	2015-01-14	9	
132	SitUps	40	2015-01-14	9	
133	Burpees	15	2015-01-14	8	
134	Lunges	20	2015-01-14	8	
135	SitUps	40	2015-01-14	8	
136	Burpees	12	2015-01-14	7	Man makers mod pushup
137	Lunges	24	2015-01-14	7	
138	SitUps	36	2015-01-14	7	
139	SitUps	2	2015-01-12	7	
140	Lunges	100	2015-01-13	29	
141	SitUps	110	2015-01-13	29	
142	Miles	3	2015-01-13	29	
143	Lunges	40	2015-01-14	30	@ C4 Crossfit
144	SitUps	82	2015-01-14	30	@ C4 Crossfit- Tabata
145	Burpees	30	2015-01-14	3	after gym burpees
146	Lunges	55	2015-01-14	14	apartment lunges
147	Burpees	10	2015-01-14	10	Wake up!
148	Miles	2.2	2015-01-14	10	Walk to bus and work.
149	Lunges	20	2015-01-14	10	Wake up!
150	SitUps	40	2015-01-14	10	Wake up!
151	Miles	1.5	2015-01-13	4	SBUL game
152	Lunges	30	2015-01-14	22	
153	Miles	3	2015-01-14	22	
154	Miles	4.5	2015-01-14	26	
155	Miles	4.25	2015-01-14	8	
156	Miles	2.5	2015-01-14	9	
157	Burpees	7	2015-01-14	20	
158	Lunges	10	2015-01-14	20	
159	SitUps	62	2015-01-14	20	
160	Burpees	5	2015-01-14	21	
161	SitUps	26	2015-01-14	21	
162	Lunges	10	2015-01-14	21	
163	Lunges	50	2015-01-14	26	
164	Miles	0.8	2015-01-14	3	
165	Burpees	50	2015-01-14	19	
166	Lunges	50	2015-01-14	19	
167	SitUps	50	2015-01-14	19	
168	Miles	2.5	2015-01-14	19	
169	Miles	0.75	2015-01-14	7	prod fac w stairs
170	SitUps	100	2015-01-14	30	@ Home
171	Lunges	100	2015-01-14	30	@ Home
172	Burpees	50	2015-01-14	30	@ Home
173	Miles	1.6	2015-01-14	14	work walk + walk to pacific place
174	Lunges	100	2015-01-14	26	
175	Miles	2.5	2015-01-14	11	
176	Lunges	10	2015-01-14	11	
177	SitUps	50	2015-01-14	11	
178	SitUps	100	2015-01-14	26	
179	SitUps	24	2015-01-14	26	
180	Burpees	40	2015-01-14	3	
181	Miles	1.5	2015-01-14	3	
182	SitUps	125	2015-01-14	3	
183	Lunges	50	2015-01-14	3	
184	Burpees	24	2015-01-14	26	
185	Burpees	40	2015-01-14	15	
186	Lunges	80	2015-01-14	15	
187	Miles	11.5	2015-01-14	15	
188	Miles	2	2015-01-14	24	
189	Lunges	100	2015-01-14	14	apartment lunges
190	Burpees	5	2015-01-14	5	crud, these are a pain
191	Miles	4	2015-01-14	5	
192	Lunges	40	2015-01-14	5	
193	SitUps	60	2015-01-14	5	
194	Burpees	30	2015-01-14	4	3x10
195	Burpees	60	2015-01-14	4	3x20
196	Miles	2.5	2015-01-14	4	Treadmill, 18:15
198	SitUps	90	2015-01-14	4	Regular, each side, 3x10 each
199	Lunges	70	2015-01-14	24	
200	Burpees	40	2015-01-14	24	
201	SitUps	160	2015-01-14	24	
202	Miles	3.55	2015-01-14	14	Roxie run
203	Burpees	40	2015-01-14	14	20/20
204	Burpees	10	2015-01-14	31	
205	Lunges	50	2015-01-14	31	
206	SitUps	20	2015-01-14	31	
207	Miles	2	2015-01-14	31	
208	Burpees	20	2015-01-14	3	
209	SitUps	100	2015-01-14	18	
210	SitUps	60	2015-01-14	14	regular
211	Lunges	50	2015-01-14	18	
212	Burpees	25	2015-01-14	18	
213	Burpees	20	2015-01-14	14	more burpees
214	Lunges	57	2015-01-14	14	apartment lunges
215	SitUps	150	2015-01-14	13	
216	Lunges	50	2015-01-14	13	
217	Burpees	25	2015-01-14	13	
218	SitUps	50	2015-01-14	23	
219	Lunges	120	2015-01-14	4	2x3x20 (2 workout sessions)
220	SitUps	90	2015-01-14	4	Regular, each side, 3x10 each
221	SitUps	100	2015-01-15	13	
222	Lunges	80	2015-01-15	9	
223	SitUps	80	2015-01-15	9	
224	Burpees	15	2015-01-15	8	
225	Lunges	20	2015-01-15	8	
226	SitUps	40	2015-01-15	8	
227	Burpees	12	2015-01-15	7	mod pushup
228	Lunges	24	2015-01-15	7	
229	SitUps	36	2015-01-15	7	
230	Miles	1.15	2015-01-13	18	
231	Miles	1.15	2015-01-14	18	
232	Burpees	15	2015-01-15	3	morning burpees 
233	Lunges	40	2015-01-15	3	
234	Lunges	40	2015-01-12	12	
235	Miles	1.6	2015-01-12	12	
236	Miles	1.6	2015-01-13	12	
237	Miles	1.6	2015-01-14	12	
238	SitUps	24	2015-01-15	12	
239	Burpees	10	2015-01-14	29	
240	Miles	4	2015-01-14	29	
241	Lunges	50	2015-01-15	30	@ C4 Crossfit- extra work
242	Miles	1	2015-01-15	30	@ C4 Crossfit- Helen +1 lap
243	SitUps	100	2015-01-15	30	@ C4 Crossfit- extra work
244	Miles	1	2015-01-15	26	
245	Miles	0.84	2015-01-15	8	
246	Miles	0.75	2015-01-15	7	prod fac w stairs
247	Miles	0.5	2015-01-15	3	
248	Burpees	26	2015-01-15	26	
249	Miles	2.2	2015-01-12	33	
250	Miles	2.2	2015-01-13	33	
251	Miles	1.1	2015-01-14	33	
252	SitUps	100	2015-01-12	33	
253	Burpees	101	2015-01-15	13	
254	Lunges	225	2015-01-15	13	
255	SitUps	200	2015-01-15	13	
256	SitUps	48	2015-01-15	13	I never should have introduced this to the office... things have gotten destructivley competitive
257	Burpees	50	2015-01-15	19	
258	Lunges	50	2015-01-15	19	
259	SitUps	50	2015-01-15	19	
260	Miles	3.25	2015-01-15	19	
261	SitUps	60	2015-01-14	34	
262	Miles	2	2015-01-13	34	
263	Miles	3.75	2015-01-14	34	
264	Lunges	70	2015-01-14	34	
265	Miles	1.6	2015-01-15	14	
266	Lunges	10	2015-01-15	5	
267	Miles	2	2015-01-14	10	Lunch Walk
268	SitUps	30	2015-01-15	10	Wake up!
269	Lunges	20	2015-01-15	10	Wake up!
270	Miles	2.3	2015-01-15	10	Walk to bus and work.
271	Miles	2.2	2015-01-15	10	Walk home.
272	Lunges	30	2015-01-15	10	Evening Lunges
273	SitUps	50	2015-01-15	10	Evening situps
274	SitUps	125	2015-01-15	24	
275	Lunges	75	2015-01-15	24	
276	Miles	2	2015-01-15	24	
277	Burpees	15	2015-01-15	34	
278	SitUps	110	2015-01-15	34	
279	Lunges	70	2015-01-15	34	
280	Burpees	20	2015-01-15	10	
281	Lunges	20	2015-01-15	10	
282	SitUps	40	2015-01-15	10	Get more of these in!!!!
283	Lunges	40	2015-01-15	10	I have to get ahead of Frank!
284	Burpees	10	2015-01-15	10	Need more burpees!
285	SitUps	20	2015-01-15	10	
286	Lunges	30	2015-01-15	10	More!!!!
287	Burpees	15	2015-01-15	10	Almost to phillip
288	SitUps	15	2015-01-15	10	Must get ahead.
289	Lunges	30	2015-01-15	10	oooooo
290	SitUps	15	2015-01-15	10	More!!!!
291	SitUps	10	2015-01-15	10	More!!!!
292	Lunges	50	2015-01-15	18	
293	Miles	1.15	2015-01-15	18	
294	Lunges	50	2015-01-15	24	
295	Burpees	15	2015-01-14	25	
296	Burpees	15	2015-01-15	25	
297	Lunges	15	2015-01-14	25	
298	Lunges	15	2015-01-15	25	
299	Miles	1	2015-01-13	25	
300	Miles	1	2015-01-14	25	
301	Miles	2	2015-01-15	25	
302	SitUps	12	2015-01-15	25	
303	Burpees	10	2015-01-15	18	
304	Lunges	30	2015-01-15	6	with baby
305	Miles	3	2015-01-15	31	
306	Miles	3.11	2015-01-14	16	
307	Burpees	10	2015-01-14	16	
308	SitUps	30	2015-01-15	10	Just a few more
309	Miles	2	2015-01-15	3	
310	Burpees	10	2015-01-15	10	10% on everything at least.
311	Lunges	10	2015-01-15	6	
312	SitUps	60	2015-01-15	3	
313	SitUps	75	2015-01-15	5	
314	Burpees	15	2015-01-16	9	
315	Lunges	20	2015-01-16	9	
316	SitUps	40	2015-01-16	9	
317	Miles	0.25	2015-01-15	8	
318	Burpees	15	2015-01-16	8	
319	Lunges	20	2015-01-16	8	
320	SitUps	40	2015-01-16	8	
321	Burpees	12	2015-01-16	7	mod pushup
322	Lunges	24	2015-01-16	7	
323	SitUps	36	2015-01-16	7	
324	SitUps	40	2015-01-16	10	Wake up!
325	Lunges	30	2015-01-16	10	Wake up!
326	Burpees	10	2015-01-16	10	Wake up!
327	Miles	11	2015-01-15	15	
328	Miles	5.7	2015-01-16	15	
329	Miles	2.3	2015-01-16	10	Walk to work
330	Burpees	50	2015-01-15	33	
331	Lunges	60	2015-01-15	33	
332	SitUps	60	2015-01-15	33	
333	Miles	2.2	2015-01-15	33	
334	SitUps	83	2015-01-16	3	
335	Burpees	11	2015-01-16	3	
336	Lunges	42	2015-01-16	3	
337	Burpees	25	2015-01-14	17	
338	Lunges	50	2015-01-14	17	
339	SitUps	100	2015-01-14	17	
340	Lunges	100	2015-01-15	17	
341	Miles	2	2015-01-14	17	
342	Miles	1	2015-01-16	17	
343	Miles	2	2015-01-15	29	
344	SitUps	20	2015-01-16	10	Waitng for code to compile.
345	Lunges	20	2015-01-16	10	
346	Miles	0.75	2015-01-16	7	prod fac w stairs
347	SitUps	240	2015-01-16	30	@ 24 Hour Fitness- Lat Down/Curl-Press/ Row/ DBell Bench
348	Lunges	240	2015-01-16	30	@ 24 Hour Fitness- Lat Down/Curl-Press/ Row/ DBell Bench
349	Burpees	120	2015-01-16	30	@ 24 Hour Fitness- Lat Down/Curl-Press/ Row/ DBell Bench
350	Miles	3	2015-01-16	30	@ 24 Hour Fitness- Lat Down/Curl-Press/ Row/ DBell Bench
351	SitUps	10	2015-01-16	10	Compile Situps!
352	Burpees	5	2015-01-16	10	Compile Burpees
353	Lunges	50	2015-01-16	13	
354	Miles	1.5	2015-01-16	10	Lunch Walk
355	Burpees	55	2015-01-16	19	
356	Lunges	75	2015-01-16	19	
357	Miles	1.75	2015-01-16	19	
358	SitUps	75	2015-01-16	19	
359	Miles	2	2015-01-16	21	
360	Burpees	1	2015-01-16	20	
361	Miles	3.5	2015-01-16	20	
362	Miles	1	2015-01-16	6	
363	Miles	2.75	2015-01-16	26	
364	Burpees	30	2015-01-16	4	3x10
365	Lunges	60	2015-01-16	4	3x20
366	SitUps	225	2015-01-16	4	3x15 regular, left, right, bent knees, leg raises
367	Miles	3.4	2015-01-16	8	
368	Miles	0.8	2015-01-16	3	
369	Burpees	11	2015-01-16	3	
370	Miles	2.4	2015-01-16	9	
371	Miles	8.97	2015-01-16	13	
372	Miles	2.4	2015-01-15	12	
373	Miles	0.8	2015-01-16	12	
374	SitUps	52	2015-01-16	13	
375	Burpees	15	2015-01-16	5	
376	Lunges	60	2015-01-16	5	
377	Miles	3	2015-01-16	5	
378	SitUps	150	2015-01-16	5	
379	Miles	3	2015-01-16	24	
380	Miles	1	2015-01-15	16	
381	Lunges	45	2015-01-16	3	
382	Miles	2	2015-01-15	23	Soccer game
383	Lunges	100	2015-01-16	26	
384	SitUps	70	2015-01-17	5	
385	Miles	0.56	2015-01-16	7	
386	Burpees	15	2015-01-17	8	
387	Lunges	20	2015-01-17	8	
388	Burpees	15	2015-01-17	9	
389	SitUps	40	2015-01-17	8	
390	Lunges	20	2015-01-17	9	
391	SitUps	40	2015-01-17	9	
392	Burpees	12	2015-01-17	7	mod pushup
393	Lunges	24	2015-01-17	7	
394	Miles	1.05	2015-01-17	7	
395	SitUps	36	2015-01-17	7	
396	Miles	2.5	2015-01-17	16	
397	Burpees	30	2015-01-17	16	
398	Lunges	60	2015-01-17	16	
399	SitUps	300	2015-01-17	16	
400	Burpees	60	2015-01-17	19	
401	Lunges	100	2015-01-17	19	
402	Miles	3	2015-01-17	19	
403	SitUps	100	2015-01-17	19	
404	Burpees	5	2015-01-17	5	
405	Lunges	20	2015-01-17	5	
406	Miles	3	2015-01-17	5	
407	Burpees	70	2015-01-17	3	
408	Miles	2.5	2015-01-17	3	
409	Miles	1.2	2015-01-17	14	ceramics round trip
410	Miles	2.1	2015-01-17	9	
411	Miles	0.8	2015-01-17	14	half work walk +
412	Miles	6.25	2015-01-17	24	
413	Burpees	10	2015-01-17	24	
414	Lunges	25	2015-01-17	24	
416	Lunges	100	2015-01-17	3	baby weight lunges
417	Miles	1.5	2015-01-16	10	
418	Miles	1.5	2015-01-17	10	
419	Burpees	10	2015-01-17	10	
420	SitUps	30	2015-01-17	10	
421	Burpees	32	2015-01-17	29	
422	Lunges	100	2015-01-17	29	
423	SitUps	110	2015-01-17	29	
424	Miles	5	2015-01-17	29	
425	Lunges	20	2015-01-17	8	
426	Miles	3.1	2015-01-17	8	
427	Lunges	20	2015-01-17	24	
428	Burpees	5	2015-01-17	24	
429	SitUps	100	2015-01-17	24	
430	Burpees	60	2015-01-17	3	ouch
431	Burpees	10	2015-01-17	3	trying to push out the record
432	Lunges	150	2015-01-17	13	
433	SitUps	150	2015-01-17	13	
434	Burpees	10	2015-01-17	3	trying to push out the record
435	Lunges	30	2015-01-17	13	
436	SitUps	15	2015-01-17	13	
437	SitUps	15	2015-01-17	13	
438	SitUps	60	2015-01-17	4	15x regular, left, right, bent knees
439	Miles	6.2	2015-01-17	4	Treadmill, 49:09
440	SitUps	60	2015-01-18	14	regular drunk situps
441	Burpees	15	2015-01-18	9	
442	Lunges	60	2015-01-18	9	
443	SitUps	100	2015-01-18	9	
444	Lunges	60	2015-01-18	30	@ Home w/ Coach Bear
445	Burpees	30	2015-01-18	30	@ Home w/ Coach Bear
446	SitUps	60	2015-01-18	30	@ Home w/ Coach Bear
447	Burpees	12	2015-01-18	7	mod pushup
448	Lunges	24	2015-01-18	7	
449	SitUps	36	2015-01-18	7	
450	Burpees	15	2015-01-18	8	
451	Lunges	15	2015-01-18	8	
452	Lunges	5	2015-01-18	8	
453	SitUps	60	2015-01-18	8	
454	Burpees	10	2015-01-16	25	
455	Burpees	10	2015-01-17	25	
456	Lunges	10	2015-01-17	25	
457	Lunges	10	2015-01-16	25	
458	Miles	2	2015-01-16	25	
459	Miles	4	2015-01-17	25	
460	SitUps	20	2015-01-17	25	
461	SitUps	20	2015-01-16	25	
462	Miles	1	2015-01-17	21	
463	Miles	1	2015-01-17	20	
464	Lunges	20	2015-01-18	20	
465	Miles	2.97	2015-01-18	13	
466	Miles	2.5	2015-01-18	16	
467	SitUps	250	2015-01-18	16	
468	Miles	3.9	2015-01-18	8	
469	SitUps	50	2015-01-16	35	
470	Lunges	50	2015-01-16	35	
471	Miles	4.5	2015-01-18	3	
472	Burpees	100	2015-01-18	13	
473	Miles	3.9	2015-01-18	9	
474	Miles	0.5	2015-01-17	26	
475	Miles	4.5	2015-01-18	26	
476	Lunges	100	2015-01-18	19	
477	Miles	3.5	2015-01-18	19	
478	SitUps	100	2015-01-18	19	
479	Lunges	30	2015-01-18	35	
480	SitUps	100	2015-01-18	35	
481	Burpees	25	2015-01-18	5	
482	Lunges	80	2015-01-18	5	
483	Miles	3	2015-01-18	5	
484	SitUps	150	2015-01-18	5	
485	Lunges	100	2015-01-18	13	
486	Lunges	50	2015-01-18	3	
487	Lunges	10	2015-01-18	3	
488	Burpees	15	2015-01-19	8	
489	Lunges	20	2015-01-19	8	
490	Lunges	20	2015-01-19	9	
491	SitUps	50	2015-01-19	8	
492	SitUps	40	2015-01-19	9	
493	Burpees	15	2015-01-19	9	
494	Burpees	10	2015-01-19	10	
495	Miles	1	2015-01-18	10	
496	Lunges	10	2015-01-18	10	
497	Burpees	10	2015-01-18	3	
498	Burpees	15	2015-01-19	14	wake up and burpee
499	SitUps	60	2015-01-19	14	Had to fight Roxie
500	Miles	2.3	2015-01-19	10	Morning Walk
501	Miles	0.4	2015-01-19	3	
502	Miles	1	2015-01-19	8	
503	SitUps	50	2015-01-18	29	
504	Burpees	15	2015-01-18	29	
505	Miles	4	2015-01-18	29	
506	SitUps	45	2015-01-19	7	
507	Lunges	30	2015-01-19	7	
508	Burpees	15	2015-01-19	7	mod pushup
509	Miles	1.4	2015-01-19	3	
510	Miles	4	2015-01-16	22	
511	SitUps	10	2015-01-19	22	
512	SitUps	180	2015-01-19	30	@ Hotel
513	Miles	1.5	2015-01-19	30	@ Hotel
514	Lunges	120	2015-01-19	30	@ Hotel
515	Burpees	60	2015-01-19	30	@ Hotel
516	Miles	1	2015-01-18	17	
517	Miles	1	2015-01-19	17	
518	SitUps	50	2015-01-18	17	
519	Miles	4.56	2015-01-19	13	
520	SitUps	100	2015-01-19	19	
521	Lunges	100	2015-01-19	19	
522	Burpees	100	2015-01-19	19	
523	Miles	5	2015-01-19	19	
524	SitUps	80	2015-01-19	20	
525	Lunges	20	2015-01-19	20	
526	Burpees	7	2015-01-19	20	
527	Lunges	15	2015-01-19	21	
528	Burpees	3	2015-01-19	21	
529	SitUps	44	2015-01-19	21	
530	SitUps	125	2015-01-18	6	
531	Miles	1.25	2015-01-19	6	
532	SitUps	20	2015-01-15	36	
533	Miles	1.4	2015-01-19	3	
534	Lunges	20	2015-01-19	10	
535	Miles	3.2	2015-01-19	10	
536	Burpees	10	2015-01-19	10	
537	Miles	1	2015-01-19	9	
538	Miles	1	2015-01-19	8	
539	SitUps	70	2015-01-19	10	
540	Burpees	5	2015-01-19	10	
541	Lunges	20	2015-01-19	10	
542	Burpees	10	2015-01-19	10	
543	Miles	3	2015-01-19	29	
544	SitUps	3	2015-01-19	36	
545	Burpees	10	2015-01-19	29	
546	SitUps	70	2015-01-19	29	
547	Lunges	30	2015-01-19	29	
548	SitUps	140	2015-01-19	3	situps at home
549	Lunges	30	2015-01-19	3	
550	Burpees	20	2015-01-19	3	
551	Burpees	5	2015-01-19	16	
552	Miles	1.5	2015-01-19	16	
553	Lunges	20	2015-01-19	10	
554	Miles	3	2015-01-19	26	
555	SitUps	200	2015-01-19	26	
556	Lunges	100	2015-01-19	26	
557	SitUps	12	2015-01-19	26	
558	Burpees	40	2015-01-19	26	
559	SitUps	60	2015-01-19	14	25/35
560	Miles	3.2	2015-01-19	14	work > mayday > home > ceramics > home
561	Lunges	50	2015-01-19	14	standing lunges
562	Burpees	35	2015-01-19	14	TV burpees
563	Lunges	30	2015-01-19	3	
564	SitUps	30	2015-01-19	3	
565	SitUps	60	2015-01-20	14	Can't sleep? Do sit-ups
566	Lunges	24	2015-01-20	7	
567	SitUps	36	2015-01-20	7	
568	Burpees	12	2015-01-20	7	mod pushup
569	Burpees	15	2015-01-20	8	
570	SitUps	50	2015-01-20	8	
571	Lunges	20	2015-01-20	8	
572	SitUps	50	2015-01-20	9	
573	Burpees	15	2015-01-20	9	
574	Lunges	20	2015-01-20	9	
575	Lunges	20	2015-01-19	5	
576	Miles	1	2015-01-19	5	
577	Burpees	5	2015-01-19	5	
578	SitUps	70	2015-01-20	10	
579	Burpees	5	2015-01-20	10	
580	Miles	2	2015-01-16	34	
581	Miles	6	2015-01-17	34	
582	Miles	6	2015-01-18	34	
583	Miles	4.5	2015-01-19	34	
584	SitUps	60	2015-01-20	14	wake up, situp
585	Miles	2.6	2015-01-20	10	
586	Burpees	15	2015-01-16	37	
587	SitUps	30	2015-01-16	37	
588	Lunges	30	2015-01-16	37	
589	Lunges	30	2015-01-19	37	
590	SitUps	40	2015-01-19	37	
591	Burpees	15	2015-01-19	37	
592	Miles	0.4	2015-01-20	3	
593	Lunges	40	2015-01-20	30	@ Hotel
594	SitUps	40	2015-01-20	30	@ Hotel
595	Burpees	20	2015-01-20	30	@ Hotel
596	Miles	0.5	2015-01-20	30	@ Hotel
597	Lunges	60	2015-01-20	37	
598	SitUps	100	2015-01-20	37	
599	Burpees	30	2015-01-20	37	
600	Miles	1	2015-01-19	17	
601	Miles	1	2015-01-20	17	
602	Burpees	8	2015-01-20	8	
603	Lunges	236	2015-01-20	8	
604	Miles	1.2	2015-01-20	26	
605	Miles	5.6	2015-01-20	21	
606	Miles	4.6	2015-01-20	20	
607	Lunges	150	2015-01-20	13	
608	SitUps	50	2015-01-20	13	
609	Miles	1.75	2015-01-20	6	
610	Lunges	20	2015-01-20	5	
611	Miles	1	2015-01-20	5	
612	Miles	1.2	2015-01-20	10	
613	Lunges	100	2015-01-20	19	
614	SitUps	100	2015-01-20	19	
615	Burpees	100	2015-01-20	19	
616	Miles	3.25	2015-01-20	19	
617	Miles	1.2	2015-01-20	9	
618	Lunges	100	2015-01-20	16	
619	Burpees	45	2015-01-20	16	
620	SitUps	350	2015-01-20	16	
621	Miles	5.6	2015-01-20	18	
622	Lunges	200	2015-01-20	9	
623	Burpees	15	2015-01-20	9	
624	SitUps	140	2015-01-20	9	
625	Lunges	20	2015-01-20	35	
626	Lunges	30	2015-01-20	22	
627	Miles	3.5	2015-01-20	22	
628	Burpees	5	2015-01-20	22	
629	Miles	2	2015-01-20	8	
630	Lunges	20	2015-01-20	35	
631	Burpees	40	2015-01-19	35	
632	Lunges	80	2015-01-20	31	
633	Miles	3	2015-01-20	31	
634	SitUps	60	2015-01-20	31	
635	Burpees	20	2015-01-20	31	
636	Lunges	10	2015-01-20	5	
637	Miles	3	2015-01-20	5	
638	Burpees	5	2015-01-20	5	
639	Lunges	80	2015-01-20	18	
640	SitUps	100	2015-01-20	34	
641	Miles	2.25	2015-01-20	34	
642	Miles	3	2015-01-20	37	
643	Burpees	30	2015-01-20	18	
644	Miles	1.4	2015-01-20	3	
645	Miles	2	2015-01-20	23	Soccer game
646	Miles	1	2015-01-20	26	
647	Miles	2	2015-01-20	38	
648	SitUps	10	2015-01-20	38	
649	SitUps	85	2015-01-21	5	
650	Lunges	20	2015-01-21	8	
651	Burpees	15	2015-01-21	8	
652	SitUps	50	2015-01-21	8	
653	SitUps	40	2015-01-21	9	
654	Burpees	15	2015-01-21	9	
655	Lunges	20	2015-01-21	9	
656	Miles	2.6	2015-01-21	22	
657	Miles	0.75	2015-01-20	7	prod fac w stairs
658	Miles	0.75	2015-01-21	7	prod fac w stairs
659	Miles	0.7	2015-01-20	7	
660	Lunges	50	2015-01-20	17	
661	SitUps	100	2015-01-20	17	
662	Miles	1	2015-01-21	17	
663	Lunges	60	2015-01-21	37	
664	Burpees	30	2015-01-21	37	
665	SitUps	100	2015-01-21	37	
666	Burpees	30	2015-01-21	37	
667	SitUps	60	2015-01-21	37	
668	Lunges	40	2015-01-21	37	
669	Lunges	110	2015-01-21	13	
670	SitUps	145	2015-01-21	13	
671	Burpees	50	2015-01-21	13	
672	SitUps	100	2015-01-21	5	
673	Miles	1.8	2015-01-21	26	
674	SitUps	25	2015-01-21	20	
675	Lunges	35	2015-01-21	20	
676	Burpees	10	2015-01-21	20	
677	SitUps	41	2015-01-21	21	
678	Lunges	10	2015-01-21	21	
679	Burpees	5	2015-01-21	21	
680	Burpees	20	2015-01-21	39	
681	SitUps	40	2015-01-21	39	
682	Lunges	20	2015-01-21	39	
683	Lunges	20	2015-01-21	38	
684	Burpees	20	2015-01-21	38	
685	SitUps	40	2015-01-21	38	
686	Miles	2.25	2015-01-21	6	
687	Lunges	90	2015-01-21	6	
688	Lunges	30	2015-01-21	7	
689	SitUps	45	2015-01-21	7	
690	Burpees	15	2015-01-21	7	mod pushup
691	Miles	1.2	2015-01-21	9	
692	Miles	1	2015-01-21	8	
693	Miles	4.69	2015-01-21	13	
694	Burpees	20	2015-01-18	25	
695	Burpees	30	2015-01-19	25	
696	Burpees	10	2015-01-20	25	
697	Burpees	30	2015-01-21	25	
698	SitUps	130	2015-01-21	18	
699	Miles	3	2015-01-18	25	
700	Miles	1.15	2015-01-21	18	
701	Miles	6	2015-01-19	25	
702	Miles	11	2015-01-20	25	
703	Miles	7	2015-01-21	25	
704	SitUps	24	2015-01-18	25	
705	SitUps	24	2015-01-19	25	
706	SitUps	24	2015-01-20	25	
707	SitUps	24	2015-01-21	25	
708	Lunges	20	2015-01-19	25	
709	Lunges	40	2015-01-20	25	
710	Lunges	20	2015-01-21	25	
711	Lunges	20	2015-01-18	25	
712	Miles	13.1	2015-01-18	11	
713	Burpees	25	2015-01-21	11	
714	SitUps	100	2015-01-21	11	
715	Lunges	48	2015-01-21	11	
716	Burpees	50	2015-01-21	18	
717	SitUps	50	2015-01-21	31	
718	Burpees	30	2015-01-21	16	
719	Lunges	90	2015-01-21	16	
720	Miles	1.5	2015-01-21	16	
721	Burpees	12	2015-01-21	5	
722	Burpees	10	2015-01-21	3	shoulder can do it again
723	Lunges	20	2015-01-21	3	did lunges to test groupme integration (thanks Alpha!)
724	Miles	1.2	2015-01-21	14	will the not record my walk to work and back?
725	Lunges	50	2015-01-21	29	
726	Miles	1.2	2015-01-20	14	this will get abused fast :)
727	Miles	2	2015-01-21	29	
728	Burpees	30	2015-01-21	29	
729	SitUps	100	2015-01-21	29	
730	Miles	5.5	2015-01-17	15	
731	Miles	13.1	2015-01-18	15	
732	Lunges	64	2015-01-22	5	
733	SitUps	64	2015-01-22	5	
734	Burpees	12	2015-01-22	7	mod pushup
735	SitUps	36	2015-01-22	7	
736	Lunges	24	2015-01-22	7	
737	Lunges	20	2015-01-22	8	
738	SitUps	50	2015-01-22	8	
739	Burpees	15	2015-01-22	8	
740	Miles	8.2	2015-01-19	15	
741	Miles	13.9	2015-01-21	15	
742	Burpees	40	2015-01-22	30	@ C4 Crossfit
743	SitUps	80	2015-01-22	30	@ C4 Crossfit- extra work
744	Lunges	40	2015-01-22	30	@ C4 Crossfit- extra work
745	Miles	0.5	2015-01-19	30	@ Hotel
746	Burpees	8	2015-01-22	5	
747	SitUps	100	2015-01-22	19	
748	Miles	3.25	2015-01-22	19	
749	Lunges	100	2015-01-22	19	
750	Burpees	100	2015-01-22	19	
752	Lunges	40	2015-01-22	37	
753	SitUps	60	2015-01-22	37	
754	Burpees	30	2015-01-22	37	
755	Miles	3	2015-01-22	8	
756	Miles	4	2015-01-17	41	4 games of beach ultimate = 4 miles
757	Miles	4	2015-01-18	41	4 games of beach ultimate = 4 miles
758	Miles	2	2015-01-20	41	2 hours of pickup ultimate= 2 miles
759	Lunges	60	2015-01-21	41	
760	Lunges	60	2015-01-22	41	
761	Miles	2	2015-01-21	41	
762	Miles	2	2015-01-22	41	
763	SitUps	100	2015-01-22	3	back in the saddle
764	Lunges	30	2015-01-22	3	
765	SitUps	60	2015-01-22	37	
766	SitUps	40	2015-01-22	37	
767	Miles	1.15	2015-01-22	18	
768	SitUps	40	2015-01-22	9	
769	Lunges	20	2015-01-22	9	
770	Burpees	15	2015-01-22	9	
771	Lunges	40	2015-01-22	37	
772	Burpees	20	2015-01-22	37	
773	SitUps	100	2015-01-22	24	
774	Lunges	25	2015-01-22	24	
775	Burpees	20	2015-01-22	24	
776	Miles	2	2015-01-22	24	
778	Lunges	60	2015-01-22	5	
779	Miles	2	2015-01-22	5	
781	Lunges	100	2015-01-22	15	
782	Burpees	50	2015-01-22	15	
777	Miles	1.5	2015-01-21	24	
780	Miles	11.1	2015-01-22	15	
783	Miles	1	2015-01-22	31	
784	Lunges	70	2015-01-22	31	
785	SitUps	50	2015-01-22	31	
786	SitUps	50	2015-01-22	13	
787	Lunges	50	2015-01-22	13	
788	Burpees	50	2015-01-22	13	
789	SitUps	60	2015-01-22	18	
790	Burpees	10	2015-01-22	18	
791	Lunges	15	2015-01-22	3	
792	Burpees	20	2015-01-22	3	
793	SitUps	60	2015-01-23	37	
794	Lunges	40	2015-01-23	37	
795	Burpees	20	2015-01-23	37	
796	Miles	0.5	2015-01-23	37	
797	Miles	0.5	2015-01-23	37	
798	Miles	3	2015-01-22	23	Indoor game + outdoor game
799	Miles	0.5	2015-01-23	37	
800	SitUps	20	2015-01-23	30	@ Home- to stay awake
801	Lunges	20	2015-01-23	30	@ Home- to stay awake
802	Burpees	10	2015-01-23	30	@ Home- to stay awake
803	SitUps	50	2015-01-23	8	
804	Lunges	20	2015-01-23	8	
805	Burpees	15	2015-01-23	8	
806	SitUps	40	2015-01-23	9	
807	Lunges	20	2015-01-23	9	
808	Burpees	15	2015-01-23	9	
809	Miles	0.75	2015-01-22	7	prod fac w stairs
810	SitUps	36	2015-01-23	7	
811	Lunges	24	2015-01-23	7	
812	Burpees	12	2015-01-23	7	
813	Lunges	30	2015-01-23	24	
814	Miles	0.4	2015-01-23	3	
815	SitUps	68	2015-01-23	3	full situps 
816	Miles	3.75	2015-01-23	30	@ 24 Hour Fitness- Lat Down/ Curl/ Head crush & press/ push-ups & goblet squat
817	SitUps	420	2015-01-23	30	@ 24 Hour Fitness- Lat Down/ Curl/ Head crush & press/ push-ups & goblet squat
818	Burpees	165	2015-01-23	30	@ 24 Hour Fitness- Lat Down/ Curl/ Head crush & press/ push-ups & goblet squat
819	Lunges	240	2015-01-23	30	@ 24 Hour Fitness- Lat Down/ Curl/ Head crush & press/ push-ups & goblet squat
820	Miles	0.6	2015-01-22	26	
821	Miles	0.75	2015-01-23	7	prod fac w stairs
822	SitUps	60	2015-01-23	37	
823	Lunges	40	2015-01-23	37	
824	Burpees	20	2015-01-23	37	
825	SitUps	150	2015-01-23	19	
826	Lunges	110	2015-01-23	19	
827	Burpees	75	2015-01-23	19	
828	Miles	3.25	2015-01-23	19	
829	Miles	0.5	2015-01-23	30	w/ Bear on bike
830	Miles	0.5	2015-01-22	26	
831	Miles	3.2	2015-01-23	26	
832	Miles	1.2	2015-01-23	14	round trip walk to work
833	Miles	2	2015-01-23	3	walking around downtown because the parking garage was on fire, seriously
834	Lunges	45	2015-01-23	3	
835	Miles	1.25	2015-01-23	23	Parking garage was on fire
836	Miles	3.5	2015-01-23	37	
837	SitUps	200	2015-01-23	13	
838	Lunges	100	2015-01-23	13	
839	Miles	5.5	2015-01-23	29	walking 'round Disneyland for work. 
840	Miles	2	2015-01-23	11	WWL Game!
841	Miles	1.15	2015-01-23	18	
842	SitUps	30	2015-01-23	18	
843	Lunges	40	2015-01-24	18	
844	SitUps	390	2015-01-24	37	
845	Lunges	260	2015-01-24	37	
846	Burpees	120	2015-01-24	37	
847	Miles	0.5	2015-01-24	37	
848	SitUps	60	2015-01-24	30	@ C4 Crossfit- extra work
849	Lunges	60	2015-01-24	30	@ C4 Crossfit- extra work
850	SitUps	50	2015-01-24	8	
851	Lunges	21	2015-01-24	8	
852	Burpees	15	2015-01-24	8	
853	Miles	1	2015-01-24	3	walk the dog, walk to bus
854	Burpees	37	2015-01-24	3	at crossfit
855	Miles	3.1	2015-01-21	10	
856	Miles	3.1	2015-01-22	10	
857	Miles	2.3	2015-01-23	10	
858	Lunges	30	2015-01-24	10	
859	Burpees	20	2015-01-22	25	
860	Burpees	10	2015-01-24	10	
861	Burpees	20	2015-01-23	25	
862	Lunges	45	2015-01-22	25	
863	Lunges	40	2015-01-23	25	
864	SitUps	60	2015-01-23	25	
865	SitUps	50	2015-01-22	25	
866	Miles	9	2015-01-22	25	
867	Miles	8	2015-01-23	25	
868	Burpees	10	2015-01-24	10	
869	Burpees	20	2015-01-24	14	work burpees
870	SitUps	94	2015-01-23	34	
871	SitUps	50	2015-01-21	34	
872	SitUps	50	2015-01-22	34	
873	SitUps	86	2015-01-24	34	
874	Lunges	55	2015-01-22	34	
875	Lunges	80	2015-01-24	34	
876	Burpees	30	2015-01-24	34	
877	Miles	2	2015-01-21	34	
878	Miles	3	2015-01-23	34	
879	SitUps	18	2015-01-24	30	@ Home
880	Miles	3.5	2015-01-24	34	
881	Lunges	20	2015-01-24	10	
882	Burpees	10	2015-01-24	10	
883	SitUps	50	2015-01-24	10	
884	Lunges	30	2015-01-24	10	
885	Miles	6.5	2015-01-24	4	Mt. Diablo hike
886	Burpees	10	2015-01-24	10	
887	SitUps	30	2015-01-24	10	
888	SitUps	100	2015-01-24	19	
889	Lunges	100	2015-01-24	19	
890	Miles	3	2015-01-24	19	
891	SitUps	30	2015-01-24	10	
892	Miles	3	2015-01-24	41	3 hours of pickup ultimate= 3 miles
893	Burpees	30	2015-01-24	41	
894	Miles	1	2015-01-24	40	
895	Burpees	1	2015-01-24	40	
896	SitUps	40	2015-01-24	9	
897	Lunges	20	2015-01-24	9	
898	Burpees	15	2015-01-24	9	
899	Miles	3.2	2015-01-24	9	
900	SitUps	210	2015-01-24	30	@ Home- Fartlek run 2.5
901	Lunges	100	2015-01-24	30	
902	Burpees	50	2015-01-24	30	@ Home- Fartlek run 2.5
903	Miles	2.5	2015-01-24	30	@ Home- Fartlek run 2.5
904	Miles	4	2015-01-24	11	2x Winter League Games
905	Miles	8.1	2015-01-23	15	
906	Miles	9	2015-01-24	15	
907	Miles	3	2015-01-24	15	1.5 winter league Ultimate games
908	Miles	3.5	2015-01-24	18	
909	Miles	4	2015-01-24	10	
910	Lunges	50	2015-01-24	10	
911	SitUps	20	2015-01-24	10	
912	SitUps	220	2015-01-24	15	
913	SitUps	450	2015-01-24	37	
914	Lunges	300	2015-01-24	37	
915	Burpees	150	2015-01-24	37	
916	SitUps	40	2015-01-24	39	
917	Lunges	30	2015-01-24	39	
918	Burpees	20	2015-01-24	39	
919	SitUps	200	2015-01-24	5	
920	Lunges	100	2015-01-24	5	
921	Miles	4	2015-01-24	5	
922	SitUps	150	2015-01-24	3	
923	Burpees	10	2015-01-24	3	
924	Miles	2.5	2015-01-24	22	
925	Miles	4	2015-01-22	22	
926	Miles	4	2015-01-23	22	
927	Burpees	29	2015-01-24	14	mmm late night burpees
928	SitUps	200	2015-01-24	18	
929	Miles	5	2015-01-24	37	No one chasing me.
930	SitUps	75	2015-01-24	14	bedtime situps.
931	Lunges	100	2015-01-24	18	
932	SitUps	100	2015-01-24	31	
933	Lunges	100	2015-01-24	31	
934	Burpees	10	2015-01-24	31	
935	SitUps	36	2015-01-25	7	
936	Lunges	24	2015-01-25	7	
937	Burpees	12	2015-01-25	7	
938	Burpees	50	2015-01-25	14	50 burpees and 2 fartees
939	SitUps	50	2015-01-24	11	
940	Lunges	55	2015-01-25	14	Staff assistance lunges
941	Miles	2	2015-01-24	21	
942	Miles	2	2015-01-24	20	
943	SitUps	60	2015-01-25	37	
944	Lunges	40	2015-01-25	37	
945	Burpees	20	2015-01-25	37	
946	Miles	2	2015-01-19	35	socer game
947	Lunges	30	2015-01-19	35	
948	Burpees	30	2015-01-19	35	
949	Miles	1	2015-01-20	35	10mi bike
950	Miles	4	2015-01-24	35	
951	SitUps	100	2015-01-18	35	
952	Miles	2	2015-01-24	16	
953	SitUps	125	2015-01-25	19	
954	Lunges	125	2015-01-25	19	
955	Burpees	60	2015-01-25	19	
956	Miles	3.3	2015-01-25	19	
957	SitUps	20	2015-01-25	10	
958	SitUps	36	2015-01-25	7	
959	Lunges	24	2015-01-25	7	
960	Burpees	12	2015-01-25	7	
961	SitUps	40	2015-01-25	39	
962	Lunges	40	2015-01-25	39	
963	Burpees	20	2015-01-25	39	
964	SitUps	20	2015-01-25	30	@ Home
965	Miles	0.5	2015-01-25	30	@ Home w/ Bear on bike
966	Miles	1.6	2015-01-25	3	
967	Miles	1.5	2015-01-25	23	Soccer. No Subs. Thanks, Frank.
968	Miles	2	2015-01-25	41	2 hours of pickup ultimate= 2 miles
969	Burpees	40	2015-01-25	41	
970	Miles	2.6	2015-01-25	26	
971	Miles	1	2015-01-25	3	
972	Burpees	30	2015-01-25	14	Nothing to see here. Just watching the interview and doing burpees
973	Lunges	50	2015-01-25	14	more lunges
974	Miles	17	2015-01-25	15	https://www.strava.com/activities/246301957
975	Lunges	20	2015-01-25	37	
976	Miles	5	2015-01-25	37	
977	Burpees	20	2015-01-25	3	
978	SitUps	30	2015-01-25	37	
979	Lunges	20	2015-01-25	37	
980	Burpees	10	2015-01-25	37	
981	SitUps	60	2015-01-25	5	
982	Lunges	100	2015-01-25	5	
983	Burpees	50	2015-01-25	5	Finally cranked out some good ones
984	Miles	3.5	2015-01-25	5	Finally cranked out some good ones
985	SitUps	36	2015-01-26	7	
986	Lunges	24	2015-01-26	7	
987	Burpees	12	2015-01-26	7	
988	Miles	0.25	2015-01-23	8	
989	Miles	3	2015-01-24	8	
990	Lunges	10	2015-01-24	8	
991	SitUps	50	2015-01-26	8	
992	Burpees	15	2015-01-26	8	
993	Lunges	20	2015-01-26	8	
994	SitUps	100	2015-01-26	9	
995	Lunges	40	2015-01-26	9	
996	Miles	3.5	2015-01-25	34	
997	Miles	3	2015-01-26	30	@ 24 Hour Fitness- Bench/ Bent Over Row
998	SitUps	180	2015-01-26	30	@ 24 Hour Fitness- Bench/ Bent Over Row
999	Lunges	180	2015-01-26	30	@ 24 Hour Fitness- Bench/ Bent Over Row
1000	Burpees	90	2015-01-26	30	@ 24 Hour Fitness- Bench/ Bent Over Row
1001	Lunges	20	2015-01-25	3	
1002	Miles	5.9	2015-01-26	10	
1003	SitUps	30	2015-01-26	37	
1004	Lunges	20	2015-01-26	37	
1005	Burpees	10	2015-01-26	37	
1006	Burpees	50	2015-01-26	37	
1007	Miles	1	2015-01-23	17	
1008	Miles	1	2015-01-24	17	
1009	Miles	1	2015-01-25	17	
1010	SitUps	100	2015-01-24	17	
1011	Lunges	40	2015-01-25	17	
1012	Burpees	20	2015-01-25	17	
1013	SitUps	125	2015-01-26	19	
1014	Lunges	125	2015-01-26	19	
1015	Burpees	60	2015-01-26	19	
1016	Miles	3.75	2015-01-26	19	
1017	SitUps	24	2015-01-24	25	
1018	Lunges	50	2015-01-24	25	
1019	Burpees	20	2015-01-24	25	
1020	Miles	12	2015-01-24	25	
1021	SitUps	24	2015-01-25	25	
1022	Lunges	20	2015-01-25	25	
1023	Burpees	20	2015-01-25	25	
1024	Miles	4	2015-01-25	25	
1025	SitUps	150	2015-01-26	24	Should vacation situps count double?
1026	Burpees	50	2015-01-26	37	
1027	Miles	1.5	2015-01-26	24	
1028	Miles	4.5	2015-01-26	26	
1029	SitUps	75	2015-01-24	13	
1030	SitUps	60	2015-01-26	9	
1031	Lunges	30	2015-01-26	9	
1032	Burpees	15	2015-01-26	9	
1033	Miles	2	2015-01-26	9	
1034	Burpees	20	2015-01-26	24	
1035	Lunges	30	2015-01-26	24	
1036	SitUps	100	2015-01-26	24	
1037	Lunges	50	2015-01-26	24	
1038	SitUps	5	2015-01-26	34	
1039	Miles	0.75	2015-01-26	34	
1040	Burpees	5	2015-01-26	34	
1041	Lunges	70	2015-01-26	34	
1042	SitUps	110	2015-01-26	11	
1043	Lunges	30	2015-01-26	11	
1044	Miles	1	2015-01-26	11	
1045	SitUps	70	2015-01-25	11	
1046	SitUps	50	2015-01-24	11	
1047	SitUps	100	2015-01-26	15	
1048	SitUps	15	2015-01-26	37	
1049	Burpees	20	2015-01-26	37	
1050	Miles	1.2	2015-01-26	3	
1051	SitUps	15	2015-01-26	37	
1052	Burpees	10	2015-01-26	37	
1053	Burpees	100	2015-01-26	13	
1054	Miles	4	2015-01-26	13	
1055	SitUps	51	2015-01-26	26	
1056	Lunges	46	2015-01-26	26	
1057	SitUps	58	2015-01-26	3	
1058	Lunges	56	2015-01-26	3	
1059	Burpees	18	2015-01-26	26	
1060	Burpees	30	2015-01-26	3	
1061	SitUps	15	2015-01-26	37	
1062	Burpees	10	2015-01-26	37	
1063	SitUps	56	2015-01-26	3	
1064	Lunges	54	2015-01-26	3	
1065	Burpees	32	2015-01-26	3	
1066	SitUps	63	2015-01-26	26	
1067	Lunges	49	2015-01-26	26	
1068	Burpees	23	2015-01-26	26	
1069	SitUps	200	2015-01-26	29	
1070	Lunges	100	2015-01-26	29	
1071	Miles	3	2015-01-26	29	
1072	Miles	3	2015-01-25	29	
1073	Miles	2	2015-01-24	29	
1074	SitUps	3	2015-01-25	16	
1075	Miles	3	2015-01-25	16	
1076	Miles	1.7	2015-01-26	10	
1077	SitUps	30	2015-01-26	10	
1078	Burpees	40	2015-01-26	37	
1079	Burpees	10	2015-01-26	37	
1080	Miles	2.5	2015-01-26	41	
1081	Miles	5	2015-01-26	37	
1082	Miles	2	2015-01-26	16	
1083	Miles	2.8	2015-01-26	14	work > home > ceramics > home
1084	Miles	0.5	2015-01-26	3	
1085	SitUps	30	2015-01-26	13	
1086	SitUps	200	2015-01-26	13	
1087	Burpees	20	2015-01-26	13	
1088	Burpees	20	2015-01-26	13	
1089	SitUps	12	2015-01-26	13	
1090	Burpees	5	2015-01-27	5	Sore from yesterday...
1091	SitUps	50	2015-01-27	8	
1092	Lunges	20	2015-01-27	8	
1093	Burpees	15	2015-01-27	8	
1094	SitUps	50	2015-01-27	9	
1095	Lunges	20	2015-01-27	9	
1096	Burpees	15	2015-01-27	9	
1097	Miles	1	2015-01-26	8	
1098	SitUps	40	2015-01-27	30	@ Home- pre crossfit
1099	Lunges	20	2015-01-27	30	@ Home- pre crossfit
1100	Burpees	10	2015-01-27	37	
1101	SitUps	225	2015-01-27	13	
1102	SitUps	150	2015-01-27	37	
1103	Lunges	100	2015-01-27	37	
1104	Burpees	50	2015-01-27	37	
1105	Lunges	40	2015-01-27	30	@ Home- post C4 crossfit
1106	SitUps	100	2015-01-27	30	@ Home- post C4 crossfit
1107	Burpees	30	2015-01-27	30	@ Home- post C4 crossfit
1108	Miles	1.5	2015-01-27	30	@ Home- post C4 crossfit
1109	SitUps	15	2015-01-26	22	
1110	Lunges	30	2015-01-26	22	
1111	Miles	2.5	2015-01-26	22	
1112	SitUps	150	2015-01-26	17	
1113	Lunges	100	2015-01-26	17	
1114	Burpees	10	2015-01-26	17	
1115	Burpees	10	2015-01-27	37	
1116	SitUps	1	2015-01-27	37	Fartlek.  Like Duco's, but less slow. 
1117	Miles	1	2015-01-27	37	Fartlek. ess slow. 
1118	Lunges	10	2015-01-27	37	
1119	Lunges	30	2015-01-27	3	post crossfit - should be worth double
1120	Miles	0.9	2015-01-27	3	
1121	Burpees	10	2015-01-27	37	
1122	Miles	0.75	2015-01-27	7	prod fac w stairs
1123	SitUps	36	2015-01-27	7	
1124	Lunges	24	2015-01-27	7	
1125	Burpees	12	2015-01-27	7	
1126	Miles	0.75	2015-01-27	7	prod fac w stairs
1127	Miles	1.8	2015-01-27	37	
1128	SitUps	20	2015-01-27	37	
1129	Burpees	10	2015-01-27	37	
1130	Lunges	100	2015-01-27	34	
1131	Burpees	25	2015-01-27	34	
1132	Miles	2	2015-01-27	34	
1133	SitUps	175	2015-01-27	19	
1134	Lunges	125	2015-01-27	19	
1135	Burpees	60	2015-01-27	19	
1136	Miles	3.75	2015-01-27	19	
1137	SitUps	59	2015-01-27	21	
1138	Burpees	5	2015-01-27	21	
1139	SitUps	65	2015-01-27	20	
1140	Burpees	10	2015-01-27	20	
1141	Lunges	352	2015-01-27	9	
1142	Burpees	5	2015-01-27	9	
1143	Lunges	285	2015-01-27	8	
1144	Burpees	6	2015-01-27	8	
1145	Miles	1	2015-01-27	8	
1146	SitUps	100	2015-01-27	13	
1147	Lunges	20	2015-01-27	13	
1148	Burpees	20	2015-01-27	13	
1149	Miles	1	2015-01-27	9	
1150	Miles	1.5	2015-01-27	8	
1151	Burpees	30	2015-01-27	13	
1152	Burpees	20	2015-01-27	13	
1153	Miles	0.5	2015-01-27	30	@ Home- w/ Bear on bike
1154	Burpees	30	2015-01-27	13	
1155	Miles	2	2015-01-27	24	
1156	Burpees	10	2015-01-27	37	
1157	Miles	1	2015-01-27	37	
1158	Miles	2.5	2015-01-15	28	
1159	Miles	4	2015-01-16	28	
1160	Miles	3	2015-01-17	28	
1161	Miles	2.5	2015-01-18	28	
1162	Burpees	100	2015-01-27	13	
1163	Miles	2.4	2015-01-19	28	
1164	Miles	4	2015-01-20	28	
1165	Miles	2.5	2015-01-21	28	Do Chinese miles count for more?
1166	SitUps	20	2015-01-16	28	
1167	Lunges	20	2015-01-16	28	
1168	Burpees	10	2015-01-16	28	
1169	SitUps	30	2015-01-26	28	
1170	Lunges	60	2015-01-26	28	
1171	Burpees	15	2015-01-26	28	
1172	Miles	8	2015-01-27	15	
1173	Lunges	240	2015-01-27	15	
1174	Burpees	120	2015-01-27	15	
1175	Burpees	5	2015-01-27	5	
1176	Miles	1	2015-01-27	5	
1177	Miles	1	2015-01-27	3	
1178	SitUps	150	2015-01-27	3	
1179	Lunges	30	2015-01-27	3	
1180	Burpees	30	2015-01-27	3	
1181	Miles	2	2015-01-27	41	2 hours of pickup ultimate= 2 miles
1182	Burpees	30	2015-01-27	41	
1183	Miles	1	2015-01-27	37	
1184	SitUps	30	2015-01-27	37	
1185	Lunges	20	2015-01-27	37	
1186	Burpees	20	2015-01-27	37	
1187	SitUps	36	2015-01-28	7	
1188	Lunges	24	2015-01-28	7	
1189	Burpees	12	2015-01-28	7	
1190	Miles	2.3	2015-01-27	10	
1191	SitUps	30	2015-01-28	10	
1192	Miles	1	2015-01-28	30	@ C4 Crossfit- extra work
1193	SitUps	60	2015-01-28	30	@ C4 Crossfit- extra work
1194	Lunges	60	2015-01-28	30	@ C4 Crossfit- extra work
1195	Burpees	15	2015-01-28	30	@ C4 Crossfit- extra work
1196	Miles	1.4	2015-01-27	14	work walk
1197	SitUps	40	2015-01-28	3	weighted situps
1198	Miles	0.75	2015-01-28	3	farmer carry for a quarter mile
1199	Miles	2	2015-01-27	17	
1200	SitUps	30	2015-01-28	37	
1201	Lunges	20	2015-01-28	37	
1202	Burpees	10	2015-01-28	37	
1203	Miles	1.6	2015-01-28	37	
1204	Miles	1.6	2015-01-28	37	
1205	Miles	1	2015-01-28	7	
1206	Miles	0.75	2015-01-28	7	
1207	SitUps	20	2015-01-28	37	
1208	Burpees	20	2015-01-28	37	
1209	SitUps	30	2015-01-28	37	
1210	Lunges	20	2015-01-28	37	
1211	Burpees	20	2015-01-28	37	
1212	Miles	4.5	2015-01-28	13	
1213	SitUps	25	2015-01-28	21	
1214	Lunges	20	2015-01-28	21	
1215	SitUps	25	2015-01-28	20	
1216	Lunges	20	2015-01-28	20	
1217	SitUps	15	2015-01-28	22	
1218	Miles	3	2015-01-28	22	
1219	SitUps	30	2015-01-27	5	
1220	Burpees	100	2015-01-28	37	
1221	SitUps	160	2015-01-28	30	@ Home- 12 minute special
1222	Lunges	120	2015-01-28	30	@ Home- 12 minute special
1223	Burpees	60	2015-01-28	30	@ Home- 12 minute special
1224	Miles	1.75	2015-01-28	30	@ Home- Fartlek sprint/run/walk
1225	Miles	2.25	2015-01-28	34	
1226	Burpees	171	2015-01-28	37	Duco- miss you. And your pretty mouth. xoxo
1227	SitUps	150	2015-01-28	19	
1228	Lunges	100	2015-01-28	19	
1229	Burpees	60	2015-01-28	19	
1230	Miles	1	2015-01-28	34	
1231	SitUps	350	2015-01-28	29	
1232	Lunges	300	2015-01-28	29	
1233	Burpees	50	2015-01-28	29	
1234	Miles	1.5	2015-01-28	29	
1235	Miles	2	2015-01-27	29	
1236	Lunges	100	2015-01-28	15	
1237	Burpees	105	2015-01-28	15	
1238	Miles	10.7	2015-01-28	15	
1239	SitUps	30	2015-01-28	11	
1240	Lunges	48	2015-01-28	11	
1241	Burpees	26	2015-01-28	11	
1242	Lunges	100	2015-01-28	34	
1243	SitUps	24	2015-01-26	25	
1244	Lunges	20	2015-01-26	25	
1245	SitUps	205	2015-01-28	34	
1246	Burpees	20	2015-01-26	25	
1247	Miles	4	2015-01-26	25	
1248	SitUps	24	2015-01-28	25	
1249	Lunges	20	2015-01-28	25	
1250	Burpees	10	2015-01-28	25	
1251	Burpees	10	2015-01-26	25	
1252	Miles	1	2015-01-28	25	
1253	Miles	1	2015-01-27	25	
1254	Burpees	31	2015-01-28	34	
1255	Miles	2.2	2015-01-28	3	
1256	SitUps	170	2015-01-28	3	
1257	Burpees	40	2015-01-28	3	
1258	Lunges	50	2015-01-28	3	
1259	SitUps	30	2015-01-28	15	got 'em
1260	Miles	0.6	2015-01-28	6	i tried jogging but these jugs! ugh...
1261	Miles	1	2015-01-28	5	
1262	SitUps	20	2015-01-28	37	
1263	Lunges	20	2015-01-28	37	
1264	SitUps	100	2015-01-28	13	
1265	Lunges	100	2015-01-28	13	
1266	Miles	0.5	2015-01-28	37	Yikes.  20 yrs ago my pace for a mile was faster than my pacefor a1/4mile now. 
1267	Miles	2	2015-01-26	23	Half an outdoor game + indoor game
1268	SitUps	30	2015-01-27	38	
1269	Burpees	15	2015-01-27	38	
1270	Miles	2	2015-01-27	38	
1271	Burpees	15	2015-01-29	38	
1272	Burpees	15	2015-01-29	38	
1273	Lunges	30	2015-01-29	38	
1274	Lunges	40	2015-01-29	38	
1275	Miles	1	2015-01-25	38	
1276	Burpees	15	2015-01-29	38	
1277	SitUps	50	2015-01-29	8	
1278	Burpees	1	2015-01-29	8	
1279	Miles	0.25	2015-01-28	8	
1280	SitUps	50	2015-01-29	9	
1281	Lunges	20	2015-01-29	9	
1282	Burpees	5	2015-01-29	9	
1283	SitUps	36	2015-01-29	7	
1284	Lunges	24	2015-01-29	7	
1285	Burpees	12	2015-01-29	7	
1286	SitUps	40	2015-01-29	30	@ Home- good morning!
1287	Lunges	50	2015-01-29	30	@ Home- good morning!
1288	SitUps	100	2015-01-29	13	
1289	Lunges	100	2015-01-29	13	
1290	SitUps	60	2015-01-29	37	
1291	Lunges	80	2015-01-29	37	
1292	Miles	1	2015-01-29	37	4 @1/4mile  
1293	SitUps	100	2015-01-29	30	@ Home- work break
1294	Lunges	100	2015-01-29	30	@ Home- work break
1295	Burpees	20	2015-01-29	30	@ Home- work break
1296	SitUps	60	2015-01-29	37	
1297	Miles	1.55	2015-01-29	7	
1298	Miles	1	2015-01-29	3	
1299	Lunges	30	2015-01-29	38	
1300	Lunges	30	2015-01-29	38	
1301	Lunges	30	2015-01-29	38	
1302	Lunges	100	2015-01-29	13	
1303	SitUps	20	2015-01-29	38	
1304	SitUps	44	2015-01-29	38	
1305	SitUps	20	2015-01-29	30	@ Home- work break
1306	Lunges	20	2015-01-29	30	@ Home- work break
1307	Burpees	10	2015-01-29	30	@ Home- work break
1308	SitUps	26	2015-01-29	38	
1309	Burpees	50	2015-01-29	38	
1310	SitUps	40	2015-01-29	13	
1311	Miles	1.5	2015-01-28	26	
1312	Miles	1.7	2015-01-29	26	
1313	Lunges	500	2015-01-29	37	2nd grade hoops practice.
1314	SitUps	100	2015-01-29	15	
1315	Lunges	351	2015-01-29	37	
1316	Miles	1	2015-01-29	34	
1317	Lunges	285	2015-01-29	34	
1318	Burpees	45	2015-01-29	34	
1319	Miles	8	2015-01-29	15	
1320	SitUps	550	2015-01-29	15	
1321	SitUps	600	2015-01-29	34	
1322	Miles	1	2015-01-28	41	
1323	SitUps	300	2015-01-29	16	
1324	Lunges	150	2015-01-29	16	
1325	Burpees	40	2015-01-29	16	
1326	Miles	1.6	2015-01-29	3	
1327	Miles	3	2015-01-29	39	
1328	SitUps	200	2015-01-30	13	
1329	Lunges	150	2015-01-30	13	
1330	SitUps	20	2015-01-30	38	
1331	SitUps	70	2015-01-30	5	
1332	Lunges	100	2015-01-30	5	
1333	Burpees	30	2015-01-30	5	
1334	Lunges	100	2015-01-30	5	
1335	Miles	3	2015-01-30	5	
1336	SitUps	20	2015-01-30	38	
1337	Burpees	15	2015-01-30	38	
1338	Burpees	15	2015-01-30	38	
1339	SitUps	20	2015-01-30	38	
1340	Lunges	30	2015-01-30	38	
1341	Burpees	15	2015-01-30	38	
1342	SitUps	24	2015-01-30	25	
1343	Lunges	30	2015-01-30	25	
1344	Burpees	10	2015-01-30	25	
1345	Miles	2	2015-01-30	25	
1346	Miles	1.25	2015-01-29	8	
1347	SitUps	50	2015-01-30	8	
1348	Lunges	20	2015-01-30	8	
1349	Burpees	20	2015-01-30	8	
1350	Miles	4	2015-01-29	19	
1351	SitUps	150	2015-01-30	19	
1352	Lunges	100	2015-01-30	19	
1353	Burpees	60	2015-01-30	19	
1354	SitUps	45	2015-01-30	7	
1355	Lunges	30	2015-01-30	7	
1356	Burpees	15	2015-01-30	7	
1357	Miles	1.2	2015-01-28	14	work walk
1358	Miles	1.2	2015-01-29	14	work walk
1359	SitUps	82	2015-01-30	3	
1360	Lunges	60	2015-01-30	3	
1361	Miles	0.4	2015-01-30	3	
1362	SitUps	40	2015-01-30	30	@ Home- work break
1363	Lunges	40	2015-01-30	30	@ Home- work break
1364	Burpees	10	2015-01-30	30	@ Home- work break
1365	Miles	0.75	2015-01-30	7	
1366	SitUps	100	2015-01-30	11	
1367	Lunges	60	2015-01-30	11	
1368	Miles	3.75	2015-01-30	19	
1369	SitUps	100	2015-01-30	13	
1370	Miles	3.125	2015-01-30	13	
1371	Lunges	50	2015-01-30	13	
1372	SitUps	120	2015-01-30	30	@ Home- work break
1373	Lunges	40	2015-01-30	30	@ Home- work break
1374	Burpees	20	2015-01-30	30	@ Home- work break
1375	Miles	1	2015-01-29	22	
1376	SitUps	20	2015-01-30	22	
1377	Miles	2.5	2015-01-30	22	
1378	Miles	1	2015-01-30	30	@ Home w/ Bear on bike
1379	SitUps	20	2015-01-30	30	@ Home- work break
1380	Lunges	20	2015-01-30	30	@ Home- work break
1381	Lunges	10	2015-01-30	30	@ Home- work break
1382	Burpees	10	2015-01-30	30	@ Home- work break
1383	Miles	4.5	2015-01-30	34	
1384	Lunges	150	2015-01-30	34	
1385	Burpees	50	2015-01-30	34	
1386	Miles	1	2015-01-30	41	
1387	SitUps	150	2015-01-30	34	
1388	Miles	1.5	2015-01-30	16	
1389	Miles	2.8	2015-01-30	14	work > home > ceramics > home
1390	SitUps	3	2015-01-30	37	
1391	SitUps	27	2015-01-30	37	
1392	Miles	3	2015-01-30	37	
1393	SitUps	20	2015-01-30	37	
1394	SitUps	20	2015-01-30	37	
1395	Lunges	160	2015-01-30	39	
1396	Burpees	30	2015-01-30	39	
1397	Miles	2	2015-01-29	23	Soccer game
1398	SitUps	40	2015-01-30	37	
1399	Burpees	60	2015-01-31	14	SF training mode breaks
1400	SitUps	40	2015-01-31	37	
1401	SitUps	70	2015-01-31	14	Can't sleep? Do sit-ups
1402	SitUps	100	2015-01-31	37	
1403	SitUps	45	2015-01-31	7	
1404	Lunges	30	2015-01-31	7	
1405	Burpees	15	2015-01-31	7	
1406	Miles	0.25	2015-01-30	8	
1407	SitUps	50	2015-01-31	8	
1408	Lunges	20	2015-01-31	8	
1409	Burpees	20	2015-01-31	8	
1410	SitUps	80	2015-01-31	30	@ C4 Crossfit- extra work
1411	Lunges	40	2015-01-31	30	@ C4 Crossfit- extra work
1412	Burpees	20	2015-01-31	30	@ C4 Crossfit- extra work
1413	Miles	1.25	2015-01-31	30	@ C4 Crossfit- extra work
1414	SitUps	30	2015-01-30	5	
1415	Miles	2	2015-01-31	5	
1416	Burpees	10	2015-01-30	5	
1417	SitUps	60	2015-01-31	15	
1418	Lunges	160	2015-01-31	38	
1419	Burpees	30	2015-01-31	38	
1420	SitUps	80	2015-01-31	30	@ Home
1421	Burpees	15	2015-01-31	30	@ Home
1422	Lunges	30	2015-01-31	30	@ Home
1423	SitUps	130	2015-01-31	9	
1424	Lunges	80	2015-01-31	9	
1425	Burpees	30	2015-01-31	9	
1426	Miles	3.5	2015-01-31	9	
1427	SitUps	70	2015-01-31	9	
1428	Lunges	90	2015-01-31	9	
1429	SitUps	30	2015-01-31	38	
1430	Lunges	20	2015-01-31	38	
1431	Burpees	15	2015-01-31	38	
1432	SitUps	30	2015-01-31	38	
1433	Lunges	30	2015-01-31	38	
1434	Burpees	15	2015-01-31	38	
1435	SitUps	30	2015-01-31	38	
1436	Lunges	40	2015-01-31	38	
1437	Burpees	15	2015-01-31	38	
1438	Miles	3.3	2015-01-31	9	
1439	SitUps	60	2015-01-31	20	
1440	Lunges	40	2015-01-31	20	
1441	Burpees	10	2015-01-31	20	
1442	SitUps	76	2015-01-31	21	
1443	Lunges	40	2015-01-31	21	
1444	Burpees	10	2015-01-31	21	
1445	SitUps	250	2015-01-31	13	
1446	Lunges	250	2015-01-31	13	
1447	SitUps	30	2015-01-31	9	
1448	Miles	1.7	2015-01-31	9	
1449	SitUps	180	2015-01-31	19	
1450	Lunges	100	2015-01-31	19	
1451	Burpees	65	2015-01-31	19	
1452	Miles	4	2015-01-31	19	
1453	Miles	3.5	2015-01-31	34	
1454	SitUps	24	2015-01-28	25	
1455	Lunges	20	2015-01-28	25	
1456	Burpees	10	2015-01-28	25	
1457	Miles	3	2015-01-28	25	
1458	SitUps	24	2015-01-31	25	
1459	Lunges	30	2015-01-31	25	
1460	Burpees	20	2015-01-31	25	
1461	Miles	1	2015-01-31	25	
1462	Burpees	151	2015-01-31	34	
1463	Lunges	250	2015-01-31	34	
1464	SitUps	50	2015-01-31	34	
1465	Miles	4	2015-01-31	25	
1466	Burpees	50	2015-01-31	13	
1467	Lunges	100	2015-01-31	25	
1468	SitUps	100	2015-01-31	25	
1469	Burpees	50	2015-01-31	13	
1470	Burpees	25	2015-01-31	13	
1471	SitUps	50	2015-01-31	15	
1472	Burpees	40	2015-01-31	14	Burpees after Dance Day
1473	Miles	4	2015-01-31	26	
1474	Burpees	10	2015-01-31	26	
1475	SitUps	200	2015-01-31	16	
1476	Lunges	10	2015-01-31	16	
1477	Burpees	20	2015-01-31	16	
1478	Miles	2	2015-01-29	29	
1479	Miles	1	2015-01-30	29	
1480	SitUps	300	2015-01-31	29	
1481	Lunges	25	2015-01-31	29	
1482	Burpees	10	2015-01-31	29	
1483	SitUps	50	2015-01-31	15	
1484	Burpees	40	2015-01-31	15	
1485	Miles	4.5	2015-01-31	3	
1486	Burpees	15	2015-01-31	3	
1487	SitUps	150	2015-01-31	34	
1488	Miles	1.6	2015-01-31	34	
1489	SitUps	100	2015-01-31	13	
1490	Lunges	100	2015-01-31	13	
1491	Burpees	25	2015-01-31	13	
1492	SitUps	160	2015-01-31	3	
1493	Burpees	30	2015-02-01	3	
1494	Lunges	50	2015-01-31	3	
1495	SitUps	45	2015-02-01	7	
1496	Lunges	30	2015-02-01	7	
1497	Burpees	15	2015-02-01	7	
1498	Miles	2	2015-01-31	41	2 hours of pickup ultimate= 2 miles
1499	Burpees	40	2015-01-27	24	recording for a few days
1500	SitUps	200	2015-02-01	24	
1501	Lunges	40	2015-02-01	24	
1502	Miles	10.5	2015-02-01	24	
1503	SitUps	97	2015-02-01	34	
1504	Burpees	41	2015-02-01	34	
1505	Lunges	51	2015-02-01	34	
1506	SitUps	100	2015-02-01	13	
1507	Burpees	60	2015-02-01	13	
1508	SitUps	60	2015-02-01	13	
1509	Burpees	40	2015-02-01	13	
1510	SitUps	120	2015-02-01	30	@ Home
1511	Burpees	30	2015-02-01	30	@ Home
1512	SitUps	150	2015-02-01	3	
1513	Burpees	40	2015-02-01	3	
1514	Lunges	100	2015-02-01	3	
1515	SitUps	41	2015-02-01	30	@ Home
1516	Lunges	21	2015-02-01	30	@ Home
1517	SitUps	60	2015-02-01	28	
1518	Lunges	80	2015-02-01	28	
1519	Burpees	40	2015-02-01	28	
1520	Miles	1.3	2015-01-29	28	
1521	SitUps	100	2015-02-01	14	Ugh I remember why I hate sit-ups.
1522	SitUps	10	2015-02-01	22	
1523	Lunges	20	2015-02-01	22	
1524	Miles	2	2015-02-01	41	
1525	Miles	2	2015-01-31	23	Soccer game
1526	Miles	1.5	2015-02-01	34	
1527	Lunges	100	2015-02-01	34	
1528	SitUps	200	2015-02-01	19	
1529	Lunges	125	2015-02-01	19	
1530	Burpees	61	2015-02-01	19	
1531	Miles	4	2015-02-01	19	
1532	SitUps	50	2015-02-01	25	
1533	Lunges	50	2015-02-01	25	
1534	Burpees	20	2015-02-01	25	
1535	Miles	4	2015-02-01	25	
1536	Miles	3.11	2015-02-01	16	
1537	Lunges	60	2015-02-01	9	
1538	Miles	0.4	2015-02-01	3	
1539	SitUps	100	2015-02-01	37	
1540	Miles	5	2015-02-01	37	
1541	Miles	3	2015-02-01	29	
1542	Miles	1	2015-02-01	5	pickup
1543	SitUps	90	2015-02-02	5	late night workout
1544	Lunges	60	2015-02-02	5	late night workout
1545	Burpees	30	2015-02-02	5	late night workout
1546	Miles	3	2015-02-02	5	
1547	SitUps	50	2015-02-02	9	
1548	Lunges	20	2015-02-02	9	
1549	Burpees	15	2015-02-02	9	
1550	SitUps	45	2015-02-02	7	
1551	Lunges	30	2015-02-02	7	
1552	Burpees	15	2015-02-02	7	
1553	Miles	1	2015-02-02	30	@ 24 Hour Fitness- Bench/ Curl & Press
1554	Burpees	60	2015-02-02	30	@ 24 Hour Fitness- Bench/ Curl & Press
1555	SitUps	240	2015-02-02	30	@ 24 Hour Fitness- Bench/ Curl & Press
1556	Lunges	120	2015-02-02	30	@ 24 Hour Fitness- Bench/ Curl & Press
1557	Miles	1	2015-01-30	17	
1558	Miles	1	2015-01-31	17	
1559	SitUps	50	2015-02-01	17	
1560	Lunges	50	2015-02-02	17	
1561	Burpees	10	2015-02-01	17	
1562	SitUps	200	2015-02-02	19	
1563	Lunges	150	2015-02-02	19	
1564	Burpees	30	2015-02-02	19	
1565	Miles	4	2015-02-02	19	
1566	SitUps	100	2015-02-02	34	
1567	SitUps	40	2015-02-02	37	
1568	SitUps	25	2015-02-02	21	
1569	Lunges	40	2015-02-02	21	
1570	Burpees	5	2015-02-02	21	
1571	SitUps	25	2015-02-02	20	
1572	Lunges	40	2015-02-02	20	
1573	Burpees	5	2015-02-02	20	
1574	Miles	1.25	2015-01-31	8	
1575	Miles	0.25	2015-02-02	8	
1576	SitUps	50	2015-02-02	8	
1577	Lunges	20	2015-02-02	8	
1578	Burpees	20	2015-02-02	8	
1579	SitUps	90	2015-02-02	38	
1580	Lunges	205	2015-02-02	38	
1581	Burpees	30	2015-02-02	38	
1582	Miles	1	2015-02-02	38	
1583	Miles	1	2015-02-02	3	
1584	SitUps	100	2015-01-31	11	
1585	Burpees	10	2015-01-31	11	
1586	Miles	2	2015-02-02	11	Snowshoeing!
1587	SitUps	65	2015-02-02	34	
1588	Burpees	25	2015-02-02	34	
1589	Lunges	50	2015-02-02	34	
1590	Miles	0.5	2015-02-02	34	
1591	Miles	1	2015-02-02	38	
1592	SitUps	150	2015-02-02	29	
1593	Miles	4	2015-02-02	29	
1594	SitUps	40	2015-02-02	37	
1595	Miles	1.5	2015-02-02	16	
1596	SitUps	100	2015-02-02	24	
1597	Miles	5	2015-02-02	24	
1598	SitUps	40	2015-02-02	37	
1599	Miles	0.5	2015-02-02	37	2@ 1/4m
1600	Miles	2.8	2015-02-02	14	work > home > ceramics > home
1601	Miles	1	2015-02-02	39	
1602	Miles	0.75	2015-02-02	7	prod fac w stairs
1603	SitUps	45	2015-02-03	7	
1604	Lunges	30	2015-02-03	7	
1605	Burpees	15	2015-02-03	7	
1606	SitUps	50	2015-02-03	9	
1607	Burpees	15	2015-02-03	9	
1608	SitUps	50	2015-02-03	8	
1609	Lunges	20	2015-02-03	8	
1610	Burpees	20	2015-02-03	8	
1611	Burpees	80	2015-02-03	34	
1612	Lunges	17	2015-02-03	34	
1613	Burpees	20	2015-02-02	17	
1614	Lunges	30	2015-02-02	17	
1615	Lunges	40	2015-02-03	30	@ 24 Hour Fitness- Deadlift & SOH
1616	Burpees	20	2015-02-03	30	@ 24 Hour Fitness- Deadlift & SOH
1617	Miles	0.75	2015-02-03	30	@ 24 Hour Fitness- Deadlift & SOH
1618	SitUps	100	2015-02-03	37	
1619	Miles	1	2015-02-03	37	Interval sprints 
1620	SitUps	64	2015-02-03	37	
1621	Miles	0.75	2015-02-03	7	prod fac w stairs
1622	SitUps	200	2015-02-03	19	
1623	Lunges	125	2015-02-03	19	
1624	Burpees	30	2015-02-03	19	
1625	Miles	4.5	2015-02-03	19	
1626	SitUps	60	2015-02-03	5	
1627	Lunges	40	2015-02-03	5	
1628	Burpees	30	2015-02-03	5	
1629	Burpees	10	2015-02-03	5	
1630	Burpees	10	2015-02-03	5	
1631	Miles	1.75	2015-02-03	37	Walking and Sprints
1632	Miles	1	2015-02-03	26	
1633	Lunges	265	2015-02-03	9	
1634	Burpees	6	2015-02-03	9	
1635	Miles	0.25	2015-02-03	9	
1636	SitUps	10	2015-02-03	5	
1637	Lunges	10	2015-02-03	5	
1638	Burpees	10	2015-02-03	5	
1639	Miles	2.25	2015-02-03	13	
1640	SitUps	100	2015-02-03	13	
1641	Burpees	100	2015-02-03	13	
1642	Burpees	10	2015-02-03	5	Catching up with my burpees
1643	Miles	3.2	2015-02-03	11	
1644	SitUps	124	2015-02-03	3	
1645	SitUps	105	2015-02-03	26	
1646	Lunges	80	2015-02-03	3	
1647	Lunges	70	2015-02-03	26	
1648	Burpees	40	2015-02-03	3	
1649	Burpees	31	2015-02-03	26	
1650	Miles	1.5	2015-02-03	3	
1651	Miles	3	2015-02-03	34	
1652	SitUps	60	2015-02-03	11	
1653	Burpees	30	2015-02-03	34	
1654	Lunges	55	2015-02-03	34	
1655	SitUps	115	2015-02-03	34	
1656	Miles	5.1	2015-01-30	15	
1657	Miles	8.1	2015-01-31	15	run, snowshoeing
1658	Miles	9.2	2015-02-01	15	
1659	Miles	10	2015-02-03	15	
1660	Miles	1	2015-02-03	30	@ Home w/ Bear on bike
1661	SitUps	100	2015-02-03	37	
1662	SitUps	50	2015-02-04	14	
1663	Burpees	25	2015-02-04	14	
1664	SitUps	90	2015-02-04	38	
1665	Miles	2	2015-02-04	38	
1666	Miles	1	2015-02-03	23	Indoor game
1667	Burpees	45	2015-02-04	38	
1668	Miles	2	2015-02-03	8	
1669	Lunges	252	2015-02-03	8	
1670	Burpees	9	2015-02-03	8	
1671	SitUps	50	2015-02-04	8	
1672	Lunges	20	2015-02-04	8	
1673	Burpees	20	2015-02-04	8	
1674	SitUps	50	2015-02-04	9	
1675	Lunges	20	2015-02-04	9	
1676	Burpees	15	2015-02-04	9	
1677	Miles	3	2015-02-03	17	
1678	SitUps	40	2015-02-04	30	@ Home w/ Tomas laughing
1679	Burpees	30	2015-02-04	30	@ Home w/ Tomas laughing
1680	Miles	1.8	2015-02-04	3	Walk to bus, walk from gym to work
1681	Miles	2	2015-02-03	41	2 hours of pickup ultimate= 2 miles
1682	SitUps	200	2015-02-04	19	
1683	Miles	4	2015-02-04	19	
1684	SitUps	45	2015-02-04	7	
1685	Lunges	30	2015-02-04	7	
1686	Burpees	15	2015-02-04	7	
1687	Miles	0.75	2015-02-04	7	prod fac w stairs
1688	SitUps	55	2015-02-04	21	
1689	Lunges	50	2015-02-04	21	
1690	Burpees	15	2015-02-04	21	
1691	SitUps	75	2015-02-04	20	
1692	Lunges	50	2015-02-04	20	
1693	Burpees	15	2015-02-04	20	
1694	Miles	2.5	2015-02-04	34	
1695	Miles	1	2015-02-04	9	
1696	Miles	1	2015-02-04	8	
1697	Miles	4	2015-02-04	37	
1698	Miles	1	2015-02-04	37	interval sprints
1699	Lunges	245	2015-02-04	38	
1700	SitUps	110	2015-02-04	38	
1701	Miles	1.2	2015-01-29	18	
1702	Miles	1.2	2015-01-31	18	
1703	Miles	1	2015-02-04	38	
1704	Miles	2.2	2015-02-02	18	
1705	Miles	1.2	2015-01-29	31	
1706	Miles	1.2	2015-01-31	31	
1707	Miles	2.2	2015-02-02	31	
1708	Miles	3	2015-01-26	31	
1709	SitUps	50	2015-01-26	31	
1710	Lunges	50	2015-01-26	31	
1711	Burpees	10	2015-01-26	31	
1712	Miles	1	2015-02-04	3	
1713	Lunges	30	2015-02-04	5	
1714	SitUps	50	2015-02-04	11	
1715	Burpees	50	2015-02-04	11	
1716	SitUps	25	2015-02-04	5	
1717	SitUps	20	2015-02-04	37	
1718	Miles	2	2015-02-04	16	
1719	SitUps	45	2015-02-05	7	
1720	Lunges	30	2015-02-05	7	
1721	Burpees	15	2015-02-05	7	
1722	SitUps	120	2015-02-05	34	
1723	Lunges	170	2015-02-05	34	
1724	Miles	1	2015-02-05	34	
1725	SitUps	231	2015-02-05	19	
1726	Lunges	50	2015-02-05	19	
1727	Burpees	50	2015-02-05	19	
1728	Miles	4.25	2015-02-05	19	
1729	Miles	0.75	2015-02-05	7	prod fac w stairs
1730	Miles	5	2015-02-05	26	
1731	SitUps	75	2015-02-05	26	
1732	Lunges	50	2015-02-05	26	
1733	Burpees	15	2015-02-05	26	
1734	SitUps	75	2015-02-05	26	
1735	Lunges	50	2015-02-05	26	
1736	Burpees	15	2015-02-05	26	
1737	Miles	2.2	2015-02-05	28	
1738	Miles	2.7	2015-02-04	28	
1739	SitUps	24	2015-02-05	25	
1740	Lunges	20	2015-02-05	25	
1741	Burpees	20	2015-02-05	25	
1742	Burpees	20	2015-02-05	25	
1743	Miles	1	2015-02-05	25	
1744	Miles	1	2015-02-05	25	
1745	Burpees	10	2015-02-04	25	
1746	Lunges	10	2015-02-04	25	
1747	SitUps	24	2015-02-04	25	
1748	SitUps	24	2015-02-03	25	
1749	Lunges	20	2015-02-03	25	
1750	Burpees	20	2015-02-03	25	
1751	Miles	2	2015-02-03	25	
1752	SitUps	24	2015-02-02	25	
1753	Lunges	20	2015-02-02	25	
1754	Burpees	20	2015-02-02	25	
1755	Miles	3	2015-02-02	25	
1756	SitUps	60	2015-02-05	11	
1757	Miles	3	2015-02-05	11	
1758	Miles	3.3	2015-02-05	34	
1759	Miles	1.2	2015-02-05	14	work walk
1760	Miles	1.2	2015-02-03	14	work walk
1761	Miles	2.1	2015-02-05	14	home > work > P.F. Chang's > home
1762	Lunges	100	2015-02-05	25	
1763	SitUps	135	2015-02-05	3	
1764	Lunges	100	2015-02-05	3	
1765	Burpees	30	2015-02-05	3	
1766	Miles	1.5	2015-02-05	3	
1767	SitUps	100	2015-02-06	38	
1768	Burpees	45	2015-02-06	38	
1769	SitUps	50	2015-02-06	5	
1770	Lunges	70	2015-02-06	5	
1771	Burpees	30	2015-02-06	5	
1772	Miles	4	2015-02-06	5	
1773	SitUps	45	2015-02-06	7	
1774	Lunges	30	2015-02-06	7	
1775	Burpees	15	2015-02-06	7	
1776	Miles	2.5	2015-02-02	22	
1777	Miles	1	2015-02-05	22	
1778	Miles	2.5	2015-02-06	22	
1779	SitUps	14	2015-02-02	22	
1780	SitUps	14	2015-02-06	22	
1781	Miles	0.5	2015-02-05	8	
1782	SitUps	50	2015-02-06	8	
1783	Lunges	20	2015-02-06	8	
1784	Burpees	20	2015-02-06	8	
1785	SitUps	40	2015-02-06	37	
1786	SitUps	100	2015-02-06	19	
1787	Miles	4	2015-02-06	19	
1788	SitUps	20	2015-02-06	5	
1789	Burpees	30	2015-02-06	5	
1790	Miles	2	2015-02-06	34	
1791	Lunges	200	2015-02-06	16	
1792	SitUps	397	2015-02-06	16	
1793	Burpees	50	2015-02-06	16	
1794	SitUps	300	2015-02-06	29	
1795	Lunges	225	2015-02-06	29	
1796	Burpees	75	2015-02-06	29	
1797	Miles	5	2015-02-03	15	
1798	Miles	5.1	2015-02-04	15	
1799	Miles	5	2015-02-06	15	whoops, Tuesday 5mi was actually Wednesday
1800	Miles	4.25	2015-02-06	37	
1801	Miles	1	2015-02-06	26	
1802	Miles	0.8	2015-02-06	3	
1803	Lunges	60	2015-02-06	3	
1804	Miles	2	2015-02-06	11	Frisbee Game
1805	Miles	1	2015-02-07	30	@ Hotel pregame warm-up
1806	Miles	4	2015-02-06	24	few days
1807	SitUps	50	2015-02-07	20	
1808	Lunges	50	2015-02-07	20	
1809	Burpees	15	2015-02-07	20	
1810	SitUps	50	2015-02-07	21	
1811	Lunges	50	2015-02-07	21	
1812	Burpees	15	2015-02-07	21	
1813	Miles	2	2015-02-07	21	
1814	Miles	2	2015-02-07	20	
1815	SitUps	22	2015-02-07	9	
1816	Lunges	90	2015-02-07	9	
1817	Burpees	10	2015-02-07	9	
1818	Miles	3	2015-02-07	9	
1819	Miles	0.8	2015-02-07	9	
1820	SitUps	100	2015-02-07	9	
1821	Lunges	100	2015-02-07	9	
1822	SitUps	100	2015-02-07	19	
1823	Lunges	50	2015-02-07	19	
1824	Burpees	30	2015-02-07	19	
1825	Miles	4.5	2015-02-07	19	
1826	Burpees	10	2015-02-07	9	
1827	SitUps	30	2015-02-07	5	
1828	Lunges	20	2015-02-07	5	
1829	Burpees	30	2015-02-07	5	
1830	Miles	5	2015-02-07	5	
1831	Miles	4	2015-02-07	34	
1832	Burpees	30	2015-02-07	34	
1833	Miles	2	2015-02-07	26	
1834	Lunges	10	2015-02-07	26	
1835	SitUps	100	2015-02-07	38	
1836	Lunges	165	2015-02-07	38	
1837	Miles	4	2015-02-07	11	2x Winter League Games
1838	Miles	1.2	2015-02-06	14	condo to blackcomb roundtrip
1839	Miles	2.7	2015-02-07	14	condo > Whistler / blackcomb > condo  / condo to whistler
1840	Miles	4.75	2015-02-07	24	
1841	Lunges	50	2015-02-07	24	
1842	Burpees	45	2015-02-08	38	
1843	SitUps	105	2015-02-08	38	
1844	Miles	1.8	2015-02-07	7	Pickerel Lake
1845	Miles	9	2015-02-07	16	
1846	Lunges	20	2015-02-07	8	
1847	Miles	1.25	2015-02-07	8	
1848	Burpees	1	2015-02-07	8	
1849	SitUps	90	2015-02-08	7	
1850	Lunges	60	2015-02-08	7	
1851	Burpees	30	2015-02-08	7	
1852	Miles	3	2015-02-07	3	
1853	Miles	4	2015-02-08	11	Sleepless in Seattle tourney
1854	SitUps	21	2015-02-08	34	
1855	Lunges	17	2015-02-08	34	
1856	Burpees	10	2015-02-08	5	
1857	Miles	1.9	2015-02-08	34	
1858	Miles	2.8	2015-02-08	20	
1859	Miles	2.8	2015-02-08	21	
1860	Miles	4	2015-02-08	19	
1861	Burpees	54	2015-02-08	34	
1862	Lunges	50	2015-02-08	34	
1863	Lunges	60	2015-02-08	5	
1864	Burpees	15	2015-02-08	34	
1865	SitUps	60	2015-02-08	5	
1866	Burpees	40	2015-02-08	5	
1867	Lunges	20	2015-02-08	5	
1868	Miles	5	2015-02-08	5	
1869	Burpees	10	2015-02-08	5	
1870	SitUps	120	2015-02-08	3	
1871	Miles	2	2015-02-08	3	
1872	SitUps	110	2015-02-08	38	
1873	SitUps	50	2015-02-05	31	
1874	Lunges	50	2015-02-05	31	
1875	Miles	1	2015-02-05	31	
1876	SitUps	150	2015-02-07	31	
1877	Lunges	170	2015-02-07	31	
1878	SitUps	150	2015-02-08	31	
1879	Burpees	10	2015-02-07	31	
1880	Lunges	50	2015-02-08	31	
1881	SitUps	60	2015-02-09	38	
1882	Burpees	50	2015-02-09	38	
1883	SitUps	100	2015-02-09	9	
1884	Lunges	90	2015-02-09	9	
1885	Miles	1	2015-02-09	37	
1886	SitUps	45	2015-02-09	7	
1887	Lunges	30	2015-02-09	7	
1888	Burpees	15	2015-02-09	7	
1889	Burpees	15	2015-02-09	30	@ Home- good morning
1890	Miles	1	2015-02-08	30	Pre-game warm-up
1891	SitUps	50	2015-02-05	17	
1892	Lunges	50	2015-02-05	17	
1893	Burpees	25	2015-02-05	17	
1894	Lunges	20	2015-02-06	17	
1895	SitUps	20	2015-02-06	17	
1896	Miles	1	2015-02-06	17	
1897	Miles	3	2015-02-09	22	
1898	SitUps	100	2015-02-09	18	
1899	Lunges	100	2015-02-09	18	
1900	Burpees	30	2015-02-09	18	
1901	SitUps	60	2015-02-09	37	
1902	Miles	1.5	2015-02-09	37	intervals
1903	Miles	1.65	2015-02-08	14	condo >blackcomb> condo> whistler>
1904	Miles	0.6	2015-02-08	14	condo >blackcomb> condo> whistler> correction
1905	Miles	1.75	2015-02-08	26	
1906	Miles	4.2	2015-02-09	18	
1907	Miles	1	2015-02-09	34	
1908	SitUps	100	2015-02-09	19	
1909	Lunges	50	2015-02-09	19	
1910	Burpees	30	2015-02-09	19	
1911	Miles	4	2015-02-09	19	
1912	Miles	3	2015-02-09	26	
1913	SitUps	125	2015-02-09	38	
1914	Miles	3	2015-02-09	38	
1915	Miles	0.3	2015-02-09	38	
1916	SitUps	100	2015-02-09	11	
1917	Lunges	60	2015-02-09	11	
1918	Miles	1	2015-02-09	11	
1919	Burpees	50	2015-02-09	38	
1920	Lunges	50	2015-02-09	38	
1921	Miles	1	2015-02-09	3	
1922	Miles	1	2015-02-09	34	
1923	Burpees	50	2015-02-09	18	
1924	SitUps	200	2015-02-09	29	
1925	Lunges	100	2015-02-09	29	
1926	Miles	3	2015-02-09	29	
1927	Miles	9	2015-02-07	29	walking 'round Disneyland not for work. 
1928	Lunges	100	2015-02-09	18	
1929	Miles	1.5	2015-02-09	16	
1930	SitUps	300	2015-02-09	16	
1931	SitUps	200	2015-02-09	34	
1932	Lunges	100	2015-02-09	34	
1933	Burpees	50	2015-02-09	34	
1934	Miles	10	2015-02-07	15	rough MLU tryout equivalent
1935	Miles	18	2015-02-08	15	
1936	Miles	3.3	2015-02-09	15	so sore
1937	Lunges	30	2015-02-10	5	
1938	Burpees	30	2015-02-10	5	
1939	Miles	3	2015-02-10	5	
1940	SitUps	50	2015-02-10	8	
1941	SitUps	50	2015-02-09	8	
1942	Lunges	20	2015-02-10	8	
1943	Lunges	20	2015-02-09	8	
1944	Burpees	20	2015-02-10	8	
1945	Burpees	20	2015-02-09	8	
1946	Miles	4.25	2015-02-09	8	
1947	SitUps	30	2015-02-10	9	
1948	SitUps	25	2015-02-09	21	
1949	Lunges	30	2015-02-09	21	
1950	SitUps	25	2015-02-09	20	
1951	Lunges	30	2015-02-09	20	
1952	Burpees	5	2015-02-09	20	
1953	Miles	0.6	2015-02-09	20	
1954	Miles	0.75	2015-02-09	7	prod fac w stairs
1955	SitUps	45	2015-02-10	7	
1956	Lunges	30	2015-02-10	7	
1957	Burpees	15	2015-02-10	7	
1958	Miles	2.5	2015-02-10	34	
1959	Miles	0.75	2015-02-10	7	prod fac w stairs
1960	Miles	0.6	2015-02-10	20	
1961	Miles	4.1	2015-02-10	19	
1962	Lunges	191	2015-02-10	38	
1963	SitUps	135	2015-02-10	38	
1964	SitUps	150	2015-02-09	17	
1965	Lunges	100	2015-02-09	17	
1966	Burpees	25	2015-02-09	17	
1967	Miles	2.58	2015-02-10	38	
1968	Miles	1.25	2015-02-09	30	@ Home w/ Bear on bike
1969	Burpees	6	2015-02-10	9	
1970	Miles	3	2015-02-10	9	
1971	Burpees	50	2015-02-10	34	
1972	Miles	2.75	2015-02-10	8	
1973	Lunges	284	2015-02-10	8	
1974	Burpees	6	2015-02-10	8	
1975	Miles	1.8	2015-02-10	26	
1976	SitUps	60	2015-02-10	11	
1977	Miles	3.5	2015-02-10	11	
1978	Miles	1	2015-02-10	34	
1979	Miles	1.5	2015-02-10	5	
1980	Burpees	30	2015-02-10	34	
1981	Lunges	50	2015-02-10	34	
1982	SitUps	115	2015-02-10	34	
1983	Miles	2.5	2015-02-10	16	
1984	Lunges	100	2015-02-10	18	
1985	Burpees	20	2015-02-10	18	
1986	SitUps	100	2015-02-10	31	
1987	Lunges	150	2015-02-10	31	
1988	Miles	1	2015-02-10	31	
1989	Burpees	10	2015-02-10	31	
1990	Miles	2	2015-02-10	38	
1991	SitUps	45	2015-02-11	7	
1992	Lunges	30	2015-02-11	7	
1993	Burpees	15	2015-02-11	7	
1994	Miles	3	2015-02-10	17	
1995	SitUps	15	2015-02-11	22	
1996	Burpees	15	2015-02-11	22	30 modified
1997	Miles	3.5	2015-02-11	22	
1998	SitUps	40	2015-02-11	37	
1999	Miles	0.6	2015-02-11	20	
2000	SitUps	24	2015-02-10	25	
2001	Lunges	30	2015-02-10	25	
2002	Burpees	10	2015-02-10	25	
2003	Miles	3	2015-02-10	25	
2004	SitUps	24	2015-02-09	25	
2005	Lunges	30	2015-02-09	25	
2006	Burpees	20	2015-02-09	25	
2007	Miles	2	2015-02-09	25	
2008	SitUps	48	2015-02-08	25	
2009	Lunges	50	2015-02-08	25	
2010	Burpees	20	2015-02-08	25	
2011	Miles	7	2015-02-08	25	
2012	SitUps	24	2015-02-07	25	
2013	Lunges	20	2015-02-07	25	
2014	Burpees	10	2015-02-07	25	
2015	Miles	2	2015-02-07	25	
2016	SitUps	24	2015-02-06	25	
2017	Lunges	20	2015-02-06	25	
2018	Burpees	10	2015-02-06	25	
2019	Miles	1	2015-02-11	25	
2020	Miles	1	2015-02-06	25	
2021	Miles	1	2015-02-10	3	
2022	Miles	1.2	2015-02-10	14	work walk
2023	Miles	1.2	2015-02-11	14	work walk
2024	Lunges	35	2015-02-11	24	
2025	Burpees	20	2015-02-11	24	
2026	Miles	1.5	2015-02-11	24	
2027	SitUps	150	2015-02-11	24	
2028	Miles	1	2015-02-11	3	
2029	SitUps	150	2015-02-11	18	
2030	Lunges	50	2015-02-11	18	
2031	Burpees	10	2015-02-11	18	
2032	Miles	1.15	2015-02-11	18	
2033	SitUps	100	2015-02-11	31	
2034	Miles	9	2015-02-11	5	Not good splits, but going the distance.....
2035	SitUps	50	2015-02-11	34	
2036	Miles	2	2015-02-11	26	
2037	Burpees	10	2015-02-11	34	
2038	Lunges	20	2015-02-12	38	
2039	SitUps	60	2015-02-12	8	
2040	Lunges	20	2015-02-12	8	
2041	Burpees	20	2015-02-12	8	
2042	Miles	0.25	2015-02-11	8	
2043	Miles	1	2015-02-12	37	
2044	Miles	0.75	2015-02-11	30	@ Home w/ Bear on bike
2045	Burpees	1	2015-02-12	30	@ Home
2046	SitUps	75	2015-02-12	21	
2047	Lunges	50	2015-02-12	21	
2048	Burpees	15	2015-02-12	21	
2049	SitUps	100	2015-02-12	20	
2050	Lunges	50	2015-02-12	20	
2051	Burpees	15	2015-02-12	20	
2052	Miles	0.6	2015-02-12	20	
2053	SitUps	100	2015-02-12	38	
2054	Lunges	100	2015-02-12	38	
2055	Miles	2.5	2015-02-12	38	
2056	SitUps	24	2015-02-12	38	
2057	Miles	0.75	2015-02-11	7	prod fac w stairs
2058	SitUps	45	2015-02-12	7	
2059	Lunges	30	2015-02-12	7	
2060	Burpees	15	2015-02-12	7	
2061	Miles	0.75	2015-02-12	7	prod fac w stairs
2062	Miles	1.4	2015-02-12	34	
2063	Burpees	52	2015-02-12	34	
2064	Lunges	161	2015-02-12	34	
2065	SitUps	225	2015-02-12	34	
2066	Miles	1.5	2015-02-12	24	
2067	Miles	1.3	2015-02-12	18	
2068	SitUps	50	2015-02-12	18	
2069	Burpees	25	2015-02-12	18	
2070	Miles	8.2	2015-02-10	15	
2071	Miles	12.1	2015-02-11	15	
2072	Miles	10.6	2015-02-12	15	
2073	Miles	1	2015-02-12	3	
2074	SitUps	25	2015-02-13	5	
2075	SitUps	40	2015-02-11	11	
2076	Lunges	20	2015-02-11	11	
2077	SitUps	45	2015-02-13	7	
2078	Lunges	30	2015-02-13	7	
2079	Burpees	15	2015-02-13	7	
2080	Miles	0.75	2015-02-13	7	prod fac w stairs
2081	SitUps	15	2015-02-13	22	
2082	Burpees	15	2015-02-13	22	
2083	Miles	3	2015-02-13	22	
2084	Miles	2.5	2015-02-13	26	
2085	Miles	4.8	2015-02-12	26	
2086	Miles	1.6	2015-02-13	34	
2087	Miles	3.7	2015-02-13	38	
2088	Lunges	10	2015-02-13	38	
2089	SitUps	146	2015-02-13	38	
2090	Burpees	50	2015-02-13	38	
2091	Miles	0.6	2015-02-13	20	
2092	Miles	1.5	2015-02-10	41	
2093	Miles	1.5	2015-02-12	41	
2094	Miles	5.7	2015-02-13	3	
2095	SitUps	300	2015-02-13	18	
2096	Miles	1.15	2015-02-13	18	
2097	SitUps	150	2015-02-12	31	
2098	Burpees	10	2015-02-12	31	
2099	Lunges	50	2015-02-13	31	
2100	Miles	4	2015-02-13	37	
2101	SitUps	70	2015-02-14	5	
2102	Lunges	100	2015-02-14	5	
2103	Burpees	40	2015-02-14	5	
2104	Miles	3	2015-02-14	5	6:22 pace on lap
2105	Miles	2	2015-02-10	29	
2106	Miles	3	2015-02-13	29	
2107	SitUps	60	2015-02-14	7	
2108	Lunges	40	2015-02-14	7	
2109	Burpees	20	2015-02-14	7	
2110	Miles	1.5	2015-02-14	18	
2111	Miles	1.7	2015-02-13	14	work walk + walk to plaza Garibaldi
2112	Miles	2	2015-02-12	28	
2113	SitUps	45	2015-02-11	28	
2114	Lunges	60	2015-02-14	28	
2115	Burpees	30	2015-02-11	28	
2116	Miles	2	2015-02-12	22	
2117	Miles	3.11	2015-02-13	16	
2118	Miles	7.3	2015-02-14	3	
2119	Miles	4.5	2015-02-14	26	
2120	Miles	2	2015-02-14	5	
2121	Burpees	10	2015-02-14	34	
2122	Miles	2.5	2015-02-14	34	
2123	Miles	1	2015-02-13	23	Work->Dinner
2124	Miles	2.75	2015-02-14	16	
2125	Miles	0.8	2015-02-14	34	
2126	SitUps	100	2015-02-14	34	
2127	Miles	2	2015-02-14	18	
2128	Lunges	40	2015-02-14	18	
2129	Burpees	10	2015-02-14	18	
2130	Miles	1.1	2015-02-15	34	
2131	SitUps	120	2015-02-15	34	
2132	Burpees	90	2015-02-15	34	
2133	Miles	2	2015-02-14	24	Atlanta airport is huge!
2134	Miles	7	2015-02-15	24	city + no car
2135	SitUps	100	2015-02-14	24	
2136	Lunges	30	2015-02-13	24	
2137	Miles	2	2015-02-14	41	2 hours of pickup ultimate= 2 miles
2138	Miles	2	2015-02-15	5	
2139	Miles	1.5	2015-02-15	16	
2140	SitUps	25	2015-02-15	20	
2141	Lunges	30	2015-02-15	20	
2142	Burpees	5	2015-02-15	20	
2143	SitUps	25	2015-02-15	21	
2144	Lunges	30	2015-02-15	21	
2145	Burpees	5	2015-02-15	21	
2146	Miles	1.3	2015-02-14	30	@ Home-Family walk
2147	Miles	1	2015-02-15	30	@ Home- Walk with Bear and friends
2148	SitUps	13	2015-02-15	34	
2149	SitUps	70	2015-02-15	7	
2150	Lunges	40	2015-02-15	7	
2151	Burpees	20	2015-02-15	7	
2152	Lunges	40	2015-02-15	24	
2153	SitUps	80	2015-02-15	24	
2154	Burpees	15	2015-02-15	24	
2155	Miles	1.7	2015-02-15	18	
2156	Lunges	100	2015-02-15	18	
2157	Burpees	50	2015-02-15	18	
2158	Miles	2	2015-02-15	37	
2159	SitUps	70	2015-02-16	5	
2160	Lunges	40	2015-02-16	5	
2161	Burpees	40	2015-02-16	5	
2162	Miles	3	2015-02-16	5	
2163	SitUps	45	2015-02-16	7	
2164	Lunges	30	2015-02-16	7	
2165	Burpees	15	2015-02-16	7	
2166	Miles	2	2015-02-15	37	
2167	Burpees	10	2015-02-12	17	
2168	SitUps	50	2015-02-12	17	
2169	Lunges	50	2015-02-16	17	
2170	Miles	1	2015-02-13	17	
2171	SitUps	25	2015-02-14	17	
2172	Lunges	50	2015-02-14	17	
2173	Burpees	25	2015-02-14	17	
2174	Miles	2	2015-02-14	17	
2175	Miles	1	2015-02-15	17	
2176	Miles	1	2015-02-16	17	
2177	Burpees	67	2015-02-16	34	
2178	Lunges	30	2015-02-15	3	
2179	Miles	1.6	2015-02-15	3	
2180	Miles	1.5	2015-02-16	30	@ 24 Hour Fitness
2181	SitUps	170	2015-02-16	38	
2182	Lunges	220	2015-02-16	38	
2183	Miles	1.6	2015-02-16	34	
2184	Miles	1.5	2015-02-16	16	
2185	Miles	3.25	2015-02-13	19	
2186	Miles	3	2015-02-14	19	
2187	Miles	4	2015-02-15	19	
2188	Lunges	150	2015-02-16	16	
2189	SitUps	500	2015-02-16	16	
2190	Burpees	50	2015-02-16	16	
2191	Miles	3	2015-02-14	29	
2192	SitUps	500	2015-02-16	29	
2193	Burpees	10	2015-02-16	29	
2194	Lunges	125	2015-02-16	29	
2195	Miles	1	2015-02-16	29	
2196	SitUps	100	2015-02-16	16	
2197	Lunges	80	2015-02-16	16	
2198	Burpees	20	2015-02-16	16	
2199	SitUps	51	2015-02-16	16	
2200	Miles	1.5	2015-02-16	30	@ 24 Hour Fitness
2201	Miles	3.8	2015-02-16	18	
2202	Miles	5.5	2015-02-15	31	
2203	Miles	3.8	2015-02-16	31	
2204	Burpees	20	2015-02-16	18	
2205	SitUps	50	2015-02-15	14	late night situps
2206	Miles	2.8	2015-02-16	14	work > home > ceramics > home
2207	Burpees	50	2015-02-16	38	
2208	Burpees	30	2015-02-16	38	
2209	Miles	2	2015-02-13	11	WWL Game!
2210	Miles	2	2015-02-14	11	Winter league
2211	Miles	1	2015-02-15	11	Goaltie
2212	Miles	3	2015-02-16	11	Track workout
2213	Miles	2	2015-02-16	41	
2214	Lunges	60	2015-02-16	41	
2215	Miles	0.75	2015-02-17	7	prod fac w stairs
2216	SitUps	45	2015-02-17	7	
2217	Lunges	30	2015-02-17	7	
2218	Burpees	15	2015-02-17	7	
2219	Miles	1	2015-02-16	4	
2220	Miles	0.4	2015-02-16	3	
2221	Miles	0.5	2015-02-17	30	@ C4 Crossfit- extra work
2222	SitUps	40	2015-02-17	37	
2223	Miles	4.5	2015-02-17	19	
2224	SitUps	80	2015-02-17	38	
2225	Miles	2.6	2015-02-17	38	
2226	Burpees	40	2015-02-17	38	
2227	Miles	2	2015-02-17	38	
2228	Miles	3.5	2015-02-17	34	
2229	Miles	4	2015-02-17	18	
2230	SitUps	50	2015-02-17	18	
2231	Burpees	30	2015-02-17	18	
2232	Miles	2	2015-02-17	31	
2233	Lunges	30	2015-02-17	31	
2234	SitUps	50	2015-02-17	31	
2235	Miles	2	2015-02-17	5	
2236	Miles	2	2015-02-15	23	Soccer game
2237	Miles	2.5	2015-02-18	16	
2238	Miles	0.25	2015-02-12	8	
2239	Miles	0.25	2015-02-13	8	
2240	Miles	1.5	2015-02-14	8	
2241	Miles	0.25	2015-02-16	8	
2242	Miles	1.25	2015-02-17	8	
2243	Lunges	20	2015-02-14	8	
2244	Burpees	5	2015-02-14	8	
2245	Miles	0.75	2015-02-16	7	prod fac w stairs
2246	Miles	0.75	2015-02-18	7	prod fac w stairs
2247	SitUps	45	2015-02-18	7	
2248	Lunges	30	2015-02-18	7	
2249	Burpees	15	2015-02-18	7	
2250	Miles	3	2015-02-18	30	@ 24 Hour Fitness
2251	Miles	1.5	2015-02-17	22	
2252	SitUps	80	2015-02-18	38	
2253	Lunges	10	2015-02-18	38	
2254	Miles	1.2	2015-02-18	9	
2255	Miles	3	2015-02-17	17	
2256	Miles	1	2015-02-18	17	
2257	Miles	2	2015-02-18	38	
2258	Miles	1	2015-02-17	3	
2259	Lunges	20	2015-02-18	3	
2260	Miles	1	2015-02-18	3	
2261	Burpees	35	2015-02-18	38	
2262	Miles	2.9	2015-02-18	34	
2263	Miles	1	2015-02-18	37	Interval sprints 
2264	Miles	2	2015-02-18	18	
2265	Miles	2	2015-02-17	41	2 hours of pickup ultimate= 2 miles
2266	Miles	1.2	2015-02-17	14	work walk
2267	Miles	2.8	2015-02-18	14	work > home > ceramics > home
2268	SitUps	130	2015-02-18	18	
2269	SitUps	100	2015-02-18	31	
2270	Lunges	80	2015-02-18	31	
2271	Burpees	10	2015-02-18	31	
2272	Miles	1	2015-02-18	31	
2273	SitUps	30	2015-02-18	37	
2274	Miles	1	2015-02-18	37	Slower intervals
2275	SitUps	100	2015-02-18	3	
2276	SitUps	40	2015-02-18	11	
2277	Lunges	48	2015-02-18	11	
2278	Burpees	16	2015-02-18	11	
2279	Miles	1	2015-02-18	11	
2280	Burpees	60	2015-02-19	14	wake up and burpee
2281	Miles	1.25	2015-02-19	30	@ C4 Crossfit- extra work
2282	Miles	1.6	2015-02-15	26	
2283	Miles	4.5	2015-02-18	26	
2284	Miles	0.75	2015-02-19	7	prod fac w stairs
2285	SitUps	45	2015-02-19	7	
2286	Lunges	30	2015-02-19	7	
2287	Burpees	15	2015-02-19	7	
2288	SitUps	100	2015-02-19	19	
2289	Lunges	50	2015-02-19	19	
2290	Burpees	30	2015-02-19	19	
2291	Miles	4.5	2015-02-19	19	
2292	Burpees	65	2015-02-19	34	
2293	Miles	2.3	2015-02-19	34	
2294	Miles	3	2015-02-17	29	
2295	Miles	1	2015-02-18	29	
2296	Miles	6.2	2015-02-19	29	
2297	Miles	1.15	2015-02-19	18	
2298	Lunges	80	2015-02-19	18	
2299	Burpees	100	2015-02-19	18	
2300	Miles	3.11	2015-02-19	16	
2301	SitUps	70	2015-02-20	5	
2302	Lunges	50	2015-02-20	5	
2303	Burpees	40	2015-02-20	5	
2304	Miles	3	2015-02-20	5	
2305	SitUps	15	2015-02-20	5	
2306	Burpees	10	2015-02-20	5	
2307	SitUps	15	2015-02-20	5	
2308	SitUps	45	2015-02-20	7	
2309	Lunges	30	2015-02-20	7	
2310	Burpees	15	2015-02-20	7	
2311	Miles	2	2015-02-19	26	
2312	Miles	1.5	2015-02-20	34	
2313	Miles	4.5	2015-02-20	19	
2314	Miles	2.3	2015-02-20	34	
2315	Miles	5	2015-02-20	26	
2316	Miles	1.4	2015-02-19	3	
2317	Miles	1.6	2015-02-20	3	
2318	Lunges	60	2015-02-20	3	
2319	Miles	2	2015-02-20	11	WWL Game!
2320	Burpees	10	2015-02-20	18	
2321	Miles	1.15	2015-02-20	18	
2322	SitUps	45	2015-02-21	7	
2323	Lunges	30	2015-02-21	7	
2324	Burpees	15	2015-02-21	7	
2325	Miles	0.75	2015-02-20	7	prod fac w stairs
2326	SitUps	50	2015-02-20	9	
2327	Miles	3.2	2015-02-20	9	
2328	Miles	3	2015-02-16	24	
2329	Miles	1	2015-02-17	24	
2330	Miles	3	2015-02-20	24	
2331	SitUps	50	2015-02-18	24	
2332	Burpees	20	2015-02-18	24	
2333	Miles	1.5	2015-02-19	24	
2334	Miles	1.4	2015-02-21	18	
2335	Burpees	20	2015-02-21	18	
2336	Miles	6.3	2015-02-21	19	
2337	SitUps	10	2015-02-21	14	Drunk Situps
2338	Miles	1.2	2015-02-19	14	work walk
2339	Miles	1.5	2015-02-21	14	work walk +
2340	SitUps	100	2015-02-21	18	
2341	Burpees	10	2015-02-21	18	
2342	Miles	1.4	2015-02-21	31	
2343	Miles	3	2015-02-20	30	@ 24 Hour Fitness
2344	Miles	1	2015-02-21	34	
2345	Lunges	40	2015-02-21	3	
2346	Miles	2	2015-02-21	11	Winter league
2347	Miles	1.5	2015-02-21	16	
2348	Lunges	25	2015-02-21	24	
2349	Miles	10	2015-02-21	24	2x ulty game + lots of walking!
2350	SitUps	30	2015-02-22	18	
2351	Lunges	30	2015-02-22	18	
2352	SitUps	40	2015-02-22	18	
2353	Burpees	10	2015-02-22	18	
2354	Lunges	50	2015-02-22	3	
2355	Miles	1.8	2015-02-22	7	Pickerel Lake
2356	SitUps	60	2015-02-22	7	
2357	Lunges	40	2015-02-22	7	
2358	Burpees	20	2015-02-22	7	
2359	Miles	2	2015-02-21	5	
2360	Miles	6.8	2015-02-22	19	
2361	Miles	2	2015-02-22	5	
2362	Miles	0.75	2015-02-22	18	
2363	Lunges	100	2015-02-22	18	
2364	SitUps	100	2015-02-22	18	
2365	Miles	1	2015-02-22	41	
2366	Miles	5	2015-02-22	16	
2367	SitUps	50	2015-02-22	5	
2368	Lunges	50	2015-02-22	5	
2369	Burpees	50	2015-02-22	5	
2370	Miles	3	2015-02-22	5	
2371	Lunges	40	2015-02-22	3	
2372	SitUps	45	2015-02-23	7	
2373	Lunges	30	2015-02-23	7	
2374	Burpees	15	2015-02-23	7	
2375	SitUps	50	2015-02-23	37	
2376	Miles	4	2015-02-22	37	
2377	Miles	1.15	2015-02-23	18	
2378	Burpees	10	2015-02-23	18	
2379	Miles	6.7	2015-02-23	19	
2380	Miles	2.9	2015-02-23	18	
2381	SitUps	50	2015-02-23	28	
2382	Lunges	40	2015-02-23	28	
2383	Burpees	30	2015-02-23	28	
2384	Miles	1	2015-02-23	5	
2385	SitUps	60	2015-02-23	38	
2386	Miles	3.5	2015-02-23	38	
2387	Miles	1.6	2015-02-19	28	
2388	Miles	3	2015-02-23	11	
2389	Miles	1	2015-02-22	11	Goaltie
2390	SitUps	100	2015-02-23	18	
2391	Lunges	50	2015-02-23	18	
2392	Burpees	25	2015-02-23	18	
2393	Miles	1.5	2015-02-23	16	
2394	Lunges	60	2015-02-23	3	
2395	SitUps	20	2015-02-23	5	
2396	Burpees	10	2015-02-23	5	
2397	Miles	4.2	2015-02-24	38	
2398	Lunges	30	2015-02-23	22	
2399	Miles	3	2015-02-23	22	
2400	Miles	0.5	2015-02-24	30	@ C4 Crossfit- too cold 
2401	Miles	4.6	2015-02-24	19	Throw it in the fire, Frodo
2402	Shot	2	2015-02-24	19	
2403	Miles	2.8	2015-02-23	14	work > home > ceramics > home
2404	Lunges	100	2015-02-24	38	
2405	SitUps	128	2015-02-24	38	
2406	Miles	1.75	2015-02-24	28	
2407	Burpees	15	2015-02-24	22	
2408	Miles	1	2015-02-24	22	
2409	SitUps	8	2015-02-24	22	
2410	Miles	1	2015-02-24	3	
2411	Lunges	40	2015-02-24	3	
2412	Miles	3	2015-02-24	26	
2413	Lunges	35	2015-02-24	26	
2414	Miles	2	2015-02-24	5	
2415	Miles	2.2	2015-02-24	18	
2416	Burpees	20	2015-02-24	18	
2417	SitUps	105	2015-02-24	18	
2418	Lunges	48	2015-02-24	11	
2419	Burpees	16	2015-02-24	11	
2420	Miles	1	2015-02-24	11	
2421	SitUps	20	2015-02-24	11	
2422	Lunges	40	2015-02-24	18	
2423	Miles	4.5	2015-02-24	38	
2424	Miles	14	2015-02-24	38	
2425	Miles	2.8	2015-02-24	14	home work > home > ceramics > home
2426	Miles	1.5	2015-02-24	37	
2427	Miles	2	2015-02-24	41	2 hours of pickup ultimate= 2 miles
2428	Miles	0.75	2015-02-24	7	prod fac w stairs
2429	Miles	0.6	2015-02-24	34	
2430	Miles	1.5	2015-02-25	30	@ 24 Hour Fitness
2431	SitUps	25	2015-02-19	17	
2432	Lunges	25	2015-02-19	17	
2433	Burpees	25	2015-02-19	17	
2434	Miles	3	2015-02-21	17	
2435	Miles	1	2015-02-22	17	
2436	SitUps	50	2015-02-23	17	
2437	Lunges	100	2015-02-23	17	
2438	Burpees	25	2015-02-23	17	
2439	Miles	3	2015-02-23	17	
2440	Miles	2	2015-02-24	17	
2441	Miles	3	2015-02-25	38	
2442	Miles	4.5	2015-02-25	26	
2443	Miles	3	2015-02-25	5	
2444	Miles	1	2015-02-25	9	
2445	Miles	2	2015-02-25	3	
2446	Miles	1.5	2015-02-25	16	
2447	Miles	2	2015-02-25	34	
2448	SitUps	45	2015-02-25	7	
2449	Lunges	30	2015-02-25	7	
2450	Burpees	15	2015-02-25	7	
2451	SitUps	45	2015-02-26	7	
2452	Lunges	30	2015-02-26	7	
2453	Burpees	15	2015-02-26	7	
2454	Miles	0.75	2015-02-25	30	@ Home exploring w/ Bear
2455	Miles	1	2015-02-26	30	@ C4 Crossfit- part of Christine
2456	Miles	4.5	2015-02-26	3	
2457	Burpees	10	2015-02-25	17	
2458	Miles	1.15	2015-02-25	18	
2459	SitUps	100	2015-02-26	41	
2460	Miles	1.5	2015-02-26	41	
2461	Lunges	150	2015-02-26	41	
2462	Miles	1.2	2015-02-25	14	work walk
2463	Miles	1.2	2015-02-26	14	work walk
2464	Miles	1.15	2015-02-26	18	
2465	Burpees	50	2015-02-26	18	
2466	SitUps	60	2015-02-26	18	
2467	Lunges	60	2015-02-26	18	
2468	Lunges	10	2015-02-26	18	
2469	Miles	2.2	2015-02-26	3	
2470	Miles	0.5	2015-02-27	37	Intervals. 
2471	Miles	1	2015-02-26	17	
2472	SitUps	150	2015-02-27	14	wake up, situp
2473	Miles	0.25	2015-02-27	30	@ C4 Crossfit- warm-up
2474	Miles	5.5	2015-02-26	16	
2475	SitUps	100	2015-02-27	41	
2476	Miles	2	2015-02-27	41	
2477	Lunges	90	2015-02-27	41	
2478	Miles	2.2	2015-02-27	34	
2479	Miles	3.5	2015-02-27	22	
2480	Burpees	10	2015-02-27	18	
2481	Miles	1.15	2015-02-27	18	
2482	Lunges	250	2015-02-27	18	
2483	Miles	3.6	2015-02-27	3	
2484	Miles	2.4	2015-02-27	26	
2485	Miles	0.8	2015-02-27	26	
2486	SitUps	100	2015-02-27	3	
2487	Lunges	42	2015-02-27	3	
2488	Burpees	20	2015-02-27	3	
2489	Miles	4	2015-02-27	37	
2490	SitUps	45	2015-02-27	7	
2491	Lunges	30	2015-02-27	7	
2492	Burpees	15	2015-02-27	7	
2493	Miles	0.75	2015-02-27	7	prod fac w stairs
2494	SitUps	45	2015-02-28	7	
2495	Lunges	30	2015-02-28	7	
2496	Burpees	15	2015-02-28	7	
2497	Miles	0.75	2015-02-26	7	
2498	Miles	2	2015-02-28	11	Winter league
2499	Miles	2	2015-02-27	11	WWL Game!
2500	Miles	2	2015-02-26	11	Goaltie
2501	Miles	1.6	2015-02-28	34	
2502	Miles	3	2015-02-28	16	
2503	Miles	1.5	2015-02-28	3	
2504	Lunges	45	2015-02-28	3	
2505	SitUps	150	2015-02-28	18	
2506	SitUps	100	2015-02-22	4	
2507	Lunges	20	2015-02-22	4	
2508	Burpees	30	2015-02-22	4	
2509	Miles	3.1	2015-02-25	4	
2510	Miles	3	2015-02-28	4	
2511	Miles	1	2015-02-23	24	
2512	Miles	1.5	2015-02-24	24	
2513	Miles	1	2015-02-25	24	
2514	Miles	3	2015-02-26	24	
2515	Miles	4	2015-02-27	24	
2516	Lunges	25	2015-02-26	24	
2517	Miles	1	2015-03-01	16	
2518	Miles	3.4	2015-03-01	9	
2519	Miles	7.3	2015-03-01	26	
2520	Miles	7.3	2015-03-01	3	
2521	Lunges	20	2015-03-01	3	
2522	Burpees	10	2015-03-01	3	
2523	Burpees	10	2015-03-01	3	
2524	SitUps	100	2015-03-01	9	
2525	Miles	5.5	2015-03-01	37	
2526	SitUps	30	2015-03-01	18	
2527	Burpees	30	2015-03-01	18	
2528	Miles	5	2015-02-28	41	
2529	SitUps	45	2015-03-02	7	
2530	Lunges	30	2015-03-02	7	
2531	Burpees	15	2015-03-02	7	
2532	Miles	0.75	2015-03-02	7	
2533	Miles	3	2015-03-02	30	@ 24 Hour Fitness
2534	Miles	5	2015-03-01	5	
2535	SitUps	30	2015-03-02	5	
2536	Lunges	30	2015-03-02	5	
2537	Burpees	20	2015-03-02	5	
2538	Miles	2	2015-03-27	17	
2539	SitUps	50	2015-03-28	17	
2540	Burpees	10	2015-03-28	17	
2541	Lunges	50	2015-02-28	17	
2542	Miles	1	2015-02-28	17	
2543	Miles	1	2015-03-01	17	
2544	SitUps	10	2015-02-28	22	
2545	Lunges	30	2015-02-27	22	
2546	Miles	2.5	2015-02-28	22	
2547	Miles	3	2015-03-02	22	
2548	Miles	3	2015-03-02	26	
2549	Miles	2.2	2015-03-02	18	
2550	Miles	2.3	2015-03-02	34	
2551	Miles	6	2015-03-02	38	
2552	Miles	1	2015-03-02	9	
2553	SitUps	30	2015-03-02	18	
2554	Lunges	30	2015-03-02	18	
2555	Burpees	30	2015-03-02	18	
2556	Miles	1.5	2015-03-02	16	
2557	Burpees	30	2015-03-02	18	
2558	Miles	3.2	2015-03-02	14	work > home > ceramics > home +
2559	Miles	1	2015-03-02	5	
2560	SitUps	72	2015-03-03	42	
2561	Miles	1	2015-03-03	3	
2562	Burpees	20	2015-03-02	17	
2563	SitUps	100	2015-03-02	17	
2564	Lunges	100	2015-03-02	17	
2565	Burpees	10	2015-03-03	3	
2566	Miles	1.3	2015-03-03	3	
2567	SitUps	105	2015-03-03	38	
2568	Lunges	110	2015-03-03	38	
2569	Burpees	40	2015-03-03	38	
2570	Miles	1	2015-03-02	41	
2571	SitUps	45	2015-03-03	7	
2572	Lunges	30	2015-03-03	7	
2573	Burpees	15	2015-03-03	7	
2574	Miles	1.17	2015-03-03	7	prod fac w stairs
2575	Miles	2.8	2015-03-03	34	
2576	Miles	1.15	2015-03-03	18	
2577	SitUps	110	2015-03-03	18	
2578	Miles	2	2015-03-03	5	
2579	Lunges	40	2015-03-03	3	
2580	Miles	2.5	2015-03-03	16	
2581	Miles	4	2015-03-04	38	
2582	Miles	2	2015-03-03	41	2 hours of pickup ultimate= 2 miles
2583	Burpees	2	2015-03-03	42	
2584	SitUps	72	2015-03-04	42	
2585	Burpees	8	2015-03-04	42	
2586	Burpees	25	2015-03-03	17	
2587	Miles	3	2015-03-03	17	
2588	SitUps	150	2015-03-04	41	
2589	Lunges	100	2015-03-04	41	
2590	Miles	2.5	2015-03-04	41	
2591	SitUps	45	2015-03-04	7	
2592	Lunges	30	2015-03-04	7	
2593	Burpees	15	2015-03-04	7	
2594	Miles	1.17	2015-03-04	7	prod fac w stairs
2595	Miles	0.25	2015-03-04	30	
2596	Miles	1.1	2015-03-04	34	
2597	Miles	1.3	2015-03-04	18	
2598	SitUps	50	2015-03-04	18	
2599	Lunges	50	2015-03-04	18	
2600	Burpees	20	2015-03-04	18	
2601	SitUps	100	2015-03-04	31	
2602	Miles	8	2015-03-04	31	
2603	Burpees	10	2015-03-04	31	
2604	Miles	1	2015-03-04	16	
2605	SitUps	20	2015-03-05	5	
2606	Lunges	20	2015-03-05	5	
2607	Burpees	20	2015-03-05	5	
2608	Miles	3	2015-03-05	5	
2609	Miles	1	2015-03-04	42	OTF
2610	Miles	1	2015-03-05	42	walk
2611	SitUps	60	2015-03-04	42	OTF
2612	SitUps	100	2015-03-05	38	
2613	Lunges	150	2015-03-05	38	
2614	SitUps	54	2015-03-05	7	
2615	Lunges	36	2015-03-05	7	
2616	Burpees	18	2015-03-05	7	
2617	Miles	0.75	2015-03-05	7	prod fac w stairs
2618	Miles	1	2015-03-05	37	Intervals 
2619	Miles	1	2015-03-04	17	
2620	Miles	1.3	2015-03-05	18	
2621	Miles	0.5	2015-03-05	30	
2622	SitUps	150	2015-03-05	41	
2623	Lunges	100	2015-03-05	41	
2624	Miles	2.25	2015-03-05	41	
2625	Miles	1.6	2015-03-05	3	
2626	Lunges	40	2015-03-05	3	
2627	Miles	3.5	2015-03-05	16	
2628	SitUps	65	2015-03-05	18	
2629	Miles	3	2015-03-05	31	
2630	Lunges	100	2015-03-05	31	
2631	SitUps	40	2015-03-05	31	
2632	Burpees	10	2015-03-05	31	
2633	Burpees	5	2015-03-06	42	
2634	SitUps	40	2015-03-06	42	
2635	Lunges	20	2015-03-06	42	
2636	Miles	1.7	2015-03-06	34	
2637	Burpees	10	2015-03-05	17	
2638	Lunges	100	2015-03-05	17	
2639	SitUps	100	2015-03-05	17	
2640	Miles	2.3	2015-03-06	34	
2641	Miles	1.17	2015-03-06	7	prod fac w stairs
2642	Miles	1	2015-03-06	3	
2643	Miles	2	2015-03-05	4	
2644	SitUps	150	2015-03-06	41	
2645	Lunges	100	2015-03-06	41	
2646	Miles	2	2015-03-06	41	
2647	Miles	3.5	2015-03-06	38	
2648	Miles	2.9	2015-03-06	3	
2649	SitUps	100	2015-03-07	3	
2650	Miles	1.17	2015-03-06	7	prod fac w stairs
2651	SitUps	54	2015-03-07	7	
2652	Lunges	36	2015-03-07	7	
2653	Burpees	18	2015-03-07	7	
2654	Miles	4.2	2015-03-07	16	Pasadena Triathlon
2655	Miles	2.5	2015-03-07	3	
2656	Miles	2	2015-03-07	42	OTF
2657	Miles	2.8	2015-03-04	14	work > home > ceramics > home
2658	Miles	2.8	2015-03-03	14	work > home > ceramics > home
2659	Miles	1.2	2015-03-05	14	work walk
2660	Miles	1.6	2015-03-06	14	home > work > Capitol Cider
2661	Miles	2.6	2015-03-07	3	
2662	Miles	0.8	2015-03-07	34	
2663	Miles	2	2015-03-07	5	
2664	SitUps	45	2015-03-07	5	
2665	Burpees	45	2015-03-07	5	
2666	Miles	4	2015-03-06	37	
2667	Miles	3	2015-03-07	41	3 hours of pickup ultimate= 3 miles
2668	Miles	2.1	2015-03-06	18	
2669	Miles	2.1	2015-03-07	18	
2670	Miles	2.1	2015-03-07	31	
2671	Miles	8.5	2015-03-07	24	
2672	Lunges	25	2015-03-07	24	
2673	SitUps	54	2015-03-08	7	
2674	Lunges	36	2015-03-08	7	
2675	Burpees	18	2015-03-08	7	
2676	Miles	2	2015-03-08	37	
2677	Miles	3.5	2015-03-06	28	
2678	Miles	2.6	2015-03-07	26	
2679	Miles	1.6	2015-03-06	26	
2680	Miles	3.5	2015-03-04	26	
2681	SitUps	75	2015-03-08	3	
2682	Burpees	25	2015-03-08	3	
2683	Miles	0.5	2015-03-08	3	
2684	SitUps	70	2015-03-08	18	
2685	Lunges	50	2015-03-08	18	
2686	Burpees	30	2015-03-08	18	
2687	Miles	4	2015-03-08	24	
2688	Miles	3	2015-03-08	38	
2689	Miles	0.6	2015-03-08	3	
2690	Miles	2.4	2015-03-07	14	home > ceramics > home> pacific place
2691	SitUps	54	2015-03-09	7	
2692	Lunges	36	2015-03-09	7	
2693	Burpees	18	2015-03-09	7	
2694	Miles	2	2015-03-08	42	
2695	SitUps	60	2015-03-09	42	
2696	Burpees	5	2015-03-09	42	
2697	Lunges	20	2015-03-09	42	
2698	Miles	2.2	2015-03-08	34	
2699	Miles	2.5	2015-03-09	26	
2700	Miles	0.75	2015-03-08	26	
2701	Miles	1	2015-03-09	30	@ 24 Hour Fitness
2702	Miles	1	2015-03-06	17	
2703	Miles	1	2015-03-07	17	
2704	Lunges	50	2015-03-07	17	
2705	SitUps	15	2015-03-06	22	
2706	Lunges	15	2015-03-06	22	
2707	Burpees	10	2015-03-06	22	
2708	Miles	6	2015-03-09	22	
2709	Miles	3	2015-03-09	22	
2710	Miles	1.5	2015-03-09	37	
2711	Miles	3.5	2015-03-09	5	
2712	Lunges	10	2015-03-09	5	
2713	Miles	3	2015-03-09	18	
2714	SitUps	100	2015-03-09	18	
2715	Miles	2.2	2015-03-09	3	
2716	SitUps	200	2015-03-09	41	
2717	Lunges	150	2015-03-09	41	
2718	Miles	2.25	2015-03-09	41	
2719	Miles	2.8	2015-03-09	14	work > home > ceramics > home
2720	SitUps	70	2015-03-10	42	
2721	Lunges	20	2015-03-10	42	
2722	Burpees	5	2015-03-10	42	
2723	Miles	0.75	2015-03-09	7	prod fac w stairs
2724	SitUps	54	2015-03-10	7	
2725	Lunges	36	2015-03-10	7	
2726	Burpees	18	2015-03-10	7	
2727	Miles	2	2015-03-09	34	
2728	SitUps	50	2015-03-09	17	
2729	Lunges	25	2015-03-09	17	
2730	Burpees	25	2015-03-09	17	
2731	SitUps	120	2015-03-09	4	
2732	Miles	2	2015-03-09	4	
2733	Lunges	60	2015-03-09	4	
2734	Miles	1.1	2015-03-10	42	OTF
2735	Burpees	13	2015-03-10	42	OTF
2736	Miles	2.5	2015-03-10	17	
2737	SitUps	40	2015-03-10	9	
2738	Burpees	6	2015-03-10	9	
2739	Lunges	40	2015-03-09	24	
2740	Miles	3	2015-03-09	24	
2741	SitUps	561	2015-03-10	29	
2742	Lunges	60	2015-03-10	29	
2743	Burpees	25	2015-03-10	29	
2744	Miles	1	2015-03-09	29	
2745	Miles	4.5	2015-03-07	29	
2746	Lunges	200	2015-03-10	16	
2747	Burpees	48	2015-03-10	16	
2748	Miles	1	2015-03-06	29	
2749	Miles	5	2015-03-05	29	
2750	Miles	1	2015-03-04	29	
2751	Miles	4	2015-03-02	29	
2752	Miles	1	2015-03-01	29	
2753	Miles	1	2015-02-28	29	
2754	Miles	6	2015-02-26	29	
2755	Miles	4	2015-02-27	29	
2756	Miles	4	2015-03-03	29	
2757	Miles	3.5	2015-03-10	26	
2758	Miles	1.15	2015-03-10	18	
2759	SitUps	100	2015-03-10	3	
2760	Miles	1	2015-03-10	3	
2761	Burpees	20	2015-03-10	3	
2762	Miles	2	2015-03-10	41	2 hours of pickup ultimate= 2 miles
2763	Miles	4	2015-03-11	38	
2764	SitUps	30	2015-03-11	22	
2765	Lunges	30	2015-03-11	22	
2766	Burpees	10	2015-03-11	22	
2767	Miles	3.5	2015-03-11	22	
2768	Miles	3.5	2015-03-11	30	@ 24 Hour Fitness- rower and bike
2769	SitUps	60	2015-03-11	38	
2770	Miles	2	2015-03-11	34	
2771	SitUps	2	2015-03-10	34	
2772	Miles	2	2015-03-11	34	
2773	Miles	1.15	2015-03-11	18	
2774	Miles	2	2015-03-11	38	
2775	SitUps	200	2015-03-11	41	
2776	Lunges	150	2015-03-11	41	
2777	Miles	2.25	2015-03-11	41	
2778	Burpees	50	2015-03-11	18	
2779	Miles	2	2015-03-11	3	
2780	SitUps	120	2015-03-11	4	
2781	Lunges	90	2015-03-11	4	
2782	Burpees	60	2015-03-11	4	
2783	SitUps	70	2015-03-12	42	
2784	Lunges	30	2015-03-12	42	
2785	Burpees	5	2015-03-12	42	
2786	Miles	0.75	2015-03-10	7	prod fac w stairs
2787	Miles	0.75	2015-03-11	7	prod fac w stairs
2788	Miles	1.17	2015-03-12	7	prod fac w stairs
2789	SitUps	54	2015-03-12	7	
2790	Lunges	36	2015-03-12	7	
2791	Burpees	18	2015-03-12	7	
2792	Miles	2	2015-03-09	26	
2793	Miles	4.5	2015-03-12	26	
2794	SitUps	110	2015-03-12	38	
2795	Lunges	15	2015-03-12	38	
2796	Miles	1.15	2015-03-12	18	
2797	Burpees	10	2015-03-12	18	
2798	Miles	1.4	2015-03-12	42	OTF
2799	Burpees	9	2015-03-12	42	OTF
2800	Miles	5.35	2015-03-12	16	
2801	Miles	3	2015-03-12	24	
2802	SitUps	150	2015-03-11	24	
2803	Burpees	45	2015-03-11	24	
2804	Miles	1.5	2015-03-11	24	
2805	Lunges	75	2015-03-11	24	
2806	Lunges	25	2015-03-12	24	
2807	Miles	2	2015-03-12	3	
2808	SitUps	200	2015-03-12	41	
2809	Lunges	150	2015-03-12	41	
2810	Miles	3	2015-03-12	41	
2811	SitUps	60	2015-03-13	42	
2812	Lunges	30	2015-03-13	42	
2813	Burpees	5	2015-03-13	42	
2814	Miles	0.5	2015-03-13	42	
2815	SitUps	100	2015-03-12	17	
2816	Burpees	25	2015-03-12	17	
2817	Miles	3	2015-03-12	17	
2818	Miles	6	2015-03-12	29	
2819	Miles	1.2	2015-03-12	26	
2820	Miles	0.75	2015-03-13	30	@ C4 Crossfit Warm-up
2821	Miles	2	2015-03-10	5	
2822	Miles	2	2015-03-12	5	
2823	Miles	1.2	2015-03-12	14	work walk
2824	Miles	2.6	2015-03-13	14	home > work >  ceramics >work > home 
2825	Miles	5	2015-03-13	4	
2826	Miles	2.1	2015-03-13	34	
2827	SitUps	100	2015-03-13	3	
2828	Burpees	20	2015-03-13	3	
2829	Miles	0.8	2015-03-13	3	
2830	SitUps	100	2015-03-13	18	
2831	Lunges	100	2015-03-13	18	
2832	Miles	1.15	2015-03-13	18	
2833	Miles	4	2015-03-13	37	
2834	Miles	1.8	2015-03-13	26	
2835	Miles	3	2015-03-14	21	
2836	Miles	0.75	2015-03-14	30	Walkin' w/ Masito
2837	Miles	3	2015-03-14	20	
2838	Miles	2	2015-03-14	5	
2839	SitUps	60	2015-03-15	14	Drunk Situps
2840	Miles	2.63	2015-03-15	7	outside 43
2841	SitUps	54	2015-03-15	7	
2842	Lunges	36	2015-03-15	7	
2843	Burpees	18	2015-03-15	7	
2844	Miles	6	2015-03-14	3	
2845	Lunges	4	2015-03-14	3	knee sprain
2846	Burpees	25	2015-03-14	3	
2847	Burpees	25	2015-03-15	3	
2848	SitUps	100	2015-03-15	3	
2849	SitUps	60	2015-03-15	42	
2850	Burpees	10	2015-03-15	42	
2851	Lunges	30	2015-03-15	42	
2852	Miles	3.2	2015-03-15	42	
2853	Miles	3.5	2015-03-14	41	
2854	Lunges	40	2015-03-15	41	
2855	Miles	2	2015-03-15	41	
2856	Miles	2.5	2015-03-15	21	
2857	Miles	2.5	2015-03-15	20	
2858	Miles	1.5	2015-03-15	16	
2859	Miles	2	2015-03-15	18	
2860	Miles	0.4	2015-03-15	3	walking the dog
2861	SitUps	100	2015-03-15	38	
2862	Miles	4	2015-03-15	38	
2863	Miles	2	2015-03-15	38	
2864	Miles	2	2015-03-15	38	
2865	SitUps	60	2015-03-15	18	
2866	SitUps	10	2015-03-15	5	
2867	Lunges	10	2015-03-15	5	
2868	Burpees	10	2015-03-15	5	
2869	Miles	3	2015-03-15	5	
2870	Miles	1	2015-03-16	37	Intervals
2871	Miles	1.25	2015-03-16	37	
2872	Miles	3.5	2015-03-15	9	
2873	SitUps	54	2015-03-16	7	
2874	Lunges	36	2015-03-16	7	
2875	Burpees	18	2015-03-16	7	
2876	Miles	1	2015-03-13	17	
2877	SitUps	50	2015-03-14	17	
2878	Miles	3.5	2015-03-16	22	
2879	Miles	3.3	2015-03-16	18	
2880	Miles	1	2015-03-16	3	
2881	Miles	4.5	2015-03-14	26	
2882	Miles	2.3	2015-03-16	26	
2883	Lunges	50	2015-03-16	18	
2884	SitUps	60	2015-03-17	42	
2885	Lunges	30	2015-03-17	42	
2886	Burpees	7	2015-03-17	42	
2887	Miles	1	2015-03-17	30	@ C4 Crossfit
2888	Miles	1.5	2015-03-14	30	@ C4 Crossfit- Group WOD
2889	Miles	1.52	2015-03-16	7	30 icey
2890	Miles	2.72	2015-03-17	7	45 outside
2891	SitUps	54	2015-03-17	7	
2892	Lunges	36	2015-03-17	7	
2893	Burpees	18	2015-03-17	7	
2894	SitUps	50	2015-03-16	17	
2895	Lunges	50	2015-03-16	17	
2896	Burpees	25	2015-03-16	17	
2897	Miles	1.1	2015-03-17	20	
2898	Miles	1.1	2015-03-17	21	
2899	SitUps	20	2015-03-17	21	
2900	SitUps	20	2015-03-17	20	
2901	SitUps	69	2015-03-17	38	
2902	Miles	2.5	2015-03-17	34	
2903	Miles	1.15	2015-03-17	18	
2904	Burpees	5	2015-03-17	18	
2905	Miles	2.5	2015-03-17	26	
2906	Lunges	70	2015-03-17	18	
2907	Miles	2	2015-03-17	41	
2908	Miles	4	2015-03-17	38	
2909	SitUps	60	2015-03-18	42	
2910	Burpees	5	2015-03-18	42	
2911	Lunges	30	2015-03-18	42	
2912	Miles	3.5	2015-03-18	30	@ 24 Hour Fitness
2913	Lunges	10	2015-03-18	5	
2914	Miles	2	2015-03-18	5	
2915	Miles	2	2015-03-17	17	
2916	Miles	1.5	2015-03-18	20	
2917	Miles	1.5	2015-03-18	21	
2918	Miles	4.8	2015-03-18	26	
2919	SitUps	83	2015-03-18	38	
2920	Miles	1.5	2015-03-18	41	
2921	SitUps	250	2015-03-18	41	
2922	Lunges	200	2015-03-18	41	
2923	Miles	2	2015-03-18	18	
2924	Miles	4	2015-03-18	38	
2925	SitUps	180	2015-03-17	4	
2926	Miles	5	2015-03-17	4	
2927	Miles	1.67	2015-03-18	7	corner
2928	SitUps	54	2015-03-18	7	
2929	Lunges	36	2015-03-18	7	
2930	Burpees	18	2015-03-18	7	
2931	SitUps	54	2015-03-19	7	
2932	Lunges	36	2015-03-19	7	
2933	Burpees	18	2015-03-19	7	
2934	SitUps	15	2015-03-18	22	
2935	Lunges	30	2015-03-18	22	
2936	Burpees	15	2015-03-18	22	
2937	Miles	4.5	2015-03-18	22	
2938	Miles	1.4	2015-03-18	3	
2939	Miles	2	2015-03-18	17	
2940	Miles	5.6	2015-03-19	30	@ Houston Zoo
2941	SitUps	60	2015-03-19	42	
2942	Burpees	6	2015-03-19	42	
2943	Lunges	30	2015-03-19	42	
2944	Miles	0.6	2015-03-18	26	
2945	Miles	0.7	2015-03-19	26	
2946	SitUps	60	2015-03-19	20	angry about vcu game. do more situps!
2947	Lunges	40	2015-03-19	20	
2948	Burpees	10	2015-03-19	20	
2949	SitUps	40	2015-03-19	20	
2950	Burpees	5	2015-03-19	20	
2951	Miles	1.7	2015-03-19	42	
2952	Miles	1.5	2015-03-19	6	
2953	Miles	2	2015-03-19	18	
2954	Miles	2.5	2015-03-19	9	
2955	Miles	6.71	2015-03-19	16	
2956	Miles	2.5	2015-03-19	3	
2957	Miles	2.7	2015-03-19	26	
2958	Miles	1.5	2015-03-19	41	
2959	SitUps	65	2015-03-20	42	
2960	Burpees	5	2015-03-20	42	
2961	Lunges	40	2015-03-20	42	
2962	Miles	1.5	2015-03-19	5	
2963	SitUps	54	2015-03-20	7	
2964	Lunges	36	2015-03-20	7	
2965	Burpees	18	2015-03-20	7	
2966	Miles	2.9	2015-03-19	34	
2967	SitUps	35	2015-03-20	6	
2968	Lunges	75	2015-03-20	6	
2969	Burpees	10	2015-03-20	6	
2970	SitUps	25	2015-03-19	17	
2971	Lunges	25	2015-03-19	17	
2972	Burpees	20	2015-03-19	17	
2973	Miles	1	2015-03-20	17	
2974	Miles	1.5	2015-03-20	18	
2975	SitUps	30	2015-03-20	22	
2976	Lunges	30	2015-03-20	22	
2977	Burpees	15	2015-03-20	22	
2978	Miles	3	2015-03-20	22	
2979	Miles	1	2015-03-20	18	
2980	Burpees	10	2015-03-20	18	
2981	Miles	3.1	2015-03-20	38	
2982	Miles	1.8	2015-03-20	3	
2983	Miles	3	2015-03-15	24	
2984	Lunges	25	2015-03-08	24	
2985	Lunges	30	2015-03-16	24	
2986	Miles	3	2015-03-16	24	
2987	Miles	1	2015-03-18	24	
2988	Miles	3	2015-03-19	24	
2989	Miles	1.5	2015-03-20	24	
2990	SitUps	200	2015-03-18	24	
2991	Lunges	250	2015-03-18	24	
2992	Burpees	75	2015-03-18	24	
2993	Lunges	20	2015-03-21	3	
2994	Burpees	20	2015-03-21	3	
2995	Miles	2.2	2015-03-21	3	
2996	Miles	1	2015-03-20	34	
2997	Miles	1.2	2015-03-21	34	
2998	Miles	4	2015-03-21	20	
2999	Miles	4	2015-03-21	21	
3000	Miles	2.1	2015-03-21	42	
3001	Miles	1	2015-03-21	41	
3002	Miles	2.5	2015-03-21	34	
3003	Lunges	30	2015-03-21	42	
3004	Miles	4.5	2015-03-21	16	
3005	Miles	1.5	2015-03-20	30	@ C4 Crossfit Warm-up
3006	SitUps	50	2015-03-22	20	
3007	Miles	1.67	2015-03-20	7	lunch 30
3008	Miles	1.67	2015-03-20	7	corner
3009	SitUps	54	2015-03-22	7	
3010	Lunges	36	2015-03-22	7	
3011	Burpees	18	2015-03-22	7	
3012	Miles	1.6	2015-03-21	7	Peace Park
3013	Miles	1.2	2015-03-22	18	
3014	Miles	3.5	2015-03-22	38	
3015	Miles	3	2015-03-22	41	
3016	Miles	0.8	2015-03-22	34	
3017	Miles	1.5	2015-03-22	3	
3018	Miles	2	2015-03-22	41	
3019	Miles	2	2015-03-22	37	
3020	Miles	1.5	2015-03-22	26	
3021	Miles	1	2015-03-20	26	
3022	SitUps	100	2015-03-22	18	
3023	Miles	3	2015-03-22	16	
3024	Lunges	40	2015-03-23	42	
3025	Miles	0.75	2015-03-23	30	@ C4 Crossfit- Group WOD
3026	Miles	1.52	2015-03-23	7	
3027	SitUps	54	2015-03-23	7	
3028	Lunges	36	2015-03-23	7	
3029	Burpees	18	2015-03-23	7	
3030	Miles	0.9	2015-03-23	34	
3031	Miles	3.5	2015-03-22	24	
3032	Miles	1.5	2015-03-23	24	
3033	Lunges	25	2015-03-23	24	
3034	Lunges	80	2015-03-23	18	
3035	Miles	1	2015-03-23	41	
3036	Burpees	30	2015-03-23	41	
3037	Miles	4	2015-03-22	5	
3038	Lunges	30	2015-03-23	5	
3039	SitUps	20	2015-03-23	5	
3040	Burpees	10	2015-03-23	5	
3041	Miles	3	2015-03-23	16	
3042	SitUps	54	2015-03-24	7	
3043	Lunges	36	2015-03-24	7	
3044	Burpees	18	2015-03-24	7	
3045	Miles	1.75	2015-03-24	30	@ 24 Hour Fitness
3046	SitUps	60	2015-03-24	42	
3047	Burpees	10	2015-03-24	42	
3048	Lunges	30	2015-03-24	42	
3049	SitUps	90	2015-03-24	3	
3050	Lunges	60	2015-03-24	3	
3051	Burpees	40	2015-03-24	3	
3052	Miles	1	2015-03-21	17	
3053	Miles	3	2015-03-22	17	
3054	Burpees	30	2015-03-22	17	
3055	Burpees	20	2015-03-23	17	
3056	Lunges	50	2015-03-23	17	
3057	Miles	2	2015-03-24	41	
3058	Miles	1.52	2015-03-24	7	lunch 30
3059	Miles	1.67	2015-03-24	7	corner
3060	Miles	1.9	2015-03-24	42	OTF
3061	Lunges	30	2015-03-25	42	
3062	Miles	2	2015-03-24	34	
3063	Miles	3	2015-03-24	17	
3064	Miles	1	2015-03-25	5	
3065	Miles	2.5	2015-03-25	34	
3066	SitUps	25	2015-03-25	21	
3067	Burpees	3	2015-03-25	21	
3068	SitUps	25	2015-03-25	20	
3069	Burpees	3	2015-03-25	20	
3070	Miles	1	2015-03-24	16	
3071	Miles	2	2015-03-25	38	
3072	SitUps	87	2015-03-25	38	
3073	Miles	2.4	2015-03-25	14	work walk x2
3074	Miles	1.8	2015-03-24	14	work > home > work > home
3075	Miles	0.6	2015-03-23	14	work > home
3076	Miles	4.1	2015-03-22	14	wandering around Portland part 2
3077	Miles	1.7	2015-03-28	14	wandering around Portland part 2
3078	Miles	1.2	2015-03-21	14	home > work > rumba
3079	Miles	1.2	2015-03-19	14	work walk
3080	Miles	0.6	2015-03-18	14	home > work 
3081	Miles	1.2	2015-03-17	14	home > work > Kell's
3082	Miles	1.2	2015-03-16	14	work walk
3083	SitUps	94	2015-03-25	38	
3084	Miles	2.2	2015-03-25	37	Intervals 
3085	Miles	1.5	2015-03-23	26	
3086	Miles	1.8	2015-03-25	18	
3087	Lunges	30	2015-03-26	42	
3088	SitUps	60	2015-03-26	42	
3089	Burpees	10	2015-03-26	42	
3090	Miles	2	2015-03-25	41	
3091	SitUps	54	2015-03-26	7	
3092	Lunges	36	2015-03-26	7	
3093	Burpees	18	2015-03-26	7	
3094	Miles	1	2015-03-25	17	
3095	SitUps	50	2015-03-25	17	
3096	Burpees	25	2015-03-25	17	
3097	Miles	2.75	2015-03-26	7	
3098	Miles	1.15	2015-03-26	18	
3099	Miles	3.61	2015-03-26	16	
3100	Miles	3.2	2015-03-26	14	work walk x2 + bell thai
3101	Miles	1.5	2015-03-26	42	
3102	SitUps	60	2015-03-27	42	
3103	Lunges	30	2015-03-27	42	
3104	Burpees	5	2015-03-27	42	
3105	SitUps	54	2015-03-27	7	
3106	Lunges	36	2015-03-27	7	
3107	Burpees	18	2015-03-27	7	
3108	Miles	1	2015-03-26	34	
3109	Miles	1	2015-03-26	3	
3110	SitUps	15	2015-03-25	22	
3111	Lunges	30	2015-03-25	22	
3112	Burpees	15	2015-03-25	22	
3113	Miles	5	2015-03-25	22	
3114	Miles	3	2015-03-26	22	
3115	Miles	2	2015-03-26	17	
3116	Miles	1.15	2015-03-27	18	
3117	Miles	1.2	2015-03-27	14	work walk
3118	Miles	8	2015-03-27	38	
3119	Miles	0.25	2015-03-27	30	@ C4 Crossfit Warm-up
3120	Lunges	50	2015-03-28	42	
3121	Burpees	10	2015-03-28	42	
3122	SitUps	60	2015-03-28	42	
3123	Miles	2.13	2015-03-28	42	
3124	Miles	2.5	2015-03-27	3	
3125	SitUps	58	2015-03-28	20	
3126	Lunges	23	2015-03-28	20	
3127	Burpees	9	2015-03-28	20	
3128	SitUps	15	2015-03-27	22	
3129	Lunges	30	2015-03-27	22	
3130	Burpees	15	2015-03-27	22	
3131	Miles	3.5	2015-03-27	22	
3132	Miles	2.2	2015-03-28	18	
3133	Miles	2	2015-03-27	34	
3134	Miles	1	2015-03-27	3	
3135	Miles	5.5	2015-03-28	3	
3136	Burpees	20	2015-03-28	3	
3137	Lunges	30	2015-03-28	3	
3138	Miles	2.5	2015-03-28	16	
3139	Miles	6	2015-03-28	5	
3140	Miles	4	2015-03-28	41	
3141	Miles	1.25	2015-03-27	41	
3142	Burpees	20	2015-03-28	3	
3143	SitUps	150	2015-03-28	18	
3144	Lunges	20	2015-03-28	3	
3145	Miles	8	2015-03-28	37	My knee is so pissed at me....
3146	Miles	3	2015-03-28	6	
3147	Miles	4	2015-03-29	38	
3148	Miles	1.5	2015-03-28	30	@ C4 Crossfit- extra work
3149	SitUps	54	2015-03-29	7	
3150	Lunges	36	2015-03-29	7	
3151	Burpees	18	2015-03-29	7	
3152	Miles	1.2	2015-03-29	21	
3153	Miles	1.2	2015-03-29	20	
3154	Miles	2.6	2015-03-27	26	
3155	Miles	5.5	2015-03-28	26	
3156	Miles	0.7	2015-03-29	26	
3157	Miles	1.5	2015-03-29	16	
3158	Miles	2	2015-03-29	38	
3159	Miles	1.6	2015-03-29	34	
3160	Miles	5	2015-03-29	18	
3161	Lunges	20	2015-03-30	3	
3162	Burpees	10	2015-03-30	3	
3163	SitUps	60	2015-03-30	42	
3164	Lunges	30	2015-03-30	42	
3165	Burpees	5	2015-03-30	42	
3166	SitUps	54	2015-03-30	7	
3167	Lunges	36	2015-03-30	7	
3168	Burpees	18	2015-03-30	7	
3169	Miles	0.25	2015-03-30	30	@ Home- work break
3170	Miles	1.9	2015-03-30	21	
3171	Miles	1.9	2015-03-30	20	
3172	Miles	1	2015-03-27	17	
3173	SitUps	20	2015-03-28	17	
3174	Lunges	100	2015-03-28	17	
3175	SitUps	20	2015-03-30	5	
3176	Lunges	20	2015-03-30	5	
3177	Burpees	10	2015-03-30	5	
3178	Miles	3	2015-03-30	5	
3179	Miles	1.86	2015-03-30	7	lunch power lines
3180	Miles	1.67	2015-03-30	7	corner
3181	Miles	4.5	2015-03-30	18	
3182	SitUps	40	2015-03-30	18	
3183	Lunges	20	2015-03-30	18	
3184	Miles	3.4	2015-03-30	14	work > home > ceramics > work
3185	SitUps	60	2015-03-31	42	
3186	Lunges	30	2015-03-31	42	
3187	Miles	0.5	2015-03-31	30	@ Home- work break
3188	Lunges	100	2015-03-30	17	
3189	Burpees	6	2015-03-31	9	
3190	Miles	1.15	2015-03-31	18	
3191	Lunges	70	2015-03-31	18	
3192	Burpees	20	2015-03-31	18	
3193	Miles	1.9	2015-03-31	42	
3194	SitUps	60	2015-04-01	42	
3195	Lunges	40	2015-04-01	42	
3196	Burpees	10	2015-04-01	42	
3197	Miles	1.86	2015-03-31	7	lunch power lines
3198	Miles	1.67	2015-03-31	7	corner
3199	SitUps	54	2015-04-01	7	
3200	Lunges	36	2015-04-01	7	
3201	Burpees	18	2015-04-01	7	
3202	Miles	0.6	2015-03-31	14	work > home 
3203	Miles	2.72	2015-04-01	7	lunch 45
3204	Miles	0.25	2015-04-01	30	@ Home- work break
3205	Miles	2.8	2015-04-01	21	
3206	Miles	2.8	2015-04-01	20	
3207	SitUps	60	2015-04-01	38	
3208	Miles	4	2015-04-01	38	
3209	Miles	1	2015-03-31	17	
3210	SitUps	50	2015-03-31	17	
3211	Burpees	25	2015-03-31	17	
3212	Miles	1.6	2015-04-01	3	
3213	SitUps	60	2015-04-01	3	
3214	Miles	1.67	2015-04-01	7	corner
3215	Miles	1.25	2015-03-30	41	
3216	SitUps	2	2015-03-31	41	
3217	SitUps	198	2015-04-01	41	
3219	Miles	2	2015-03-31	41	
3220	Miles	1.75	2015-04-01	41	
3221	Lunges	40	2015-04-01	3	
3222	Miles	3	2015-04-01	38	
3223	Lunges	5	2015-04-01	3	
3224	Miles	1.5	2015-03-26	24	
3225	Lunges	30	2015-03-26	24	
3226	Miles	3	2015-03-29	24	
3227	Lunges	25	2015-03-29	24	
3228	Lunges	50	2015-03-30	24	
3229	Miles	3	2015-03-30	24	
3230	SitUps	250	2015-04-01	24	
3231	Lunges	120	2015-04-01	24	
3232	Burpees	50	2015-04-01	24	
3233	Burpees	50	2015-04-01	24	
3234	Miles	2	2015-04-01	24	
3235	Burpees	20	2015-04-01	3	
3236	SitUps	70	2015-03-30	4	
3237	Miles	5	2015-03-30	4	
3238	SitUps	60	2015-04-01	4	
3239	Miles	2	2015-04-01	4	
3240	SitUps	60	2015-04-02	42	
3241	Lunges	40	2015-04-02	42	
3242	Burpees	5	2015-04-02	42	
3243	Miles	2.6	2015-04-01	18	
3244	Miles	3.5	2015-04-01	22	
3245	Lunges	80	2015-04-02	16	
3246	Burpees	30	2015-04-02	16	
3247	Miles	3.61	2015-04-02	16	
3248	SitUps	20	2015-04-02	29	
3249	Lunges	25	2015-04-02	29	
3250	Burpees	50	2015-04-02	29	
3251	Miles	3.1	2015-04-02	29	
3252	Miles	1.5	2015-03-21	29	
3253	Miles	2	2015-03-22	29	
3254	Miles	3	2015-03-24	29	
3255	SitUps	30	2015-03-30	29	
3256	Miles	4	2015-03-26	29	
3257	SitUps	7	2015-03-28	29	
3258	Miles	7	2015-03-28	29	
3259	Miles	3	2015-03-30	29	
3260	Miles	1.15	2015-04-02	18	
3261	SitUps	115	2015-04-02	3	
3262	Lunges	40	2015-04-02	3	
3263	Burpees	30	2015-04-02	3	
3264	Burpees	5	2015-04-02	3	
3265	Lunges	30	2015-04-02	18	
3266	Miles	1.67	2015-04-02	7	corner
3267	SitUps	54	2015-04-03	7	
3268	Lunges	36	2015-04-03	7	
3269	Burpees	18	2015-04-03	7	
3270	Miles	2.72	2015-04-03	7	lunch 45
3271	Miles	2	2015-04-02	17	
3272	Miles	3	2015-04-03	22	
3273	Shot	1	2015-04-03	3	
3274	SitUps	60	2015-04-03	42	
3275	Burpees	5	2015-04-03	42	
3276	Lunges	30	2015-04-03	42	
3277	Miles	1.3	2015-04-03	42	
3278	Miles	2	2015-04-03	37	Intervals
3279	Miles	3	2015-04-04	38	
3280	SitUps	50	2015-04-04	38	
3281	Miles	3.8	2015-04-04	4	
3282	Burpees	30	2015-04-04	29	
3283	Lunges	60	2015-04-04	29	
3284	Miles	3	2015-04-04	29	
3285	SitUps	25	2015-04-04	5	
3286	Miles	5	2015-04-04	5	
3287	Miles	2	2015-03-31	5	
3288	Miles	6	2015-04-04	38	
3289	Miles	1	2015-04-05	37	Intervals
3290	Miles	3	2015-04-05	38	
3291	Miles	2	2015-04-05	4	
3292	Miles	3	2015-04-05	29	
3293	Miles	4	2015-04-04	41	
3294	Miles	3	2015-04-05	41	
3295	Miles	3	2015-04-05	41	
3296	SitUps	54	2015-04-04	7	
3297	Lunges	36	2015-04-04	7	
3298	Burpees	18	2015-04-04	7	
3299	SitUps	54	2015-04-05	7	
3300	Lunges	36	2015-04-05	7	
3301	Burpees	18	2015-04-05	7	
3302	Miles	1.67	2015-04-05	7	corner
3303	Miles	0.75	2015-04-04	30	@ Home
3304	Miles	0.25	2015-04-06	30	@ C4 Crossfit Warm-up
3305	SitUps	30	2015-04-06	22	
3306	Lunges	30	2015-04-06	22	
3307	Burpees	10	2015-04-06	22	
3308	Miles	3.5	2015-04-06	22	
3309	Miles	1	2015-04-03	17	
3310	SitUps	60	2015-04-04	17	
3311	Lunges	100	2015-04-04	17	
3312	Burpees	30	2015-04-04	17	
3313	Miles	2	2015-04-05	17	
3314	Lunges	30	2015-04-06	42	
3315	SitUps	60	2015-04-06	42	
3316	Miles	1.52	2015-04-06	7	lunch 30
3317	Miles	1.67	2015-04-06	7	corner
3318	Shot	1	2015-04-06	34	
3319	Miles	4	2015-04-06	14	work walk x2 + ceramics
3320	Miles	0.9	2015-04-06	14	home >  convention Center
3321	Miles	0.9	2015-04-04	14	home >  convention Center
3322	Miles	3.7	2015-04-03	14	home > work > convention Center > home > convention center > home
3323	Miles	4.5	2015-04-02	14	home > work > home > motif > waterfront > trove > motif
3324	Miles	1.2	2015-04-01	14	work walk
3325	Miles	0.6	2015-04-06	14	home > work 
3326	Miles	0.6	2015-04-07	14	work > home
3327	SitUps	60	2015-04-07	42	
3328	Lunges	30	2015-04-07	42	
3329	SitUps	5	2015-04-07	42	
3330	Miles	0.5	2015-04-07	42	
3331	SitUps	54	2015-04-07	7	
3332	Lunges	36	2015-04-07	7	
3333	Burpees	18	2015-04-07	7	
3334	Miles	2.72	2015-04-07	7	
3335	SitUps	100	2015-04-06	17	
3336	Lunges	100	2015-04-06	17	
3337	Burpees	35	2015-04-06	17	
3338	SitUps	60	2015-04-07	20	
3339	Lunges	30	2015-04-07	20	
3340	Burpees	10	2015-04-07	20	
3341	SitUps	20	2015-04-07	21	
3342	Lunges	30	2015-04-07	21	
3343	Burpees	5	2015-04-07	21	
3344	Miles	3	2015-04-07	5	
3345	SitUps	20	2015-04-07	5	
3346	Lunges	20	2015-04-07	5	
3347	Burpees	10	2015-04-07	5	
3348	Miles	12	2015-04-04	24	O-fest!
3349	Miles	7	2015-04-05	24	
3350	Miles	3	2015-04-07	24	
3351	Lunges	50	2015-04-04	24	
3352	Lunges	50	2015-04-05	24	
3353	Miles	2.1	2015-04-07	18	
3354	SitUps	50	2015-04-07	24	
3355	Lunges	25	2015-04-07	18	
3356	Burpees	10	2015-04-07	18	
3357	Miles	1.5	2015-04-07	30	@ Home- work break
3358	Miles	1	2015-04-08	30	@ C4 Crossfit- extra work
3359	Miles	2	2015-04-07	17	
3360	Miles	1.43	2015-04-08	42	
3361	Lunges	60	2015-04-08	42	
3362	Burpees	12	2015-04-08	42	
3363	Lunges	20	2015-04-08	18	
3364	Miles	1.8	2015-04-08	18	
3365	SitUps	200	2015-04-08	24	
3366	Burpees	70	2015-04-08	24	I think these are going to be the end of me...
3367	Lunges	50	2015-04-08	24	
3368	Miles	1	2015-04-08	24	
3369	SitUps	50	2015-04-07	24	
3370	Lunges	50	2015-04-07	24	
3371	Burpees	20	2015-04-08	18	
3372	Miles	0.5	2015-04-08	38	
3373	SitUps	60	2015-04-09	42	
3374	Lunges	30	2015-04-09	42	
3375	SitUps	5	2015-04-09	42	
3376	SitUps	50	2015-04-09	21	
3377	SitUps	180	2015-04-09	4	
3378	Burpees	30	2015-04-09	4	
3379	Miles	2.4	2015-04-09	4	
3380	Miles	1.8	2015-04-09	18	
3381	Burpees	25	2015-04-09	18	
3382	SitUps	20	2015-04-10	5	
3383	Miles	1	2015-04-10	5	
3384	SitUps	20	2015-04-10	21	
3385	Miles	1.55	2015-04-10	42	
3386	Burpees	5	2015-04-09	42	
3387	Miles	1.5	2015-04-10	30	@ C4 Crossfit
3388	Miles	1.15	2015-04-10	18	
3389	Burpees	10	2015-04-10	18	
3390	Burpees	10	2015-04-11	18	
3391	Burpees	10	2015-04-11	18	
3392	Miles	1.6	2015-04-11	30	@ C4 Crossfit- Group WOD
3393	Burpees	3	2015-04-11	41	
3394	Miles	2	2015-04-10	37	Intervals 
3395	Burpees	10	2015-04-11	18	
3396	SitUps	54	2015-04-11	7	
3397	Lunges	36	2015-04-11	7	
3398	Burpees	18	2015-04-11	7	
3399	Miles	1.67	2015-04-11	7	corner
3400	Miles	2.33	2015-04-12	7	roundabout
3401	Miles	3.3	2015-04-12	21	
3402	Miles	3.3	2015-04-12	20	
3403	Burpees	10	2015-04-12	18	
3404	Miles	3	2015-04-11	9	
3405	Miles	2.6	2015-04-12	9	
3406	Lunges	25	2015-04-12	24	
3407	Miles	5	2015-04-12	38	
3408	Miles	4	2015-04-12	37	
3409	Lunges	25	2015-04-09	17	
3410	SitUps	25	2015-04-09	17	
3411	Burpees	10	2015-04-09	17	
3412	Miles	1	2015-04-10	17	
3413	SitUps	50	2015-04-12	17	
3414	Burpees	25	2015-04-12	17	
3415	Miles	2.63	2015-04-13	7	
3416	SitUps	54	2015-04-13	7	
3417	Lunges	36	2015-04-13	7	
3418	Burpees	18	2015-04-13	7	
3419	Miles	3.5	2015-04-13	16	
3420	SitUps	150	2015-04-13	26	
3421	Lunges	100	2015-04-13	26	
3422	Burpees	30	2015-04-13	26	
3423	Lunges	30	2015-04-14	42	
3424	SitUps	60	2015-04-14	42	
3425	Burpees	5	2015-04-14	42	
3426	Miles	1	2015-04-14	17	
3427	Miles	2.81	2015-04-14	7	lunch 45
3428	Miles	1.3	2015-04-13	18	
3429	Burpees	5	2015-04-14	9	
3430	Miles	1	2015-04-14	9	
3431	Miles	2.4	2015-04-14	18	
3432	Burpees	10	2015-04-14	18	
3433	Miles	6.4	2015-04-14	4	
3434	Burpees	10	2015-04-14	18	
3435	Miles	1.25	2015-04-14	30	@ Home
3436	SitUps	60	2015-04-15	42	
3437	Burpees	5	2015-04-15	42	
3438	Lunges	30	2015-04-15	42	
3439	Lunges	50	2015-04-14	17	
3440	Burpees	35	2015-04-14	17	
3441	SitUps	54	2015-04-15	7	
3442	Lunges	36	2015-04-15	7	
3443	Burpees	18	2015-04-15	7	
3444	Miles	2.82	2015-04-15	7	
3445	Miles	2.63	2015-04-15	7	44th st
3446	SitUps	200	2015-04-15	41	
3447	Lunges	200	2015-04-15	41	
3448	Miles	1.5	2015-04-15	41	
3449	Miles	2	2015-04-15	38	
3450	SitUps	60	2015-04-15	5	
3451	Lunges	60	2015-04-15	5	
3452	Burpees	30	2015-04-15	5	
3453	Miles	5	2015-04-15	5	
3454	SitUps	20	2015-04-16	5	
3455	Miles	2.5	2015-04-15	18	
3456	SitUps	50	2015-04-15	17	
3457	Miles	3	2015-04-15	17	
3458	Miles	2.81	2015-04-16	7	lunch 45
3459	Lunges	44	2015-04-16	42	
3460	Miles	2.2	2015-04-16	42	
3461	Lunges	28	2015-04-15	16	
3462	Burpees	13	2015-04-15	16	
3463	Miles	3.63	2015-04-16	16	
3464	Miles	1.15	2015-04-16	18	
3465	Burpees	20	2015-04-16	18	
3466	Miles	1	2015-04-16	41	
3467	Lunges	2	2015-04-16	29	
3468	Miles	3.12	2015-04-16	29	
3469	Miles	2.81	2015-04-17	7	lunch 45
3470	Miles	1.28	2015-04-17	7	Ada twshp park 2 laps
3471	SitUps	100	2015-04-18	20	
3472	Lunges	50	2015-04-18	20	
3473	Burpees	20	2015-04-18	20	
3474	Miles	1.81	2015-04-18	7	Hall Lake trail
3475	Miles	1.9	2015-04-18	20	
3476	Miles	1.9	2015-04-18	21	
3477	SitUps	54	2015-04-18	7	
3478	Lunges	36	2015-04-18	7	
3479	Burpees	18	2015-04-18	7	
3480	Miles	1.67	2015-04-18	7	corner
3481	Miles	6.2	2015-04-18	18	
3482	Miles	2	2015-04-18	41	
3483	Lunges	20	2015-04-19	20	
3484	Burpees	20	2015-04-19	20	
3485	Burpees	50	2015-04-19	38	
3486	Miles	1	2015-04-17	17	
3487	SitUps	50	2015-04-18	17	
3488	Lunges	100	2015-04-18	17	
3489	Burpees	25	2015-04-18	17	
3490	Burpees	20	2015-04-20	20	
3491	Miles	1.2	2015-04-20	20	
3492	Miles	1.2	2015-04-20	21	
3493	Miles	3.9	2015-04-20	18	
3494	Miles	1.1	2015-04-19	18	
3495	Miles	1	2015-04-20	41	
3496	Miles	2.5	2015-04-18	16	
3497	Miles	1.5	2015-04-19	16	
3498	Miles	2	2015-04-19	37	
3499	SitUps	50	2015-04-20	17	
3500	Lunges	50	2015-04-20	17	
3501	Burpees	20	2015-04-20	17	
3502	Burpees	50	2015-04-21	38	
3503	Burpees	20	2015-04-21	38	
3504	Burpees	6	2015-04-21	16	
3505	SitUps	60	2015-04-22	42	
3506	Lunges	30	2015-04-22	42	
3507	Burpees	1	2015-04-22	42	
3508	Miles	2	2015-04-21	37	Intervals
3509	SitUps	50	2015-04-21	17	
3510	Miles	1.5	2015-04-22	41	
3511	SitUps	250	2015-04-22	41	
3512	Burpees	70	2015-04-22	38	
3513	Miles	1.8	2015-04-22	42	
3514	SitUps	60	2015-04-19	5	
3515	Lunges	40	2015-04-22	5	
3516	Burpees	20	2015-04-19	5	
3517	SitUps	10	2015-04-22	5	
3518	Lunges	10	2015-04-22	5	
3519	Burpees	30	2015-04-22	5	
3520	Miles	3.52	2015-04-22	38	
3521	Miles	1	2015-04-22	41	
3522	SitUps	60	2015-04-23	42	
3523	Lunges	30	2015-04-23	42	
3524	Burpees	5	2015-04-23	42	
3525	Miles	1.86	2015-04-21	7	lunch power lines
3526	Miles	1	2015-04-23	17	
3527	Miles	4	2015-04-15	22	
3528	SitUps	30	2015-04-13	22	
3529	Lunges	15	2015-04-13	22	
3530	Burpees	15	2015-04-13	22	
3531	Miles	4	2015-04-13	22	
3532	Lunges	70	2015-04-23	16	
3533	Burpees	30	2015-04-23	16	
3534	Miles	1.2	2015-04-22	18	
3535	Miles	1.15	2015-04-23	18	
3536	Miles	2.1	2015-04-23	9	
3537	SitUps	25	2015-04-23	17	
3538	Lunges	50	2015-04-23	17	
3539	Burpees	10	2015-04-23	17	
3540	Miles	2.81	2015-04-24	7	lunch 45
3541	Miles	1	2015-04-23	41	
3542	Miles	0.25	2015-04-22	30	@ C4 Crossfit Warm-up
3543	Miles	0.75	2015-04-23	30	@ C4 Crossfit
3544	Burpees	101	2015-04-24	38	
3545	Miles	1.81	2015-04-24	42	
3546	Miles	2.63	2015-04-25	7	44th st
3547	Miles	3	2015-04-25	16	
3548	Lunges	210	2015-04-25	29	
3549	Burpees	100	2015-04-25	29	
3550	Miles	3	2015-04-25	41	
3551	Burpees	20	2015-04-25	41	
3552	Miles	2	2015-04-26	42	
3553	Miles	2	2015-04-26	18	
3554	Burpees	11	2015-04-26	18	
3555	Miles	5	2015-04-26	16	
3556	Miles	12	2015-04-26	9	
3557	Miles	3.7	2015-04-26	20	
3558	Miles	3.7	2015-04-26	21	
3559	Miles	1	2015-04-24	17	
3560	Miles	3	2015-04-25	17	
3561	SitUps	50	2015-04-26	17	
3562	Miles	2.81	2015-04-27	7	lunch 45
3563	Miles	0.75	2015-04-23	30	@ C4 Crossfit
3564	Miles	0.5	2015-04-25	30	@ C4 Crossfit
3565	Miles	0.25	2015-04-27	30	@ C4 Crossfit Warm-up
3566	Miles	2	2015-04-27	41	
3567	Miles	2	2015-04-26	37	
3568	Miles	1	2015-04-27	17	
3569	SitUps	25	2015-04-27	17	
3570	Burpees	10	2015-04-27	17	
3571	Miles	1.5	2015-04-28	30	@ C4 Crossfit
3572	Miles	1.86	2015-04-28	7	lunch power lines
3573	Burpees	4	2015-04-28	9	
3574	Miles	1.25	2015-04-28	9	
3575	Lunges	160	2015-04-28	16	
3576	Burpees	40	2015-04-28	16	
3577	Lunges	180	2015-04-28	29	
3578	Burpees	75	2015-04-28	29	
3579	SitUps	60	2015-04-29	42	
3580	Lunges	30	2015-04-29	42	
3581	Burpees	5	2015-04-29	42	
3582	Miles	1.3	2015-04-28	18	
3583	Miles	2	2015-04-28	17	
3584	Miles	2.81	2015-04-29	7	lunch 45
3585	Miles	1.93	2015-04-29	42	
3586	Miles	2	2015-04-29	41	
3587	Miles	2.5	2015-04-29	37	Intervals
3588	Miles	2	2015-04-29	17	
3589	Miles	2.81	2015-04-30	7	lunch 45
3590	Miles	1.5	2015-04-29	18	
3591	Shot	1	2015-04-29	38	
3592	SitUps	50	2015-04-30	17	
3593	Lunges	120	2015-04-30	17	
3594	Burpees	10	2015-04-30	17	
3595	Miles	0.25	2015-05-01	30	@ C4 Crossfit Warm-up
3596	Miles	0.5	2015-04-30	30	@ C4 Crossfit
3597	Miles	1	2015-04-29	30	@ Home- work break
3598	Miles	6.71	2015-04-30	16	
3599	Miles	1.5	2015-05-01	16	
3600	Burpees	10	2015-04-29	41	
3601	SitUps	250	2015-05-01	41	
3602	Miles	1.5	2015-05-01	41	
3603	Miles	1.15	2015-05-01	18	
3604	Miles	3	2015-05-02	9	
3605	Miles	2.81	2015-05-01	7	lunch 45
3606	Miles	2.5	2015-05-02	7	stony creek wilderness trail
3607	Miles	3	2015-05-02	41	
3608	Miles	2.5	2015-05-03	9	
3609	Lunges	50	2015-04-26	24	
3610	Lunges	50	2015-05-03	24	
3611	Lunges	25	2015-04-30	24	
3612	Miles	4.5	2015-05-03	37	
3613	SitUps	10	2015-04-24	22	
3614	Miles	3	2015-05-01	22	
3615	Lunges	30	2015-05-01	22	
3616	Miles	4	2015-05-03	22	
3617	Miles	1.9	2015-05-02	20	
3618	SitUps	25	2015-05-02	17	
3619	Burpees	20	2015-05-02	17	
3620	Miles	1	2015-05-02	17	
3621	Miles	2.81	2015-05-04	7	lunch 45
3622	Miles	1	2015-05-04	18	
3623	SitUps	72	2015-05-04	42	
3624	Burpees	18	2015-05-04	42	
3625	Lunges	40	2015-05-04	42	
3626	Miles	2.1	2015-05-04	42	
3627	SitUps	15	2015-05-04	22	
3628	Lunges	30	2015-05-04	22	
3629	Burpees	10	2015-05-04	22	
3630	Miles	4	2015-05-04	22	
3631	Miles	2	2015-05-04	41	
3632	SitUps	60	2015-05-05	42	
3633	Lunges	30	2015-05-05	42	
3634	Burpees	10	2015-05-05	42	
3635	Miles	1.6	2015-05-05	7	Peace Park
3636	Lunges	120	2015-05-04	29	
3637	Burpees	40	2015-05-04	29	
3638	Miles	10	2015-04-25	4	Dresden
3639	Miles	10	2015-05-01	4	Elbe Sandstone Mountains
3640	SitUps	80	2015-05-04	17	
3641	Burpees	15	2015-05-04	17	
3642	SitUps	50	2015-05-05	21	
3643	Burpees	3	2015-05-05	9	
3644	Miles	0.5	2015-05-05	9	
3645	SitUps	250	2015-05-05	41	
3646	Miles	1.5	2015-05-05	41	
3647	Miles	1.15	2015-05-05	18	
3648	SitUps	200	2015-05-04	24	omg so many abs...
3649	Lunges	50	2015-05-04	24	
3650	Miles	2	2015-05-05	17	
3651	Miles	2.81	2015-05-06	7	lunch 45
3652	Miles	2.25	2015-05-06	41	
3653	SitUps	200	2015-05-07	41	
3654	Lunges	10	2015-05-06	42	
3655	Burpees	5	2015-05-06	42	
3656	Miles	1.84	2015-05-06	42	
3657	SitUps	20	2015-05-06	42	
3658	Miles	2.76	2015-05-06	7	long walk
3659	Miles	1.4	2015-05-07	18	
3660	Miles	2.81	2015-05-07	7	lunch 45
3661	SitUps	50	2015-05-06	17	
3662	Miles	1	2015-05-06	17	
3663	Miles	2.63	2015-05-07	7	44th st
3664	Miles	1	2015-05-07	41	
3665	Miles	3	2015-05-07	9	
3666	SitUps	30	2015-05-04	5	
3667	Lunges	30	2015-05-04	5	
3668	Burpees	30	2015-05-04	5	
3669	Miles	6	2015-05-07	5	
3670	SitUps	30	2015-05-05	5	
3671	Burpees	35	2015-05-07	5	
3672	SitUps	10	2015-05-07	5	
3673	Lunges	40	2015-05-07	5	
3674	Miles	1.15	2015-05-07	18	
3675	Miles	1.86	2015-05-08	7	power lines
3676	Miles	1	2015-05-08	30	@ Home- work break
3677	Miles	0.25	2015-05-07	30	@ C4 Crossfit
3678	Miles	0.5	2015-05-05	30	@ C4 Crossfit
3679	SitUps	250	2015-05-08	41	
3680	Miles	1	2015-05-08	41	
3681	Miles	1	2015-05-08	9	
3682	Miles	3	2015-05-09	41	
3683	Miles	1.8	2015-05-09	7	
3684	Miles	1.25	2015-05-09	37	Intervals
3685	Miles	1.5	2015-05-05	37	Intervals 
3686	SitUps	60	2015-05-10	42	
3687	Lunges	30	2015-05-10	42	
3688	Burpees	5	2015-05-10	42	
3689	Miles	3.03	2015-05-10	42	
3690	Miles	4	2015-05-10	37	
3691	Lunges	25	2015-05-10	24	
3692	Lunges	75	2015-05-10	24	
3693	SitUps	200	2015-05-10	41	
3694	Burpees	50	2015-05-10	41	
3695	SitUps	50	2015-05-10	17	
3696	Miles	1	2015-05-10	17	
3697	Lunges	150	2015-05-11	29	
3698	Burpees	50	2015-05-11	29	
3699	Lunges	240	2015-05-11	16	
3700	Burpees	60	2015-05-11	16	
3701	Lunges	64	2015-05-11	16	
3702	Miles	1	2015-05-11	41	
3703	Burpees	20	2015-05-11	17	
3704	Miles	1.854	2015-05-11	42	
3705	SitUps	50	2015-05-12	17	
3706	Miles	0.5	2015-05-12	17	
3707	Miles	1.5	2015-05-13	42	
3708	Lunges	90	2015-05-13	29	
3709	Burpees	75	2015-05-13	29	
3710	Burpees	14	2015-05-13	29	
3711	Lunges	316	2015-05-13	16	
3712	Burpees	80	2015-05-13	16	
3713	Miles	1	2015-05-13	41	
3714	SitUps	200	2015-05-13	41	
3715	Burpees	60	2015-05-13	41	
3716	SitUps	25	2015-05-13	17	
3717	Burpees	20	2015-05-13	17	
3718	Miles	0.5	2015-05-13	17	
3719	Miles	0.5	2015-05-14	9	
3720	Miles	1.5	2015-05-14	17	
3721	Miles	3	2015-05-15	37	Intervals
3722	Miles	3.75	2015-05-15	30	@ C4 Crossfit
3723	Miles	2	2015-05-16	30	@ C4 Crossfit
3724	Lunges	150	2015-05-16	24	
3725	SitUps	100	2015-05-16	24	
3726	Burpees	25	2015-05-16	24	
3727	Burpees	100	2015-05-16	16	
3728	Miles	1.8	2015-05-16	42	
3729	Miles	4	2015-05-17	37	
3730	Miles	1.3	2015-05-17	37	Intervals
3731	Lunges	30	2015-05-17	41	
3732	Miles	4	2015-05-17	41	
3733	Burpees	40	2015-05-16	17	
3734	SitUps	50	2015-05-16	17	
3735	Miles	1	2015-05-15	17	
3736	Miles	1	2015-05-17	17	
3737	Miles	2.5	2015-05-18	42	
3738	SitUps	70	2015-05-18	42	
3739	Lunges	10	2015-05-18	42	
3740	Miles	1.5	2015-05-18	41	
3741	Burpees	10	2015-05-19	42	
3742	SitUps	60	2015-05-19	42	
3743	Lunges	30	2015-05-19	42	
3744	SitUps	50	2015-05-18	17	
3745	Miles	1	2015-05-18	17	
3746	Burpees	40	2015-05-19	16	
3747	SitUps	300	2015-05-19	41	
3748	Miles	0.25	2015-05-19	30	@ C4 Crossfit Warm-up
3749	Miles	1	2015-05-20	37	intervals
3750	SitUps	60	2015-05-20	42	
3751	Lunges	30	2015-05-20	42	
3752	Burpees	10	2015-05-20	42	
3753	Miles	1	2015-05-19	17	
3754	SitUps	30	2015-05-18	22	
3755	SitUps	30	2015-05-20	22	
3756	Lunges	30	2015-05-18	22	
3757	Lunges	30	2015-05-20	22	
3758	Burpees	14	2015-05-18	22	
3759	Burpees	12	2015-05-20	22	
3760	Miles	3	2015-05-18	22	
3761	Miles	3	2015-05-20	22	
3762	Miles	0.5	2015-05-19	9	
3763	SitUps	64	2015-05-20	9	
3764	Miles	1	2015-05-20	9	
3765	SitUps	10	2015-05-20	5	
3766	Lunges	10	2015-05-20	5	
3767	Miles	1.5	2015-05-20	17	
3768	Burpees	10	2015-05-21	42	
3769	Miles	1.75	2015-05-21	42	
3770	Burpees	60	2015-05-21	16	
3771	Burpees	50	2015-05-21	29	
3772	Miles	1	2015-05-20	41	
3773	Miles	6	2015-05-23	37	Tourney !
3774	SitUps	1	2015-05-23	37	
3775	SitUps	1	2015-05-23	37	
3776	Shot	1	2015-05-23	37	
3777	Miles	3	2015-05-23	41	
3778	SitUps	30	2015-05-24	5	
3779	Lunges	30	2015-05-24	5	
3780	Burpees	20	2015-05-24	5	
3781	Miles	4	2015-05-24	5	
3782	SitUps	64	2015-05-25	9	
3783	SitUps	64	2015-05-22	9	
3784	Miles	3	2015-05-25	30	@ C4 Crossfit
3785	Miles	0.25	2015-05-23	30	@ C4 Crossfit
3786	Miles	0.75	2015-05-21	30	@ C4 Crossfit
3787	Lunges	20	2015-05-25	41	
3788	Miles	6	2015-05-25	41	
3789	Miles	1.5	2015-05-26	9	
3790	Miles	3	2015-05-24	42	
3791	Burpees	2	2015-05-24	42	
3792	SitUps	60	2015-05-26	42	
3793	Lunges	30	2015-05-26	42	
3794	Burpees	10	2015-05-26	42	
3795	Miles	0.75	2015-05-26	42	
3796	Burpees	60	2015-05-26	29	
3797	Burpees	80	2015-05-26	16	
3798	Burpees	10	2015-05-21	17	
3799	SitUps	25	2015-05-21	17	
3800	Miles	3	2015-05-23	17	
3801	SitUps	50	2015-05-25	17	
3802	Burpees	25	2015-05-25	17	
3803	Miles	3	2015-05-26	17	
3804	Miles	1.75	2015-05-27	42	
3805	SitUps	50	2015-05-27	17	
3806	Burpees	10	2015-05-27	17	
3807	SitUps	30	2015-05-27	22	
3808	Lunges	30	2015-05-27	22	
3809	Burpees	9	2015-05-27	22	
3810	Miles	3	2015-05-27	22	
3811	SitUps	20	2015-05-28	42	
3812	Lunges	30	2015-05-28	42	
3813	Burpees	10	2015-05-28	42	
3814	Burpees	50	2015-05-28	29	
3815	Burpees	60	2015-05-28	16	
3816	Miles	1	2015-05-27	41	
3817	Burpees	5	2015-05-29	42	
3818	Burpees	50	2015-05-29	14	2 x 25
3819	Miles	1.2	2015-05-28	14	work walk
3820	Miles	1.2	2015-05-27	14	work walk
3821	Miles	1.2	2015-05-26	14	work walk
3822	Miles	0.75	2015-05-28	30	in Nashville
3823	SitUps	64	2015-05-28	9	
3824	Miles	2	2015-05-28	9	
3825	Miles	2	2015-05-29	9	
3826	SitUps	64	2015-05-30	9	
3827	Miles	1	2015-05-30	9	
3828	Burpees	70	2015-05-30	16	
3829	Burpees	155	2015-05-30	29	
3830	Lunges	50	2015-05-27	24	
3831	SitUps	100	2015-05-27	24	
3832	SitUps	100	2015-05-26	24	
3833	SitUps	150	2015-05-29	24	
3834	Miles	3	2015-05-28	41	
3835	Burpees	35	2015-05-31	16	
3836	Burpees	35	2015-05-31	29	
3837	Shot	1	2015-05-31	29	
3838	Shot	1	2015-05-31	16	
3839	SitUps	100	2015-05-29	14	packing
3840	Lunges	120	2015-05-29	14	packing
3841	Miles	1	2015-05-29	17	
3842	Miles	2	2015-05-31	17	
3843	SitUps	60	2015-06-02	42	
3844	Lunges	30	2015-06-02	42	
3845	Burpees	10	2015-06-02	42	
3846	SitUps	50	2015-06-01	17	
3847	Burpees	25	2015-06-01	17	
3848	Miles	2	2015-06-02	9	
3849	Miles	1.25	2015-06-01	9	
3850	Burpees	5	2015-06-02	42	
3851	Miles	2	2015-06-02	42	
3852	Miles	2	2015-06-03	9	
3853	Miles	2	2015-06-02	17	
3854	Miles	2	2015-06-03	9	
3855	Miles	1.6	2015-06-04	42	
3856	SitUps	40	2015-06-04	5	
3857	Lunges	40	2015-06-04	5	
3858	Burpees	30	2015-06-04	5	
3859	Miles	5	2015-06-04	5	
3860	Miles	1	2015-06-01	41	
3861	Miles	1.5	2015-06-03	41	
3862	SitUps	300	2015-06-05	41	
3863	Miles	1	2015-06-03	17	
3864	SitUps	40	2015-06-04	17	
3865	Burpees	40	2015-06-04	17	
3866	Miles	2	2015-06-05	9	
3867	Miles	3	2015-06-06	9	
3868	Miles	0.5	2015-06-06	30	@ C4 Crossfit- Group WOD
3869	Miles	0.5	2015-06-05	30	@ C4 Crossfit
3870	Miles	1.25	2015-06-02	30	@ C4 Crossfit
3871	Miles	0.5	2015-06-03	30	@ Home
3872	SitUps	150	2015-06-02	24	
3873	Lunges	20	2015-06-06	41	
3874	Miles	4	2015-06-06	41	
3875	Miles	2	2015-06-07	41	
3876	Lunges	20	2015-06-07	41	
3877	Miles	1	2015-06-05	17	
3878	Miles	3	2015-06-06	17	
3879	Miles	1	2015-06-07	17	
3880	Miles	1.25	2015-06-08	30	@ C4 Crossfit
3881	Miles	1	2015-06-06	42	
3882	Miles	1.5	2015-06-08	42	
3883	Miles	1	2015-06-08	41	
3884	SitUps	60	2015-06-09	42	
3885	Lunges	30	2015-06-09	42	
3886	Burpees	5	2015-06-09	42	
3887	Miles	2	2015-06-09	17	
3888	SitUps	30	2015-06-10	22	
3889	Lunges	30	2015-06-10	22	
3890	Miles	4	2015-06-10	22	
3891	Burpees	5	2015-06-10	22	
3892	Miles	4.27	2015-06-10	14	work walk + Roxie run
3893	Miles	1.2	2015-06-09	14	work walk
3894	Miles	3.42	2015-06-08	14	work walk + start up run
3895	Miles	4	2015-06-08	9	
3896	Miles	1	2015-06-10	41	
3897	SitUps	80	2015-06-11	17	
3898	Burpees	10	2015-06-11	17	
3899	Miles	2.5	2015-06-11	9	
3900	SitUps	25	2015-06-12	9	
3901	Miles	2	2015-06-13	41	
3902	Miles	3	2015-06-13	9	
3903	Miles	1	2015-06-12	17	
3904	Miles	1	2015-06-14	17	
3905	Miles	2	2015-06-15	42	
3906	SitUps	60	2015-06-16	42	
3907	Lunges	30	2015-06-16	42	
3908	Burpees	10	2015-06-16	42	
3909	SitUps	100	2015-06-15	17	
3910	Burpees	25	2015-06-15	17	
3911	Miles	0.25	2015-06-15	30	@ C4 Crossfit Warm-up
3912	Miles	2	2015-06-15	41	
3913	SitUps	300	2015-06-16	41	
3914	Miles	2	2015-06-16	17	
3915	Lunges	10	2015-06-17	42	
3916	Burpees	18	2015-06-17	42	
3917	Miles	2.25	2015-06-17	42	
3918	SitUps	323	2015-06-17	26	
3919	Burpees	72	2015-06-17	26	
3920	Lunges	80	2015-06-17	26	
3921	SitUps	50	2015-06-17	17	
3922	Burpees	10	2015-06-17	17	
3923	Miles	1.5	2015-06-15	9	
3924	Miles	2.5	2015-06-16	9	
3925	Miles	1	2015-06-17	9	
3926	SitUps	150	2015-06-18	9	
3927	Lunges	150	2015-06-16	8	
3928	Burpees	10	2015-06-18	9	
3929	Burpees	10	2015-06-16	8	
3930	Miles	1	2015-06-18	8	
3931	Miles	2	2015-06-18	17	
3932	SitUps	60	2015-06-20	8	
3933	Lunges	20	2015-06-20	8	
3934	Burpees	10	2015-06-20	8	
3935	Miles	3.9	2015-06-20	8	
3936	Miles	0.5	2015-06-18	30	@ C4 Crossfit- extra sprints
3937	Miles	5	2015-06-20	9	
3938	Burpees	5	2015-06-20	9	
3939	Miles	0.5	2015-06-20	8	
3940	SitUps	60	2015-06-21	8	
3941	Lunges	20	2015-06-21	8	
3942	Burpees	10	2015-06-21	8	
3943	Miles	2	2015-06-21	8	
3944	Miles	2	2015-06-21	9	
3945	SitUps	20	2015-06-21	8	
3946	Lunges	10	2015-06-21	8	
3947	Burpees	12	2015-06-21	8	
3948	SitUps	40	2015-06-22	8	
3949	Lunges	30	2015-06-22	8	
3950	Burpees	10	2015-06-22	8	
3951	Lunges	25	2015-06-22	8	
3952	Miles	5.4	2015-06-22	9	
3953	Miles	1	2015-06-19	17	
3954	Miles	5	2015-06-20	17	
3955	Miles	2	2015-06-21	17	
3956	SitUps	60	2015-06-23	42	
3957	Lunges	30	2015-06-23	42	
3958	Burpees	10	2015-06-23	42	
3959	SitUps	40	2015-06-23	8	
3960	Burpees	10	2015-06-23	8	
3961	Burpees	30	2015-06-22	17	
3962	Burpees	10	2015-06-23	9	
3963	Miles	2.1	2015-06-23	42	
3964	Miles	4	2015-06-23	8	
3965	Miles	0.5	2015-06-23	30	@ C4 Crossfit
3966	Lunges	30	2015-06-24	42	
3967	Burpees	10	2015-06-24	42	
3968	Miles	2	2015-06-23	17	
3969	SitUps	60	2015-06-25	42	
3970	Lunges	30	2015-06-25	42	
3971	Burpees	10	2015-06-25	42	
3972	Miles	1	2015-06-24	17	
3973	Miles	1.5	2015-06-25	30	@ C4 Crossfit
3974	Burpees	10	2015-06-25	42	
3975	Miles	2.1	2015-06-25	42	
3976	SitUps	62	2015-06-25	9	
3977	Burpees	5	2015-06-25	9	
3978	Miles	1	2015-06-25	9	
3979	SitUps	60	2015-06-26	42	
3980	Lunges	30	2015-06-26	42	
3981	Burpees	10	2015-06-26	42	
3982	SitUps	45	2015-06-26	8	
3983	Burpees	12	2015-06-26	8	
3984	Miles	0.5	2015-06-25	8	
3985	Burpees	15	2015-06-25	17	
3986	Miles	0.5	2015-06-25	17	
3987	Miles	0.5	2015-06-26	8	
3988	SitUps	200	2015-06-26	9	
3989	Burpees	10	2015-06-26	9	
3990	Miles	3	2015-06-26	9	
3991	SitUps	65	2015-06-27	8	
3992	Burpees	12	2015-06-27	8	
3993	Burpees	10	2015-06-27	9	
3994	Miles	2	2015-06-27	17	
3995	Miles	1	2015-06-27	17	
3996	Burpees	11	2015-06-27	17	
3997	SitUps	60	2015-06-27	42	
3998	Miles	1.9	2015-06-27	42	
3999	Burpees	2	2015-06-28	42	
4000	Burpees	25	2015-06-29	42	
4001	Miles	24	2015-06-29	42	
4002	SitUps	200	2015-06-29	9	
4003	Burpees	10	2015-06-29	9	
4004	Miles	1.5	2015-06-29	9	
4005	Miles	1	2015-06-29	8	
4006	Miles	-24	2015-06-29	42	
4007	Miles	2.4	2015-06-29	42	
4008	Lunges	30	2015-06-30	42	
4009	SitUps	60	2015-06-30	42	
4010	Burpees	12	2015-06-30	42	
4011	SitUps	63	2015-06-30	8	
4012	Burpees	10	2015-06-30	8	
4013	Miles	1.5	2015-06-30	8	
4014	Miles	3.2	2015-06-30	9	
4015	SitUps	200	2015-07-01	9	
4016	Burpees	10	2015-07-01	9	
4017	Miles	3.7	2015-07-01	9	
4018	Lunges	40	2015-07-01	42	
4019	Burpees	60	2015-07-01	24	Maybe I'll get there eventually!
4020	Miles	1.25	2015-07-02	30	@ C4 Crossfit
4021	SitUps	7	2015-07-02	8	
4022	Burpees	8	2015-07-02	8	
4023	Miles	0.5	2015-07-02	8	
4024	Miles	1	2015-07-03	8	
4025	Miles	4.5	2015-07-03	9	
4026	Miles	3	2015-07-03	9	
4027	Miles	3.23	2015-07-05	8	
4028	Miles	0.1	2015-07-04	8	
4029	Miles	0.1	2015-07-03	8	
4030	Miles	1	2015-07-04	8	
4031	Miles	1	2015-07-03	8	
4032	Miles	2.2	2015-07-06	42	
4033	Burpees	10	2015-07-07	42	
4034	SitUps	70	2015-07-07	8	
4035	Burpees	20	2015-07-07	8	
4036	Miles	4.66	2015-07-06	8	
4037	Miles	0.25	2015-07-06	30	@ C4 Crossfit
4038	Miles	0.75	2015-07-07	30	@ C4 Crossfit- sprints
4039	SitUps	20	2015-07-08	42	
4040	Lunges	30	2015-07-08	42	
4041	Burpees	24	2015-07-08	42	
4042	Miles	2.15	2015-07-08	42	
4043	Burpees	9	2015-07-13	42	
4044	Miles	1.56	2015-07-13	42	
4045	Miles	0.5	2015-07-14	8	
4046	SitUps	41	2015-07-14	8	
4047	Burpees	11	2015-07-14	8	
4048	Miles	1.1	2015-07-08	8	
4049	Lunges	30	2015-07-15	42	
4050	Burpees	10	2015-07-15	42	
4051	Miles	1.1	2015-07-15	8	
4052	Miles	0.75	2015-07-15	30	@ C4 Crossfit
4053	Miles	0.25	2015-07-13	30	@ C4 Crossfit
4054	Miles	0.25	2015-07-16	30	@ C4 Crossfit
4055	Miles	1	2015-07-17	30	@ C4 Crossfit
4056	Miles	0.5	2015-07-18	8	
4057	Miles	0.5	2015-07-17	8	
4058	Miles	1.1	2015-07-16	8	
4059	Lunges	20	2015-07-20	42	
4060	Miles	1.5	2015-07-20	42	
4061	Miles	1.4	2015-07-22	42	
4062	Miles	1.8	2015-07-27	8	
4063	Miles	1.1	2015-07-26	8	
4064	Miles	1.1	2015-07-24	8	
4065	Miles	1.1	2015-07-23	8	
4066	Miles	1.1	2015-07-22	8	
4067	Miles	1.1	2015-07-21	8	
4068	Miles	1.1	2015-07-20	8	
4069	Miles	1.1	2015-07-19	8	
4070	Miles	2	2015-07-25	8	
4071	Burpees	18	2015-07-27	42	
4072	Miles	1.5	2015-07-28	42	
4073	SitUps	70	2015-07-28	8	
4074	Burpees	16	2015-07-28	8	
4075	Miles	0.5	2015-07-28	8	
4076	Burpees	10	2015-07-28	8	
4077	SitUps	40	2015-07-28	8	
4078	Lunges	112	2015-07-28	42	
4079	Miles	1.2	2015-07-27	42	
4080	Miles	0.55	2015-07-29	8	
4081	SitUps	60	2015-08-04	8	
4082	Burpees	13	2015-08-04	8	
4083	Miles	1.1	2015-08-03	8	
4084	Miles	1.1	2015-08-02	8	
4085	Miles	0.5	2015-08-01	8	
4086	Miles	1.6	2015-07-31	8	
4087	Miles	1.1	2015-07-30	8	
4088	Miles	1	2015-08-06	30	@ C4 Crossfit
4089	Miles	0.5	2015-08-04	30	@ C4 Crossfit
4090	Miles	1.5	2015-08-06	42	
4091	Miles	1	2015-08-07	42	
4092	Miles	1.1	2015-08-12	8	
4093	Miles	1.1	2015-08-11	8	
4094	Miles	1.1	2015-08-10	8	
4095	Miles	1.1	2015-08-09	8	
4096	Miles	0.5	2015-08-08	8	
4097	Miles	0.5	2015-08-07	8	
4098	Miles	2.75	2015-08-06	8	
4099	Miles	1.1	2015-08-05	8	
4100	Miles	1.1	2015-08-04	8	
4101	SitUps	50	2015-08-12	8	
4102	Burpees	18	2015-08-12	8	
4103	SitUps	50	2015-08-01	9	
4104	Burpees	4	2015-08-12	8	
4105	Miles	4.05	2015-08-11	14	Ian says hi
4106	Miles	3.85	2015-08-06	14	Patrick run
4107	Miles	4.62	2015-08-04	14	Patrick run
4108	Miles	1.86	2015-08-13	14	Patrick run
4109	SitUps	60	2015-08-14	8	
4110	Burpees	15	2015-08-14	8	
4111	Burpees	5	2015-08-14	9	
4112	SitUps	30	2015-08-14	8	
4113	Burpees	10	2015-08-14	8	
4114	Miles	1.5	2015-08-14	8	
4115	Burpees	5	2015-08-14	9	
4116	SitUps	50	2015-08-15	8	
4117	Burpees	15	2015-08-15	8	
4118	Miles	1.1	2015-08-13	8	
4119	Burpees	7	2015-08-15	8	
4120	Burpees	25	2015-08-15	9	
4121	Miles	1.1	2015-08-16	8	
4122	SitUps	60	2015-08-17	8	
4123	Burpees	25	2015-08-17	8	
4124	Miles	1.6	2015-08-17	8	
4125	Burpees	7	2015-08-17	9	
4126	SitUps	30	2015-08-18	8	
4127	Burpees	11	2015-08-18	8	
4128	Miles	0.25	2015-08-17	30	@ C4 Crossfit
4129	Miles	0.75	2015-08-14	30	@ C4 Crossfit
4130	Miles	1	2015-08-12	30	@ C4 Crossfit
4131	SitUps	30	2015-08-18	8	
4132	Burpees	10	2015-08-18	8	
4133	Miles	2	2015-08-18	8	
4134	SitUps	45	2015-08-19	8	
4135	Burpees	11	2015-08-19	8	
4136	Burpees	10	2015-08-19	9	
4137	SitUps	40	2015-08-20	8	
4138	Burpees	13	2015-08-20	8	
4139	Miles	1.8	2015-08-19	8	
4140	Miles	1.8	2015-08-20	8	
4141	Burpees	10	2015-08-21	9	
4142	SitUps	40	2015-08-22	42	
4143	Lunges	30	2015-08-22	42	
4144	Burpees	9	2015-08-22	42	
4145	Miles	2.1	2015-08-22	42	
4146	Burpees	10	2015-08-23	5	
4147	Miles	0.5	2015-08-25	30	@ Home
4148	Miles	0.25	2015-08-24	30	@ C4 Crossfit
4149	Miles	1.1	2015-08-21	8	
4150	Miles	1.1	2015-08-23	8	
4151	Miles	1.5	2015-08-24	8	
4152	Miles	1.5	2015-08-25	8	
4153	Miles	2	2015-08-26	8	
4154	Miles	2	2015-08-27	8	
4155	Miles	2	2015-08-28	8	
4156	SitUps	31	2015-08-29	8	
4157	Burpees	11	2015-08-29	8	
4158	SitUps	31	2015-08-29	8	
4159	Burpees	11	2015-08-29	8	
4160	SitUps	31	2015-08-29	8	
4161	Burpees	11	2015-08-29	8	
4162	SitUps	31	2015-08-29	8	
4163	Burpees	11	2015-08-29	8	
4164	Miles	2	2015-08-29	8	
4165	Burpees	15	2015-08-30	8	
4166	SitUps	60	2015-08-30	42	
4167	Lunges	20	2015-08-30	42	
4168	Miles	2.2	2015-08-30	42	
4169	Burpees	10	2015-08-30	42	
4170	SitUps	45	2015-08-30	8	
4171	Miles	2.75	2015-08-30	8	
4172	Burpees	10	2015-08-29	9	
4173	Burpees	10	2015-08-30	9	
4174	Burpees	10	2015-08-31	9	
4175	Burpees	11	2015-08-31	9	
4176	SitUps	304	2015-08-28	26	
4177	Lunges	72	2015-08-28	26	
4178	Burpees	186	2015-08-28	26	
4179	SitUps	31	2015-08-31	8	
4180	Burpees	11	2015-08-31	8	
4181	Miles	1.3	2015-08-31	8	
4182	Burpees	12	2015-08-31	9	
4183	Miles	0.25	2015-08-31	30	@ C4 Crossfit
4184	Burpees	25	2015-09-01	9	
4185	Miles	2.5	2015-09-01	8	
4186	SitUps	45	2015-09-01	8	
4187	Burpees	21	2015-09-01	8	
4188	Burpees	42	2015-09-01	9	
4189	Miles	1.25	2015-09-02	30	@ C4 Crossfit
4190	Miles	1.1	2015-09-02	8	
4191	SitUps	10	2015-09-02	8	
4192	Burpees	15	2015-09-02	8	
4193	Burpees	20	2015-09-02	9	
4194	Burpees	11	2015-09-03	9	
4195	Miles	1.5	2015-09-03	8	
4196	SitUps	31	2015-09-03	8	
4197	Burpees	11	2015-09-03	8	
4198	Burpees	20	2015-09-03	9	
4199	Miles	1.25	2015-09-04	30	@ C4 Crossfit- extra work
4200	SitUps	31	2015-09-05	8	
4201	Burpees	11	2015-09-05	8	
4202	Miles	1.5	2015-09-05	8	
4203	Miles	0.5	2015-09-05	30	@ C4 Crossfit- sprints
4204	SitUps	60	2015-09-05	8	
4205	Burpees	20	2015-09-05	8	
4206	Miles	1.5	2015-09-05	8	
4207	Burpees	50	2015-09-05	9	
4208	Burpees	25	2015-09-05	9	
4209	Miles	2.5	2015-09-06	8	
4210	SitUps	31	2015-09-07	8	
4211	Burpees	11	2015-09-07	8	
4212	Miles	1.67	2015-09-07	8	
4213	Miles	0.5	2015-09-07	30	@ C4 Crossfit- sprints
4214	Burpees	52	2015-09-07	9	
4215	Miles	0.5	2015-09-08	30	@ C4 Crossfit
4216	SitUps	35	2015-09-08	8	
4217	Burpees	13	2015-09-08	8	
4218	Burpees	12	2015-09-08	8	
4219	SitUps	20	2015-09-08	8	
4220	Burpees	40	2015-09-08	9	
4221	Burpees	1	2015-09-08	9	
4222	Burpees	1	2015-09-08	9	
4223	SitUps	61	2015-09-10	8	
4224	Burpees	21	2015-09-10	8	
4225	Burpees	42	2015-09-10	9	
4226	Miles	0.75	2015-09-10	30	@ C4 Crossfit
4227	Miles	1	2015-09-09	30	@ C4 Crossfit- extra work
4228	SitUps	61	2015-09-11	8	
4229	Burpees	21	2015-09-11	8	
4230	Burpees	42	2015-09-11	9	
4231	SitUps	31	2015-09-12	8	
4232	Burpees	11	2015-09-12	8	
4233	SitUps	29	2015-09-12	8	
4234	Burpees	10	2015-09-12	8	
4235	Burpees	42	2015-09-12	9	
4236	Burpees	21	2015-09-13	8	
4237	SitUps	60	2015-09-13	8	
4238	SitUps	60	2015-09-13	8	
4239	Burpees	19	2015-09-13	8	
4240	Burpees	25	2015-09-13	9	
4241	Burpees	55	2015-09-13	9	
4242	SitUps	70	2015-09-19	42	
4243	Lunges	30	2015-09-19	42	
4244	Burpees	10	2015-09-19	42	
4245	Miles	2.2	2015-09-19	42	
4246	Burpees	1	2015-09-19	8	
4247	Shot	1	2015-09-19	8	
4248	Burpees	1	2015-09-19	9	
4249	Shot	1	2015-09-19	9	
4250	Miles	1.5	2015-09-14	30	@ C4 Crossfit- extra work
4251	Miles	1.25	2015-09-15	30	@ C4 Crossfit- extra work
4252	Miles	0.75	2015-09-17	30	@ C4 Crossfit- extra work
4253	Miles	0.25	2015-09-19	30	@ C4 Crossfit
4254	Miles	1.5	2015-09-21	30	
4255	Miles	1	2015-09-24	30	@ C4 Crossfit- extra work
4256	Miles	0.75	2015-09-25	30	@ C4 Crossfit- HELEN
4257	Miles	0.5	2015-09-26	30	@ C4 Crossfit
4258	Miles	1	2015-09-29	30	@ C4 Crossfit
4259	Miles	1.25	2015-10-02	30	@ C4 Crossfit
4260	Miles	0.75	2015-09-28	30	@ C4 Crossfit
4261	SitUps	75	2015-10-01	26	
4262	Lunges	100	2015-10-01	26	
4263	SitUps	84	2015-10-02	26	
4264	SitUps	100	2015-10-05	26	
4265	Lunges	100	2015-10-05	26	
4266	Burpees	36	2015-10-05	26	
4267	Miles	0.25	2015-10-05	30	@ Baseball
4268	Miles	2.75	2015-10-06	30	@ C4 Crossfit- extra work
4269	Lunges	20	2015-10-07	42	
4270	Burpees	10	2015-10-07	42	
4271	Miles	1	2015-10-05	42	
4272	Miles	0.5	2015-10-07	42	
4273	Miles	1	2015-10-07	30	@ C4 Crossfit- extra work
4274	Burpees	15	2015-10-14	42	
4275	Miles	1.5	2015-10-14	42	
4276	Miles	1	2015-10-13	30	@ C4 Crossfit
4277	Burpees	10	2015-10-15	42	
4278	Miles	1.1	2015-10-15	42	
4279	SitUps	60	2015-10-16	42	
4280	SitUps	20	2015-10-16	42	
4281	Burpees	10	2015-10-16	42	
4282	Lunges	20	2015-10-16	42	
4283	Miles	1.5	2015-10-16	30	@ C4 Crossfit- extra work
4284	Burpees	10	2015-10-19	42	
4285	Miles	0.5	2015-10-19	42	
4286	Miles	1.25	2015-10-19	30	@ C4 Crossfit- extra work
4287	Lunges	20	2015-10-20	42	
4288	Burpees	10	2015-10-20	42	
4289	Lunges	20	2015-10-21	42	
4290	Burpees	15	2015-10-21	42	
4291	Miles	1.1	2015-10-21	42	
4292	Lunges	20	2015-10-22	42	
4293	Burpees	15	2015-10-22	42	
4294	Miles	1.5	2015-10-20	30	@ C4 Crossfit- extra work
4295	Miles	1.25	2015-10-22	30	@ C4 Crossfit- extra work
4296	Miles	1.25	2015-10-23	30	@ C4 Crossfit- extra work
4297	Lunges	20	2015-10-26	42	
4298	Miles	1.5	2015-10-26	42	
4299	Burpees	15	2015-10-26	42	
4300	Miles	0.75	2015-10-26	30	@ C4 Crossfit- sprints
4301	Lunges	25	2015-10-27	42	
4302	Burpees	15	2015-10-27	42	
4303	Miles	1.1	2015-10-27	42	
4304	Burpees	10	2015-10-28	42	
4305	Miles	1	2015-10-28	42	
4306	Miles	2	2015-10-28	30	@ C4 Crossfit- sprints
4307	Lunges	20	2015-10-29	42	
4308	Burpees	10	2015-10-29	42	
4309	Miles	1.5	2015-10-29	42	
4310	Miles	0.75	2015-10-30	30	@ C4 Crossfit- extra work
4311	Lunges	20	2015-11-02	42	
4312	Miles	1.6	2015-11-02	42	
4313	Burpees	20	2015-11-02	42	
4314	Burpees	10	2015-11-03	42	
4315	Miles	1.25	2015-11-03	42	
4316	Burpees	10	2015-11-04	42	
4317	Miles	0.65	2015-11-04	42	
4318	Burpees	10	2015-11-05	42	
4319	Miles	1	2015-11-05	42	
4320	Lunges	30	2015-11-06	42	
4321	Burpees	20	2015-11-06	42	
4322	Miles	1.62	2015-11-06	42	
4323	Burpees	15	2015-11-09	42	
4324	Miles	1.26	2015-11-09	42	
4325	Burpees	10	2015-11-10	42	
4326	Miles	1.25	2015-11-10	42	
4327	Burpees	15	2015-11-11	42	
4328	Burpees	15	2015-11-12	42	
4329	Miles	2	2015-11-12	42	
4330	Burpees	5	2015-11-13	42	
4331	Miles	1.56	2015-11-14	42	
4332	Burpees	15	2015-11-16	42	
4333	Burpees	10	2015-11-17	42	
4334	Miles	1	2015-11-17	42	
4335	Miles	1.5	2015-11-18	42	
4336	Burpees	15	2015-11-18	42	
4337	Burpees	15	2015-11-19	42	
4338	Miles	1.1	2015-11-19	42	
4339	Miles	0.8	2015-11-20	42	
4340	Burpees	10	2015-11-20	42	
4341	Burpees	20	2015-11-21	42	
4342	Miles	2.25	2015-11-21	42	
4343	Burpees	20	2015-11-23	42	
4344	Miles	1.62	2015-11-23	42	
4345	Burpees	10	2015-11-24	42	
4346	Miles	1	2015-11-24	42	
4347	Burpees	10	2015-11-25	42	
4348	Miles	0.78	2015-11-25	42	
4349	Shot	1	2015-11-25	7	
4350	Miles	1.3	2015-12-01	42	
4351	Burpees	10	2015-12-01	42	
4352	Burpees	7	2015-12-02	42	
4353	Miles	1	2015-12-02	42	
4354	Burpees	13	2015-12-03	42	
4355	Miles	1	2015-12-03	42	
4356	Burpees	10	2015-12-04	42	
4357	Miles	1.03	2015-12-04	42	
4358	Burpees	10	2015-12-07	42	
4359	Miles	1.4	2015-12-07	42	
4360	Miles	1.2	2015-12-09	42	
4361	Burpees	20	2015-12-09	42	
4362	Burpees	10	2015-12-10	42	
4363	Miles	1.25	2015-12-10	42	
4364	Burpees	10	2015-12-12	42	
4365	Miles	2.05	2015-12-12	42	
4366	Burpees	5	2015-12-14	42	
4367	Miles	1	2015-12-15	42	
4368	Burpees	15	2015-12-15	42	
4369	Burpees	10	2015-12-16	42	
4370	Miles	1	2015-12-16	42	
4371	Burpees	11	2015-12-17	42	
4372	Miles	1	2015-12-17	42	
4373	Miles	1.05	2015-12-18	42	
4374	Miles	2.25	2015-12-20	42	
4375	Miles	1	2015-12-21	42	
4376	Miles	1.5	2015-12-23	42	
4377	Shot	1	2015-12-23	42	
4378	Shot	1	2015-06-27	17	\N
\.


--
-- Data for Name: EXERCISE_ENTRIES_2016; Type: TABLE DATA; Schema: public; Owner: bacardi
--

COPY "EXERCISE_ENTRIES_2016" (id, exercisetype, reps, datedone, userid, comment) FROM stdin;
1	PushUps	30	2016-01-15	15	
2	Planks	12	2016-01-15	15	
3	AirSquats	40	2016-01-15	15	
4	PushUps	100	2016-01-15	14	crafting push ups
5	Planks	30	2016-01-15	23	5 one-minute planks
6	AirSquats	20	2016-01-15	8	
7	PushUps	10	2016-01-15	8	
8	Planks	5	2016-01-15	8	
9	AirSquats	25	2016-01-15	9	
10	PushUps	10	2016-01-15	9	
11	Planks	15	2016-01-15	9	
12	AirSquats	83	2016-01-15	3	
13	PushUps	75	2016-01-15	3	
14	Miles	1.5	2016-01-15	3	
15	AirSquats	20	2016-01-15	15	
16	AirSquats	20	2016-01-15	44	
17	PushUps	20	2016-01-15	44	
18	Planks	6	2016-01-15	44	
19	PushUps	10	2016-01-15	44	
20	AirSquats	200	2016-01-15	45	
21	PushUps	50	2016-01-15	45	
22	Planks	12	2016-01-15	45	
23	AirSquats	50	2016-01-15	13	
24	PushUps	50	2016-01-15	13	
25	Planks	25	2016-01-15	13	
26	AirSquats	50	2016-01-15	13	
27	PushUps	10	2016-01-15	44	
28	Planks	3	2016-01-15	44	
29	AirSquats	10	2016-01-15	44	
30	Planks	3	2016-01-15	44	
31	PushUps	50	2016-01-15	13	
32	Planks	10	2016-01-15	13	
33	AirSquats	48	2016-01-15	34	
34	PushUps	23	2016-01-15	34	
35	Miles	2	2016-01-15	14	Work walk round trip
36	Miles	4.7	2016-01-15	13	
37	Miles	1.5	2016-01-15	3	
38	Planks	20	2016-01-15	3	
39	AirSquats	57	2016-01-15	3	
40	AirSquats	50	2016-01-15	37	
41	PushUps	20	2016-01-15	37	
42	Planks	11	2016-01-15	37	
43	AirSquats	50	2016-01-15	13	
44	PushUps	25	2016-01-15	13	
45	Planks	15	2016-01-15	13	
46	Miles	3	2016-01-15	26	
47	AirSquats	50	2016-01-16	9	
48	Planks	3	2016-01-15	9	
49	PushUps	20	2016-01-16	44	
50	Planks	3	2016-01-16	44	
51	AirSquats	20	2016-01-16	46	
52	PushUps	80	2016-01-15	46	
53	PushUps	20	2016-01-16	46	
54	AirSquats	60	2016-01-16	30	@ C4 Crossfit
55	Miles	0.5	2016-01-16	30	@ C4 Crossfit- running
56	PushUps	10	2016-01-16	9	
57	Miles	2.5	2016-01-15	24	
58	Miles	6.09	2016-01-16	46	Rowing on erg
59	Miles	2	2016-01-16	34	Ultimate game
60	AirSquats	20	2016-01-16	14	Football
61	PushUps	100	2016-01-16	14	Football
62	AirSquats	6	2016-01-15	14	Late night
63	Planks	6	2016-01-15	14	Late night
64	AirSquats	50	2016-01-16	13	
65	Miles	2.75	2016-01-16	13	
66	AirSquats	50	2016-01-16	9	
67	PushUps	50	2016-01-16	9	
68	Planks	3	2016-01-16	9	
69	PushUps	25	2016-01-16	13	
70	Planks	15	2016-01-16	13	
71	AirSquats	25	2016-01-16	9	
72	Planks	7	2016-01-16	9	
73	Planks	15	2016-01-16	13	
74	AirSquats	25	2016-01-16	13	
75	AirSquats	25	2016-01-16	13	
76	AirSquats	25	2016-01-16	13	
77	AirSquats	50	2016-01-16	23	
78	Planks	12	2016-01-16	23	
79	Miles	1	2016-01-16	23	
80	AirSquats	46	2016-01-16	8	
81	PushUps	31	2016-01-16	8	
82	Planks	16	2016-01-16	8	
83	Miles	0.5	2016-01-15	8	
84	Miles	1	2016-01-16	8	
85	Miles	2	2016-01-16	3	
86	AirSquats	50	2016-01-16	3	
87	Planks	15	2016-01-16	3	
88	AirSquats	10	2016-01-16	3	
89	PushUps	25	2016-01-16	3	
90	AirSquats	112	2016-01-16	26	
91	PushUps	50	2016-01-16	26	
92	Miles	2.8	2016-01-16	34	
93	Planks	18	2016-01-16	26	
94	Planks	15	2016-01-16	3	
95	AirSquats	100	2016-01-16	15	
96	PushUps	70	2016-01-16	15	
97	Miles	5	2016-01-16	15	4x1:20 ultimate games at Lei-Out!
98	AirSquats	50	2016-01-16	15	
99	AirSquats	10	2016-01-16	11	
100	Planks	6	2016-01-16	11	
101	Miles	5	2016-01-16	11	
102	Miles	1	2016-01-16	3	
103	Miles	1	2016-01-16	26	
104	AirSquats	60	2016-01-17	46	
105	PushUps	100	2016-01-17	46	
106	Planks	18	2016-01-17	46	
107	Miles	5.17	2016-01-17	46	Rowing on erg
108	AirSquats	31	2016-01-17	8	
109	PushUps	21	2016-01-17	8	
110	Planks	11	2016-01-17	8	
111	Miles	6	2016-01-17	8	
112	AirSquats	50	2016-01-17	13	
113	PushUps	50	2016-01-17	13	
114	AirSquats	5	2016-01-16	24	
115	AirSquats	50	2016-01-17	13	
116	PushUps	50	2016-01-17	13	
117	AirSquats	100	2016-01-17	17	
118	PushUps	25	2016-01-17	17	
119	Miles	7.27	2016-01-17	13	
120	Planks	15	2016-01-17	13	
121	Planks	15	2016-01-17	13	
122	Miles	1	2016-01-16	9	
123	Miles	6	2016-01-17	9	
124	AirSquats	30	2016-01-17	15	
125	Miles	3.75	2016-01-17	15	3x1:20 ultimate games at Lei-Out!
126	Miles	3	2016-01-17	11	
127	AirSquats	70	2016-01-16	45	
128	AirSquats	30	2016-01-16	45	
129	AirSquats	2	2016-01-17	45	
130	Miles	2	2016-01-17	45	
131	AirSquats	48	2016-01-17	37	
132	PushUps	24	2016-01-17	37	
133	Planks	12	2016-01-17	37	
134	AirSquats	75	2016-01-18	46	
135	PushUps	85	2016-01-18	46	
136	Planks	6	2016-01-18	9	
137	AirSquats	15	2016-01-17	24	
138	AirSquats	60	2016-01-18	30	@ C4 Crossfit
139	PushUps	30	2016-01-18	30	@ C4 Crossfit- extra work
140	Planks	6	2016-01-18	30	@ C4 Crossfit- extra work
141	Miles	0.25	2016-01-18	30	@ C4 Crossfit- extra work
142	Planks	12	2016-01-18	34	
143	AirSquats	115	2016-01-18	34	
144	PushUps	10	2016-01-18	34	
145	AirSquats	15	2016-01-18	8	
146	PushUps	10	2016-01-18	8	
147	Planks	5	2016-01-18	8	
148	Miles	1.3	2016-01-18	26	
149	AirSquats	40	2016-01-18	7	
150	PushUps	20	2016-01-18	7	
151	Planks	10	2016-01-18	7	
152	Miles	1	2016-01-18	24	
153	Miles	3	2016-01-18	7	
154	Miles	6	2016-01-16	47	ultimate frisbee tournament - Winter thing
155	Miles	6	2016-01-17	47	day 2 Winter thing
156	PushUps	30	2016-01-15	47	
157	Planks	36	2016-01-18	47	
158	AirSquats	20	2016-01-15	47	
159	Miles	3.3	2016-01-18	34	
160	Planks	20	2016-01-18	17	
161	Miles	2	2016-01-18	17	
162	AirSquats	50	2016-01-18	13	
163	PushUps	50	2016-01-18	13	
164	Planks	15	2016-01-18	13	
165	Miles	1.25	2016-01-18	30	Bike-walk with boys
166	AirSquats	10	2016-01-18	14	Work squats
167	Miles	2	2016-01-18	14	Work walk round trip
168	AirSquats	10	2016-01-18	9	
169	AirSquats	15	2016-01-18	8	
170	PushUps	10	2016-01-18	8	
171	Planks	6	2016-01-18	8	
172	Miles	0.5	2016-01-18	8	
173	AirSquats	18	2016-01-18	37	
174	PushUps	12	2016-01-18	37	
175	Planks	6	2016-01-18	37	
176	AirSquats	100	2016-01-18	18	
177	PushUps	25	2016-01-18	18	
178	Planks	17	2016-01-18	18	
179	Miles	2	2016-01-18	23	Soccer game
180	Planks	24	2016-01-19	46	
181	AirSquats	20	2016-01-19	49	
182	Miles	1	2016-01-19	49	
183	Miles	3.5	2016-01-18	49	
184	AirSquats	115	2016-01-18	49	
185	AirSquats	25	2016-01-16	49	
186	PushUps	60	2016-01-19	49	
187	Miles	1	2016-01-16	49	
188	Planks	10	2016-01-19	49	
189	AirSquats	35	2016-01-16	49	
190	Planks	18	2016-01-19	34	
191	AirSquats	15	2016-01-18	24	
192	PushUps	15	2016-01-19	24	
193	AirSquats	54	2016-01-19	14	even it out
194	Planks	12	2016-01-15	25	
195	Planks	12	2016-01-16	25	
196	Planks	12	2016-01-17	25	
197	Planks	12	2016-01-18	25	
198	PushUps	10	2016-01-16	25	
199	PushUps	10	2016-01-17	25	
200	Miles	3	2016-01-16	25	
201	Miles	4	2016-01-15	25	
202	AirSquats	1	2016-01-17	25	
203	Miles	4	2016-01-18	25	
204	AirSquats	36	2016-01-19	7	
205	PushUps	24	2016-01-19	7	
206	Planks	12	2016-01-19	7	
207	AirSquats	30	2016-01-19	30	@ C4 Crossfit
208	Planks	10	2016-01-19	30	@ C4 Crossfit
209	Miles	1	2016-01-19	30	@ Home on rower
210	Miles	3	2016-01-19	7	
211	AirSquats	20	2016-01-19	9	
212	PushUps	20	2016-01-19	9	
213	Planks	10	2016-01-19	9	
214	AirSquats	48	2016-01-19	37	
215	AirSquats	100	2016-01-19	17	
216	Planks	20	2016-01-19	17	
217	Miles	2.5	2016-01-19	17	
218	Miles	2.2	2016-01-19	14	Work walk round trip
219	AirSquats	75	2016-01-19	4	
220	PushUps	30	2016-01-19	4	
221	Planks	15	2016-01-19	4	
222	PushUps	25	2016-01-19	18	
223	Planks	10	2016-01-19	18	
224	AirSquats	13	2016-01-19	26	weighted
225	Miles	4	2016-01-19	25	
226	PushUps	30	2016-01-19	25	
227	Planks	6	2016-01-19	25	
228	AirSquats	30	2016-01-19	18	
229	AirSquats	198	2016-01-19	37	
230	PushUps	99	2016-01-19	37	
231	Planks	48	2016-01-19	37	
232	Miles	2	2016-01-19	37	
233	AirSquats	200	2016-01-19	15	
234	PushUps	10	2016-01-19	15	
235	AirSquats	50	2016-01-19	26	
236	PushUps	30	2016-01-19	26	
237	Planks	12	2016-01-19	26	
238	AirSquats	50	2016-01-19	26	
239	PushUps	20	2016-01-19	26	
240	Planks	12	2016-01-19	26	
241	AirSquats	70	2016-01-20	14	Toothbrush Squats
242	AirSquats	30	2016-01-19	47	sore knee
243	PushUps	50	2016-01-19	47	
244	Planks	18	2016-01-19	47	
245	AirSquats	162	2016-01-20	34	
246	Miles	1.5	2016-01-20	34	
247	AirSquats	150	2016-01-19	13	
248	PushUps	150	2016-01-19	13	
249	Miles	4	2016-01-16	16	
250	Miles	1.5	2016-01-18	16	
251	AirSquats	50	2016-01-20	9	
252	Planks	12	2016-01-20	9	
253	AirSquats	30	2016-01-19	8	
254	Miles	0.5	2016-01-19	8	
255	AirSquats	30	2016-01-20	8	
256	PushUps	21	2016-01-20	8	
257	Planks	9	2016-01-20	8	
258	Miles	0.75	2016-01-20	8	
259	Miles	5	2016-01-17	44	
260	Miles	3	2016-01-19	44	
261	AirSquats	20	2016-01-16	44	
262	AirSquats	10	2016-01-20	44	
263	AirSquats	25	2016-01-20	44	
264	PushUps	15	2016-01-20	44	
265	Planks	6	2016-01-20	44	
266	PushUps	10	2016-01-20	44	
267	PushUps	11	2016-01-20	8	
268	Planks	6	2016-01-20	8	
269	Miles	3	2016-01-20	34	
270	AirSquats	50	2016-01-20	13	
271	Planks	20	2016-01-20	13	
272	Miles	4	2016-01-20	13	
273	AirSquats	165	2016-01-20	49	
274	Planks	10	2016-01-19	49	
275	Miles	4.5	2016-01-20	49	
276	Planks	6	2016-01-20	8	
277	Miles	1.2	2016-01-20	18	
278	PushUps	5	2016-01-20	9	
279	Planks	12	2016-01-20	9	
280	Planks	5	2016-01-20	9	
281	PushUps	50	2016-01-20	17	
282	Miles	1.5	2016-01-20	17	
283	Miles	2.6	2016-01-20	14	Forgot lunch, had to go back.
284	AirSquats	35	2016-01-20	3	
285	Miles	1.5	2016-01-20	3	
286	AirSquats	28	2016-01-20	26	Weighted pause squats
287	Miles	1.25	2016-01-20	26	2000m row
288	PushUps	100	2016-01-20	14	4 sets of 25
289	Planks	16	2016-01-20	3	
290	Miles	0.2	2016-01-20	3	
291	AirSquats	30	2016-01-20	14	5 x 1 minute sets
292	Planks	30	2016-01-20	14	5 x 1 minute sets
293	PushUps	20	2016-01-20	3	
294	AirSquats	50	2016-01-20	3	
295	AirSquats	47	2016-01-20	26	
296	Planks	12	2016-01-20	3	
297	Planks	12	2016-01-20	26	
298	Miles	5	2016-01-20	15	
299	AirSquats	20	2016-01-20	15	
300	PushUps	60	2016-01-20	25	
301	Planks	12	2016-01-20	25	
302	Miles	4.5	2016-01-20	25	
303	PushUps	25	2016-01-20	14	Beat em
304	Planks	10	2016-01-20	18	
305	Miles	1.5	2016-01-20	52	
306	Planks	6	2016-01-20	52	
307	AirSquats	50	2016-01-19	52	
308	Planks	12	2016-01-19	52	
309	PushUps	40	2016-01-20	15	
310	PushUps	20	2016-01-19	52	
311	PushUps	50	2016-01-20	14	going to the top
312	Planks	24	2016-01-20	14	to the top!
313	AirSquats	10	2016-01-20	14	get even
314	PushUps	25	2016-01-20	14	get even!!!
315	PushUps	40	2016-01-21	37	
316	Planks	20	2016-01-21	37	
317	Miles	1	2016-01-20	23	Walk to work
318	AirSquats	100	2016-01-20	46	
319	AirSquats	100	2016-01-21	14	Toothbrush Squats
320	AirSquats	60	2016-01-21	47	
321	PushUps	130	2016-01-21	49	
322	PushUps	60	2016-01-21	47	
323	Miles	1	2016-01-21	49	
324	Planks	30	2016-01-21	47	
325	Miles	1	2016-01-21	26	
326	Planks	20	2016-01-21	34	
327	AirSquats	36	2016-01-21	7	
328	PushUps	24	2016-01-21	7	
329	Planks	12	2016-01-21	7	
330	Miles	1	2016-01-21	30	@ Home on rower
331	AirSquats	60	2016-01-21	30	@ C4 Crossfit- extra work
332	Planks	15	2016-01-21	30	@ C4 Crossfit- extra work
333	PushUps	50	2016-01-21	30	@ C4 Crossfit- extra work
334	Miles	3	2016-01-21	7	
335	PushUps	32	2016-01-21	34	
336	Planks	20	2016-01-21	34	
337	Planks	10	2016-01-21	49	
338	AirSquats	50	2016-01-21	34	
339	PushUps	10	2016-01-21	34	
340	Planks	10	2016-01-21	34	
341	Miles	2	2016-01-21	14	Work walk round trip
342	Miles	5.1	2016-01-21	15	
343	Planks	8	2016-01-21	15	
344	PushUps	25	2016-01-21	34	
345	Miles	4.6	2016-01-21	13	
346	PushUps	40	2016-01-21	25	
347	Planks	12	2016-01-21	25	
348	Miles	3	2016-01-21	25	
349	AirSquats	40	2016-01-21	18	
350	PushUps	20	2016-01-21	18	
351	Planks	15	2016-01-21	18	
352	Planks	10	2016-01-21	17	
353	Miles	1	2016-01-21	17	
354	AirSquats	60	2016-01-21	37	
355	PushUps	44	2016-01-21	37	
356	Planks	22	2016-01-21	37	
357	Miles	2	2016-01-21	37	
358	AirSquats	75	2016-01-21	4	
359	PushUps	30	2016-01-21	4	
360	Planks	15	2016-01-21	4	
361	AirSquats	10	2016-01-21	46	
362	Miles	3.47	2016-01-22	46	Rowing on erg
363	PushUps	100	2016-01-22	46	
364	Planks	25	2016-01-22	46	
365	Planks	12	2016-01-22	26	
366	AirSquats	40	2016-01-22	26	
367	PushUps	20	2016-01-22	26	
368	AirSquats	5	2016-01-22	9	
369	PushUps	20	2016-01-22	9	
370	PushUps	20	2016-01-22	9	
371	Planks	17	2016-01-22	9	
372	AirSquats	100	2016-01-22	14	Toothbrush Squats
373	PushUps	30	2016-01-20	11	
374	AirSquats	205	2016-01-22	34	
375	PushUps	5	2016-01-22	34	
376	Miles	0.9	2016-01-22	34	Rowing
377	AirSquats	36	2016-01-22	7	
378	PushUps	24	2016-01-22	7	
379	Planks	12	2016-01-22	7	
380	Miles	3	2016-01-22	7	
381	Miles	2.8	2016-01-22	34	
382	Miles	2	2016-01-22	14	Work walk round trip
383	AirSquats	36	2016-01-21	12	Wasn't actually planning on doing the challenge this year. But what the hell.
384	Miles	1.7	2016-01-22	3	
385	PushUps	40	2016-01-22	3	
386	Miles	1	2016-01-21	8	
387	AirSquats	45	2016-01-22	8	
388	PushUps	31	2016-01-22	8	
389	Planks	14	2016-01-22	8	
390	AirSquats	65	2016-01-22	3	
391	AirSquats	20	2016-01-22	25	
392	PushUps	40	2016-01-22	25	
393	Planks	12	2016-01-22	25	
394	Miles	4.3	2016-01-22	25	
395	PushUps	20	2016-01-22	3	
396	AirSquats	170	2016-01-22	49	
397	Miles	4	2016-01-22	49	
398	Planks	12	2016-01-22	34	
399	AirSquats	20	2016-01-22	18	
400	PushUps	10	2016-01-22	18	
401	AirSquats	120	2016-01-22	15	
402	PushUps	60	2016-01-22	15	
403	Miles	3.5	2016-01-23	17	
404	AirSquats	100	2016-01-23	14	Toothbrush Squats
405	PushUps	50	2016-01-23	3	
406	AirSquats	75	2016-01-23	4	
407	PushUps	30	2016-01-23	4	
408	Planks	15	2016-01-23	4	
409	AirSquats	20	2016-01-22	11	
410	PushUps	15	2016-01-22	11	
411	Planks	16	2016-01-22	11	
412	Miles	2	2016-01-22	11	
413	AirSquats	150	2016-01-22	47	
414	PushUps	100	2016-01-22	47	
415	Planks	42	2016-01-22	47	
416	AirSquats	120	2016-01-23	34	
417	PushUps	60	2016-01-23	34	
418	AirSquats	60	2016-01-23	3	
419	PushUps	50	2016-01-23	3	
420	Planks	20	2016-01-23	3	
421	Planks	15	2016-01-23	3	
422	AirSquats	40	2016-01-23	26	Burpees
423	AirSquats	30	2016-01-23	26	Dumbbell thrusters
424	PushUps	40	2016-01-23	26	Burpees
425	AirSquats	120	2016-01-23	26	Ball slams
426	Miles	2	2016-01-23	34	Ultimate!
427	Miles	2	2016-01-23	15	Winter league
428	AirSquats	20	2016-01-23	8	
429	Planks	7	2016-01-23	8	
430	PushUps	15	2016-01-23	8	
431	Miles	2.6	2016-01-23	26	
432	Miles	5.9	2016-01-23	3	
433	AirSquats	5	2016-01-23	3	
434	PushUps	50	2016-01-23	3	
435	AirSquats	50	2016-01-23	13	
436	PushUps	50	2016-01-23	13	
437	Miles	9.28	2016-01-23	13	
438	Miles	5	2016-01-23	23	
439	AirSquats	10	2016-01-19	24	
440	PushUps	15	2016-01-23	24	
441	Miles	3	2016-01-23	24	
442	Planks	6	2016-01-23	24	
443	AirSquats	25	2016-01-23	24	
444	AirSquats	20	2016-01-23	26	
445	PushUps	40	2016-01-23	26	
446	AirSquats	80	2016-01-23	45	
447	PushUps	40	2016-01-23	45	
448	Planks	6	2016-01-23	45	
449	AirSquats	60	2016-01-18	45	
450	PushUps	30	2016-01-18	45	
451	AirSquats	25	2016-01-23	25	
452	PushUps	50	2016-01-23	25	
453	Planks	20	2016-01-23	25	
454	Miles	5	2016-01-23	25	
455	AirSquats	10	2016-01-23	25	
456	PushUps	30	2016-01-23	3	
457	Miles	0.4	2016-01-23	3	
458	Planks	46	2016-01-23	15	
459	PushUps	50	2016-01-23	46	
460	Planks	15	2016-01-23	46	
461	Miles	4.76	2016-01-24	46	Rowing on erg
462	AirSquats	60	2016-01-23	34	
463	AirSquats	150	2016-01-24	17	
464	PushUps	50	2016-01-24	17	
465	AirSquats	111	2016-01-23	30	@ Home
466	PushUps	111	2016-01-23	30	@ Home
467	Planks	33	2016-01-23	30	@ Home
468	Miles	2	2016-01-23	30	@ Home on rower
469	AirSquats	15	2016-01-24	8	
470	PushUps	21	2016-01-24	8	
471	Planks	6	2016-01-24	8	
472	Miles	1	2016-01-24	49	
473	Miles	2	2016-01-23	49	
474	AirSquats	100	2016-01-21	49	
475	Planks	100	2016-01-24	13	
476	AirSquats	50	2016-01-24	13	
477	PushUps	50	2016-01-24	13	
478	Planks	20	2016-01-24	13	
479	AirSquats	25	2016-01-24	13	
480	AirSquats	20	2016-01-24	13	
481	AirSquats	30	2016-01-24	15	
482	Miles	8.2	2016-01-24	15	
483	Miles	3.5	2016-01-24	34	
484	AirSquats	35	2016-01-24	9	
485	PushUps	10	2016-01-24	9	
486	Planks	1	2016-01-24	9	
487	AirSquats	30	2016-01-24	49	
488	Miles	3.5	2016-01-24	49	
489	AirSquats	60	2016-01-19	49	
490	Miles	3.5	2016-01-24	26	
491	PushUps	41	2016-01-20	26	Bench press
492	Planks	18	2016-01-24	34	
493	PushUps	20	2016-01-24	34	
494	Miles	3.7	2016-01-24	3	
495	AirSquats	85	2016-01-24	46	
496	Planks	50	2016-01-24	46	
497	PushUps	25	2016-01-24	46	
498	Miles	1	2016-01-24	17	
499	Miles	2	2016-01-24	45	
500	AirSquats	200	2016-01-24	45	
501	Planks	6	2016-01-24	45	
502	AirSquats	30	2016-01-24	45	
503	PushUps	30	2016-01-24	45	
504	AirSquats	110	2016-01-24	47	
505	PushUps	100	2016-01-24	47	
506	AirSquats	50	2016-01-24	47	
507	Planks	36	2016-01-24	47	
508	Miles	3	2016-01-24	47	
509	AirSquats	45	2016-01-24	25	
510	PushUps	120	2016-01-24	25	
511	Miles	2	2016-01-22	37	
512	Planks	25	2016-01-24	25	
513	PushUps	24	2016-01-24	37	
514	Planks	12	2016-01-24	37	
515	Miles	5.2	2016-01-24	25	
516	AirSquats	60	2016-01-24	15	
517	PushUps	20	2016-01-24	15	
518	Planks	2	2016-01-24	15	
519	Planks	24	2016-01-24	25	
520	AirSquats	20	2016-01-24	25	
521	PushUps	40	2016-01-24	25	
522	AirSquats	25	2016-01-25	9	
523	PushUps	20	2016-01-25	9	
524	Planks	10	2016-01-25	9	
525	Miles	1.5	2016-01-25	30	@ C4 Crossfit- sprints
526	PushUps	80	2016-01-25	30	@ C4 Crossfit- extra work
527	Planks	15	2016-01-25	30	@ C4 Crossfit- extra work
528	AirSquats	30	2016-01-25	30	@ C4 Crossfit- extra work
529	AirSquats	10	2016-01-24	11	
530	Miles	2.5	2016-01-24	11	
531	Miles	2	2016-01-23	11	
532	Miles	3.2	2016-01-24	18	
533	AirSquats	100	2016-01-25	14	Toothbrush Squats
534	Miles	1.6	2016-01-25	3	
535	Miles	0.8	2016-01-25	26	
536	Miles	4.6	2016-01-25	18	
537	PushUps	48	2016-01-25	34	
538	Planks	18	2016-01-25	34	
539	Miles	0.3	2016-01-25	34	Rowing
540	Planks	8	2016-01-25	34	
541	Miles	3.6	2016-01-25	34	
542	AirSquats	50	2016-01-25	13	
543	PushUps	50	2016-01-25	13	
544	Planks	5	2016-01-25	13	
545	Miles	0.25	2016-01-25	13	
546	Miles	2	2016-01-25	14	Work walk round trip
547	Planks	15	2016-01-25	3	
548	Miles	0.6	2016-01-25	3	
549	Miles	2.25	2016-01-25	26	
550	AirSquats	40	2016-01-25	25	
551	PushUps	60	2016-01-25	25	
552	Planks	24	2016-01-25	25	
553	Miles	5	2016-01-25	25	
554	Planks	3	2016-01-25	9	
555	Miles	1	2016-01-25	23	
556	Miles	2.5	2016-01-25	17	
557	Planks	20	2016-01-25	17	
558	PushUps	30	2016-01-25	18	
559	Planks	22	2016-01-25	18	
560	Miles	5	2016-01-25	15	
561	Planks	10	2016-01-25	15	
562	AirSquats	50	2016-01-25	24	
563	Planks	6	2016-01-25	24	
564	PushUps	20	2016-01-25	24	
565	AirSquats	25	2016-01-25	24	
566	Planks	11	2016-01-25	24	
567	AirSquats	20	2016-01-25	52	
568	Planks	12	2016-01-25	52	
569	Miles	1.5	2016-01-25	52	
570	Miles	3.2	2016-01-24	52	
571	AirSquats	30	2016-01-21	52	
572	PushUps	30	2016-01-21	52	
573	AirSquats	100	2016-01-25	25	
574	AirSquats	96	2016-01-25	37	
575	PushUps	72	2016-01-25	37	
576	Planks	36	2016-01-25	37	
577	Miles	2	2016-01-25	37	
578	AirSquats	100	2016-01-25	4	
579	PushUps	30	2016-01-25	4	
580	Planks	15	2016-01-25	4	
581	Miles	1	2016-01-25	4	
582	AirSquats	20	2016-01-25	46	
583	Miles	3.43	2016-01-26	46	Erg
584	PushUps	42	2016-01-25	49	
585	Miles	3.6	2016-01-25	49	
586	Planks	18	2016-01-25	49	
587	AirSquats	60	2016-01-26	49	
588	PushUps	50	2016-01-26	49	
589	Miles	1	2016-01-26	49	
590	AirSquats	36	2016-01-26	7	
591	PushUps	24	2016-01-26	7	
592	Planks	12	2016-01-26	7	
593	Miles	3	2016-01-26	7	
594	AirSquats	120	2016-01-26	30	@ Home
595	PushUps	120	2016-01-26	30	@ Home
596	Planks	36	2016-01-26	30	@ Home
597	Miles	1	2016-01-26	30	@ Home on rower
598	AirSquats	30	2016-01-25	8	
599	PushUps	21	2016-01-25	8	
600	Planks	12	2016-01-25	8	
601	Miles	1	2016-01-25	8	
602	Miles	1.6	2016-01-26	8	
603	AirSquats	10	2016-01-26	8	
604	PushUps	21	2016-01-26	8	
605	Planks	12	2016-01-26	8	
606	AirSquats	100	2016-01-26	17	
607	Miles	0.5	2016-01-26	17	
608	PushUps	50	2016-01-26	17	
609	Miles	6.12	2016-01-26	13	
610	Planks	6	2016-01-26	46	
611	PushUps	100	2016-01-26	46	
612	Planks	24	2016-01-26	3	
613	Planks	24	2016-01-26	26	
614	PushUps	40	2016-01-26	3	
615	Miles	2.2	2016-01-26	3	
616	Miles	1.2	2016-01-26	18	
617	AirSquats	60	2016-01-26	3	
618	AirSquats	30	2016-01-26	3	
619	AirSquats	100	2016-01-26	26	
620	PushUps	59	2016-01-26	26	
621	Planks	10	2016-01-26	3	
622	Planks	40	2016-01-26	3	
623	AirSquats	30	2016-01-26	4	
624	PushUps	30	2016-01-26	4	
625	Planks	15	2016-01-26	4	
626	Miles	3	2016-01-26	4	
627	AirSquats	50	2016-01-26	26	
628	Planks	24	2016-01-26	26	
629	PushUps	25	2016-01-26	3	
630	AirSquats	70	2016-01-26	18	
631	PushUps	25	2016-01-26	18	
632	Planks	26	2016-01-26	18	
633	Planks	25	2016-01-26	37	
634	AirSquats	50	2016-01-27	25	
635	AirSquats	50	2016-01-26	25	
636	PushUps	80	2016-01-26	25	
637	Planks	24	2016-01-26	25	
638	Miles	2	2016-01-27	25	
639	Miles	2	2016-01-26	25	
640	Miles	1.6	2016-01-26	9	
641	Planks	6	2016-01-27	9	
642	AirSquats	25	2016-01-27	9	
643	PushUps	25	2016-01-27	9	
644	Miles	6.01	2016-01-27	46	Erg
645	Planks	20	2016-01-27	46	
646	PushUps	25	2016-01-27	9	
647	Miles	0.4	2016-01-27	3	To bus
648	Miles	0.2	2016-01-27	3	Sled drags
649	AirSquats	84	2016-01-27	3	Slam ball
650	AirSquats	42	2016-01-27	3	Burpees
651	PushUps	42	2016-01-27	3	Burpees
652	Miles	1.5	2016-01-27	30	@ C4 Crossfit- extra work
653	AirSquats	80	2016-01-27	30	@ C4 Crossfit- extra work
654	Miles	2.3	2016-01-27	34	
655	Miles	1.4	2016-01-27	9	
656	AirSquats	15	2016-01-27	8	
657	Planks	5	2016-01-27	8	
658	Miles	0.5	2016-01-27	8	
659	AirSquats	25	2016-01-27	8	
660	PushUps	22	2016-01-27	8	
661	Planks	6	2016-01-27	8	
662	AirSquats	35	2016-01-27	46	
663	AirSquats	100	2016-01-27	14	Toothbrush Squats
664	Miles	2	2016-01-27	14	Work walk round trip
665	Miles	3.9	2016-01-18	53	50 F
666	Miles	2.7	2016-01-19	53	
667	AirSquats	50	2016-01-19	53	
668	PushUps	20	2016-01-19	53	
669	Planks	6	2016-01-19	53	
670	Miles	3	2016-01-20	53	
671	AirSquats	50	2016-01-20	53	
672	PushUps	20	2016-01-20	53	
673	Planks	8	2016-01-20	53	
674	AirSquats	50	2016-01-22	53	
675	PushUps	20	2016-01-22	53	
676	Planks	10	2016-01-22	53	
677	Miles	2	2016-01-24	53	Ultimate pickup game
678	Miles	3.28	2016-01-26	53	
679	Miles	3	2016-01-27	25	
680	AirSquats	50	2016-01-27	25	
681	AirSquats	50	2016-01-26	53	
682	PushUps	100	2016-01-27	25	
683	PushUps	20	2016-01-26	53	
684	Planks	30	2016-01-27	25	
685	Planks	12	2016-01-26	53	
686	Miles	2.5	2016-01-27	53	
687	AirSquats	50	2016-01-27	53	
688	PushUps	20	2016-01-27	53	
689	Planks	12	2016-01-27	53	
690	Miles	2	2016-01-27	24	
691	Miles	2	2016-01-27	24	
692	AirSquats	30	2016-01-27	26	Weighted
693	PushUps	25	2016-01-27	26	Bench press
694	AirSquats	70	2016-01-27	18	
695	PushUps	35	2016-01-27	18	
696	Planks	10	2016-01-27	18	
697	Miles	1.7	2016-01-27	18	
698	PushUps	80	2016-01-27	4	
699	Planks	20	2016-01-27	4	
700	Miles	2.5	2016-01-27	3	
701	PushUps	50	2016-01-27	37	
702	Planks	29	2016-01-27	37	
703	AirSquats	50	2016-01-27	13	
704	Planks	50	2016-01-27	13	
705	AirSquats	100	2016-01-28	14	Toothbrush Squats
706	PushUps	50	2016-01-28	14	Morning warm up
707	AirSquats	25	2016-01-28	9	
708	PushUps	75	2016-01-28	9	
709	Planks	15	2016-01-28	9	
710	AirSquats	15	2016-01-28	9	
711	AirSquats	25	2016-01-28	9	
712	Miles	1	2016-01-28	26	
713	Miles	4.7	2016-01-28	34	
714	AirSquats	25	2016-01-27	49	
715	Miles	1	2016-01-27	49	
716	AirSquats	135	2016-01-28	49	
717	Miles	5.1	2016-01-28	49	
718	PushUps	20	2016-01-27	49	
719	Planks	10	2016-01-28	34	
720	Miles	4	2016-01-28	13	
721	PushUps	25	2016-01-28	13	
722	AirSquats	25	2016-01-28	13	
723	AirSquats	50	2016-01-28	34	
724	AirSquats	25	2016-01-28	13	
725	PushUps	25	2016-01-28	13	
726	AirSquats	31	2016-01-28	8	
727	PushUps	5	2016-01-28	8	
728	Planks	2	2016-01-28	8	
729	AirSquats	30	2016-01-28	13	
730	PushUps	30	2016-01-28	13	
731	PushUps	20	2016-01-28	13	
732	Planks	10	2016-01-28	13	
733	AirSquats	25	2016-01-28	13	
734	Planks	5	2016-01-28	13	
735	AirSquats	60	2016-01-28	26	Wall balls
736	PushUps	24	2016-01-28	4	
737	Miles	3.5	2016-01-28	4	
738	AirSquats	90	2016-01-28	3	
739	Miles	1.1	2016-01-28	3	
740	Miles	3	2016-01-28	14	Work walk plus
741	AirSquats	150	2016-01-28	25	
742	PushUps	120	2016-01-28	25	
743	AirSquats	30	2016-01-28	25	
744	Planks	5	2016-01-28	25	
745	Miles	1	2016-01-27	17	
746	Miles	1	2016-01-28	17	
747	Planks	20	2016-01-28	17	
748	AirSquats	100	2016-01-28	18	
749	PushUps	40	2016-01-28	18	
750	Planks	25	2016-01-28	18	
751	Miles	1.7	2016-01-28	18	
752	AirSquats	30	2016-01-28	52	
753	PushUps	20	2016-01-28	52	
754	Planks	24	2016-01-28	52	
755	Miles	3	2016-01-28	52	
756	AirSquats	20	2016-01-26	52	
757	PushUps	20	2016-01-28	52	
758	Miles	2	2016-01-28	23	
759	AirSquats	100	2016-01-28	37	
760	PushUps	50	2016-01-28	37	
761	AirSquats	10	2016-01-28	3	
762	AirSquats	50	2016-01-16	54	
763	Planks	12	2016-01-16	54	
764	Miles	1	2016-01-16	54	
765	AirSquats	36	2016-01-28	7	
766	PushUps	24	2016-01-28	7	
767	Planks	12	2016-01-28	7	
768	Miles	3	2016-01-28	7	
769	Miles	0.35	2016-01-29	34	
770	AirSquats	36	2016-01-29	7	
771	PushUps	24	2016-01-29	7	
772	Planks	12	2016-01-29	7	
773	AirSquats	40	2016-01-29	30	on the road
774	PushUps	20	2016-01-29	30	on the road
775	Planks	8	2016-01-29	30	on the road
776	Miles	1.5	2016-01-24	12	
777	Miles	2	2016-01-26	12	
778	AirSquats	74	2016-01-28	12	
779	Planks	7	2016-01-28	12	
780	Miles	5.45	2016-01-29	13	
781	Planks	20	2016-01-29	13	
782	AirSquats	25	2016-01-29	13	
783	AirSquats	25	2016-01-29	13	
784	AirSquats	100	2016-01-29	14	Toothbrush Squats
785	Miles	0.6	2016-01-29	3	
786	AirSquats	30	2016-01-29	18	
787	PushUps	40	2016-01-29	18	
788	Planks	13	2016-01-29	18	
789	Miles	2.3	2016-01-29	18	
790	Miles	2.5	2016-01-27	24	
791	AirSquats	30	2016-01-29	3	
792	PushUps	20	2016-01-29	3	
793	Planks	12	2016-01-29	3	
794	Planks	12	2016-01-29	3	
795	Miles	3.5	2016-01-29	26	
796	PushUps	25	2016-01-29	13	
797	PushUps	50	2016-01-29	13	
798	Miles	1	2016-01-30	37	
799	Miles	3	2016-01-30	7	
800	Miles	2.62	2016-01-29	53	
801	AirSquats	50	2016-01-29	53	
802	AirSquats	30	2016-01-29	53	
803	PushUps	30	2016-01-29	53	
804	Planks	12	2016-01-29	53	
805	Miles	2.42	2016-01-30	53	
806	AirSquats	20	2016-01-30	53	50-30 erroneously recorded the day before
807	PushUps	30	2016-01-30	53	
808	AirSquats	12	2016-01-30	53	
809	AirSquats	35	2016-01-30	3	
810	PushUps	35	2016-01-30	3	
811	Miles	0.6	2016-01-30	3	
812	AirSquats	35	2016-01-30	26	Burpees
813	PushUps	35	2016-01-30	26	Burpees
814	Miles	0.6	2016-01-30	26	
815	AirSquats	100	2016-01-29	25	
816	PushUps	100	2016-01-29	25	
817	Planks	24	2016-01-29	25	
818	Miles	4	2016-01-30	25	
819	AirSquats	4	2016-01-29	25	
820	Miles	2	2016-01-30	34	Ultimate 
821	AirSquats	300	2016-01-30	25	
822	PushUps	170	2016-01-30	25	
823	Planks	24	2016-01-30	25	
824	Planks	31	2016-01-30	34	
825	AirSquats	25	2016-01-30	9	
826	AirSquats	100	2016-01-30	13	
827	PushUps	110	2016-01-30	13	
828	Planks	15	2016-01-30	13	
829	AirSquats	100	2016-01-30	25	
830	PushUps	90	2016-01-30	25	
831	PushUps	60	2016-01-28	46	
832	Planks	7	2016-01-28	46	
833	AirSquats	40	2016-01-28	46	
834	Miles	2.3	2016-01-30	46	23 miles biked
835	AirSquats	100	2016-01-30	25	
836	PushUps	40	2016-01-30	25	
837	AirSquats	10	2016-01-30	34	
838	Miles	0.8	2016-01-30	26	
839	Planks	26	2016-01-30	25	
840	Miles	1	2016-01-30	25	
841	PushUps	50	2016-01-30	25	
842	PushUps	4	2016-01-30	54	
843	PushUps	50	2016-01-30	25	
844	AirSquats	50	2016-01-30	18	
845	PushUps	60	2016-01-30	18	
846	Planks	10	2016-01-30	18	
847	Miles	0.8	2016-01-30	3	
848	PushUps	50	2016-01-30	25	
849	Miles	4	2016-01-29	24	
850	AirSquats	50	2016-01-30	25	
851	PushUps	50	2016-01-30	25	
852	Planks	6	2016-01-29	44	
853	Miles	1	2016-01-29	49	
854	Miles	2	2016-01-30	49	
855	Miles	2	2016-01-31	49	
856	PushUps	90	2016-01-31	49	
857	AirSquats	170	2016-01-31	49	
858	AirSquats	180	2016-01-31	34	
859	PushUps	80	2016-01-31	34	
860	Miles	1.75	2016-01-31	34	
861	Miles	4	2016-01-31	26	
862	Miles	0.5	2016-01-31	8	
863	Miles	1	2016-01-30	8	
864	Miles	2	2016-01-31	53	
865	AirSquats	50	2016-01-31	53	
866	PushUps	30	2016-01-31	53	
867	Planks	12	2016-01-31	53	
868	Miles	3	2016-01-31	37	
869	Miles	2	2016-01-31	45	
870	AirSquats	30	2016-01-30	45	
871	PushUps	20	2016-01-29	45	
872	AirSquats	30	2016-01-29	45	
873	Planks	5	2016-01-28	45	
874	Miles	3	2016-01-29	17	
875	Miles	1	2016-01-31	17	
876	AirSquats	100	2016-01-31	17	
877	PushUps	40	2016-01-31	17	
878	PushUps	20	2016-01-29	17	
879	AirSquats	100	2016-01-31	14	Toothbrush Squats
880	AirSquats	100	2016-01-31	18	
881	PushUps	100	2016-01-31	18	
882	Planks	53	2016-01-31	18	
883	Miles	5.3	2016-01-31	18	
884	AirSquats	100	2016-01-31	52	
885	PushUps	50	2016-01-31	52	
886	Planks	30	2016-01-31	52	
887	AirSquats	150	2016-01-31	13	
888	PushUps	125	2016-01-31	13	
889	Planks	30	2016-01-31	13	
890	Planks	30	2016-01-31	13	
891	Planks	17	2016-01-31	37	
892	AirSquats	100	2016-01-31	46	
893	PushUps	50	2016-01-31	46	
894	Planks	30	2016-01-31	46	
895	Miles	3.86	2016-02-01	46	Erg 
896	AirSquats	75	2016-02-01	26	
897	PushUps	40	2016-02-01	26	
898	Planks	32	2016-02-01	26	
899	AirSquats	40	2016-02-01	30	@ C4 Crossfit- extra work
900	PushUps	30	2016-02-01	30	@ C4 Crossfit- extra work
901	Planks	8	2016-02-01	30	@ C4 Crossfit- extra work
902	PushUps	20	2016-01-31	3	
903	Miles	4	2016-01-31	3	
904	PushUps	20	2016-02-01	3	
905	AirSquats	105	2016-02-01	14	Toothbrush Squats
906	Planks	32	2016-02-01	26	
907	AirSquats	48	2016-02-01	7	
908	PushUps	32	2016-02-01	7	
909	Planks	16	2016-02-01	7	
910	AirSquats	120	2016-02-01	49	
911	Miles	1	2016-02-01	49	
912	PushUps	40	2016-02-01	49	
913	Miles	3	2016-02-01	7	
914	AirSquats	100	2016-02-01	49	
915	AirSquats	50	2016-02-01	49	
916	PushUps	50	2016-02-01	49	
917	Planks	50	2016-02-01	49	
918	Miles	4	2016-02-01	14	Walking around Vancouver
919	AirSquats	60	2016-02-01	46	
920	Planks	12	2016-02-01	46	
921	Miles	7	2016-02-01	13	
922	AirSquats	10	2016-02-01	13	
923	AirSquats	100	2016-01-31	25	
924	PushUps	100	2016-01-31	25	
925	Planks	20	2016-01-31	25	
926	Miles	2	2016-01-31	25	
927	AirSquats	100	2016-02-01	25	
928	PushUps	60	2016-02-01	25	
929	Planks	12	2016-02-01	25	
930	Miles	4	2016-02-01	25	
931	AirSquats	50	2016-02-01	53	
932	PushUps	50	2016-02-01	53	
933	Planks	13	2016-02-01	53	
934	PushUps	40	2016-02-01	52	
935	Planks	24	2016-02-01	52	
936	Miles	3	2016-02-01	52	
937	AirSquats	70	2016-02-01	18	
938	PushUps	30	2016-02-01	18	
939	Planks	20	2016-02-01	18	
940	Miles	3.5	2016-02-01	18	
941	AirSquats	25	2016-02-01	11	
942	AirSquats	50	2016-01-27	11	
943	Miles	2	2016-01-29	11	
944	Miles	2	2016-01-30	11	
945	AirSquats	10	2016-02-01	3	
946	Miles	1.4	2016-02-01	3	
947	Planks	10	2016-02-01	3	
948	PushUps	22	2016-02-01	3	
949	Planks	20	2016-02-01	3	
950	AirSquats	50	2016-02-01	26	
951	PushUps	25	2016-02-01	26	
952	AirSquats	50	2016-02-01	3	
953	AirSquats	50	2016-02-01	26	
954	PushUps	25	2016-02-01	26	
955	Planks	10	2016-02-01	3	
956	PushUps	22	2016-02-01	3	
957	Miles	4	2016-02-01	9	
958	AirSquats	35	2016-02-02	3	
959	Planks	20	2016-02-02	3	
960	Miles	1.6	2016-02-02	3	
961	AirSquats	30	2016-02-02	49	
962	PushUps	50	2016-02-02	49	
963	Miles	1	2016-02-02	49	
964	Planks	50	2016-02-02	49	
965	AirSquats	48	2016-02-02	7	
966	PushUps	32	2016-02-02	7	
967	AirSquats	16	2016-02-02	7	
968	AirSquats	50	2016-02-02	13	
969	Miles	2.5	2016-02-02	13	
970	Miles	3	2016-01-31	54	
971	PushUps	4	2016-01-30	54	
972	PushUps	6	2016-02-02	54	
973	AirSquats	50	2016-02-02	30	@ Home
974	PushUps	70	2016-02-02	30	@ Home
975	Planks	10	2016-02-02	30	@ Home
976	Miles	1.75	2016-02-02	30	@ Home on rower
977	Miles	1.5	2016-02-02	9	
978	PushUps	25	2016-02-02	9	
979	Miles	3.31	2016-02-02	53	
980	AirSquats	50	2016-02-02	53	
981	AirSquats	50	2016-02-02	53	
982	PushUps	50	2016-02-02	53	
983	Planks	14	2016-02-02	53	
984	Miles	2.5	2016-02-02	49	
985	Miles	0.6	2016-02-02	3	
986	AirSquats	15	2016-02-02	3	
987	Miles	1	2016-02-02	34	
988	AirSquats	30	2016-02-02	26	Weighted
989	Miles	0.6	2016-02-02	26	
990	AirSquats	170	2016-02-02	18	
991	PushUps	10	2016-02-02	18	
992	Planks	20	2016-02-02	18	
993	Miles	2.3	2016-02-02	18	
994	Miles	2	2016-02-01	17	
995	Miles	2	2016-02-02	17	
996	Planks	25	2016-02-02	17	
997	Miles	2	2016-02-01	23	
998	Miles	2	2016-02-02	23	
999	Miles	1	2016-02-03	34	
1000	AirSquats	120	2016-02-02	14	Toothbrush Squats
1001	AirSquats	105	2016-02-03	14	Toothbrush Squats
1002	Miles	0.5	2016-02-03	30	@ C4 Crossfit
1003	AirSquats	130	2016-02-03	30	@ C4 Crossfit
1004	PushUps	120	2016-02-03	30	@ C4 Crossfit
1005	Planks	15	2016-02-03	30	@ C4 Crossfit
1006	PushUps	24	2016-02-02	37	
1007	Planks	12	2016-02-02	37	
1008	Miles	3	2016-02-03	37	
1009	AirSquats	48	2016-02-03	7	
1010	PushUps	32	2016-02-03	7	
1011	Planks	16	2016-02-03	7	
1012	Miles	3	2016-02-03	7	
1013	AirSquats	50	2016-02-03	18	
1014	PushUps	10	2016-02-03	18	
1015	Planks	6	2016-02-03	18	
1016	Miles	2.2	2016-02-03	18	
1017	PushUps	50	2016-02-03	17	
1018	Miles	1	2016-02-03	17	
1019	AirSquats	20	2016-02-02	25	
1020	PushUps	20	2016-02-02	25	
1021	Planks	6	2016-02-02	25	
1022	Miles	4	2016-02-02	25	
1023	AirSquats	50	2016-02-03	25	
1024	PushUps	20	2016-02-03	25	
1025	Planks	6	2016-02-03	25	
1026	Miles	7	2016-02-03	25	
1027	Miles	2.7	2016-02-03	53	
1028	AirSquats	10	2016-02-03	53	60-50 erroneously recorded on 2/2
1029	PushUps	50	2016-02-03	53	
1030	Planks	12	2016-02-03	53	Originally recorded as squats on 1/30
1031	AirSquats	14	2016-02-03	53	
1032	Planks	14	2016-02-03	53	
1033	AirSquats	20	2016-02-03	46	
1034	Miles	5.71	2016-02-04	46	Erg
1035	Planks	20	2016-02-04	46	
1036	AirSquats	2	2016-02-03	3	
1037	Miles	2	2016-02-03	3	
1038	AirSquats	120	2016-02-04	14	Toothbrush Squats
1039	Miles	1	2016-02-03	14	Work walk
1040	Miles	1	2016-02-04	26	
1041	Miles	3.4	2016-02-04	13	
1042	AirSquats	150	2016-02-04	34	
1043	PushUps	110	2016-02-04	34	
1044	Planks	55	2016-02-04	34	
1045	AirSquats	10	2016-02-04	34	
1046	AirSquats	100	2016-02-04	46	
1047	Miles	3	2016-01-26	15	
1048	Miles	5.4	2016-01-27	15	
1049	Miles	3	2016-01-29	15	Cascades tryouts, 3 hours
1050	Miles	4	2016-01-30	15	Cascades tryouts, 4 hours
1051	Miles	5	2016-02-04	15	
1052	AirSquats	30	2016-02-03	15	woo
1053	AirSquats	24	2016-02-04	3	
1054	Miles	2.6	2016-02-04	3	
1055	AirSquats	200	2016-02-03	49	
1056	Miles	0.5	2016-02-04	49	
1057	AirSquats	150	2016-02-04	49	
1058	PushUps	100	2016-02-04	49	
1059	Miles	5	2016-02-04	49	
1060	Planks	50	2016-02-04	49	
1061	Miles	0.75	2016-02-04	26	Row
1062	Miles	0.6	2016-02-04	26	
1063	AirSquats	20	2016-02-04	26	Weighted
1064	PushUps	20	2016-02-04	26	Bench press
1065	PushUps	25	2016-02-04	3	
1066	AirSquats	25	2016-02-04	18	
1067	PushUps	50	2016-02-04	18	
1068	Planks	51	2016-02-04	18	
1069	Miles	2.3	2016-02-04	18	
1070	AirSquats	24	2016-02-04	53	50 - 26 erroneously reported earlier
1071	PushUps	50	2016-02-04	53	
1072	AirSquats	50	2016-02-04	13	
1073	PushUps	50	2016-02-04	13	
1074	Miles	2.9	2016-02-04	14	Work walk plus fitness tracking.
1075	Miles	2	2016-02-04	17	
1076	Planks	20	2016-02-04	13	
1077	Miles	1.5	2016-02-02	12	
1078	PushUps	50	2016-02-05	12	
1079	AirSquats	12	2016-02-04	12	
1080	Miles	1.5	2016-02-04	12	
1081	Miles	6.5	2016-02-05	4	
1082	PushUps	25	2016-02-04	9	
1083	Miles	1	2016-02-03	9	
1084	Miles	2.5	2016-02-04	30	@ Home on rower
1085	AirSquats	40	2016-02-04	30	@ Home
1086	AirSquats	50	2016-02-04	25	
1087	PushUps	60	2016-02-04	25	
1088	Planks	24	2016-02-04	25	
1089	Miles	6.5	2016-02-04	25	
1090	AirSquats	115	2016-02-05	14	Toothbrush Squats
1091	PushUps	40	2016-02-05	14	Morning warm up
1092	AirSquats	48	2016-02-05	7	
1093	PushUps	32	2016-02-05	7	
1094	Planks	16	2016-02-05	7	
1095	Planks	32	2016-02-05	26	
1096	Miles	3	2016-01-30	24	
1097	AirSquats	10	2016-02-05	13	
1098	Miles	5.7	2016-02-05	13	
1099	Miles	2.29	2016-02-05	53	
1100	AirSquats	50	2016-02-05	53	
1101	PushUps	50	2016-02-05	53	
1102	Planks	14	2016-02-05	53	
1103	Miles	1.5	2016-02-05	30	@ C4 Crossfit- extra work
1104	AirSquats	50	2016-02-05	30	@ Home
1105	PushUps	30	2016-02-05	30	@ Home
1106	Planks	12	2016-02-05	30	@ Home
1107	AirSquats	50	2016-02-05	25	
1108	AirSquats	60	2016-02-05	25	
1109	PushUps	60	2016-02-05	25	
1110	Planks	12	2016-02-05	25	
1111	Miles	8	2016-02-05	25	
1112	AirSquats	30	2016-02-05	18	
1113	PushUps	20	2016-02-05	18	
1114	Miles	2.4	2016-02-05	18	
1115	Miles	1	2016-02-05	26	
1116	PushUps	60	2016-02-05	46	
1117	Miles	5.45	2016-02-06	46	Erg
1118	Miles	3	2016-02-05	7	
1119	AirSquats	100	2016-02-06	14	Toothbrush Squats
1120	PushUps	15	2016-02-06	14	1 arm
1121	Miles	2	2016-02-06	26	
1122	PushUps	30	2016-02-06	26	
1123	Planks	16	2016-02-06	26	
1124	Miles	1.2	2016-02-05	3	
1125	PushUps	75	2016-02-06	3	
1126	Planks	16	2016-02-06	3	
1127	Miles	2	2016-02-06	3	
1128	Planks	10	2016-02-06	3	
1129	Planks	10	2016-02-06	3	
1130	AirSquats	125	2016-02-06	3	
1131	PushUps	20	2016-02-06	3	
1132	PushUps	40	2016-02-06	3	
1133	AirSquats	30	2016-02-06	3	
1134	Planks	10	2016-02-06	3	
1135	Planks	150	2016-02-06	13	
1136	AirSquats	45	2016-02-06	13	
1137	AirSquats	45	2016-02-06	13	
1138	AirSquats	45	2016-02-06	13	
1139	Planks	20	2016-02-06	46	
1140	PushUps	75	2016-02-06	46	
1141	Miles	3	2016-02-05	17	
1142	Miles	1.5	2016-02-04	23	
1143	Miles	1	2016-02-05	23	
1144	Miles	1	2016-02-06	23	
1145	AirSquats	25	2016-02-06	54	
1146	PushUps	10	2016-02-06	54	
1147	Miles	1	2016-02-06	54	
1148	Planks	12	2016-02-06	54	
1149	AirSquats	100	2016-02-06	25	
1150	PushUps	70	2016-02-06	25	
1151	Planks	24	2016-02-06	25	
1152	Miles	1	2016-02-06	25	
1153	Miles	1.8	2016-02-06	26	
1154	AirSquats	20	2016-02-06	18	
1155	PushUps	35	2016-02-06	18	
1156	Planks	12	2016-02-06	18	
1157	AirSquats	25	2016-02-06	23	
1158	PushUps	10	2016-02-06	23	
1159	Planks	13	2016-02-06	23	
1160	PushUps	85	2016-02-06	13	
1161	PushUps	25	2016-02-07	13	
1162	Miles	1.8	2016-02-06	3	
1163	AirSquats	50	2016-02-05	24	
1164	AirSquats	205	2016-02-07	34	
1165	PushUps	119	2016-02-07	34	
1166	Planks	24	2016-02-07	34	
1167	AirSquats	205	2016-02-07	49	
1168	Planks	16	2016-02-07	49	
1169	PushUps	122	2016-02-07	49	
1170	AirSquats	50	2016-02-03	11	
1171	AirSquats	36	2016-02-06	11	
1172	Miles	2	2016-02-06	11	
1173	Miles	1	2016-02-05	11	
1174	Planks	10	2016-02-05	11	
1175	Miles	6.2	2016-02-07	9	
1176	Miles	1.5	2016-02-05	9	
1177	Miles	2	2016-02-07	53	
1178	AirSquats	50	2016-02-07	53	
1179	PushUps	50	2016-02-07	53	
1180	Planks	15	2016-02-07	53	
1181	Miles	4.7	2016-02-07	34	
1182	Miles	5.2	2016-02-07	49	
1183	AirSquats	20	2016-02-07	46	
1184	Planks	12	2016-02-07	46	
1185	AirSquats	100	2016-02-07	17	
1186	PushUps	40	2016-02-07	17	
1187	AirSquats	50	2016-02-07	13	
1188	PushUps	110	2016-02-07	13	
1189	AirSquats	20	2016-02-07	13	
1190	PushUps	20	2016-02-07	13	
1191	Miles	1	2016-02-07	3	
1192	PushUps	10	2016-02-07	18	
1193	Miles	1	2016-02-07	26	
1194	Planks	16	2016-02-08	26	
1195	AirSquats	50	2016-02-08	26	
1196	PushUps	25	2016-02-08	26	
1197	AirSquats	115	2016-02-07	14	Toothbrush Squats
1198	PushUps	40	2016-02-07	14	Warm up
1199	AirSquats	60	2016-02-08	30	@ C4 Crossfit- extra work
1200	PushUps	50	2016-02-08	30	@ C4 Crossfit- extra work
1201	Planks	20	2016-02-08	30	@ C4 Crossfit- extra work
1202	Miles	2.5	2016-02-08	30	@ Home on rower
1203	AirSquats	100	2016-02-07	25	
1204	PushUps	70	2016-02-07	25	
1205	Planks	24	2016-02-07	25	
1206	Miles	1	2016-02-07	25	
1207	AirSquats	48	2016-02-08	7	
1208	PushUps	32	2016-02-08	7	
1209	Planks	16	2016-02-08	7	
1210	AirSquats	50	2016-02-08	26	
1211	PushUps	25	2016-02-08	26	
1212	Planks	16	2016-02-08	26	
1213	AirSquats	115	2016-02-08	14	Toothbrush Squats
1214	Miles	1.9	2016-02-08	34	
1215	AirSquats	40	2016-02-08	46	
1216	PushUps	100	2016-02-08	46	
1217	Planks	28	2016-02-08	46	
1218	Miles	1.5	2016-02-08	9	
1219	Miles	2.41	2016-02-08	53	
1220	AirSquats	50	2016-02-08	25	
1221	PushUps	50	2016-02-08	25	
1222	Planks	12	2016-02-08	25	
1223	Miles	6	2016-02-08	25	
1224	AirSquats	60	2016-02-08	53	
1225	PushUps	60	2016-02-08	53	
1226	Planks	18	2016-02-08	53	
1227	AirSquats	40	2016-02-08	49	
1228	PushUps	50	2016-02-08	49	
1229	Miles	5	2016-02-08	49	
1230	Miles	2.3	2016-02-08	18	
1231	AirSquats	20	2016-02-08	18	
1232	PushUps	20	2016-02-08	18	
1233	Planks	7	2016-02-08	18	
1234	Miles	6.1	2016-02-05	15	
1235	Miles	5	2016-02-08	15	
1236	Miles	2	2016-02-06	15	winter league
1237	Miles	2	2016-02-07	15	2.5 hours of goalty
1238	Planks	12	2016-02-08	15	
1239	Miles	2.3	2016-02-08	52	
1240	AirSquats	30	2016-02-04	52	
1241	PushUps	20	2016-02-04	52	
1242	Miles	1	2016-02-08	52	
1243	Miles	2	2016-02-08	23	
1244	AirSquats	200	2016-02-08	13	
1245	PushUps	100	2016-02-08	13	
1246	Planks	50	2016-02-08	13	
1247	Miles	4.57	2016-02-09	46	Erg
1248	Miles	1.9	2016-02-08	3	
1249	Miles	7.4	2016-02-09	13	
1250	Miles	5	2016-02-09	49	
1251	AirSquats	230	2016-02-09	49	
1252	PushUps	180	2016-02-09	49	
1253	Planks	50	2016-02-09	49	
1254	Miles	3.5	2016-02-08	4	
1255	AirSquats	100	2016-02-09	4	
1256	PushUps	30	2016-02-09	4	
1257	Planks	20	2016-02-09	4	
1258	Miles	0.8	2016-02-09	26	
1259	Miles	1	2016-02-09	53	Bike to work
1260	AirSquats	60	2016-02-09	53	
1261	PushUps	60	2016-02-09	53	
1262	Planks	21	2016-02-09	53	
1263	Miles	1	2016-02-09	26	
1264	Miles	2	2016-02-08	17	
1265	PushUps	30	2016-02-09	17	
1266	Planks	30	2016-02-09	17	
1267	Miles	3	2016-02-09	17	
1268	Miles	1	2016-02-09	26	
1269	AirSquats	40	2016-02-09	18	
1270	PushUps	15	2016-02-09	18	
1271	Planks	10	2016-02-09	18	
1272	Miles	3	2016-02-09	18	
1273	Miles	0.2	2016-02-09	18	
1274	AirSquats	16	2016-02-09	37	
1275	PushUps	22	2016-02-09	37	
1276	Planks	18	2016-02-09	37	
1277	Miles	3	2016-02-10	37	
1278	AirSquats	240	2016-02-09	34	
1279	PushUps	180	2016-02-09	34	
1280	Miles	0.5	2016-02-09	34	
1281	AirSquats	100	2016-02-09	14	Toothbrush Squats
1282	Miles	1.9	2016-02-08	14	Work walk 
1283	Miles	1.1	2016-02-09	14	Pho walk
1284	Planks	12	2016-02-09	12	
1285	Miles	1	2016-02-07	12	
1286	Miles	2	2016-02-09	9	
1287	AirSquats	70	2016-02-09	46	
1288	AirSquats	50	2016-02-10	25	
1289	PushUps	60	2016-02-10	25	
1290	Planks	12	2016-02-10	25	
1291	Miles	5	2016-02-10	25	
1292	AirSquats	50	2016-02-09	25	
1293	PushUps	60	2016-02-09	25	
1294	Planks	12	2016-02-09	25	
1295	Miles	6	2016-02-09	25	
1296	Miles	1	2016-02-09	54	
1297	AirSquats	30	2016-02-10	54	
1298	Miles	2.25	2016-02-10	13	
1299	PushUps	15	2016-02-10	54	
1300	AirSquats	100	2016-02-11	44	
1301	PushUps	100	2016-02-11	44	
1302	Planks	9	2016-02-10	16	
1303	PushUps	5	2016-02-10	17	
1304	Planks	10	2016-02-10	17	
1305	Miles	1	2016-02-10	17	
1306	AirSquats	30	2016-02-10	18	
1307	PushUps	25	2016-02-10	18	
1308	Miles	1.2	2016-02-10	18	
1309	Miles	1	2016-02-10	53	Bike to work
1310	AirSquats	60	2016-02-10	53	
1311	PushUps	60	2016-02-10	53	
1312	Planks	15	2016-02-10	53	
1313	Miles	1.5	2016-02-10	23	
1314	AirSquats	82	2016-02-11	34	
1315	PushUps	10	2016-02-11	34	
1316	AirSquats	115	2016-02-10	14	Toothbrush Squats
1317	Miles	4	2016-02-10	14	Work walk round trip plus
1318	AirSquats	115	2016-02-11	14	Toothbrush Squats
1319	Miles	0.8	2016-02-10	26	
1320	Miles	1.2	2016-02-11	26	
1321	Planks	32	2016-02-11	26	
1322	AirSquats	100	2016-02-11	25	
1323	PushUps	60	2016-02-11	25	
1324	Planks	12	2016-02-11	25	
1325	PushUps	1	2016-02-11	25	
1326	Miles	6.75	2016-02-11	4	
1327	AirSquats	30	2016-02-11	26	Weighted
1328	AirSquats	40	2016-02-11	26	Wall balls
1329	AirSquats	17	2016-02-11	26	Bench press
1330	Miles	1	2016-02-11	26	Row
1331	PushUps	17	2016-02-11	26	Bench press
1332	Miles	0.5	2016-02-11	26	
1333	AirSquats	60	2016-02-11	24	
1334	PushUps	35	2016-02-11	24	
1335	Miles	1	2016-02-11	23	
1336	AirSquats	25	2016-02-11	18	
1337	PushUps	50	2016-02-11	18	
1338	Planks	53	2016-02-11	18	
1339	AirSquats	60	2016-02-11	52	
1340	PushUps	40	2016-02-11	52	
1341	Planks	24	2016-02-11	52	
1342	Miles	3	2016-02-11	52	
1343	AirSquats	20	2016-02-10	52	
1344	PushUps	30	2016-02-10	52	
1345	Planks	18	2016-02-10	52	
1346	Miles	1	2016-02-10	52	
1347	Miles	2.3	2016-02-08	52	
1348	PushUps	10	2016-02-11	54	
1349	AirSquats	50	2016-02-11	54	
1350	Planks	13	2016-02-11	54	
1351	AirSquats	150	2016-02-11	13	
1352	PushUps	150	2016-02-11	13	
1353	Miles	2.5	2016-02-11	30	@ C4 Crossfit- extra work
1354	AirSquats	25	2016-02-11	30	@ C4 Crossfit- extra work
1355	PushUps	25	2016-02-11	30	@ C4 Crossfit- extra work
1356	Planks	10	2016-02-11	30	@ C4 Crossfit- extra work
1357	Miles	2.8	2016-02-12	14	Work walk tracked
1358	Miles	1.5	2016-02-09	3	
1359	Miles	2.2	2016-02-10	3	
1360	Miles	1.2	2016-02-11	3	
1361	AirSquats	30	2016-02-11	49	
1362	AirSquats	60	2016-02-11	49	
1363	Miles	1	2016-02-12	49	
1364	AirSquats	48	2016-02-12	7	
1365	PushUps	32	2016-02-12	7	
1366	Planks	16	2016-02-12	7	
1367	Miles	3	2016-02-12	7	
1368	PushUps	100	2016-02-12	13	
1369	AirSquats	300	2016-02-12	45	
1370	Planks	10	2016-02-12	45	
1371	PushUps	50	2016-02-12	45	
1372	AirSquats	50	2016-02-10	45	
1373	PushUps	20	2016-02-10	45	
1374	AirSquats	50	2016-02-09	45	
1375	AirSquats	50	2016-02-12	30	@ C4 Crossfit- extra work
1376	PushUps	50	2016-02-12	30	@ C4 Crossfit- extra work
1377	Planks	24	2016-02-12	30	@ C4 Crossfit- extra work
1378	Miles	3.5	2016-02-12	30	@ C4 Crossfit- sprints
1379	Miles	5	2016-02-11	25	
1380	AirSquats	100	2016-02-12	25	
1381	PushUps	30	2016-02-12	25	
1382	Planks	12	2016-02-12	25	
1383	Miles	2	2016-02-12	25	
1384	PushUps	35	2016-02-12	18	
1385	Planks	21	2016-02-12	18	
1386	Miles	1.3	2016-02-12	18	
1387	AirSquats	100	2016-02-12	25	
1388	Planks	12	2016-02-12	25	
1389	Planks	12	2016-02-12	25	
1390	Miles	2	2016-02-12	3	
1391	Miles	5	2016-02-13	46	Erg
1392	Miles	4.6	2016-02-13	49	
1393	Planks	80	2016-02-13	34	
1394	PushUps	140	2016-02-13	34	
1395	AirSquats	195	2016-02-13	34	
1396	Miles	1	2016-02-13	34	
1397	AirSquats	180	2016-02-13	49	
1398	PushUps	120	2016-02-13	49	
1399	Planks	60	2016-02-13	49	
1400	Miles	2.5	2016-02-13	49	
1401	Miles	1	2016-02-11	17	
1402	Miles	2	2016-02-12	17	
1403	PushUps	20	2016-02-12	17	
1404	AirSquats	20	2016-02-12	17	
1405	Miles	3	2016-02-12	26	
1406	AirSquats	80	2016-02-13	26	Wall balls
1407	AirSquats	44	2016-02-13	26	Burpees
1408	PushUps	44	2016-02-13	26	Burpees
1409	Miles	0.5	2016-02-13	26	
1410	AirSquats	41	2016-02-11	12	
1411	Planks	6	2016-02-11	12	
1412	AirSquats	48	2016-02-13	7	
1413	PushUps	32	2016-02-13	7	
1414	AirSquats	20	2016-02-13	46	
1415	PushUps	50	2016-02-13	46	
1416	Planks	20	2016-02-13	46	
1417	Miles	3	2016-02-13	24	
1418	Miles	12.65	2016-02-13	13	
1419	Miles	1	2016-02-13	3	
1420	AirSquats	50	2016-02-13	13	
1421	PushUps	50	2016-02-13	13	
1422	AirSquats	40	2016-02-13	30	@ Westside CF 
1423	PushUps	40	2016-02-13	30	@ Westside CF 
1424	Planks	8	2016-02-13	30	@ Westside CF 
1425	Miles	2.5	2016-02-13	30	Hike w/ boys
1426	PushUps	15	2016-02-13	24	
1427	PushUps	15	2016-02-14	24	
1428	Planks	14	2016-02-14	24	
1429	Miles	6.2	2016-02-14	9	
1430	AirSquats	205	2016-02-14	34	
1431	PushUps	140	2016-02-14	34	
1432	Miles	0.8	2016-02-14	34	
1433	Planks	60	2016-02-14	34	
1434	AirSquats	25	2016-02-14	13	
1435	Miles	1	2016-02-14	49	
1436	AirSquats	205	2016-02-14	49	
1437	PushUps	136	2016-02-14	49	
1438	Planks	60	2016-02-14	49	
1439	AirSquats	25	2016-02-14	13	
1440	AirSquats	30	2016-02-13	54	
1441	PushUps	16	2016-02-13	54	
1442	Miles	1	2016-02-13	54	
1443	AirSquats	100	2016-02-14	14	Toothbrush Squats
1444	AirSquats	115	2016-02-13	14	Toothbrush Squats
1445	PushUps	80	2016-02-13	14	Football
1446	Miles	4	2016-02-14	45	
1447	Miles	3.2	2016-02-14	26	
1448	AirSquats	100	2016-02-13	25	
1449	PushUps	60	2016-02-13	25	
1450	Planks	24	2016-02-13	25	
1451	Miles	2	2016-02-13	25	
1452	AirSquats	100	2016-02-14	25	
1453	PushUps	50	2016-02-14	25	
1454	Planks	30	2016-02-14	25	
1455	Miles	2	2016-02-14	25	
1456	AirSquats	100	2016-02-14	13	
1457	PushUps	75	2016-02-14	13	
1458	Planks	10	2016-02-14	13	
1459	AirSquats	50	2016-02-14	13	
1460	PushUps	25	2016-02-14	13	
1461	Miles	5	2016-02-13	23	
1462	Miles	3	2016-02-14	23	
1463	Miles	3.36	2016-02-14	46	Erg
1464	Planks	15	2016-02-14	46	
1465	AirSquats	105	2016-02-15	14	Toothbrush Squats
1466	Miles	3.2	2016-02-14	3	
1467	PushUps	20	2016-02-14	15	
1468	Planks	8	2016-02-14	15	
1469	AirSquats	50	2016-02-15	25	
1470	PushUps	30	2016-02-15	25	
1471	Planks	6	2016-02-15	25	
1472	AirSquats	15	2016-02-14	3	
1473	PushUps	10	2016-02-14	3	
1474	Miles	1.6	2016-02-15	3	
1475	PushUps	50	2016-02-15	13	
1476	AirSquats	5	2016-02-15	13	
1477	AirSquats	100	2016-02-15	30	@ Home
1478	PushUps	80	2016-02-15	30	@ Home
1479	Planks	20	2016-02-15	30	@ Home
1480	AirSquats	60	2016-02-12	53	
1481	PushUps	60	2016-02-12	53	
1482	Planks	15	2016-02-12	53	
1483	AirSquats	60	2016-02-13	53	
1484	PushUps	0	2016-02-13	53	Hurt my R shoulder skiing
1485	Miles	1.25	2016-02-15	30	Running and rowing
1486	Planks	15	2016-02-13	53	
1487	Miles	2.48	2016-02-15	53	
1488	AirSquats	60	2016-02-15	53	
1489	Planks	15	2016-02-15	53	
1490	Miles	2	2016-02-10	15	Men's winter league
1491	Miles	2	2016-02-13	15	winter league
1492	Miles	4.7	2016-02-09	15	
1493	Miles	5.4	2016-02-12	15	
1494	Miles	4.7	2016-02-15	15	
1495	AirSquats	150	2016-02-15	25	
1496	PushUps	60	2016-02-15	25	
1497	Planks	30	2016-02-15	25	
1498	Miles	8	2016-02-15	25	
1499	AirSquats	30	2016-02-15	25	
1500	AirSquats	80	2016-02-14	17	
1501	Planks	20	2016-02-13	17	
1502	Miles	1	2016-02-14	17	
1503	Miles	1	2016-02-15	17	
1504	Planks	25	2016-02-15	17	
1505	AirSquats	30	2016-02-15	26	
1506	AirSquats	9	2016-02-15	26	
1507	PushUps	39	2016-02-15	26	
1508	Planks	16	2016-02-15	26	
1509	AirSquats	60	2016-02-15	3	
1510	Miles	0.6	2016-02-15	3	
1511	PushUps	40	2016-02-15	3	
1512	Planks	46	2016-02-15	3	
1513	Planks	6	2016-02-15	25	
1514	Planks	8	2016-02-15	25	
1515	AirSquats	50	2016-02-15	25	
1516	AirSquats	50	2016-02-15	25	
1517	AirSquats	40	2016-02-15	18	
1518	PushUps	30	2016-02-15	18	
1519	Planks	20	2016-02-15	18	
1520	AirSquats	20	2016-02-15	15	
1521	PushUps	30	2016-02-15	15	
1522	Planks	22	2016-02-15	15	
1523	AirSquats	150	2016-02-15	13	
1524	PushUps	75	2016-02-15	13	
1525	Planks	15	2016-02-15	13	
1526	AirSquats	100	2016-02-16	14	Toothbrush Squats
1527	Miles	3	2016-02-16	14	Work walk round trip
1528	AirSquats	100	2016-02-16	25	
1529	PushUps	20	2016-02-16	25	
1530	Planks	12	2016-02-16	25	
1531	Miles	1	2016-02-16	34	
1532	Miles	2.5	2016-02-16	3	
1533	AirSquats	40	2016-02-16	30	@ C4 Crossfit- extra work
1534	PushUps	50	2016-02-16	30	@ C4 Crossfit- extra work
1535	Planks	12	2016-02-16	30	@ C4 Crossfit- extra work
1536	Miles	1.25	2016-02-16	30	Sprints
1537	AirSquats	15	2016-02-16	24	
1538	AirSquats	100	2016-02-16	25	
1539	Miles	1	2016-02-14	12	
1540	AirSquats	30	2016-02-16	12	
1541	Miles	0.6	2016-02-16	34	
1542	AirSquats	140	2016-02-16	49	
1543	PushUps	100	2016-02-16	49	
1544	Miles	1	2016-02-16	49	
1545	Miles	4	2016-02-16	26	
1546	AirSquats	70	2016-02-16	46	
1547	PushUps	125	2016-02-16	46	
1548	Planks	15	2016-02-16	46	
1549	Planks	15	2016-02-15	11	
1550	Miles	2	2016-02-13	11	
1551	Miles	2	2016-02-12	11	
1552	AirSquats	18	2016-02-08	11	
1553	AirSquats	48	2016-02-16	7	
1554	PushUps	32	2016-02-16	7	
1555	Planks	16	2016-02-16	7	
1556	AirSquats	30	2016-02-16	11	
1557	AirSquats	30	2016-02-16	11	
1558	AirSquats	10	2016-02-16	11	
1559	AirSquats	2	2016-02-16	11	
1560	Miles	5	2016-02-16	15	
1561	Miles	7	2016-02-16	25	
1562	Planks	24	2016-02-16	25	
1563	Miles	2	2016-02-16	17	
1564	AirSquats	50	2016-02-16	17	
1565	PushUps	35	2016-02-16	17	
1566	Miles	6	2016-02-16	18	
1567	Miles	0.3	2016-02-16	18	
1568	Planks	20	2016-02-16	4	
1569	Miles	1.25	2016-02-16	4	
1570	AirSquats	100	2016-02-16	54	
1571	AirSquats	98	2016-02-16	37	
1572	PushUps	48	2016-02-16	37	
1573	Planks	30	2016-02-16	37	
1574	Miles	4	2016-02-16	37	
1575	Miles	3.84	2016-02-17	46	Erg
1576	AirSquats	48	2016-02-17	7	
1577	PushUps	32	2016-02-17	7	
1578	Planks	16	2016-02-17	7	
1579	Miles	3	2016-02-17	7	
1580	AirSquats	200	2016-02-16	13	
1581	PushUps	75	2016-02-16	13	
1582	AirSquats	15	2016-02-16	24	
1583	Planks	12	2016-02-17	25	
1584	AirSquats	100	2016-02-17	26	Wall balls
1585	Miles	0.5	2016-02-17	26	
1586	AirSquats	95	2016-02-17	34	
1587	PushUps	20	2016-02-17	34	
1588	Planks	6	2016-02-17	34	
1589	Miles	1	2016-02-17	34	
1590	Miles	1	2016-02-17	17	
1591	AirSquats	75	2016-02-17	13	
1592	PushUps	75	2016-02-17	13	
1593	Planks	15	2016-02-17	13	
1594	PushUps	30	2016-02-17	18	
1595	Planks	14	2016-02-17	18	
1596	Miles	1.7	2016-02-17	18	
1597	AirSquats	89	2016-02-17	11	
1598	Miles	1	2016-02-17	11	
1599	Miles	1.4	2016-02-17	3	
1600	Planks	16	2016-02-17	3	
1601	PushUps	40	2016-02-17	3	
1602	PushUps	15	2016-02-17	24	
1603	AirSquats	50	2016-02-17	25	
1604	PushUps	30	2016-02-17	25	
1605	Planks	30	2016-02-17	25	
1606	Miles	6	2016-02-17	25	
1607	Miles	1.3	2016-02-18	26	
1608	Miles	1	2016-02-18	3	
1609	PushUps	40	2016-02-18	3	
1610	AirSquats	115	2016-02-18	14	Toothbrush Squats
1611	AirSquats	105	2016-02-17	14	Toothbrush Squats
1612	Miles	3.2	2016-02-18	14	Work walk round trip
1613	Miles	4	2016-02-18	25	
1614	AirSquats	30	2016-02-18	34	
1615	PushUps	30	2016-02-18	34	
1616	Planks	20	2016-02-18	34	
1617	AirSquats	80	2016-02-17	49	
1618	Miles	1	2016-02-17	49	
1619	AirSquats	30	2016-02-18	49	
1620	PushUps	30	2016-02-18	49	
1621	Miles	3	2016-02-18	49	
1622	Miles	4.5	2016-02-18	26	
1623	AirSquats	26	2016-02-18	26	
1624	AirSquats	20	2016-02-18	8	
1625	PushUps	10	2016-02-18	8	
1626	Planks	5	2016-02-18	8	
1627	Miles	0.5	2016-02-18	8	
1628	Miles	1	2016-02-17	8	
1629	Miles	6.2	2016-02-07	8	
1630	AirSquats	70	2016-02-18	18	
1631	PushUps	40	2016-02-18	18	
1632	Planks	25	2016-02-18	18	
1633	Miles	2.4	2016-02-18	18	
1634	PushUps	15	2016-02-18	54	
1635	PushUps	30	2016-02-18	37	
1636	Planks	22	2016-02-18	37	
1637	Miles	1.51	2016-02-18	37	
1638	AirSquats	25	2016-02-18	54	
1639	Planks	8	2016-02-18	54	
1640	AirSquats	50	2016-02-18	13	
1641	Miles	3.95	2016-02-18	13	
1642	AirSquats	30	2016-02-18	54	
1643	Miles	0.6	2016-02-18	3	
1644	PushUps	75	2016-02-19	3	
1645	Planks	10	2016-02-19	3	
1646	AirSquats	50	2016-02-18	25	
1647	PushUps	30	2016-02-18	25	
1648	Planks	30	2016-02-18	25	
1649	Miles	2	2016-02-18	25	
1650	AirSquats	30	2016-02-18	46	
1651	Miles	0.44	2016-02-19	46	Biking
1652	Planks	20	2016-02-19	25	
1653	Miles	3.5	2016-02-19	25	
1654	AirSquats	48	2016-02-19	7	
1655	PushUps	32	2016-02-19	7	
1656	Planks	16	2016-02-19	7	
1657	PushUps	30	2016-02-19	3	
1658	Miles	1.25	2016-02-19	3	
1659	Miles	1	2016-02-19	34	
1660	AirSquats	20	2016-02-19	16	
1661	PushUps	20	2016-02-19	16	
1662	Planks	7	2016-02-19	16	
1663	Miles	1	2016-02-19	49	
1664	AirSquats	110	2016-02-19	49	
1665	PushUps	60	2016-02-19	49	
1666	Miles	1.3	2016-02-19	3	
1667	Miles	0.8	2016-02-19	26	
1668	PushUps	20	2016-02-19	3	
1669	Miles	4	2016-02-19	25	
1670	Planks	30	2016-02-19	25	
1671	AirSquats	50	2016-02-19	25	
1672	PushUps	30	2016-02-19	25	
1673	PushUps	15	2016-02-19	18	
1674	Miles	1.2	2016-02-19	18	
1675	AirSquats	48	2016-02-20	7	
1676	PushUps	32	2016-02-20	7	
1677	Planks	16	2016-02-20	7	
1678	Miles	2.5	2016-02-20	7	
1679	AirSquats	100	2016-02-20	3	
1680	PushUps	50	2016-02-20	3	
1681	Miles	2.65	2016-02-20	46	26.5 miles biking
1682	Miles	2	2016-02-20	25	
1683	Planks	30	2016-02-20	25	
1684	AirSquats	50	2016-02-20	26	Ball slams
1685	Miles	1	2016-02-20	26	
1686	Miles	2	2016-02-20	3	
1687	Miles	3	2016-02-20	16	
1688	Miles	5	2016-02-20	34	
1689	AirSquats	50	2016-02-17	30	@ C4 Crossfit- extra work
1690	Miles	1	2016-02-17	30	@ C4 Crossfit- extra work
1691	AirSquats	150	2016-02-20	30	@ Home
1692	PushUps	100	2016-02-20	30	@ Home
1693	Planks	32	2016-02-20	30	@ Home
1694	Miles	1.25	2016-02-20	30	@ Home on rower
1695	Planks	21	2016-02-20	3	
1696	Miles	2	2016-02-17	15	men's winter league
1697	Planks	10	2016-02-20	46	
1698	PushUps	40	2016-02-20	46	
1699	AirSquats	25	2016-02-20	46	
1700	PushUps	30	2016-02-20	25	
1701	AirSquats	50	2016-02-20	25	
1702	Planks	30	2016-02-20	25	
1703	Miles	2.6	2016-02-20	8	
1704	AirSquats	16	2016-02-21	8	
1705	PushUps	11	2016-02-21	8	
1706	Planks	2	2016-02-21	8	
1707	Miles	7	2016-02-20	49	
1708	AirSquats	25	2016-02-20	13	
1709	AirSquats	50	2016-02-20	18	
1710	PushUps	30	2016-02-20	18	
1711	Planks	26	2016-02-20	18	
1712	Miles	1.5	2016-02-20	18	
1713	Miles	4.04	2016-02-21	46	Erg
1714	AirSquats	48	2016-02-21	7	
1715	PushUps	32	2016-02-21	7	
1716	Planks	16	2016-02-21	7	
1717	AirSquats	25	2016-02-21	26	
1718	PushUps	40	2016-02-21	26	
1719	Planks	16	2016-02-21	26	
1720	AirSquats	70	2016-02-21	34	
1721	PushUps	63	2016-02-21	34	
1722	Miles	1	2016-02-21	34	
1723	Miles	10	2016-02-20	4	
1724	Miles	1	2016-02-18	17	
1725	AirSquats	50	2016-02-19	17	
1726	PushUps	20	2016-02-19	17	
1727	Planks	20	2016-02-19	17	
1728	Miles	3	2016-02-21	17	
1729	Miles	1	2016-02-21	49	
1730	PushUps	80	2016-02-21	49	
1731	PushUps	40	2016-02-21	26	
1732	Planks	16	2016-02-21	26	
1733	Planks	16	2016-02-21	3	
1734	AirSquats	90	2016-02-21	46	
1735	PushUps	100	2016-02-21	46	
1736	Planks	40	2016-02-21	46	
1737	Miles	2	2016-02-21	13	
1738	Miles	4.1	2016-02-21	26	
1739	AirSquats	50	2016-02-21	25	
1740	PushUps	30	2016-02-21	25	
1741	Planks	80	2016-02-21	25	
1742	Miles	3	2016-02-21	25	
1743	AirSquats	15	2016-02-18	24	
1744	PushUps	25	2016-02-21	24	
1745	Miles	3	2016-02-21	24	
1746	Miles	5	2016-02-21	8	
1747	Miles	1.6	2016-02-20	9	
1748	Miles	5	2016-02-21	9	
1749	PushUps	25	2016-02-21	18	
1750	Planks	18	2016-02-21	18	
1751	Miles	2.1	2016-02-21	18	
1752	Miles	4.1	2016-02-21	3	
1753	AirSquats	48	2016-02-22	7	
1754	PushUps	32	2016-02-22	7	
1755	Planks	16	2016-02-22	7	
1756	PushUps	20	2016-02-22	25	
1757	Planks	12	2016-02-22	25	
1758	PushUps	10	2016-02-21	11	
1759	Miles	2	2016-02-21	11	
1760	Miles	2	2016-02-19	11	
1761	Miles	2	2016-02-20	11	
1762	AirSquats	105	2016-02-22	14	Toothbrush Squats
1763	Miles	6.4	2016-02-22	9	
1764	AirSquats	30	2016-02-22	9	
1765	Planks	3	2016-02-22	9	
1766	AirSquats	50	2016-02-22	8	
1767	PushUps	2	2016-02-22	8	
1768	Planks	10	2016-02-22	8	
1769	Miles	3	2016-02-22	7	
1770	Miles	2.37	2016-02-22	53	
1771	AirSquats	60	2016-02-22	53	
1772	Planks	15	2016-02-22	53	
1773	Miles	5	2016-02-22	25	
1774	Planks	40	2016-02-22	25	
1775	AirSquats	50	2016-02-22	25	
1776	AirSquats	30	2016-02-22	26	weighted
1777	PushUps	15	2016-02-22	26	Bench press
1778	PushUps	3	2016-02-22	26	Bench press
1779	Miles	0.8	2016-02-22	26	
1780	Miles	3.7	2016-02-22	18	
1781	AirSquats	30	2016-02-22	3	
1782	PushUps	20	2016-02-22	3	
1783	Miles	1.2	2016-02-22	3	
1784	PushUps	10	2016-02-22	3	
1785	Planks	26	2016-02-22	3	
1786	AirSquats	100	2016-02-22	15	
1787	PushUps	100	2016-02-22	15	
1788	Miles	4	2016-02-21	15	MLU tryouts, 4 hours
1789	AirSquats	68	2016-02-22	37	
1790	PushUps	30	2016-02-22	37	
1791	Planks	18	2016-02-22	37	
1792	Miles	1.65	2016-02-22	37	
1793	Miles	4.34	2016-02-23	46	Erg
1794	PushUps	40	2016-02-22	17	
1795	Planks	20	2016-02-22	17	
1796	AirSquats	50	2016-02-23	25	
1797	PushUps	30	2016-02-23	25	
1798	Planks	12	2016-02-23	25	
1799	AirSquats	48	2016-02-23	7	
1800	PushUps	32	2016-02-23	7	
1801	Planks	16	2016-02-23	7	
1802	AirSquats	10	2016-02-22	11	
1803	PushUps	10	2016-02-22	11	
1804	Planks	20	2016-02-22	11	
1805	Miles	1.8	2016-02-23	26	
1806	Planks	12	2016-02-23	25	
1807	Miles	2.2	2016-02-23	34	
1808	Miles	1	2016-02-23	53	Biked to work
1809	AirSquats	60	2016-02-23	53	
1810	Planks	15	2016-02-23	53	
1811	Planks	15	2016-02-23	46	
1812	Miles	6	2016-02-23	25	
1813	Miles	1.2	2016-02-23	18	
1814	Planks	30	2016-02-23	25	
1815	AirSquats	280	2016-02-23	18	
1816	Planks	15	2016-02-23	25	
1817	PushUps	20	2016-02-23	18	
1818	Miles	3	2016-02-23	17	
1819	Miles	4.6	2016-02-23	13	
1820	AirSquats	10	2016-02-23	13	
1821	Planks	12	2016-02-23	37	
1822	Miles	2	2016-02-23	37	
1823	Miles	2.77	2016-02-24	46	Erg
1824	Miles	1.25	2016-02-22	30	@ C4 Crossfit- extra work
1825	AirSquats	50	2016-02-22	30	@ C4 Crossfit
1826	PushUps	20	2016-02-23	3	
1827	Miles	2.2	2016-02-23	3	
1828	AirSquats	20	2016-02-24	3	
1829	AirSquats	70	2016-02-24	30	@ C4 Crossfit
1830	AirSquats	48	2016-02-24	7	
1831	PushUps	32	2016-02-24	7	
1832	Planks	16	2016-02-24	7	
1833	Planks	60	2016-02-24	30	@ C4 Crossfit- extra work
1834	Miles	1.75	2016-02-24	30	@ C4 Crossfit- extra work
1835	Miles	3	2016-02-24	7	
1836	AirSquats	50	2016-02-24	8	
1837	PushUps	15	2016-02-24	8	
1838	Planks	11	2016-02-24	8	
1839	Shot	1	2016-02-24	25	
1840	AirSquats	100	2016-02-24	46	
1841	PushUps	100	2016-02-24	46	
1842	AirSquats	100	2016-02-24	13	
1843	PushUps	50	2016-02-24	13	
1844	Planks	15	2016-02-24	13	
1845	AirSquats	35	2016-02-24	13	
1846	Planks	5	2016-02-24	13	
1851	AirSquats	300	2016-02-21	45	
1855	AirSquats	1	2016-02-24	45	
1858	Miles	1	2016-02-24	11	
1859	Miles	2.5	2016-02-23	11	
1847	Miles	2.9	2016-02-24	3	
1850	AirSquats	25	2016-02-24	13	
1854	AirSquats	30	2016-02-21	45	
1857	AirSquats	45	2016-02-24	11	
1848	AirSquats	25	2016-02-24	13	
1852	AirSquats	4	2016-02-20	45	
1860	AirSquats	10	2016-02-23	11	
1849	Planks	20	2016-02-24	13	
1853	Planks	10	2016-02-21	45	
1856	AirSquats	2	2016-02-21	45	
1861	PushUps	10	2016-02-23	11	
1862	AirSquats	25	2016-02-24	26	Weighted
1863	Planks	32	2016-02-24	26	
1864	AirSquats	130	2016-02-25	34	
1865	PushUps	50	2016-02-25	34	
1866	Miles	1.7	2016-02-25	34	
1867	Planks	12	2016-02-24	46	
1868	Miles	0.4	2016-02-24	3	
1869	PushUps	20	2016-02-25	3	
1870	Planks	10	2016-02-25	3	
1871	Miles	1	2016-02-24	53	Bike to work
1872	AirSquats	60	2016-02-24	53	
1873	Planks	15	2016-02-24	53	
1874	Miles	1.1	2016-02-25	26	
1875	AirSquats	48	2016-02-25	7	
1876	PushUps	32	2016-02-25	7	
1877	Planks	16	2016-02-25	7	
1878	Miles	3.7	2016-02-25	34	
1879	Miles	0.6	2016-02-25	3	
1880	PushUps	20	2016-02-25	3	
1881	Planks	20	2016-02-25	3	
1882	AirSquats	100	2016-02-25	26	
1883	Miles	4.6	2016-02-25	26	
1884	PushUps	26	2016-02-25	26	
1885	AirSquats	4	2016-02-25	45	
1886	Miles	4	2016-02-25	45	
1887	Miles	2	2016-02-21	45	
1888	AirSquats	20	2016-02-25	46	
1889	Planks	18	2016-02-25	46	
1890	AirSquats	20	2016-02-25	11	
1891	PushUps	20	2016-02-25	11	
1892	Miles	2	2016-02-25	11	
1893	Planks	6	2016-02-25	11	
1894	PushUps	50	2016-02-25	18	
1895	Planks	13	2016-02-25	18	
1896	Miles	2.3	2016-02-25	18	
1897	PushUps	30	2016-02-25	4	
1898	Planks	10	2016-02-25	4	
1899	Miles	4	2016-02-25	4	
1900	PushUps	11	2016-02-25	4	
1901	Planks	16	2016-02-25	26	
1902	AirSquats	60	2016-02-25	15	
1903	Planks	27	2016-02-25	15	
1904	Planks	6	2016-02-26	15	
1905	Miles	1	2016-02-25	53	Biked to work
1906	AirSquats	60	2016-02-25	53	
1907	Planks	18	2016-02-25	53	
1908	AirSquats	105	2016-02-26	14	Toothbrush Squats
1909	AirSquats	120	2016-02-25	14	Toothbrush Squats
1910	Miles	3.4	2016-02-25	14	Work walk round trip
1911	Miles	3.4	2016-02-24	14	Work walk round trip
1912	Miles	3.6	2016-02-22	14	Work walk round trip
1913	AirSquats	20	2016-02-26	30	@ C4 Crossfit- extra work
1914	Planks	12	2016-02-26	30	@ C4 Crossfit- extra work
1915	Miles	2.25	2016-02-26	30	@ C4 Crossfit- sprints
1916	AirSquats	50	2016-02-25	17	
1917	PushUps	40	2016-02-25	17	
1918	Planks	20	2016-02-25	17	
1919	Miles	1	2016-02-25	17	
1920	Miles	4	2016-02-25	16	
1921	Miles	2	2016-02-26	16	
1922	PushUps	80	2016-02-26	18	
1923	Planks	10	2016-02-26	18	
1924	Miles	1.7	2016-02-26	18	
1925	AirSquats	48	2016-02-26	7	
1926	PushUps	32	2016-02-26	7	
1927	Planks	16	2016-02-26	7	
1928	Miles	1.5	2016-02-26	7	
1929	Miles	2	2016-02-26	24	
1930	Miles	3	2016-02-27	24	
1931	AirSquats	15	2016-02-27	24	
1932	Miles	1.2	2016-02-26	3	
1933	AirSquats	102	2016-02-27	3	
1934	PushUps	72	2016-02-27	3	
1935	Miles	2	2016-02-27	34	
1936	AirSquats	90	2016-02-27	26	Ball slams
1937	PushUps	72	2016-02-27	26	
1938	Miles	0.5	2016-02-27	3	
1939	Miles	0.5	2016-02-27	26	
1940	PushUps	20	2016-02-27	3	
1941	Planks	16	2016-02-27	3	
1942	Planks	20	2016-02-27	26	
1943	Planks	50	2016-02-27	34	
1944	Planks	10	2016-02-27	3	
1945	Planks	20	2016-02-27	26	
1946	PushUps	70	2016-02-27	15	
1947	Planks	21	2016-02-27	15	
1948	AirSquats	100	2016-02-27	13	
1949	Planks	50	2016-02-27	13	
1950	Miles	4.8	2016-02-27	13	
1951	PushUps	125	2016-02-27	46	
1952	Planks	21	2016-02-27	46	
1953	AirSquats	10	2016-02-27	34	
1954	Planks	11	2016-02-27	34	
1955	PushUps	20	2016-02-27	34	
1956	Miles	1.6	2016-02-27	3	
1957	PushUps	10	2016-02-27	3	
1958	AirSquats	120	2016-02-27	37	
1959	PushUps	90	2016-02-27	37	
1960	Planks	20	2016-02-27	37	
1961	Miles	2	2016-02-27	37	
1962	PushUps	15	2016-02-27	18	
1963	Miles	1	2016-02-27	18	
1964	AirSquats	48	2016-02-28	7	
1965	PushUps	32	2016-02-28	7	
1966	Planks	16	2016-02-28	7	
1967	Miles	1.6	2016-02-27	26	
1968	Miles	0.5	2016-02-28	34	
1969	PushUps	53	2016-02-28	34	
1970	Planks	42	2016-02-28	34	
1971	Planks	20	2016-02-27	17	
1972	Miles	2	2016-02-27	17	
1973	AirSquats	100	2016-02-28	17	
1974	Miles	3.81	2016-02-27	53	
1975	AirSquats	60	2016-02-27	53	
1976	Planks	19	2016-02-27	53	
1977	AirSquats	20	2016-02-28	8	
1978	PushUps	15	2016-02-28	8	
1979	Planks	6	2016-02-28	8	
1980	Miles	2.5	2016-02-28	8	
1981	PushUps	15	2016-02-28	8	
1982	Planks	7	2016-02-28	8	
1983	PushUps	15	2016-02-28	8	
1984	AirSquats	40	2016-02-28	8	
1985	Planks	9	2016-02-28	8	
1986	AirSquats	20	2016-02-28	8	
1987	PushUps	10	2016-02-28	8	
1988	Miles	3.4	2016-02-28	7	
1989	AirSquats	125	2016-02-28	15	
1990	PushUps	20	2016-02-28	15	
1991	Miles	2.18	2016-02-28	46	Biked 21.8 miles
1992	Miles	2.41	2016-02-28	53	
1993	AirSquats	100	2016-02-28	53	
1994	Planks	18	2016-02-28	53	
1995	AirSquats	50	2016-02-28	18	
1996	PushUps	30	2016-02-28	18	
1997	Planks	12	2016-02-28	18	
1998	AirSquats	20	2016-02-28	46	
1999	Miles	3.46	2016-02-29	46	Erg
2000	PushUps	88	2016-02-29	34	
2001	AirSquats	63	2016-02-29	34	
2002	Miles	1.3	2016-02-29	34	
2003	AirSquats	48	2016-02-29	7	
2004	PushUps	32	2016-02-29	7	
2005	Planks	16	2016-02-29	7	
2006	Miles	2	2016-02-29	7	
2007	AirSquats	50	2016-02-29	30	@ C4 Crossfit- extra work
2008	PushUps	30	2016-02-29	30	@ C4 Crossfit- extra work
2009	Miles	2.75	2016-02-29	30	@ C4 Crossfit- extra work
2010	AirSquats	31	2016-02-29	8	
2011	PushUps	10	2016-02-29	8	
2012	Planks	7	2016-02-29	8	
2013	Miles	0.5	2016-02-29	8	
2014	PushUps	20	2016-02-29	37	
2015	Planks	12	2016-02-29	37	
2016	AirSquats	40	2016-02-29	18	
2017	PushUps	15	2016-02-29	18	
2018	AirSquats	48	2016-03-01	7	
2019	PushUps	32	2016-03-01	7	
2020	Planks	16	2016-03-01	7	
2021	AirSquats	20	2016-02-29	24	
2022	Miles	3	2016-03-01	24	
2023	Miles	0.5	2016-02-28	3	
2024	Miles	1.4	2016-02-29	3	
2025	Miles	0.8	2016-03-01	3	
2026	AirSquats	156	2016-03-01	37	
2027	PushUps	56	2016-03-01	37	
2028	Planks	28	2016-03-01	37	
2029	Miles	1.5	2016-03-01	37	
2030	PushUps	60	2016-03-01	4	
2031	Planks	36	2016-03-01	4	
2032	Miles	2.5	2016-03-01	4	
2033	PushUps	50	2016-03-01	13	
2034	Miles	4.06	2016-02-29	13	
2035	AirSquats	10	2016-02-29	13	
2036	PushUps	20	2016-03-01	3	
2037	Miles	0.8	2016-03-01	3	
2038	Planks	10	2016-03-01	3	
2039	Miles	2	2016-03-01	17	
2040	Planks	14	2016-03-01	3	
2041	Planks	15	2016-03-01	3	
2042	Miles	2	2016-03-01	37	
2043	AirSquats	90	2016-03-02	30	@ C4 Crossfit
2044	PushUps	80	2016-03-02	30	@ C4 Crossfit- extra work
2045	Planks	20	2016-03-02	30	@ C4 Crossfit- extra work
2046	Miles	2.25	2016-03-02	30	@ C4 Crossfit- sprints
2047	AirSquats	48	2016-03-02	7	
2048	PushUps	32	2016-03-02	7	
2049	Planks	16	2016-03-02	7	
2050	Miles	1.4	2016-03-02	34	
2051	PushUps	30	2016-03-02	55	
2052	Miles	1.5	2016-03-02	4	
2053	AirSquats	40	2016-03-02	18	
2054	PushUps	30	2016-03-02	18	
2055	Planks	12	2016-03-02	18	
2056	Miles	1.2	2016-03-02	18	
2057	PushUps	40	2016-03-02	17	
2058	Miles	1	2016-03-02	17	
2059	Planks	12	2016-02-29	46	
2060	Miles	5.03	2016-03-03	46	
2061	Miles	1	2016-03-02	26	
2062	AirSquats	48	2016-03-03	7	
2063	PushUps	32	2016-03-03	7	
2064	Planks	16	2016-03-03	7	
2065	Miles	2.5	2016-03-03	34	
2066	Miles	0.5	2016-03-03	26	
2067	Miles	0.6	2016-03-03	34	
2068	AirSquats	60	2016-03-03	46	
2069	PushUps	60	2016-03-03	46	
2070	Miles	1	2016-03-03	53	Biked to work
2071	AirSquats	200	2016-03-03	53	
2072	AirSquats	100	2016-03-03	18	
2073	PushUps	50	2016-03-03	18	
2074	Miles	1.1	2016-03-03	18	
2075	AirSquats	200	2016-03-04	4	
2076	PushUps	100	2016-03-04	4	
2077	Planks	60	2016-03-04	4	
2078	Miles	2	2016-03-04	37	
2079	AirSquats	80	2016-03-03	37	
2080	PushUps	34	2016-03-03	37	
2081	Planks	24	2016-03-03	37	
2082	Miles	3.14	2016-03-04	46	Erg
2083	Miles	1.3	2016-03-02	3	
2084	Miles	1.6	2016-03-03	3	
2085	Miles	0.4	2016-03-04	3	
2086	AirSquats	48	2016-03-04	7	
2087	PushUps	32	2016-03-04	7	
2088	Planks	16	2016-03-04	7	
2089	AirSquats	60	2016-03-03	30	@ C4 Crossfit
2090	Miles	1	2016-03-03	30	@ C4 Crossfit
2091	AirSquats	65	2016-03-04	46	
2092	PushUps	115	2016-03-04	46	
2093	Planks	32	2016-03-04	46	
2094	Miles	2	2016-02-28	45	
2095	Miles	1	2016-03-04	37	
2096	PushUps	20	2016-03-04	18	
2097	Miles	1.7	2016-03-04	18	
2098	AirSquats	70	2016-03-05	15	
2099	PushUps	20	2016-03-05	15	
2100	Miles	2	2016-03-04	17	
2101	AirSquats	48	2016-03-05	7	
2102	PushUps	32	2016-03-05	7	
2103	Planks	16	2016-03-05	7	
2104	Miles	2.8	2016-03-05	34	
2105	Miles	4.09	2016-03-05	53	
2106	Miles	3.5	2016-03-05	34	
2107	AirSquats	100	2016-03-05	53	
2108	Miles	1.7	2016-03-05	18	
2109	PushUps	20	2016-03-05	18	
2110	AirSquats	48	2016-03-06	7	
2111	PushUps	32	2016-03-06	7	
2112	Planks	16	2016-03-06	7	
2113	Miles	3.03	2016-03-05	46	30.3 miles biking
2114	AirSquats	100	2016-03-06	17	
2115	PushUps	40	2016-03-06	17	
2116	Planks	10	2016-03-06	17	
2117	Planks	24	2016-03-06	26	
2118	PushUps	20	2016-03-06	3	
2119	Planks	23	2016-03-06	3	
2120	AirSquats	25	2016-03-06	34	
2121	Miles	0.4	2016-03-06	34	
2122	PushUps	50	2016-03-06	34	
2123	AirSquats	25	2016-03-06	16	
2124	PushUps	10	2016-03-06	16	
2125	Planks	9	2016-03-06	16	
2126	Planks	20	2016-03-06	34	
2127	Miles	2.22	2016-03-06	53	
2128	Miles	2.5	2016-03-06	11	
2129	Miles	3	2016-03-05	11	
2130	AirSquats	2	2016-02-26	11	
2131	Miles	2	2016-02-26	11	
2132	Miles	2	2016-02-27	11	
2133	AirSquats	32	2016-02-29	11	
2134	Planks	18	2016-02-29	11	
2135	AirSquats	95	2016-03-02	11	
2136	Miles	2.6	2016-03-06	3	
2137	Miles	2.6	2016-03-06	26	
2138	AirSquats	50	2016-03-06	18	
2139	PushUps	60	2016-03-06	18	
2140	Planks	12	2016-03-06	18	
2141	AirSquats	60	2016-03-06	46	
2142	PushUps	45	2016-03-06	46	
2143	Planks	24	2016-03-07	26	
2144	AirSquats	30	2016-03-07	3	
2145	PushUps	20	2016-03-07	3	
2146	Planks	11	2016-03-07	3	
2147	AirSquats	130	2016-03-07	30	@ C4 Crossfit
2148	PushUps	100	2016-03-07	30	@ C4 Crossfit
2149	Planks	15	2016-03-07	30	@ C4 Crossfit
2150	Miles	1.25	2016-03-07	30	@ C4 Crossfit
2151	AirSquats	60	2016-03-07	7	
2152	PushUps	40	2016-03-07	7	
2153	Planks	20	2016-03-07	7	
2154	Miles	1	2016-03-07	26	
2155	Miles	0.8	2016-03-07	3	
2156	AirSquats	25	2016-03-07	13	
2157	PushUps	100	2016-03-07	13	
2158	Miles	2.25	2016-03-07	13	
2159	Miles	2.45	2016-03-07	53	
2160	AirSquats	100	2016-03-07	53	
2161	AirSquats	30	2016-03-07	26	Weighted
2162	PushUps	13	2016-03-07	26	Bench press
2163	AirSquats	24	2016-03-07	26	
2164	PushUps	41	2016-03-07	26	
2165	Planks	24	2016-03-07	26	
2166	AirSquats	30	2016-03-07	3	
2167	Miles	0.4	2016-03-07	3	
2168	AirSquats	30	2016-03-07	3	
2169	AirSquats	5	2016-03-07	3	
2170	PushUps	30	2016-03-07	3	
2171	Miles	3	2016-03-07	17	
2172	AirSquats	20	2016-03-07	13	
2173	PushUps	30	2016-03-07	18	
2174	Planks	12	2016-03-07	18	
2175	PushUps	75	2016-03-07	4	
2176	Miles	1	2016-03-07	4	
2177	AirSquats	45	2016-03-07	4	
2178	Planks	14	2016-03-07	4	
2179	Miles	2	2016-02-29	23	
2180	Miles	3	2016-03-07	23	
2181	Miles	1	2016-02-27	23	
2182	Miles	2	2016-03-06	23	
2183	AirSquats	60	2016-03-08	46	
2184	Planks	20	2016-03-08	46	
2185	Miles	4.61	2016-03-08	46	Erg
2186	Miles	1	2016-03-07	7	
2187	AirSquats	60	2016-03-08	7	
2188	PushUps	40	2016-03-08	7	
2189	Planks	20	2016-03-08	7	
2190	Miles	3	2016-03-08	4	
2191	Miles	2.35	2016-03-08	53	
2192	AirSquats	55	2016-03-08	34	
2193	PushUps	50	2016-03-08	34	
2194	Miles	1	2016-03-07	16	
2195	Miles	1	2016-03-08	16	
2196	AirSquats	128	2016-03-08	37	
2197	PushUps	76	2016-03-08	37	
2198	Planks	39	2016-03-08	37	
2199	Miles	3.5	2016-03-08	37	
2200	Miles	1.6	2016-03-08	3	
2201	AirSquats	60	2016-03-09	7	
2202	PushUps	40	2016-03-09	7	
2203	Planks	20	2016-03-09	7	
2204	AirSquats	100	2016-03-08	53	
2205	AirSquats	260	2016-03-09	30	@ Home
2206	PushUps	100	2016-03-09	30	@ Home
2207	Planks	36	2016-03-09	30	@ Home
2208	Miles	1.25	2016-03-09	30	@ Home on rower
2209	PushUps	95	2016-03-09	46	
2210	Planks	30	2016-03-09	46	
2211	Planks	20	2016-03-08	17	
2212	Miles	4	2016-03-09	17	
2213	Miles	2	2016-03-09	16	
2214	Miles	2.22	2016-03-09	53	
2215	AirSquats	100	2016-03-09	53	
2216	PushUps	30	2016-03-08	12	
2217	AirSquats	18	2016-03-08	12	
2218	PushUps	6	2016-03-06	12	
2219	Planks	3	2016-03-06	12	
2220	Miles	3.06	2016-03-10	53	
2221	Miles	3.95	2016-03-10	13	
2222	AirSquats	50	2016-03-10	13	
2223	PushUps	50	2016-03-10	13	
2224	Planks	10	2016-03-10	13	
2225	AirSquats	50	2016-03-10	30	@ Home
2226	PushUps	30	2016-03-10	30	@ Home
2227	Planks	48	2016-03-10	30	@ Home
2228	Miles	0.75	2016-03-10	30	@ Home on rower
2229	AirSquats	90	2016-03-10	46	
2230	AirSquats	100	2016-03-10	53	
2231	AirSquats	50	2016-03-10	18	
2232	PushUps	20	2016-03-10	18	
2233	Planks	15	2016-03-10	18	
2234	Miles	2.9	2016-03-10	18	
2235	AirSquats	24	2016-03-10	26	Front squats
2236	Miles	0.75	2016-03-10	26	Row
2237	Miles	1.8	2016-03-10	26	
2238	AirSquats	100	2016-03-10	15	
2239	Planks	12	2016-03-10	15	
2240	AirSquats	50	2016-03-10	37	
2241	PushUps	192	2016-03-10	37	
2242	Planks	96	2016-03-10	37	
2243	Miles	1.85	2016-03-11	37	
2244	Miles	2	2016-03-11	34	
2245	Miles	3.3	2016-03-11	46	Erg
2246	Miles	1.2	2016-03-10	3	
2247	Miles	1.5	2016-03-09	3	
2248	Miles	1	2016-03-10	3	
2249	PushUps	20	2016-03-11	3	
2250	AirSquats	20	2016-03-11	3	
2251	Miles	0.8	2016-03-11	26	
2252	AirSquats	80	2016-03-11	46	
2253	PushUps	100	2016-03-11	46	
2254	AirSquats	50	2016-03-11	30	@ C4 Crossfit- extra work
2255	PushUps	20	2016-03-11	30	@ C4 Crossfit- extra work
2256	Miles	0.5	2016-03-11	30	@ C4 Crossfit- extra work
2257	Miles	1.7	2016-03-11	3	
2258	Planks	11	2016-03-12	3	
2259	PushUps	40	2016-03-10	17	
2260	Planks	20	2016-03-10	17	
2261	Miles	2	2016-03-10	17	
2262	Miles	3	2016-03-11	17	
2263	AirSquats	65	2016-03-10	55	
2264	PushUps	30	2016-03-10	55	
2265	Miles	1	2016-03-07	55	
2266	Miles	1	2016-03-08	55	
2267	Miles	1	2016-03-09	55	
2268	Miles	1	2016-03-10	55	
2269	Miles	1	2016-03-11	55	
2270	AirSquats	100	2016-03-12	55	
2271	PushUps	20	2016-03-12	55	
2272	AirSquats	75	2016-03-12	3	
2273	Miles	2.16	2016-03-12	46	21.6 miles biking
2274	AirSquats	70	2016-03-12	26	
2275	Miles	1.75	2016-03-12	26	
2276	Miles	3	2016-03-12	16	
2277	Miles	4	2016-03-12	3	
2278	Miles	2.5	2016-03-12	34	
2279	PushUps	70	2016-03-12	3	
2280	Planks	12	2016-03-12	3	
2281	Planks	14	2016-03-12	3	
2282	PushUps	20	2016-03-12	34	
2283	Planks	30	2016-03-12	34	
2284	AirSquats	30	2016-03-10	12	
2285	PushUps	18	2016-03-10	12	
2286	Miles	1	2016-03-12	16	
2287	PushUps	60	2016-03-12	37	
2288	Planks	25	2016-03-12	37	
2289	Miles	1.1	2016-03-12	26	
2290	Miles	1.1	2016-03-12	3	
2291	AirSquats	50	2016-03-12	18	
2292	PushUps	50	2016-03-12	18	
2293	Planks	15	2016-03-12	18	
2294	Miles	3.3	2016-03-12	18	
2295	AirSquats	60	2016-03-11	7	
2296	PushUps	40	2016-03-11	7	
2297	Planks	20	2016-03-11	7	
2298	Miles	3.4	2016-03-12	7	
2299	AirSquats	105	2016-03-13	34	
2300	PushUps	25	2016-03-13	34	
2301	Planks	24	2016-03-13	34	
2302	Miles	0.5	2016-03-13	34	
2303	Miles	2	2016-03-12	5	Starting it up!
2304	Planks	23	2016-03-13	3	
2305	Miles	1	2016-03-12	17	
2306	AirSquats	100	2016-03-13	17	
2307	PushUps	40	2016-03-13	17	
2308	AirSquats	60	2016-03-13	46	
2309	Planks	48	2016-03-13	46	
2310	Miles	1.6	2016-03-13	37	
2311	Miles	2	2016-03-13	34	
2312	Miles	7	2016-03-12	15	7 hours of Slog in the Bog playtime
2313	PushUps	20	2016-03-13	37	
2314	Planks	10	2016-03-13	37	
2315	Miles	2	2016-03-13	26	
2316	Miles	3	2016-03-13	5	
2317	AirSquats	60	2016-03-14	7	
2318	PushUps	40	2016-03-14	7	
2319	Planks	20	2016-03-14	7	
2320	Miles	3	2016-03-14	7	
2321	Miles	2.59	2016-03-14	53	
2322	PushUps	70	2016-03-14	34	
2323	AirSquats	133	2016-03-14	34	
2324	PushUps	30	2016-03-14	55	
2325	Planks	14	2016-03-14	55	
2326	Miles	1	2016-03-14	55	
2327	Miles	1	2016-03-14	17	
2328	Planks	20	2016-03-14	17	
2329	AirSquats	30	2016-03-14	26	Weighted
2330	AirSquats	25	2016-03-14	11	
2331	Miles	8	2016-03-12	11	
2332	AirSquats	25	2016-03-09	11	
2333	Planks	12	2016-03-09	11	
2334	Miles	0.5	2016-03-09	11	
2335	AirSquats	24	2016-03-07	11	
2336	Planks	18	2016-03-07	11	
2337	Planks	24	2016-03-14	26	
2338	Planks	3	2016-03-14	26	
2339	Planks	1	2016-03-14	26	
2340	PushUps	25	2016-03-14	26	
2341	PushUps	26	2016-03-14	26	
2342	AirSquats	27	2016-03-14	26	
2343	PushUps	4	2016-03-14	26	
2344	AirSquats	75	2016-03-14	3	
2345	PushUps	40	2016-03-14	3	
2346	Planks	27	2016-03-14	3	
2347	Miles	1.6	2016-03-14	3	
2348	PushUps	26	2016-03-14	26	
2349	Planks	15	2016-03-14	37	
2350	PushUps	30	2016-03-14	37	
2351	PushUps	15	2016-03-15	56	I did 30 on my knees since I'm weak, Neil said i had to divide in half. 
2352	Planks	8	2016-03-15	56	
2353	AirSquats	30	2016-03-14	5	
2354	Miles	3	2016-03-14	5	
2355	Miles	2	2016-03-15	56	Walking with a toddler. The pace was slow...
2356	Miles	2.8	2016-03-15	53	
2357	AirSquats	100	2016-03-15	55	
2358	Planks	30	2016-03-15	55	
2359	Miles	1	2016-03-15	55	
2360	Miles	3.68	2016-03-15	46	36.8 miles biking
2361	Miles	1	2016-03-15	56	
2362	Miles	3.13	2016-03-16	46	Erg
2363	Miles	2.1	2016-03-15	26	
2364	Planks	24	2016-03-16	26	
2365	PushUps	20	2016-03-16	26	
2366	AirSquats	60	2016-03-15	7	
2367	PushUps	40	2016-03-15	7	
2368	Planks	20	2016-03-15	7	
2369	AirSquats	30	2016-03-15	37	
2370	PushUps	30	2016-03-15	37	
2371	Planks	15	2016-03-15	37	
2372	Miles	2	2016-03-16	37	
2373	Miles	1.3	2016-03-15	3	
2374	Miles	2.51	2016-03-16	53	
2375	AirSquats	50	2016-03-16	53	
2376	Planks	15	2016-03-16	46	
2377	AirSquats	80	2016-03-16	46	
2378	AirSquats	90	2016-03-15	12	
2379	PushUps	30	2016-03-15	12	
2380	PushUps	22	2016-03-16	26	Floor press
2381	AirSquats	39	2016-03-16	26	
2382	Miles	1.25	2016-03-16	26	
2383	AirSquats	30	2016-03-16	3	
2384	PushUps	20	2016-03-16	3	
2385	Planks	10	2016-03-16	3	
2386	Miles	0.8	2016-03-16	3	
2387	PushUps	28	2016-03-16	26	
2388	Planks	24	2016-03-16	26	
2389	AirSquats	10	2016-03-16	26	
2390	Planks	5	2016-03-15	17	
2391	AirSquats	50	2016-03-15	17	
2392	PushUps	35	2016-03-15	17	
2393	Miles	2	2016-03-16	17	
2394	AirSquats	60	2016-03-16	37	
2395	PushUps	56	2016-03-16	37	
2396	Planks	28	2016-03-16	37	
2397	PushUps	10	2016-03-16	5	
2398	Miles	1	2016-03-16	5	
2399	AirSquats	60	2016-03-17	7	
2400	PushUps	40	2016-03-17	7	
2401	Planks	20	2016-03-17	7	
2402	AirSquats	50	2016-03-17	26	
2403	PushUps	25	2016-03-17	26	
2404	Planks	18	2016-03-17	26	
2405	AirSquats	50	2016-03-17	26	
2406	PushUps	25	2016-03-17	26	
2407	Planks	18	2016-03-17	26	
2408	AirSquats	88	2016-03-17	26	
2409	AirSquats	40	2016-03-17	3	
2410	Miles	2.4	2016-03-17	3	
2411	AirSquats	20	2016-03-16	18	
2412	PushUps	25	2016-03-16	18	
2413	Miles	3.1	2016-03-17	18	
2414	Miles	1	2016-03-17	53	
2415	AirSquats	50	2016-03-17	53	
2416	PushUps	25	2016-03-17	3	
2417	Miles	1.4	2016-03-17	3	
2418	Miles	1.1	2016-03-17	26	
2419	AirSquats	48	2016-03-17	37	
2420	PushUps	34	2016-03-17	37	
2421	Planks	17	2016-03-17	37	
2422	Miles	1.13	2016-03-17	37	
2423	AirSquats	10	2016-03-18	18	
2424	PushUps	15	2016-03-18	18	
2425	Miles	1.3	2016-03-17	18	
2426	AirSquats	30	2016-03-17	5	
2427	PushUps	10	2016-03-17	5	
2428	PushUps	78	2016-03-17	14	Gym
2429	PushUps	30	2016-03-17	23	
2430	Miles	2	2016-03-17	23	
2431	Miles	2	2016-03-14	23	
2432	AirSquats	60	2016-03-18	7	
2433	PushUps	40	2016-03-18	7	
2434	Planks	20	2016-03-18	7	
2435	Miles	3	2016-03-18	7	
2436	PushUps	5	2016-03-18	34	
2437	Planks	15	2016-03-18	34	
2438	Miles	1.8	2016-03-18	34	
2439	Planks	18	2016-03-18	15	
2440	AirSquats	36	2016-03-18	3	
2441	AirSquats	40	2016-03-15	15	
2442	PushUps	36	2016-03-18	3	
2443	Miles	3.1	2016-03-18	3	
2444	Miles	1	2016-03-18	26	
2445	AirSquats	36	2016-03-18	26	
2446	PushUps	36	2016-03-18	26	
2447	Miles	5	2016-03-18	15	
2448	Miles	7.9	2016-03-06	15	
2449	Miles	5.3	2016-03-08	15	
2450	Miles	5.1	2016-03-09	15	
2451	Miles	1	2016-03-18	53	
2452	Miles	15	2016-03-13	45	
2453	AirSquats	200	2016-03-11	45	
2454	PushUps	100	2016-03-11	45	
2455	Planks	10	2016-03-11	45	
2456	Miles	4	2016-03-06	45	
2457	Planks	6	2016-03-18	56	
2458	Miles	3	2016-03-17	17	
2459	PushUps	20	2016-03-18	17	
2460	Miles	4	2016-03-18	17	
2461	AirSquats	60	2016-03-19	3	
2462	PushUps	20	2016-03-19	3	
2463	Planks	11	2016-03-19	3	
2464	PushUps	15	2016-03-18	18	
2465	Miles	1.2	2016-03-18	18	
2466	Miles	1.5	2016-03-19	18	
2467	Miles	3	2016-03-19	16	
2468	AirSquats	20	2016-03-18	5	
2469	AirSquats	100	2016-03-19	30	@ Home
2470	PushUps	50	2016-03-19	30	@ Home
2471	Planks	30	2016-03-19	30	@ Home
2472	Miles	1	2016-03-19	30	@ Home on rower
2473	AirSquats	100	2016-03-11	24	
2474	Miles	6	2016-03-17	24	
2475	PushUps	100	2016-03-17	24	
2476	Planks	6	2016-03-17	24	
2477	Miles	3	2016-03-19	34	
2478	AirSquats	72	2016-03-20	34	
2479	PushUps	82	2016-03-20	34	
2480	AirSquats	60	2016-03-20	7	
2481	PushUps	40	2016-03-20	7	
2482	Planks	20	2016-03-20	7	
2483	Miles	3	2016-03-20	7	
2484	Miles	1.5	2016-03-20	26	
2485	Miles	1.5	2016-03-20	34	
2486	Miles	1	2016-03-19	53	
2487	Miles	2	2016-03-19	24	
2488	AirSquats	70	2016-03-21	15	
2489	Planks	18	2016-03-21	15	
2490	Miles	2	2016-03-20	15	Spring league
2491	Miles	3	2016-03-21	5	
2492	AirSquats	78	2016-03-21	37	
2493	PushUps	40	2016-03-21	37	
2494	Miles	2	2016-03-20	3	
2495	Planks	18	2016-03-21	37	
2496	Miles	2	2016-03-21	37	
2497	Miles	1.6	2016-03-21	3	
2498	Miles	2.7	2016-03-22	14	Work walk
2499	Miles	4.5	2016-03-17	14	Work + Gym walk
2500	AirSquats	40	2016-03-21	11	
2501	Miles	2	2016-03-20	11	
2502	Miles	2	2016-03-19	11	
2503	AirSquats	25	2016-03-16	11	
2504	Planks	12	2016-03-16	11	
2505	AirSquats	30	2016-03-17	23	
2506	Miles	1	2016-03-19	23	
2507	Miles	2	2016-03-21	23	
2508	Miles	2.7	2016-03-16	14	Work walk
2509	Miles	2.3	2016-03-15	14	Work walk
2510	Miles	1.7	2016-03-14	14	Work walk
2511	PushUps	40	2016-03-22	15	
2512	Planks	24	2016-03-22	15	
2513	AirSquats	20	2016-03-22	18	
2514	PushUps	15	2016-03-22	18	
2515	Miles	2	2016-03-22	18	
2516	Miles	2	2016-03-21	17	
2517	AirSquats	100	2016-03-22	17	
2518	PushUps	50	2016-03-22	17	
2519	Planks	10	2016-03-22	17	
2520	Miles	3.7	2016-03-22	14	Work walk
2521	PushUps	65	2016-03-21	46	
2522	AirSquats	100	2016-03-23	46	
2525	Planks	25	2016-03-23	46	
2523	Miles	4.87	2016-03-23	46	Erg
2524	Miles	4.87	2016-03-23	46	Erg
2526	Miles	2	2016-03-22	26	
2527	Miles	1.4	2016-03-21	26	
2528	Miles	2.2	2016-03-22	3	
2529	AirSquats	30	2016-03-23	3	
2530	PushUps	20	2016-03-23	3	
2531	Planks	11	2016-03-23	3	
2532	AirSquats	70	2016-03-22	37	
2533	PushUps	30	2016-03-22	37	
2534	Planks	15	2016-03-22	37	
2535	Miles	1.4	2016-03-22	37	
2536	Miles	2	2016-03-22	24	
2537	Miles	1.7	2016-03-23	3	
2538	AirSquats	24	2016-03-23	26	Weighted
2539	PushUps	20	2016-03-23	26	Bench press
2540	Miles	1	2016-03-23	26	
2541	Planks	24	2016-03-23	26	
2542	PushUps	37	2016-03-23	26	
2543	Miles	2.5	2016-03-23	53	
2544	AirSquats	50	2016-03-23	53	
2545	AirSquats	30	2016-03-23	3	
2546	PushUps	10	2016-03-23	3	
2547	Planks	25	2016-03-23	3	
2548	Planks	11	2016-03-23	3	
2549	AirSquats	60	2016-03-23	3	
2550	PushUps	10	2016-03-23	3	
2551	AirSquats	40	2016-03-23	18	
2552	PushUps	30	2016-03-23	18	
2553	Planks	20	2016-03-24	18	
2554	Miles	1.4	2016-03-23	18	
2555	Miles	2.5	2016-03-24	53	
2556	AirSquats	50	2016-03-24	53	
2557	Planks	20	2016-03-24	17	
2558	Miles	2	2016-03-24	17	
2559	AirSquats	30	2016-03-24	37	
2560	PushUps	30	2016-03-24	37	
2561	Planks	15	2016-03-24	37	
2562	Miles	2	2016-03-24	37	
2563	AirSquats	65	2016-03-24	3	
2564	PushUps	40	2016-03-24	3	
2565	Planks	22	2016-03-24	3	
2566	Miles	1.2	2016-03-24	3	
2567	Miles	2	2016-03-24	23	
2568	PushUps	40	2016-03-25	14	Bowling gutter balls
2569	Miles	2.3	2016-03-25	14	Work walk
2570	Miles	2.8	2016-03-23	14	Work walk
2571	PushUps	30	2016-03-25	3	
2572	PushUps	40	2016-03-25	14	Bowling gutter balls
2573	Miles	2.5	2016-03-25	53	
2574	AirSquats	50	2016-03-25	53	
2575	Miles	4	2016-03-22	15	
2576	AirSquats	50	2016-03-25	15	
2577	Miles	1.5	2016-03-25	16	
2578	Miles	1.6	2016-03-24	9	
2579	Miles	4	2016-03-23	9	
2580	Miles	1.6	2016-03-22	9	
2581	AirSquats	50	2016-03-25	26	Slam balls
2582	Miles	2.5	2016-03-25	26	
2583	Miles	4.37	2016-03-26	53	
2584	AirSquats	100	2016-03-25	13	
2585	Planks	20	2016-03-25	13	
2586	PushUps	100	2016-03-25	13	
2587	Miles	4.5	2016-03-13	13	
2588	Miles	8.2	2016-03-26	13	
2589	Miles	2	2016-03-26	34	
2590	Miles	-4.87	2016-03-23	46	reverse doubled up
2591	Planks	22	2016-03-26	46	
2592	Miles	2.15	2016-03-26	46	Biking 21.5 miles
2593	Miles	2.2	2016-03-26	26	
2594	Miles	3	2016-03-24	18	
2595	Miles	1.3	2016-03-25	18	
2596	Miles	3	2016-03-26	17	
2597	Miles	3.4	2016-03-26	7	
2598	Miles	10	2016-03-26	14	
2599	PushUps	40	2016-03-26	55	
2600	AirSquats	120	2016-03-26	55	
2601	PushUps	15	2016-03-22	4	
2602	Miles	2	2016-03-22	4	
2603	Miles	2	2016-03-23	24	
2604	Miles	2	2016-03-27	24	
2605	Miles	1.5	2016-03-26	24	
2606	AirSquats	50	2016-03-27	24	
2607	Miles	4	2016-03-27	17	
2608	PushUps	20	2016-03-27	17	
2609	Planks	20	2016-03-27	17	
2610	Miles	2.5	2016-03-27	53	
2611	AirSquats	50	2016-03-27	53	
2612	Miles	0.75	2016-03-27	26	
2613	Miles	3	2016-03-26	9	
2614	AirSquats	55	2016-03-28	30	@ C4 Crossfit
2615	Miles	0.25	2016-03-28	30	@ C4 Crossfit- sprints
2616	AirSquats	100	2016-03-28	19	Ugh. Not this again
2617	Miles	4.5	2016-03-28	19	
2618	AirSquats	60	2016-03-28	7	
2619	PushUps	40	2016-03-28	7	
2620	Planks	20	2016-03-28	7	
2621	Miles	3	2016-03-28	7	
2622	AirSquats	10	2016-03-26	5	
2623	PushUps	10	2016-03-26	5	
2624	Miles	4	2016-03-27	5	
2625	AirSquats	10	2016-03-28	5	
2626	PushUps	10	2016-03-28	5	
2627	Miles	2	2016-03-28	9	
2628	Miles	2	2016-03-27	24	
2629	Miles	2.52	2016-03-28	53	
2630	Miles	2	2016-03-28	34	
2631	AirSquats	50	2016-03-28	53	
2632	PushUps	30	2016-03-28	55	
2633	Planks	18	2016-03-28	55	
2634	Miles	1	2016-03-28	55	
2635	AirSquats	80	2016-03-29	46	
2636	Miles	3.74	2016-03-29	46	
2637	PushUps	40	2016-03-27	46	
2638	Miles	7	2016-03-27	14	Wandering around Vancouver
2639	AirSquats	21	2016-03-28	26	Weighted
2640	PushUps	30	2016-03-29	19	
2641	Planks	20	2016-03-29	19	
2642	Miles	2	2016-03-29	19	
2643	AirSquats	80	2016-03-29	12	
2644	Planks	8	2016-03-29	12	
2645	Miles	1.5	2016-03-25	12	
2646	Miles	2	2016-03-27	12	
2647	AirSquats	75	2016-03-29	9	
2648	Miles	2	2016-03-29	9	
2649	AirSquats	60	2016-03-29	8	
2650	PushUps	25	2016-03-29	9	
2651	PushUps	35	2016-03-29	8	
2652	Planks	20	2016-03-29	9	
2653	Planks	16	2016-03-29	8	
2654	Miles	2	2016-03-29	8	
2655	Miles	2	2016-03-23	8	
2656	PushUps	10	2016-03-29	5	
2657	Planks	5	2016-03-29	5	
2658	AirSquats	15	2016-03-29	7	
2659	PushUps	10	2016-03-29	7	
2660	Planks	5	2016-03-29	7	
2661	Miles	2.5	2016-03-29	26	
2662	PushUps	40	2016-03-29	17	
2663	Planks	10	2016-03-29	17	
2664	Miles	1	2016-03-29	53	Biked to work
2665	AirSquats	50	2016-03-29	53	
2666	Miles	1.3	2016-03-29	18	
2667	Planks	15	2016-03-30	46	
2668	Miles	5.67	2016-03-30	46	Erg
2669	Miles	1.8	2016-03-29	34	
2670	AirSquats	50	2016-03-30	9	
2671	PushUps	10	2016-03-30	9	
2672	Planks	12	2016-03-30	9	
2673	AirSquats	45	2016-03-30	30	@ C4 Crossfit
2674	PushUps	30	2016-03-30	30	@ C4 Crossfit
2675	Miles	1	2016-03-30	30	@ C4 Crossfit
2676	AirSquats	40	2016-03-29	37	
2677	PushUps	28	2016-03-29	37	
2678	Planks	14	2016-03-29	37	
2679	Miles	2	2016-03-28	37	
2680	AirSquats	50	2016-03-30	19	
2681	PushUps	30	2016-03-30	19	
2682	Miles	3	2016-03-30	19	
2683	Planks	10	2016-03-30	19	
2684	Miles	2	2016-03-30	9	
2685	Miles	1	2016-03-30	53	Bike to work
2686	AirSquats	50	2016-03-30	53	
2687	Miles	0.8	2016-03-30	26	
2688	AirSquats	25	2016-03-30	26	weighted 
2689	Miles	1	2016-03-30	26	Rowing
2690	PushUps	26	2016-03-30	26	Bench press
2691	AirSquats	50	2016-03-30	18	
2692	PushUps	30	2016-03-30	18	
2693	Planks	12	2016-03-30	18	
2694	Miles	1	2016-03-30	18	
2695	Miles	0.6	2016-03-30	18	
2696	AirSquats	56	2016-03-31	26	
2697	PushUps	30	2016-03-31	26	
2698	Planks	18	2016-03-31	26	
2699	AirSquats	50	2016-03-31	26	
2700	PushUps	30	2016-03-31	26	
2701	Planks	18	2016-03-31	26	
2702	Miles	2	2016-03-29	5	
2703	Miles	3	2016-03-30	5	
2704	Miles	2	2016-03-25	3	
2705	Miles	0.8	2016-03-25	3	
2706	Miles	1.2	2016-03-26	3	
2707	AirSquats	30	2016-03-28	3	
2708	AirSquats	30	2016-03-30	3	
2709	Miles	1.6	2016-03-28	3	
2710	Miles	1.6	2016-03-29	3	
2711	Miles	2.2	2016-03-30	3	
2712	PushUps	30	2016-03-30	3	
2713	Miles	3.19	2016-03-31	53	
2714	AirSquats	50	2016-03-31	53	
2715	AirSquats	75	2016-03-31	19	
2716	PushUps	50	2016-03-31	19	
2717	Planks	20	2016-03-31	19	
2718	Miles	3	2016-03-31	19	
2719	Miles	1.5	2016-03-31	26	
2720	Miles	2.5	2016-03-30	8	
2721	AirSquats	10	2016-03-31	8	
2722	PushUps	30	2016-03-31	8	
2723	Planks	11	2016-03-31	8	
2724	Miles	4	2016-03-31	17	
2725	Miles	0.5	2016-03-31	26	
2726	PushUps	20	2016-03-31	26	
2727	AirSquats	20	2016-03-31	18	
2728	PushUps	10	2016-03-31	18	
2729	Planks	20	2016-03-31	18	
2730	Miles	1.2	2016-03-31	18	
2731	Miles	3.27	2016-04-01	46	Erg
2732	AirSquats	65	2016-04-01	46	
2733	AirSquats	70	2016-03-31	37	
2734	Miles	1	2016-03-31	37	
2735	Miles	1.5	2016-04-01	3	
2736	AirSquats	60	2016-04-01	19	
2737	AirSquats	30	2016-04-01	19	
2738	AirSquats	-30	2016-04-01	19	
2739	PushUps	30	2016-04-01	19	
2740	Planks	15	2016-04-01	19	
2741	Miles	3.25	2016-04-01	19	
2742	Planks	18	2016-04-01	46	
2743	Miles	1	2016-04-01	53	bike to work
2744	AirSquats	50	2016-04-01	53	
2745	Miles	1.2	2016-04-01	18	
2746	AirSquats	150	2016-04-02	3	
2747	PushUps	60	2016-04-02	3	
2748	Planks	30	2016-04-02	3	
2749	AirSquats	125	2016-04-02	34	
2750	PushUps	100	2016-04-02	34	
2751	AirSquats	120	2016-04-02	3	
2752	PushUps	60	2016-04-02	3	
2753	Planks	30	2016-04-02	3	
2754	Planks	10	2016-04-02	34	
2755	AirSquats	38	2016-04-02	26	Burpees
2756	PushUps	38	2016-04-02	26	Burpees
2757	Miles	0.5	2016-04-01	26	
2758	PushUps	20	2016-03-31	12	
2759	Planks	10	2016-03-31	12	
2760	Miles	2.5	2016-04-02	34	
2761	Miles	1	2016-03-29	55	
2762	Miles	1	2016-03-30	55	
2763	Miles	1	2016-03-31	55	
2764	Miles	5	2016-04-02	55	
2765	AirSquats	60	2016-04-02	19	
2766	AirSquats	30	2016-04-02	19	
2767	Planks	15	2016-04-02	19	
2768	PushUps	30	2016-04-02	19	
2769	AirSquats	-30	2016-04-02	19	
2770	Miles	3.5	2016-04-02	19	
2771	AirSquats	15	2016-04-02	9	
2772	Miles	3	2016-04-02	9	
2773	Miles	2.43	2016-04-02	53	
2774	Miles	2	2016-04-02	26	
2775	AirSquats	50	2016-04-02	53	
2776	Miles	3	2016-03-30	7	
2777	AirSquats	45	2016-04-01	7	
2778	PushUps	30	2016-04-01	7	
2779	Planks	15	2016-04-01	7	
2780	Miles	3	2016-04-01	7	
2781	Miles	2	2016-04-02	3	
2782	AirSquats	30	2016-04-03	3	
2783	PushUps	50	2016-04-03	26	
2784	PushUps	60	2016-04-03	34	
2785	Planks	30	2016-04-03	34	
2786	Miles	1.3	2016-04-03	34	
2787	Miles	1.8	2016-04-03	26	
2788	Planks	24	2016-04-03	26	
2789	AirSquats	12	2016-04-03	26	
2790	PushUps	12	2016-04-03	26	
2791	Planks	6	2016-04-03	26	
2792	PushUps	20	2016-04-03	26	
2793	Planks	18	2016-04-03	26	
2794	Miles	2.7	2016-04-03	18	
2795	Miles	2.5	2016-04-03	53	
2796	AirSquats	50	2016-04-03	53	
2797	Miles	5.2	2016-04-03	3	
2798	Miles	1.4	2016-04-03	26	
2799	Miles	0.7	2016-04-03	34	
2800	PushUps	18	2016-04-03	26	
2801	Planks	18	2016-04-03	26	
2802	AirSquats	60	2016-04-03	3	
2803	Planks	15	2016-04-03	3	
2804	AirSquats	2	2016-04-03	3	
2805	PushUps	12	2016-04-03	3	
2806	Planks	10	2016-04-03	3	
2807	AirSquats	60	2016-04-03	46	
2808	PushUps	80	2016-04-03	46	
2809	Miles	0.35	2016-04-03	46	Biking
2810	AirSquats	60	2016-04-04	7	
2811	PushUps	40	2016-04-04	7	
2812	Planks	20	2016-04-04	7	
2813	AirSquats	30	2016-04-04	3	
2814	AirSquats	60	2016-04-04	19	
2815	PushUps	40	2016-04-04	19	
2816	Planks	15	2016-04-04	19	
2817	Miles	3.75	2016-04-04	19	
2818	AirSquats	50	2016-04-04	8	
2819	PushUps	20	2016-04-04	8	
2820	Planks	3	2016-04-04	8	
2821	Miles	3	2016-04-02	8	
2822	Miles	3.04	2016-04-04	53	
2823	AirSquats	50	2016-04-04	53	
2824	Planks	6	2016-04-04	53	
2825	Miles	4	2016-04-02	17	
2826	PushUps	20	2016-04-04	17	
2827	Planks	20	2016-04-04	17	
2828	Miles	1	2016-04-04	17	
2829	AirSquats	50	2016-04-04	15	
2830	Planks	10	2016-04-04	15	
2831	Miles	6	2016-04-02	15	Fool's Fest
2832	Miles	6	2016-04-03	15	Fool's Fest
2833	Miles	2	2016-04-03	15	Fool's Fest
2834	AirSquats	18	2016-04-04	26	Weighted
2835	PushUps	15	2016-04-04	26	Bench press
2836	AirSquats	25	2016-04-04	3	
2837	PushUps	20	2016-04-04	3	
2838	Planks	26	2016-04-04	3	
2839	Miles	1.2	2016-04-04	3	
2840	AirSquats	50	2016-04-04	15	
2841	AirSquats	60	2016-04-05	7	
2842	PushUps	40	2016-04-05	7	
2843	Planks	20	2016-04-05	7	
2844	AirSquats	60	2016-04-05	19	
2845	PushUps	40	2016-04-05	19	
2846	Planks	20	2016-04-05	19	
2847	Miles	3.75	2016-04-05	19	
2848	Miles	1	2016-04-05	53	bike to work
2849	AirSquats	50	2016-04-05	53	
2850	Planks	6	2016-04-05	53	
2851	PushUps	40	2016-04-05	55	
2852	Miles	1	2016-04-05	55	
2853	AirSquats	60	2016-04-05	17	
2854	PushUps	40	2016-04-05	17	
2855	Planks	5	2016-04-05	17	
2856	Miles	2	2016-04-05	17	
2857	Miles	1	2016-04-05	34	
2858	AirSquats	30	2016-04-04	5	
2859	PushUps	30	2016-04-04	5	
2860	Miles	2	2016-04-05	5	
2861	Miles	4	2016-04-02	5	
2862	Planks	10	2016-04-04	5	
2863	AirSquats	10	2016-04-05	5	
2864	PushUps	10	2016-04-05	5	
2865	Miles	1.3	2016-04-05	26	
2866	PushUps	25	2016-04-05	26	
2867	AirSquats	45	2016-04-05	3	
2868	Planks	18	2016-04-05	26	
2869	Miles	1.6	2016-04-05	3	
2870	Planks	23	2016-04-05	3	
2871	AirSquats	35	2016-04-05	3	
2872	PushUps	25	2016-04-05	26	
2873	Planks	18	2016-04-05	26	
2874	PushUps	20	2016-04-05	3	
2875	AirSquats	100	2016-04-05	15	
2876	PushUps	50	2016-04-05	15	
2877	Miles	6.21	2016-04-06	46	Erg
2878	AirSquats	60	2016-04-06	19	
2879	PushUps	40	2016-04-06	19	
2880	Planks	20	2016-04-06	19	
2881	Miles	3.75	2016-04-06	19	
2882	Miles	2.67	2016-04-06	53	
2883	AirSquats	50	2016-04-06	53	
2884	AirSquats	6	2016-04-06	53	
2885	Planks	6	2016-04-06	53	
2886	AirSquats	25	2016-04-06	26	Weighted
2887	Miles	1.25	2016-04-06	26	
2888	AirSquats	30	2016-04-06	18	
2889	PushUps	35	2016-04-06	18	
2890	Planks	12	2016-04-06	18	
2891	Miles	1.2	2016-04-06	18	
2892	AirSquats	100	2016-04-06	15	
2893	PushUps	50	2016-04-06	15	
2894	PushUps	20	2016-04-06	15	
2895	AirSquats	200	2016-03-28	45	
2896	Planks	10	2016-03-28	45	
2897	PushUps	30	2016-03-28	45	
2898	PushUps	15	2016-04-06	45	
2899	Miles	2.5	2016-04-07	30	Sprints
2900	AirSquats	75	2016-04-07	30	@ C4 Crossfit- extra work
2901	PushUps	50	2016-04-07	30	@ C4 Crossfit- extra work
2902	Planks	30	2016-04-07	30	@ C4 Crossfit- extra work
2903	Miles	1	2016-04-07	53	bike to work
2904	AirSquats	60	2016-04-07	7	
2905	PushUps	40	2016-04-07	7	
2906	Planks	20	2016-04-07	7	
2907	AirSquats	70	2016-04-07	15	
2908	PushUps	20	2016-04-07	15	
2909	Miles	4	2016-04-08	26	
2910	AirSquats	55	2016-04-07	46	
2911	Planks	12	2016-04-07	46	
2912	PushUps	15	2016-04-08	46	
2913	AirSquats	45	2016-04-07	18	
2914	PushUps	25	2016-04-07	18	
2915	Miles	3	2016-04-07	18	
2916	AirSquats	40	2016-04-02	12	
2917	PushUps	20	2016-04-02	12	
2918	Planks	10	2016-04-02	12	
2919	Miles	2	2016-04-05	12	
2920	Miles	5.5	2016-03-26	23	
2921	Miles	1	2016-03-27	23	
2922	Miles	2	2016-04-04	23	
2923	Planks	31	2016-04-08	7	
2924	AirSquats	110	2016-04-07	34	
2925	PushUps	60	2016-04-07	34	
2926	Miles	1	2016-04-08	34	
2927	AirSquats	50	2016-04-08	24	
2928	Miles	2	2016-04-08	24	
2929	Miles	1	2016-04-08	53	bike to work
2930	Miles	2	2016-04-08	53	goaltimate
2931	Planks	10	2016-04-08	53	
2932	AirSquats	75	2016-04-08	46	
2933	Planks	24	2016-04-08	46	
2934	Miles	3.4	2016-04-09	7	
2935	Miles	1	2016-04-09	26	Row
2936	Miles	1.5	2016-04-09	26	
2937	AirSquats	40	2016-04-09	26	Burpees
2938	PushUps	40	2016-04-09	26	Burpees
2939	AirSquats	40	2016-04-09	3	
2940	PushUps	40	2016-04-09	3	
2941	Planks	21	2016-04-09	3	
2942	Planks	18	2016-04-09	26	
2943	Planks	11	2016-04-09	3	
2944	AirSquats	17	2016-04-09	26	
2945	PushUps	7	2016-04-09	26	
2946	AirSquats	30	2016-04-09	3	
2947	Miles	2.76	2016-04-09	53	
2948	AirSquats	44	2016-04-09	53	50 - 6 misrecorded
2949	Planks	10	2016-04-09	53	
2950	PushUps	10	2016-04-08	5	
2951	Miles	3	2016-04-08	5	
2952	PushUps	20	2016-04-09	5	
2953	Planks	10	2016-04-09	5	
2954	Miles	3	2016-04-09	5	
2955	Miles	1.75	2016-04-09	26	
2956	PushUps	10	2016-04-09	34	
2957	Planks	20	2016-04-09	34	
2958	Miles	1	2016-04-09	34	
2959	AirSquats	60	2016-04-08	19	
2960	PushUps	50	2016-04-08	19	
2961	Planks	25	2016-04-08	19	
2962	Miles	3.25	2016-04-08	19	
2963	Miles	2.5	2016-04-09	19	
2964	PushUps	128	2016-04-10	34	
2965	Miles	0.3	2016-04-10	34	
2966	Miles	1	2016-04-10	26	
2967	PushUps	31	2016-04-10	26	
2968	Planks	18	2016-04-10	26	
2969	PushUps	30	2016-04-10	26	
2970	Planks	18	2016-04-10	26	
2971	AirSquats	31	2016-04-10	3	
2972	AirSquats	50	2016-04-10	53	
2973	Planks	12	2016-04-10	53	
2974	Miles	3	2016-04-08	15	
2975	AirSquats	125	2016-04-10	15	
2976	PushUps	100	2016-04-10	15	
2977	Planks	40	2016-04-10	15	
2978	Miles	3.1	2016-04-10	15	
2979	Miles	0.8	2016-04-10	26	
2980	Miles	2	2016-04-08	17	
2981	Miles	2	2016-04-09	17	
2982	AirSquats	100	2016-04-10	17	
2983	PushUps	30	2016-04-10	17	
2984	Planks	10	2016-04-10	17	
2985	PushUps	30	2016-04-10	26	
2986	Planks	18	2016-04-10	26	
2987	AirSquats	20	2016-04-08	37	
2988	PushUps	24	2016-04-08	37	
2989	Planks	12	2016-04-08	37	
2990	Miles	1.5	2016-04-09	37	
2991	Miles	3.73	2016-04-11	46	Erg
2992	AirSquats	60	2016-04-11	46	
2993	Planks	12	2016-04-11	46	
2994	AirSquats	75	2016-04-11	30	@ C4 Crossfit- extra work
2995	PushUps	50	2016-04-11	30	@ C4 Crossfit- extra work
2996	Planks	24	2016-04-11	30	@ C4 Crossfit- extra work
2997	Miles	2	2016-04-11	30	@ C4 Crossfit- extra work
2998	Planks	-12	2016-04-08	7	
2999	Planks	15	2016-04-09	7	
3000	AirSquats	60	2016-04-11	7	
3001	PushUps	40	2016-04-11	7	
3002	Planks	20	2016-04-11	7	
3003	AirSquats	36	2016-04-11	3	
3004	Miles	1	2016-04-11	53	bike to work
3005	AirSquats	50	2016-04-11	53	
3006	Planks	12	2016-04-11	53	
3007	Miles	1.9	2016-04-11	26	
3008	AirSquats	250	2016-04-11	45	
3009	Planks	10	2016-04-11	45	
3010	PushUps	40	2016-04-11	45	
3011	Miles	3	2016-04-11	5	
3012	AirSquats	104	2016-04-11	37	
3013	PushUps	36	2016-04-11	37	
3014	Planks	18	2016-04-11	37	
3015	Miles	2	2016-04-11	37	
3016	Miles	1.7	2016-04-12	34	
3017	Miles	1.75	2016-04-11	19	
3018	AirSquats	60	2016-04-12	19	
3019	PushUps	50	2016-04-12	19	
3020	Planks	25	2016-04-12	19	
3021	Miles	2.25	2016-04-12	19	
3022	Miles	3.05	2016-04-12	53	
3023	Planks	30	2016-04-12	53	
3024	PushUps	5	2016-04-12	53	
3025	Miles	2	2016-04-11	23	
3026	Planks	30	2016-04-12	17	
3027	Miles	2	2016-04-12	17	
3028	AirSquats	70	2016-04-12	18	
3029	PushUps	45	2016-04-12	18	
3030	Planks	24	2016-04-12	18	
3031	Miles	1	2016-04-12	18	
3032	AirSquats	30	2016-04-12	26	Weighted
3033	Miles	0.5	2016-04-12	26	
3034	AirSquats	400	2016-04-12	15	
3035	PushUps	200	2016-04-12	15	
3036	Planks	15	2016-04-12	46	
3037	AirSquats	40	2016-04-12	46	
3038	AirSquats	60	2016-04-13	7	
3039	PushUps	40	2016-04-13	7	
3040	Planks	20	2016-04-13	7	
3041	Miles	1.2	2016-04-13	26	
3042	AirSquats	30	2016-04-13	19	
3043	PushUps	20	2016-04-13	19	
3044	Planks	10	2016-04-13	19	
3045	Miles	1.5	2016-04-13	19	
3046	AirSquats	116	2016-04-13	3	
3047	PushUps	25	2016-04-13	3	
3048	AirSquats	75	2016-04-13	26	Ball slams
3049	PushUps	22	2016-04-13	26	Bench press
3050	Miles	2	2016-04-12	5	
3051	AirSquats	30	2016-04-13	5	
3052	PushUps	10	2016-04-13	5	
3053	Miles	1.5	2016-04-13	34	
3054	PushUps	76	2016-04-13	34	
3055	AirSquats	124	2016-04-13	37	
3056	PushUps	36	2016-04-13	37	
3057	Planks	18	2016-04-13	37	
3058	Miles	2	2016-04-12	37	
3059	Miles	2	2016-04-13	53	
3060	Planks	30	2016-04-13	53	
3061	PushUps	5	2016-04-13	53	
3062	AirSquats	10	2016-04-13	5	
3063	PushUps	20	2016-04-13	5	
3064	Planks	2	2016-04-13	5	
3065	PushUps	40	2016-04-13	17	
3066	Miles	1	2016-04-13	17	
3067	PushUps	50	2016-04-13	15	
3068	AirSquats	50	2016-04-13	18	
3069	PushUps	25	2016-04-13	18	
3070	Planks	18	2016-04-13	18	
3071	Miles	1	2016-04-13	18	
3072	PushUps	25	2016-04-13	5	
3073	AirSquats	20	2016-04-13	5	
3074	AirSquats	10	2016-04-13	5	
3075	PushUps	5	2016-04-13	5	
3076	Planks	2	2016-04-13	5	
3077	Miles	4.68	2016-04-14	46	Erg
3078	AirSquats	50	2016-04-13	46	
3079	Planks	13	2016-04-13	46	
3080	Miles	3	2016-04-13	7	
3081	Miles	3.77	2016-04-13	9	
3082	Miles	3.4	2016-04-13	14	Work walk
3083	Miles	3.2	2016-04-12	14	Work walk
3084	Miles	3.1	2016-04-11	14	Work walk
3085	Miles	2.6	2016-04-09	14	Dog park
3086	Miles	2.7	2016-04-07	14	Work walk
3087	Miles	2.4	2016-04-06	14	Work walk + gym warm up
3088	Miles	3	2016-04-04	14	Work walk
3089	Miles	1.6	2016-04-02	14	Wandering
3090	Miles	3.2	2016-04-01	14	Work walk
3091	Planks	11	2016-04-13	3	
3092	PushUps	28	2016-04-14	26	
3093	PushUps	12	2016-04-14	26	
3094	Miles	1.1	2016-04-14	26	
3095	PushUps	40	2016-04-14	26	
3096	Miles	1.28	2016-04-14	53	
3097	AirSquats	50	2016-04-14	30	@ C4 Crossfit- extra work
3098	PushUps	50	2016-04-14	30	@ C4 Crossfit- extra work
3099	Planks	24	2016-04-14	30	@ C4 Crossfit- extra work
3100	Miles	1.5	2016-04-14	30	@ C4 Crossfit- extra work
3101	Miles	1	2016-04-14	26	
3102	PushUps	5	2016-04-14	53	
3103	Planks	30	2016-04-14	53	
3104	PushUps	7	2016-04-14	26	
3105	AirSquats	65	2016-04-14	18	
3106	PushUps	15	2016-04-14	18	
3107	Miles	2	2016-04-14	18	
3108	AirSquats	50	2016-04-08	24	
3109	PushUps	65	2016-04-15	24	
3110	Planks	28	2016-04-15	24	
3111	Miles	3	2016-04-15	24	
3112	AirSquats	25	2016-04-13	24	
3113	Miles	2	2016-04-15	24	
3114	AirSquats	31	2016-04-15	3	
3115	PushUps	21	2016-04-15	3	
3116	Planks	11	2016-04-15	3	
3117	Planks	24	2016-04-15	26	
3118	Miles	0.7	2016-04-15	26	
3119	PushUps	45	2016-04-15	3	
3120	AirSquats	45	2016-04-15	3	
3121	AirSquats	15	2016-04-15	3	
3122	Planks	18	2016-04-15	26	
3123	Miles	1.2	2016-04-15	34	
3124	Planks	15	2016-04-15	3	
3125	AirSquats	90	2016-04-15	19	
3126	PushUps	50	2016-04-15	19	
3127	Planks	30	2016-04-15	19	
3128	Miles	3.75	2016-04-15	19	
3129	Miles	1	2016-04-15	26	
3130	AirSquats	15	2016-04-15	26	Weighted
3131	AirSquats	45	2016-04-15	26	Burpees
3132	PushUps	45	2016-04-15	26	Burpees
3133	Planks	18	2016-04-15	26	
3134	AirSquats	35	2016-04-15	26	
3135	PushUps	6	2016-04-15	26	
3136	AirSquats	270	2016-04-15	37	
3137	PushUps	36	2016-04-15	37	
3138	Planks	18	2016-04-15	37	
3139	Miles	1.2	2016-04-15	37	
3140	AirSquats	35	2016-04-15	18	
3141	PushUps	10	2016-04-15	18	
3142	Miles	0.5	2016-04-15	18	
3143	Planks	2	2016-04-15	5	
3144	Miles	4	2016-04-16	5	
3145	Planks	22	2016-04-16	3	
3146	AirSquats	31	2016-04-16	3	
3147	PushUps	24	2016-04-16	3	
3148	Planks	12	2016-04-16	3	
3149	AirSquats	20	2016-04-16	3	
3150	Miles	0.5	2016-04-16	26	
3151	PushUps	30	2016-04-16	15	
3152	Planks	15	2016-04-16	15	
3153	Planks	11	2016-04-16	3	
3154	Miles	3.02	2016-04-16	46	30.2 miles biking
3155	Miles	1.1	2016-04-16	26	
3156	Miles	2	2016-04-16	53	frisbee tourney
3157	Planks	30	2016-04-16	53	
3158	AirSquats	30	2016-04-16	18	
3159	PushUps	30	2016-04-16	18	
3160	Miles	0.5	2016-04-16	18	
3161	Planks	18	2016-04-16	46	
3162	Miles	2.5	2016-04-16	9	
3163	Miles	2	2016-04-15	9	
3164	Miles	3	2016-04-14	9	
3165	Miles	1.8	2016-04-16	34	
3166	Miles	1.5	2016-04-16	30	Sprints
3167	AirSquats	120	2016-04-17	30	
3168	Miles	10	2016-04-16	13	
3169	Planks	10	2016-04-17	12	
3170	Miles	1.5	2016-04-17	12	
3171	Planks	21	2016-04-17	3	
3172	AirSquats	40	2016-04-17	3	
3173	PushUps	20	2016-04-17	12	
3174	Miles	2.4	2016-04-17	8	
3175	Miles	1.6	2016-04-16	8	
3176	Planks	7	2016-04-17	8	
3177	Planks	4	2016-04-17	8	
3178	PushUps	10	2016-04-17	8	
3179	PushUps	5	2016-04-17	8	
3180	AirSquats	10	2016-04-17	8	
3181	AirSquats	50	2016-04-17	46	
3182	Planks	25	2016-04-17	46	
3183	Miles	2.7	2016-04-17	26	
3184	PushUps	30	2016-04-17	17	
3185	Planks	30	2016-04-17	17	
3186	Miles	3	2016-04-17	17	
3187	AirSquats	80	2016-04-17	18	
3188	PushUps	40	2016-04-17	18	
3189	Planks	20	2016-04-17	18	
3190	PushUps	36	2016-04-17	37	
3191	Planks	18	2016-04-17	37	
3192	Miles	3.7796	2016-04-17	37	
3193	Miles	4	2016-04-11	55	
3194	Miles	6	2016-04-19	55	
3195	PushUps	20	2016-04-24	55	
3196	Miles	2.5	2016-04-18	26	
3197	Miles	0.9	2016-04-18	12	
3198	AirSquats	10	2016-04-18	8	
3199	PushUps	10	2016-04-18	8	
3200	Planks	5	2016-04-18	8	
3201	Miles	1.5	2016-04-18	8	
3202	Miles	2.02	2016-04-18	46	Biking 20.2 miles
3203	Miles	1.1	2016-04-18	26	
3204	AirSquats	300	2016-04-18	14	100 fs pp 100 wall ball 100 ball slams
3205	AirSquats	50	2016-04-18	17	
3206	Planks	10	2016-04-18	17	
3207	Miles	2	2016-04-18	17	
3208	Miles	1	2016-04-18	53	bike to work
3209	Planks	30	2016-04-18	53	
3210	AirSquats	140	2016-04-18	18	
3211	PushUps	65	2016-04-18	18	
3212	Planks	18	2016-04-18	18	
3213	Miles	1	2016-04-18	18	
3214	Miles	2	2016-04-18	23	
3215	AirSquats	30	2016-04-18	3	
3216	Planks	9	2016-04-18	3	
3217	Planks	24	2016-04-19	26	
3218	PushUps	25	2016-04-19	26	
3219	Planks	18	2016-04-19	26	
3220	PushUps	25	2016-04-19	26	
3221	Planks	6	2016-04-19	26	
3222	Miles	5.7	2016-04-18	14	Work walk + eye + gym
3223	Miles	3.5	2016-04-16	14	Beer walk
3224	Miles	2.8	2016-04-14	14	Work walk
3225	Miles	2.8	2016-04-19	26	
3226	Miles	2	2016-04-19	34	
3227	AirSquats	30	2016-04-19	18	
3228	PushUps	15	2016-04-19	18	
3229	Miles	2	2016-04-19	18	
3230	AirSquats	40	2016-04-19	37	
3231	Planks	18	2016-04-20	37	
3232	Miles	0.4204	2016-04-20	37	
3233	Miles	3.4	2016-04-20	46	
3234	PushUps	25	2016-04-20	26	
3235	Planks	18	2016-04-20	26	
3236	AirSquats	40	2016-04-20	26	
3237	AirSquats	40	2016-04-20	26	
3238	Planks	18	2016-04-20	26	
3239	PushUps	25	2016-04-20	26	
3240	Miles	3.4	2016-04-18	7	
3241	AirSquats	100	2016-04-15	24	
3242	Miles	2	2016-04-20	24	
3243	Planks	20	2016-04-20	24	
3244	PushUps	50	2016-04-20	24	
3245	Miles	1.3	2016-04-20	34	
3246	AirSquats	30	2016-04-19	19	
3247	AirSquats	75	2016-04-20	19	
3248	PushUps	20	2016-04-19	19	
3249	PushUps	50	2016-04-20	19	
3250	Planks	10	2016-04-19	19	
3251	Planks	30	2016-04-20	19	
3252	Miles	2.25	2016-04-20	19	
3253	Miles	3.75	2016-04-19	19	
3254	Shot	1	2016-04-20	3	
3255	AirSquats	30	2016-04-20	26	
3256	PushUps	20	2016-04-20	26	
3257	AirSquats	50	2016-04-20	18	
3258	PushUps	20	2016-04-20	18	
3259	Miles	2.2	2016-04-20	18	
3260	Miles	4	2016-04-19	17	
3261	AirSquats	40	2016-04-21	26	
3262	AirSquats	1	2016-04-21	26	
3263	PushUps	30	2016-04-21	26	
3264	Planks	24	2016-04-21	26	
3265	Planks	3	2016-04-21	26	
3266	Miles	2	2016-04-19	9	
3267	Miles	2.5	2016-04-20	9	
3268	Miles	5.2	2016-04-20	14	Work + gym
3269	Miles	2.7	2016-04-19	14	Work walk
3270	Miles	0.8	2016-04-21	34	
3271	Miles	1.3	2016-04-21	26	
3272	Miles	1.6	2016-04-21	34	
3273	Miles	1	2016-04-21	53	bike to work
3274	PushUps	5	2016-04-21	53	
3275	Planks	32	2016-04-21	53	
3276	PushUps	30	2016-04-21	17	
3277	Planks	20	2016-04-21	17	
3278	Miles	1	2016-04-21	17	
3279	Miles	1	2016-04-21	26	
3280	AirSquats	50	2016-04-21	18	
3281	PushUps	40	2016-04-21	18	
3282	Planks	30	2016-04-21	18	
3283	Miles	2.4	2016-04-21	18	
3284	AirSquats	80	2016-04-21	37	
3285	PushUps	20	2016-04-22	37	
3286	Planks	18	2016-04-22	37	
3287	Miles	0.86	2016-04-22	37	
3288	Miles	1	2016-04-21	23	
3289	Miles	2.7	2016-04-21	14	Work walk
3290	Miles	1.5	2016-04-20	7	
3291	Planks	21	2016-04-22	7	
3292	PushUps	25	2016-04-22	26	
3293	Planks	18	2016-04-22	26	
3294	PushUps	25	2016-04-22	26	
3295	AirSquats	30	2016-04-22	19	
3296	PushUps	20	2016-04-22	19	
3297	Planks	15	2016-04-22	19	
3298	Miles	2.25	2016-04-22	19	
3299	AirSquats	30	2016-04-22	45	
3300	Miles	4	2016-04-22	45	
3301	Planks	4	2016-04-22	45	
3302	Miles	3	2016-04-17	45	
3303	AirSquats	4	2016-04-16	45	
3304	Miles	4	2016-04-16	45	
3305	Miles	1	2016-04-21	30	@ Home on rower
3306	AirSquats	60	2016-04-21	30	@ Home
3307	Planks	9	2016-04-21	30	@ Home
3308	PushUps	30	2016-04-21	30	@ Home
3309	AirSquats	200	2016-04-22	30	@ C4 Crossfit- extra work
3310	Miles	1.25	2016-04-22	30	@ C4 Crossfit- extra work
3311	PushUps	60	2016-04-22	30	@ C4 Crossfit- extra work
3312	Planks	18	2016-04-22	30	@ C4 Crossfit- extra work
3313	AirSquats	70	2016-04-22	26	
3314	Miles	0.25	2016-04-22	26	
3315	Miles	2	2016-04-22	53	
3316	Planks	18	2016-04-22	26	
3317	AirSquats	100	2016-04-22	18	
3318	PushUps	60	2016-04-22	18	
3319	Planks	30	2016-04-22	18	
3320	Miles	3	2016-04-22	18	
3321	AirSquats	70	2016-04-21	15	
3322	Planks	25	2016-04-23	7	
3323	Miles	2	2016-04-22	23	
3324	Miles	0.8	2016-04-23	26	
3325	PushUps	50	2016-04-23	26	
3326	Miles	2.61	2016-04-23	53	
3327	PushUps	20	2016-04-23	44	
3328	Planks	34	2016-04-23	53	
3329	PushUps	10	2016-04-23	53	
3330	Miles	0.5	2016-04-23	30	@ C4 Crossfit- sprints
3331	AirSquats	100	2016-04-23	30	@ C4 Crossfit- extra work
3332	Planks	10	2016-04-23	30	@ C4 Crossfit- extra work
3333	Miles	1.2	2016-04-23	26	
3334	AirSquats	40	2016-04-23	18	
3335	PushUps	30	2016-04-23	18	
3336	Planks	12	2016-04-23	18	
3337	Miles	2.2	2016-04-23	18	
3338	Planks	34	2016-04-24	34	
3339	Miles	3.4	2016-04-23	7	
3340	Miles	3.4	2016-04-24	7	
3341	Planks	21	2016-04-24	7	
3342	Miles	3	2016-04-11	16	
3343	PushUps	30	2016-04-23	15	
3344	PushUps	10	2016-04-24	53	
3345	Planks	34	2016-04-24	53	
3346	Miles	2	2016-04-24	34	
3347	Miles	2	2016-04-24	23	
3348	Miles	2	2016-04-22	17	
3349	Miles	4	2016-04-23	17	
3350	AirSquats	100	2016-04-24	17	
3351	PushUps	35	2016-04-24	17	
3352	AirSquats	80	2016-04-24	15	
3353	PushUps	100	2016-04-24	15	
3354	Planks	18	2016-04-24	15	
3355	Planks	64	2016-04-24	18	
3356	Miles	3	2016-04-24	9	
3357	Miles	2	2016-04-22	9	
3358	Planks	16	2016-04-22	46	
3359	AirSquats	50	2016-04-25	9	
3360	PushUps	20	2016-04-25	9	
3361	Planks	10	2016-04-25	9	
3362	Miles	0.8	2016-04-25	34	
3363	PushUps	50	2016-04-25	30	@ C4 Crossfit- extra work
3364	Planks	12	2016-04-25	30	@ C4 Crossfit- extra work
3365	Miles	1	2016-04-25	30	@ C4 Crossfit- sprints
3366	AirSquats	60	2016-04-25	46	
3367	Planks	31	2016-04-25	46	
3368	AirSquats	40	2016-04-25	18	
3369	PushUps	15	2016-04-25	18	
3370	Planks	42	2016-04-25	18	
3371	Miles	7.75	2016-04-26	14	
3372	Miles	3	2016-04-25	23	
3373	Miles	2	2016-04-25	9	
3374	AirSquats	10	2016-04-24	37	
3375	Miles	2.6	2016-04-24	37	
3376	Miles	2.56	2016-04-26	53	
3377	PushUps	20	2016-04-26	53	
3378	Planks	36	2016-04-26	53	
3379	Shot	1	2016-04-26	26	
3380	AirSquats	50	2016-04-26	17	
3381	PushUps	40	2016-04-26	17	
3382	Planks	20	2016-04-26	17	
3383	Miles	1	2016-04-26	17	
3384	AirSquats	60	2016-04-26	18	
3385	Planks	6	2016-04-26	18	
3386	Miles	2.4	2016-04-26	18	
3387	PushUps	50	2016-04-26	15	
3388	Miles	3	2016-04-26	7	
3389	Miles	2.8	2016-04-26	14	Work walk
3390	AirSquats	20	2016-04-26	37	
3391	PushUps	49	2016-04-26	37	
3392	Planks	24	2016-04-26	37	
3393	Miles	0.9	2016-04-27	37	
3394	Miles	3	2016-04-23	24	
3395	Miles	1.25	2016-04-27	30	@ C4 Crossfit- extra work
3396	Miles	2.8	2016-04-27	34	
3397	PushUps	45	2016-04-27	14	Gym
3398	PushUps	20	2016-04-27	18	
3399	Planks	10	2016-04-27	18	
3400	Miles	1	2016-04-27	18	
3401	Miles	2	2016-04-27	53	goaltimate
3402	Planks	12	2016-04-27	53	
3403	PushUps	5	2016-04-27	53	
3404	PushUps	80	2016-04-28	30	@ Home
3405	Planks	24	2016-04-28	30	@ Home
3406	Miles	1.25	2016-04-28	30	@ Home on rower
3407	PushUps	20	2016-04-28	17	
3408	Planks	20	2016-04-28	17	
3409	AirSquats	50	2016-04-28	18	
3410	PushUps	20	2016-04-28	18	
3411	Planks	60	2016-04-28	18	
3412	Miles	2.7	2016-04-28	18	
3413	AirSquats	30	2016-04-28	53	
3414	PushUps	10	2016-04-28	53	
3415	PushUps	200	2016-04-29	30	@ C4 Crossfit- extra work
3416	Miles	2	2016-04-29	30	@ C4 Crossfit- extra work
3417	Planks	20	2016-04-29	7	
3418	Miles	0.8	2016-04-29	34	
3419	AirSquats	100	2016-04-28	37	
3420	AirSquats	120	2016-04-29	5	
3421	PushUps	70	2016-04-29	5	
3422	AirSquats	14	2016-04-29	5	
3423	Planks	14	2016-04-29	5	
3424	Miles	5	2016-04-29	5	
3425	Miles	1.1	2016-04-29	34	
3426	AirSquats	30	2016-04-29	18	
3427	PushUps	35	2016-04-29	18	
3428	Planks	29	2016-04-29	18	
3429	Miles	2.5	2016-04-29	18	
3430	Miles	2.68	2016-04-30	53	
3431	Miles	2.5	2016-04-30	34	
3432	Miles	2.1	2016-04-30	18	
3433	Miles	2	2016-04-30	17	
3434	AirSquats	30	2016-04-29	7	
3435	AirSquats	30	2016-05-01	7	
3436	PushUps	20	2016-05-01	7	
3437	Planks	12	2016-05-01	7	
3438	Miles	2	2016-05-01	53	ultimate
3439	Planks	30	2016-05-01	53	
3440	PushUps	10	2016-05-01	53	
3441	PushUps	30	2016-05-01	17	
3442	Planks	20	2016-05-01	17	
3443	Miles	2	2016-05-01	18	
3444	Miles	2.5	2016-05-01	34	
3445	Miles	1	2016-05-01	23	
3446	Miles	2	2016-04-27	24	
3447	AirSquats	30	2016-05-02	7	
3448	PushUps	20	2016-05-02	7	
3449	Planks	12	2016-05-02	7	
3450	AirSquats	20	2016-05-02	37	
3451	PushUps	40	2016-05-02	37	
3452	Planks	18	2016-05-02	37	
3453	Miles	2	2016-05-01	37	
3454	Miles	0.5	2016-05-01	37	
3455	Miles	1.5	2016-05-02	23	
3456	Miles	1.5	2016-05-02	18	
3457	Miles	1	2016-05-01	53	bike to work
3458	AirSquats	125	2016-05-02	15	
3459	PushUps	50	2016-05-02	15	
3460	Planks	30	2016-05-02	15	
3461	Planks	12	2016-05-02	15	
3462	Miles	1.8	2016-05-03	34	
3463	Miles	1	2016-05-03	53	bike to work
3464	Planks	30	2016-05-03	53	
3465	PushUps	15	2016-05-03	53	
3466	Miles	1	2016-05-03	18	
3467	Miles	0.5	2016-05-03	18	
3468	Miles	2	2016-04-30	12	
3469	AirSquats	100	2016-05-03	15	
3470	Miles	1	2016-05-02	23	
3471	Miles	1	2016-05-03	23	
3472	AirSquats	30	2016-05-03	7	
3473	PushUps	20	2016-05-03	7	
3474	Planks	12	2016-05-03	7	
3475	AirSquats	80	2016-05-04	37	
3476	Miles	1.4	2016-05-04	18	
3477	PushUps	100	2016-05-04	14	40 + 60 burpees 
3478	Miles	1	2016-05-04	53	ultimate
3479	Planks	18	2016-05-04	53	
3480	PushUps	10	2016-05-04	53	
3481	PushUps	36	2016-05-04	37	
3482	AirSquats	18	2016-05-04	37	
3483	PushUps	12	2016-05-04	37	
3484	Miles	1.4	2016-05-04	37	
3485	PushUps	12	2016-05-04	37	
3486	PushUps	100	2016-05-03	4	
3487	Planks	30	2016-05-03	4	
3488	Miles	5	2016-05-03	4	5x1
3489	Miles	3	2016-04-28	4	
3490	PushUps	30	2016-04-28	4	
3491	Miles	1	2016-05-04	9	
3492	Miles	1.6	2016-05-03	9	
3493	Miles	1	2016-05-02	9	
3494	Miles	1.6	2016-04-28	9	
3495	Miles	1.6	2016-04-27	9	
3496	Miles	1	2016-04-26	9	
3497	Miles	1.2	2016-05-05	18	
3498	Miles	1.6	2016-05-05	9	
3499	Miles	3	2016-05-02	24	
3500	PushUps	60	2016-05-06	24	
3501	Planks	60	2016-05-06	24	
3502	Planks	30	2016-05-04	30	@ C4 Crossfit- extra work
3503	Miles	2.5	2016-05-04	30	@ C4 Crossfit- extra work
3504	Miles	0.75	2016-05-06	30	@ C4 Crossfit- extra work
3505	AirSquats	30	2016-05-06	7	
3506	PushUps	20	2016-05-06	7	
3507	Planks	12	2016-05-06	7	
3508	AirSquats	10	2016-05-06	9	
3509	Miles	2.25	2016-05-06	9	
3510	Miles	2.55	2016-05-06	53	
3511	PushUps	30	2016-05-06	53	
3512	Planks	30	2016-05-06	53	
3513	Planks	6	2016-05-06	53	
3514	PushUps	10	2016-05-06	53	
3515	Miles	3.5	2016-05-06	34	
3516	Miles	3.6	2016-05-06	18	
3517	Miles	1.26	2016-05-07	53	
3518	Miles	1.6	2016-05-07	9	
3519	Planks	4	2016-05-07	34	
3520	Miles	2	2016-05-07	34	
3521	Miles	2.5	2016-05-08	23	
3522	Miles	2	2016-05-08	34	
3523	AirSquats	20	2016-05-08	15	
3524	PushUps	120	2016-05-08	15	
3525	Planks	22	2016-05-08	15	
3526	Miles	0.96	2016-05-09	53	
3527	Miles	3	2016-05-09	9	
3528	Miles	2.2	2016-05-09	34	
3529	Miles	0.3	2016-05-09	34	
3530	PushUps	20	2016-05-07	17	
3531	AirSquats	50	2016-05-07	17	
3532	Planks	10	2016-05-07	17	
3533	Miles	6	2016-05-09	17	
3534	PushUps	10	2016-05-09	15	
3535	PushUps	50	2016-05-09	53	
3536	Miles	3	2016-05-09	23	
3537	Miles	3.4	2016-05-08	7	
3538	Miles	3.4	2016-05-09	7	
3539	Planks	18	2016-05-10	30	@ C4 Crossfit- extra work
3540	Miles	0.5	2016-05-10	30	@ C4 Crossfit- extra work
3541	Miles	1.39	2016-05-10	53	
3542	Miles	2	2016-05-10	34	
3543	PushUps	50	2016-05-10	53	
3544	Miles	1	2016-05-10	18	
3545	Miles	0.8	2016-05-10	18	
3546	Miles	1	2016-05-10	23	
3547	Planks	12	2016-05-10	53	
3548	AirSquats	75	2016-05-10	17	
3549	PushUps	20	2016-05-10	17	
3550	Planks	10	2016-05-10	17	
3551	Miles	2	2016-05-10	17	
3552	PushUps	30	2016-05-10	4	
3553	Planks	10	2016-05-10	4	
3554	Miles	3.5	2016-05-10	4	
3555	Miles	4.5	2016-05-11	34	
3556	Miles	1.6	2016-05-11	18	
3557	AirSquats	110	2016-05-11	5	
3558	PushUps	40	2016-05-11	5	
3559	Planks	10	2016-05-11	5	
3560	Miles	1	2016-05-11	5	
3561	Miles	5	2016-05-09	5	
3562	PushUps	20	2016-05-11	53	
3563	PushUps	20	2016-05-12	15	
3564	AirSquats	80	2016-05-11	37	
3565	PushUps	24	2016-05-11	37	
3566	Planks	12	2016-05-11	37	
3567	Miles	1	2016-05-12	37	
3568	Miles	0.5	2016-05-11	30	@ C4 Crossfit- extra work
3569	Planks	36	2016-05-11	30	@ C4 Crossfit- extra work
3570	Miles	1	2016-05-12	30	@ C4 Crossfit- bad hamstring (R)
3571	Miles	1.6	2016-05-12	9	
3572	Miles	1.6	2016-05-11	9	
3573	Miles	3	2016-05-10	9	
3574	Miles	3.2	2016-05-12	34	
3575	Planks	6	2016-05-12	34	
3576	Miles	1	2016-05-12	23	
3577	Miles	1.4	2016-05-12	37	
3578	Miles	1	2016-05-12	30	@ Home on rower- bad hamstring (R)
3579	Miles	1.9	2016-05-12	18	
3580	Planks	11	2016-05-13	18	
3581	Miles	1.3	2016-05-13	18	
3582	PushUps	20	2016-05-13	53	
3583	Planks	10	2016-05-13	53	
3584	AirSquats	100	2016-05-13	4	
3585	PushUps	60	2016-05-13	4	
3586	Planks	25	2016-05-13	4	
3587	Miles	2	2016-05-13	4	Hills
3588	PushUps	24	2016-05-13	37	
3589	Miles	3	2016-05-13	17	
3590	PushUps	20	2016-05-14	17	
3591	PushUps	50	2016-05-15	53	
3592	AirSquats	88	2016-05-15	37	
3593	PushUps	70	2016-05-15	37	
3594	Planks	37	2016-05-15	37	
3595	Miles	2.5	2016-05-15	37	
3596	AirSquats	36	2016-05-16	7	
3597	PushUps	24	2016-05-16	7	
3598	Planks	18	2016-05-16	7	
3599	Miles	5	2016-05-16	24	
3600	Miles	5	2016-05-15	17	
3601	Miles	2	2016-05-16	17	
3602	AirSquats	80	2016-05-16	37	
3603	PushUps	24	2016-05-16	37	
3604	Planks	12	2016-05-16	37	
3605	Miles	1.2	2016-05-16	37	
3606	Miles	3	2016-05-16	9	
3607	Miles	2	2016-05-17	9	
3608	Miles	1	2016-05-16	55	
3609	PushUps	30	2016-05-16	55	
3610	Miles	1	2016-05-12	55	
3611	Miles	1	2016-05-11	55	
3612	Miles	1	2016-05-10	55	
3613	Miles	1	2016-05-09	55	
3614	Miles	1	2016-05-05	55	
3615	AirSquats	50	2016-05-17	17	
3616	PushUps	20	2016-05-17	17	
3617	Miles	1	2016-05-15	23	
3618	Miles	2	2016-05-16	23	
3619	Miles	0.75	2016-05-17	30	@ Home on rower 
3620	Miles	5	2016-05-18	55	
3621	AirSquats	80	2016-05-17	37	
3622	PushUps	50	2016-05-18	53	
3623	Planks	10	2016-05-18	53	
3624	Miles	1.4	2016-05-19	37	
3625	Miles	0.5	2016-05-19	30	@ C4 Crossfit- extra work
3626	Miles	0.75	2016-05-18	30	@ C4 Crossfit- extra work
3627	Planks	10	2016-05-19	17	
3628	Miles	1	2016-05-19	17	
3629	AirSquats	46	2016-05-19	37	
3630	PushUps	24	2016-05-19	37	
3631	Planks	12	2016-05-19	37	
3632	PushUps	60	2016-05-20	53	
3633	Planks	10	2016-05-20	53	
3634	Planks	30	2016-05-21	55	
3635	PushUps	32	2016-05-21	55	
3636	PushUps	10	2016-05-21	55	
3637	Planks	12	2016-05-21	55	
3638	Miles	2	2016-05-20	17	
3639	PushUps	60	2016-05-21	53	
3640	Planks	10	2016-05-21	53	
3641	Miles	3	2016-05-18	23	
3642	Miles	1	2016-05-19	23	
3643	Miles	4	2016-05-22	55	
3644	Planks	30	2016-05-22	55	
3645	AirSquats	100	2016-05-22	55	
3646	PushUps	30	2016-05-22	55	
3647	AirSquats	20	2016-05-22	4	
3648	PushUps	10	2016-05-22	4	
3649	Planks	6	2016-05-22	4	
3650	Miles	3.6	2016-05-22	4	
3651	AirSquats	100	2016-05-22	17	
3652	PushUps	15	2016-05-22	17	
3653	Miles	1	2016-05-22	23	
3654	Miles	1.6	2016-05-18	9	
3655	Miles	4	2016-05-19	9	
3656	AirSquats	20	2016-05-23	9	
3657	Planks	10	2016-05-23	9	
3658	Miles	1.6	2016-05-23	9	
3659	Miles	1.5	2016-05-24	9	
3660	AirSquats	25	2016-05-24	9	
3661	PushUps	60	2016-05-24	53	
3662	Planks	10	2016-05-24	53	
3663	Miles	5	2016-05-24	55	
3664	Miles	3	2016-05-23	23	
3665	Miles	1	2016-05-24	23	
3666	AirSquats	30	2016-05-25	37	
3667	PushUps	48	2016-05-24	37	
3668	Planks	24	2016-05-24	37	
3669	Miles	1.51	2016-05-24	37	
3670	Miles	0.5	2016-05-24	37	
3671	Miles	5	2016-05-26	55	
3672	Miles	3.09	2016-05-26	53	
3673	PushUps	60	2016-05-26	53	
3674	Planks	10	2016-05-26	53	
3675	PushUps	40	2016-05-25	15	
3676	Miles	1.5	2016-05-25	30	@ C4 Crossfit- extra work
3677	Planks	30	2016-05-24	30	@ C4 Crossfit- extra work
3678	Miles	1	2016-05-24	30	@ C4 Crossfit- extra work
3679	Miles	1	2016-05-23	30	@ Home on rower
3680	Miles	1	2016-05-26	23	
3681	AirSquats	40	2016-05-26	17	
3682	PushUps	40	2016-05-26	17	
3683	Planks	30	2016-05-26	17	
3684	PushUps	10	2016-05-26	15	
3685	Planks	15	2016-05-26	15	
3686	Miles	1	2016-05-26	4	
3687	Miles	1	2016-05-24	4	
3688	AirSquats	10	2016-05-24	4	
3689	PushUps	45	2016-05-26	4	
3690	Planks	24	2016-05-26	4	
3691	AirSquats	70	2016-05-26	4	
3692	Miles	1.2	2016-05-26	37	
3693	Shot	1	2016-05-14	18	Done!!!
3694	Miles	1.38	2016-05-27	53	
3695	PushUps	50	2016-05-27	53	
3696	Planks	10	2016-05-27	53	
3697	PushUps	24	2016-05-27	37	
3698	Planks	12	2016-05-27	37	
3699	Miles	1.6	2016-05-27	9	
3700	Miles	1.6	2016-05-26	9	
3701	AirSquats	25	2016-05-28	9	
3702	Miles	3.5	2016-05-29	9	
3703	AirSquats	100	2016-05-29	17	
3704	PushUps	20	2016-05-29	17	
3705	Planks	20	2016-05-30	34	
3706	Miles	2	2016-05-30	30	@ C4 Crossfit
3707	Planks	20	2016-05-30	34	
3708	PushUps	24	2016-05-29	37	
3709	Planks	12	2016-05-29	37	
3710	Miles	2.4	2016-05-31	37	
3711	Planks	12	2016-05-31	30	@ C4 Crossfit- extra work
3712	Miles	0.5	2016-05-31	30	@ C4 Crossfit- extra work
3713	Miles	2.5	2016-05-31	23	
3714	Miles	5	2016-06-01	55	
3715	Miles	1.4	2016-06-01	37	
3716	Miles	1.5	2016-06-01	9	
3717	Miles	1.6	2016-05-31	9	
3718	PushUps	100	2016-06-02	53	
3719	Miles	3.6	2016-06-02	9	
3720	Planks	30	2016-06-02	53	
3721	AirSquats	15	2016-06-02	38	
3722	Planks	11	2016-06-02	38	
3723	PushUps	32	2016-06-02	38	
3724	Miles	1.25	2016-06-02	37	
3725	Miles	5	2016-06-03	55	
3726	PushUps	50	2016-06-03	53	
3727	Planks	10	2016-06-03	53	
3728	Planks	20	2016-06-04	34	
3729	Planks	9	2016-05-31	15	
3730	Planks	9	2016-06-02	15	
3731	Planks	9	2016-06-03	15	
3732	PushUps	50	2016-05-31	15	
3733	PushUps	40	2016-06-03	15	
3734	PushUps	40	2016-06-04	53	
3735	AirSquats	10	2016-06-04	53	
3736	Planks	10	2016-06-04	53	
3737	Miles	1.5	2016-06-03	23	
3738	AirSquats	100	2016-06-04	17	
3739	PushUps	30	2016-06-04	17	
3740	Planks	5	2016-06-04	17	
3741	Miles	0.41	2016-06-05	53	
3742	Planks	15	2016-06-05	17	
3743	Miles	2	2016-06-05	37	
3744	AirSquats	30	2016-06-05	16	
3745	PushUps	30	2016-06-05	16	
3746	Planks	30	2016-06-05	16	
3747	Miles	3.11	2016-06-05	16	
3748	Planks	30	2016-06-05	34	
3749	Miles	0.75	2016-06-03	30	@ C4 Crossfit- extra work
3750	Planks	18	2016-06-03	30	@ C4 Crossfit- extra work
3751	Planks	18	2016-06-06	30	@ C4 Crossfit- extra work
3752	PushUps	30	2016-06-05	53	
3753	Planks	10	2016-06-06	53	
3754	Miles	4	2016-06-06	23	
3755	Miles	2	2016-06-07	23	
3756	Miles	3	2016-06-01	24	
3757	Miles	2	2016-06-05	24	
3758	AirSquats	40	2016-06-06	24	
3759	PushUps	50	2016-06-04	24	
3760	AirSquats	40	2016-06-04	24	
3761	Miles	2	2016-06-07	24	
3762	Miles	0.81	2016-06-08	53	
3763	PushUps	50	2016-06-08	53	
3764	Miles	0.75	2016-06-07	30	@ C4 Crossfit- extra work
3765	Planks	18	2016-06-07	30	@ C4 Crossfit- extra work
3766	Miles	5	2016-06-07	55	
3767	Miles	5	2016-06-09	55	
3768	Planks	12	2016-06-05	37	
3769	Miles	0.72	2016-06-09	53	
3770	PushUps	40	2016-06-09	15	
3771	Planks	4	2016-06-09	15	
3772	PushUps	30	2016-06-09	53	
3773	Miles	1	2016-06-09	23	
3774	AirSquats	7	2016-06-08	16	
3775	Miles	3.11	2016-06-09	16	
3776	Miles	1.85	2016-06-09	37	
3777	Miles	1.56	2016-06-10	53	
3778	PushUps	50	2016-06-10	53	
3779	Planks	18	2016-06-09	30	@ C4 Crossfit- extra work
3780	Miles	0.5	2016-06-09	30	@ C4 Crossfit- extra work
3781	Planks	30	2016-06-11	34	
3782	AirSquats	100	2016-06-11	17	
3783	PushUps	20	2016-06-11	17	
3784	Planks	10	2016-06-11	17	
3785	Miles	1.5	2016-06-11	16	
3786	Planks	10	2016-06-12	34	
3787	Planks	40	2016-06-13	17	
3788	Miles	3	2016-06-12	37	
3789	Miles	3.4	2016-06-03	7	
3790	Miles	3.4	2016-06-10	7	
3791	Miles	1.5	2016-06-13	7	
3792	Planks	2	2016-06-10	7	
3793	Miles	5	2016-06-14	55	
3794	AirSquats	50	2016-06-14	17	
3795	PushUps	20	2016-06-14	17	
3796	Miles	1	2016-06-14	55	
3797	AirSquats	30	2016-06-15	16	
3798	PushUps	30	2016-06-15	16	
3799	Miles	7	2016-06-16	55	
3800	Planks	24	2016-06-16	34	
3801	PushUps	60	2016-06-16	53	
3802	Planks	20	2016-06-16	53	
3803	Miles	1.5	2016-06-18	16	
3804	AirSquats	75	2016-06-15	24	
3805	PushUps	100	2016-06-15	24	
3806	Planks	30	2016-06-15	24	
3807	Miles	4	2016-06-18	24	
3808	PushUps	25	2016-06-19	17	
3809	Planks	10	2016-06-19	17	
3810	Planks	22	2016-06-21	34	
3811	AirSquats	50	2016-06-22	16	
3812	PushUps	10	2016-06-22	16	
3813	Planks	12	2016-06-22	16	
3814	Planks	18	2016-06-22	34	
3815	Miles	0.98	2016-06-23	53	
3816	PushUps	60	2016-06-23	53	
3817	Planks	12	2016-06-23	53	
3818	Miles	1.6	2016-06-23	9	
3819	Miles	6	2016-06-22	9	
3820	Miles	3.6	2016-06-21	9	
3821	Miles	4	2016-06-19	9	
3822	Planks	30	2016-06-23	34	
3823	PushUps	20	2016-06-22	17	
3824	Miles	3.11	2016-06-23	16	
3825	Planks	8	2016-06-24	34	
3826	PushUps	30	2016-06-24	53	
3827	Planks	10	2016-06-24	53	
3828	AirSquats	100	2016-06-25	17	
3829	PushUps	15	2016-06-25	17	
3830	Planks	5	2016-06-25	17	
3831	Miles	2	2016-06-25	16	
3832	Planks	60	2016-06-25	34	
3833	Planks	12	2016-06-26	34	
3834	Planks	10	2016-06-26	17	
3835	AirSquats	55	2016-06-27	9	
3836	AirSquats	10	2016-06-24	9	
3837	PushUps	10	2016-06-24	9	
3838	Planks	6	2016-06-24	9	
3839	Planks	12	2016-06-27	9	
3840	PushUps	40	2016-06-27	53	
3841	Planks	12	2016-06-27	53	
3842	Miles	1.6	2016-06-27	9	
3843	AirSquats	20	2016-06-28	9	
3844	Miles	1.6	2016-06-28	9	
3845	PushUps	45	2016-06-29	53	
3846	Planks	10	2016-06-29	53	
3847	Miles	3.5	2016-06-29	53	
3848	PushUps	45	2016-06-30	53	
3849	Planks	12	2016-06-30	53	
3850	PushUps	15	2016-06-30	53	
3851	Planks	6	2016-06-30	53	
3852	Planks	30	2016-07-01	34	
3853	AirSquats	50	2016-07-04	16	
3854	PushUps	6	2016-07-04	16	
3855	Shot	1	2016-07-04	34	
3856	Miles	2	2016-07-05	30	@ C4 Crossfit- extra work
3857	Planks	15	2016-07-05	30	@ C4 Crossfit- extra work
3858	Planks	10	2016-06-30	17	
3859	PushUps	20	2016-07-03	17	
3860	AirSquats	100	2016-07-03	17	
3861	PushUps	30	2016-07-05	17	
3862	Planks	10	2016-07-05	17	
3863	Miles	1.43	2016-07-05	37	
3864	AirSquats	50	2016-07-06	16	
3865	PushUps	30	2016-07-06	16	
3866	Planks	10	2016-07-06	16	
3867	Miles	2	2016-07-07	30	@ C4 Crossfit- extra work
3868	Planks	9	2016-07-07	30	@ C4 Crossfit- extra work
3869	AirSquats	60	2016-07-06	5	
3870	PushUps	10	2016-07-06	5	
3871	Planks	5	2016-07-07	5	
3872	Miles	25	2016-07-05	5	
3873	PushUps	10	2016-07-03	5	
3874	Miles	15	2016-07-02	5	
3875	Miles	2	2016-07-09	16	
3876	Miles	4.4	2016-07-09	37	
3877	AirSquats	100	2016-07-09	17	
3878	PushUps	10	2016-07-09	17	
3879	Planks	5	2016-07-09	17	
3880	Miles	0.66	2016-07-12	37	
3881	Miles	1	2016-07-13	37	
3882	AirSquats	35	2016-07-16	9	
3883	Miles	10	2016-07-16	24	
3884	AirSquats	100	2016-07-16	24	
3885	PushUps	50	2016-07-16	24	
3886	Planks	60	2016-07-16	24	
3887	AirSquats	100	2016-07-15	24	
3888	AirSquats	20	2016-07-18	9	
3889	AirSquats	100	2016-07-17	17	
3890	PushUps	20	2016-07-17	17	
3891	Planks	20	2016-07-18	17	
3892	Miles	6	2016-07-16	37	
3893	Miles	4	2016-07-17	37	
3894	AirSquats	60	2016-07-19	5	
3895	PushUps	20	2016-07-19	5	
3896	Planks	10	2016-07-19	5	
3897	Miles	3	2016-07-19	5	
3898	Miles	1	2016-07-20	30	@ C4 Crossfit- extra work
3899	Miles	2	2016-07-19	37	
3900	Planks	20	2016-07-21	17	
3901	PushUps	100	2016-07-23	14	30 handstand 70 Burpee
3902	Miles	6	2016-07-24	37	
3903	AirSquats	100	2016-07-26	17	
3904	PushUps	50	2016-07-26	17	
3905	Planks	10	2016-07-26	17	
3906	Planks	9	2016-07-27	30	@ C4 Crossfit- extra work
3907	Miles	1	2016-07-27	30	@ Home on rower
3908	AirSquats	10	2016-07-28	9	
3909	AirSquats	25	2016-07-21	9	
3910	PushUps	10	2016-07-21	9	
3911	PushUps	10	2016-07-28	17	
3912	Planks	5	2016-07-28	17	
3913	Miles	5	2016-07-28	55	
3914	AirSquats	20	2016-07-29	9	
3915	Miles	0.75	2016-07-29	30	@ C4 Crossfit- extra work
3916	AirSquats	100	2016-07-31	17	
3917	PushUps	20	2016-07-31	17	
3918	AirSquats	50	2016-07-31	16	
3919	PushUps	30	2016-07-31	16	
3920	Planks	10	2016-07-31	16	
3921	Miles	6	2016-07-31	37	
3922	PushUps	10	2016-08-01	17	
3923	Planks	20	2016-08-02	17	
3924	AirSquats	15	2016-08-03	9	
3925	Miles	5	2016-08-02	55	
3926	Miles	1	2016-08-03	55	
3927	PushUps	25	2016-08-07	17	
3928	Planks	10	2016-08-07	17	
3929	Miles	2	2016-08-07	23	
3930	Miles	4.5	2016-08-08	23	
3931	Miles	18	2016-08-05	37	
3932	Miles	12	2016-08-06	37	
3933	Miles	1.5	2016-08-09	23	
3934	Miles	1	2016-08-10	23	
3935	Miles	3.2	2016-08-08	19	
3936	Miles	3.25	2016-08-11	19	
3937	AirSquats	20	2016-08-12	17	
3938	PushUps	50	2016-08-12	17	
3939	Planks	10	2016-08-12	17	
3940	AirSquats	30	2016-08-15	17	
3941	PushUps	30	2016-08-15	17	
3942	Planks	20	2016-08-15	17	
3943	AirSquats	25	2016-08-15	9	
3944	AirSquats	25	2016-08-13	9	
3945	Miles	6	2016-08-12	30	Hike to 
3946	Miles	1	2016-08-17	30	@ Home on rower
3947	Planks	27	2016-08-17	30	@ Home
3948	PushUps	20	2016-08-17	17	
3949	AirSquats	30	2016-08-18	17	
3950	PushUps	35	2016-08-18	17	
3951	Planks	15	2016-08-18	17	
3952	Miles	1	2016-08-15	55	
3953	Miles	1	2016-08-16	55	
3954	Miles	1	2016-08-17	55	
3955	Miles	1	2016-08-18	55	
3956	Miles	1	2016-08-19	55	
3957	Planks	12	2016-08-21	17	
3958	Miles	5	2016-08-22	55	
3959	Planks	10	2016-08-23	17	
3960	Miles	1	2016-08-23	55	
3961	Miles	5	2016-08-24	55	
3962	Miles	1.25	2016-08-23	30	@ C4 Crossfit- extra work
3963	Miles	1.25	2016-08-24	30	@ Home on rower
3964	Planks	9	2016-08-23	30	@ C4 Crossfit- extra work
3965	Miles	0.5	2016-08-22	30	@ C4 Crossfit- extra work
3966	Planks	15	2016-08-24	17	
3967	PushUps	50	2016-08-24	17	
3968	Planks	20	2016-08-25	17	
3969	AirSquats	20	2016-08-25	9	
3970	AirSquats	110	2016-08-27	9	
3971	PushUps	50	2016-08-27	9	
3972	Planks	12	2016-08-27	9	
3973	Miles	5	2016-08-26	55	
3974	Miles	1	2016-08-25	55	
3975	Planks	10	2016-08-27	17	
3976	PushUps	20	2016-08-27	17	
3977	AirSquats	100	2016-08-27	9	
3978	AirSquats	100	2016-08-22	24	
3979	PushUps	100	2016-08-22	24	
3980	Miles	20	2016-08-16	24	
3981	Planks	20	2016-08-21	24	
3982	Miles	1.5	2016-08-26	30	@ Home on rower
3983	Miles	5	2016-08-29	55	
3984	PushUps	10	2016-08-29	55	
3985	AirSquats	70	2016-08-29	5	
3986	PushUps	50	2016-08-29	5	
3987	Planks	10	2016-08-29	5	
3988	Miles	6	2016-08-29	5	
3989	PushUps	20	2016-08-29	17	
3990	Planks	15	2016-08-29	17	
3991	AirSquats	20	2016-08-28	9	
3992	AirSquats	100	2016-08-30	9	
3993	PushUps	30	2016-08-30	9	
3994	Planks	18	2016-08-30	9	
3995	Planks	9	2016-08-29	30	@ Home
3996	Planks	9	2016-08-30	30	@ Home
3997	Miles	1.5	2016-08-29	30	@ Home on rower
3998	Miles	1	2016-08-30	30	@ Home on rower
3999	AirSquats	40	2016-08-31	5	
4000	PushUps	20	2016-08-31	5	
4001	Planks	3	2016-08-31	5	
4002	Miles	3	2016-08-31	5	
4003	AirSquats	100	2016-09-01	9	
4004	PushUps	30	2016-09-01	9	
4005	Planks	18	2016-09-01	9	
4006	PushUps	50	2016-09-03	17	
4007	Planks	20	2016-09-03	17	
4008	AirSquats	35	2016-09-04	9	
4009	AirSquats	100	2016-09-03	9	
4010	PushUps	10	2016-09-04	9	
4011	PushUps	30	2016-09-03	9	
4012	Planks	9	2016-09-04	9	
4013	Planks	27	2016-09-03	9	
4014	AirSquats	20	2016-09-04	24	
4015	Miles	3	2016-09-03	24	
4016	Miles	6	2016-09-02	24	
4017	Miles	0.8	2016-09-03	30	@ C4 Crossfit
4018	Miles	2.25	2016-09-05	30	@ C4 Crossfit- extra work
4019	AirSquats	100	2016-09-05	9	
4020	PushUps	30	2016-09-05	9	
4021	Planks	27	2016-09-05	9	
4022	PushUps	20	2016-09-06	17	
4023	Miles	2.25	2016-09-06	30	@ Home interval training
4024	Miles	2.5	2016-09-07	30	@ Home interval training
4025	Planks	15	2016-09-07	30	@ Home
4026	PushUps	50	2016-09-08	17	
4027	Planks	20	2016-09-08	17	
4028	AirSquats	115	2016-09-09	9	
4029	AirSquats	35	2016-09-07	9	
4030	AirSquats	35	2016-09-08	9	
4031	PushUps	10	2016-09-09	9	
4032	Planks	9	2016-09-09	9	
4033	Miles	3	2016-09-09	30	@ Home
4034	AirSquats	100	2016-09-10	9	
4035	PushUps	30	2016-09-10	9	
4036	Planks	27	2016-09-10	9	
4037	AirSquats	300	2016-09-10	55	
4038	PushUps	60	2016-09-10	55	
4039	Planks	42	2016-09-10	55	
4040	Miles	1	2016-09-07	55	
4041	Miles	1	2016-09-08	55	
4042	PushUps	71	2016-09-12	17	
4043	Planks	20	2016-09-12	17	
4044	Planks	30	2016-09-12	30	@ Home
4045	Miles	2.25	2016-09-12	30	@ Home
4046	Miles	1.5	2016-09-13	30	@ Home on rower
4047	Planks	27	2016-09-13	30	@ Home
4048	AirSquats	100	2016-09-14	9	
4049	Planks	10	2016-09-14	9	
4050	PushUps	40	2016-09-14	9	
4051	AirSquats	25	2016-09-04	24	
4052	Miles	2.5	2016-09-14	24	
4053	PushUps	20	2016-09-13	24	
4054	Planks	18	2016-09-14	30	@ C4 Crossfit- extra work
4055	Miles	1	2016-09-14	30	@ C4 Crossfit- extra work
4056	Miles	3.25	2016-09-15	30	@ Home
4057	AirSquats	40	2016-09-16	5	
4058	PushUps	55	2016-09-16	5	
4059	Planks	5	2016-09-16	5	
4060	Miles	3	2016-09-16	5	
4061	Miles	2	2016-09-17	16	
4062	Miles	2.25	2016-09-19	30	@ Home
4063	Miles	1.25	2016-09-19	30	@ C4 Crossfit- extra work
4064	Planks	18	2016-09-19	30	@ C4 Crossfit- extra work
4065	Miles	1	2016-09-20	30	@ Home on rower
4066	AirSquats	120	2016-09-19	9	
4067	Planks	20	2016-09-19	9	
4068	PushUps	40	2016-09-19	9	
4069	AirSquats	30	2016-09-20	16	
4070	PushUps	20	2016-09-20	16	
4071	Planks	10	2016-09-20	16	
4072	Miles	3	2016-09-19	23	
4073	Miles	2.25	2016-09-20	30	@ Home
4074	PushUps	20	2016-09-20	37	
4075	Planks	12	2016-09-20	37	
4076	AirSquats	30	2016-09-21	16	
4077	PushUps	20	2016-09-21	16	
4078	Planks	10	2016-09-21	16	
4079	Miles	2	2016-09-21	16	
4080	Miles	5	2016-09-15	24	
4081	PushUps	16	2016-09-22	37	
4082	Planks	2	2016-09-22	37	
4083	AirSquats	30	2016-09-22	16	
4084	PushUps	20	2016-09-22	16	
4085	Planks	10	2016-09-22	16	
4086	Miles	0.75	2016-09-23	30	@ C4 Crossfit
4087	Miles	3.25	2016-09-23	30	@ Home
4088	Miles	2	2016-09-24	16	
4089	Miles	1.5	2016-09-26	30	@ C4 Crossfit
4090	Miles	2.25	2016-09-26	30	@ Home
4091	Miles	10	2016-09-24	55	
4092	AirSquats	45	2016-09-27	16	
4093	PushUps	30	2016-09-27	16	
4094	Planks	15	2016-09-27	16	
4095	AirSquats	45	2016-09-28	16	
4096	PushUps	30	2016-09-28	16	
4097	Planks	15	2016-09-28	16	
4098	AirSquats	45	2016-09-29	16	
4099	PushUps	30	2016-09-29	16	
4100	Planks	15	2016-09-29	16	
4101	Miles	2	2016-09-29	30	@ Home
4102	AirSquats	30	2016-10-01	16	
4103	PushUps	25	2016-10-01	16	
4104	Planks	10	2016-10-01	16	
4105	Miles	2	2016-10-01	16	
4106	Miles	2.75	2016-10-01	30	@ Home
4107	Miles	2.25	2016-10-03	30	@ Home
4108	Miles	2	2016-10-03	30	@ C4 Crossfit- extra work
4109	Miles	2	2016-10-04	30	@ C4 Crossfit- extra work
4110	Miles	0.5	2016-10-04	30	@ C4 Crossfit- extra work
4111	Miles	2.25	2016-10-05	30	@ Home
4112	AirSquats	60	2016-10-05	16	
4113	PushUps	40	2016-10-05	16	
4114	Planks	20	2016-10-05	16	
4115	Miles	3	2016-10-05	23	
4116	AirSquats	25	2016-10-05	23	
4117	AirSquats	60	2016-10-06	16	
4118	PushUps	40	2016-10-06	16	
4119	Planks	20	2016-10-06	16	
4120	AirSquats	60	2016-10-07	16	
4121	PushUps	40	2016-10-07	16	
4122	Planks	20	2016-10-07	16	
4123	Miles	2	2016-10-08	16	
4124	AirSquats	75	2016-10-11	16	
4125	PushUps	50	2016-10-11	16	
4126	Planks	30	2016-10-11	16	
4127	AirSquats	75	2016-10-12	16	
4128	PushUps	50	2016-10-12	16	
4129	Planks	30	2016-10-12	16	
4130	Miles	3	2016-10-14	30	@ Home
4131	Miles	2	2016-10-15	16	
4132	Miles	1	2016-10-06	23	
4133	Miles	1	2016-10-07	23	
4134	Miles	1	2016-10-10	23	
4135	Miles	1	2016-10-11	23	
4136	Miles	1	2016-10-12	23	
4137	AirSquats	75	2016-10-18	16	
4138	PushUps	50	2016-10-18	16	
4139	Planks	30	2016-10-18	16	
4140	AirSquats	45	2016-10-19	16	
4141	PushUps	25	2016-10-19	16	
4142	Planks	15	2016-10-19	16	
4143	Miles	2	2016-10-23	16	
4144	AirSquats	200	2016-10-24	4	
4145	PushUps	100	2016-10-24	4	
4146	Planks	34	2016-10-24	4	
4147	Miles	3.6	2016-10-24	4	
4148	AirSquats	90	2016-10-27	16	
4149	PushUps	40	2016-10-27	16	
4150	Planks	15	2016-10-27	16	
4151	Miles	2	2016-10-29	16	
4152	AirSquats	50	2016-10-27	4	
4153	PushUps	30	2016-10-27	4	
4154	Planks	10	2016-10-27	4	
4155	AirSquats	50	2016-10-30	4	
4156	Planks	10	2016-10-30	4	
4157	PushUps	30	2016-10-30	4	
4158	AirSquats	65	2016-11-01	16	
4159	PushUps	45	2016-11-01	16	
4160	Planks	25	2016-11-01	16	
4161	Miles	8	2016-11-04	16	
4162	Miles	2	2016-11-07	16	
4163	Miles	5	2016-11-08	16	
4164	Miles	3.2	2016-11-09	16	
4165	Miles	2	2016-11-10	16	
4166	Miles	2	2016-11-12	16	
4167	Miles	3.25	2016-11-07	19	
4168	Miles	3.25	2016-11-08	19	
4169	Miles	3.25	2016-11-09	19	
4170	Miles	3.25	2016-11-17	19	
4171	Miles	3.6	2016-11-14	19	
4172	Miles	3.7	2016-11-15	19	
4173	Miles	3.75	2016-11-16	19	
4174	AirSquats	100	2016-11-17	19	
4175	PushUps	40	2016-11-17	19	
4176	PushUps	10	2016-11-17	19	
4177	Miles	2.75	2016-11-17	19	
4178	Planks	20	2016-11-17	19	
4179	Miles	-3.25	2016-11-17	19	
4180	AirSquats	12	2016-11-19	7	
4181	PushUps	4	2016-11-19	7	
4182	Planks	8	2016-11-19	7	
4183	AirSquats	100	2016-11-18	19	
4184	PushUps	60	2016-11-18	19	
4185	Planks	30	2016-11-18	19	
4186	Miles	3.25	2016-11-18	19	
4187	AirSquats	12	2016-11-19	7	
4188	PushUps	7	2016-11-19	7	
4189	AirSquats	55	2016-11-19	19	
4190	PushUps	40	2016-11-19	19	
4191	Planks	20	2016-11-19	19	
4192	Miles	3.85	2016-11-20	19	
4193	AirSquats	25	2016-11-20	7	
4194	PushUps	3	2016-11-20	7	
4195	Planks	8	2016-11-20	7	
4196	AirSquats	15	2016-11-20	7	
4197	PushUps	2	2016-11-20	7	
4198	Planks	6	2016-11-20	7	
4199	AirSquats	110	2016-11-20	19	
4200	PushUps	60	2016-11-20	19	
4201	Planks	25	2016-11-20	19	
4202	AirSquats	120	2016-11-21	19	
4203	PushUps	60	2016-11-21	19	
4204	Planks	25	2016-11-21	19	
4205	Miles	3.9	2016-11-21	19	
4206	AirSquats	20	2016-11-22	7	
4207	PushUps	3	2016-11-22	7	
4208	Planks	7	2016-11-22	7	
4209	AirSquats	120	2016-11-22	19	
4210	AirSquats	120	2016-11-23	19	
4211	PushUps	75	2016-11-22	19	
4212	PushUps	75	2016-11-23	19	
4213	Planks	30	2016-11-22	19	
4214	Planks	30	2016-11-23	19	
4215	Miles	3.9	2016-11-23	19	
4216	AirSquats	20	2016-11-24	7	
4217	PushUps	5	2016-11-24	7	
4218	Planks	7	2016-11-24	7	
4219	AirSquats	20	2016-11-25	7	
4220	PushUps	6	2016-11-25	7	
4221	Planks	7	2016-11-25	7	
4222	AirSquats	15	2016-11-25	7	
4223	PushUps	3	2016-11-25	7	
4224	Planks	6	2016-11-25	7	
4225	Miles	3	2016-11-25	7	
4226	AirSquats	90	2016-11-24	19	
4227	AirSquats	120	2016-11-25	19	
4228	PushUps	40	2016-11-24	19	
4229	PushUps	60	2016-11-25	19	
4230	Planks	20	2016-11-25	19	
4231	Planks	30	2016-11-24	19	
4232	Miles	3.1	2016-11-24	19	
4233	Miles	3.85	2016-11-25	19	
4234	AirSquats	75	2016-11-26	19	
4235	PushUps	50	2016-11-26	19	
4236	Planks	25	2016-11-26	19	
4237	Miles	3.25	2016-11-26	19	
4238	Miles	2.6	2016-11-26	7	
4239	AirSquats	20	2016-11-26	7	
4240	PushUps	5	2016-11-26	7	
4241	Planks	7	2016-11-26	7	
4242	AirSquats	15	2016-11-26	7	
4243	PushUps	3	2016-11-26	7	
4244	Planks	6	2016-11-26	7	
4245	Miles	1.6	2016-11-26	7	
4246	Miles	1.6	2016-11-26	7	
4247	AirSquats	20	2016-11-27	7	
4248	PushUps	5	2016-11-27	7	
4249	Planks	7	2016-11-27	7	
4250	PushUps	5	2016-11-27	7	
4251	AirSquats	20	2016-11-28	7	
4252	PushUps	6	2016-11-28	7	
4253	Planks	7	2016-11-28	7	
4254	AirSquats	15	2016-11-28	7	
4255	PushUps	4	2016-11-28	7	
4256	Planks	6	2016-11-28	7	
4257	Miles	3	2016-11-28	7	
4258	AirSquats	100	2016-11-28	19	
4259	PushUps	80	2016-11-28	19	
4260	Planks	45	2016-11-28	19	
4261	Miles	3.9	2016-11-28	19	
4262	AirSquats	65	2016-11-29	16	
4263	PushUps	45	2016-11-29	16	
4264	Planks	23	2016-11-29	16	
4265	AirSquats	40	2016-11-29	7	
4266	PushUps	10	2016-11-29	7	
4267	Planks	13	2016-11-29	7	
4268	Miles	3	2016-11-29	7	
4269	AirSquats	150	2016-11-29	19	
4270	PushUps	100	2016-11-29	19	
4271	Planks	50	2016-11-29	19	
4272	Miles	4	2016-11-29	19	
4273	AirSquats	20	2016-11-30	7	
4274	PushUps	6	2016-11-30	7	
4275	Planks	7	2016-11-30	7	
4276	AirSquats	20	2016-11-30	7	
4277	Miles	1.5	2016-11-30	7	
4278	AirSquats	150	2016-11-30	19	
4279	PushUps	100	2016-11-30	19	
4280	Planks	50	2016-11-30	19	
4281	Miles	4	2016-11-30	19	
4282	Miles	1.5	2016-11-30	7	
4283	AirSquats	20	2016-11-30	7	
4284	PushUps	4	2016-11-30	7	
4285	Planks	6	2016-11-30	7	
4286	AirSquats	100	2016-11-30	16	
4287	PushUps	60	2016-11-30	16	
4288	Planks	30	2016-11-30	16	
4289	AirSquats	20	2016-12-01	7	
4290	PushUps	6	2016-12-01	7	
4291	Planks	6	2016-12-01	7	
4292	AirSquats	20	2016-12-01	7	
4293	PushUps	4	2016-12-01	7	
4294	Miles	3	2016-12-01	7	
4295	AirSquats	150	2016-12-01	19	
4296	PushUps	100	2016-12-01	19	
4297	Planks	50	2016-12-01	19	
4298	Miles	4	2016-12-01	19	
4299	AirSquats	40	2016-12-01	16	
4300	PushUps	15	2016-12-01	16	
4301	Planks	10	2016-12-01	16	
4302	PushUps	10	2016-12-02	7	
4303	PushUps	7	2016-12-02	7	
4304	AirSquats	20	2016-12-02	7	
4305	PushUps	4	2016-12-02	7	
4306	AirSquats	20	2016-12-02	7	
4307	AirSquats	150	2016-12-02	19	
4308	PushUps	100	2016-12-02	19	
4309	Planks	60	2016-12-02	19	
4310	Miles	4.5	2016-12-02	19	
4311	Miles	3	2016-12-02	7	
4312	PushUps	5	2016-12-02	7	
4313	PushUps	7	2016-12-03	7	
4314	PushUps	4	2016-12-03	7	
4315	AirSquats	24	2016-12-03	7	
4316	Miles	3	2016-12-03	7	
4317	PushUps	5	2016-12-03	7	
4318	PushUps	5	2016-12-03	7	
4319	Miles	3	2016-12-03	7	
4320	PushUps	13	2016-12-04	7	
4321	PushUps	12	2016-12-04	7	
4322	PushUps	60	2016-12-03	19	
4323	Planks	30	2016-12-03	19	
4324	AirSquats	150	2016-12-04	19	
4325	PushUps	120	2016-12-04	19	
4326	Planks	75	2016-12-04	19	
4327	Miles	6	2016-12-04	19	
4328	PushUps	65	2016-12-03	14	
4329	PushUps	12	2016-12-05	7	
4330	PushUps	13	2016-12-05	7	
4331	AirSquats	150	2016-12-05	19	
4332	PushUps	105	2016-12-05	19	
4333	Planks	60	2016-12-05	19	
4334	AirSquats	6	2016-12-05	19	
4335	AirSquats	-6	2016-12-05	19	
4336	Miles	6	2016-12-05	19	
4337	AirSquats	151	2016-12-06	19	
4338	PushUps	60	2016-12-06	19	
4339	Planks	30	2016-12-06	19	
4340	PushUps	61	2016-12-06	19	
4341	Planks	36	2016-12-06	19	
4342	Miles	3	2016-12-06	7	
4343	PushUps	7	2016-12-06	7	
4344	PushUps	13	2016-12-06	7	
4345	Miles	5.5	2016-12-06	19	
4346	AirSquats	150	2016-12-06	16	
4347	PushUps	75	2016-12-06	16	
4348	Planks	45	2016-12-06	16	
4349	PushUps	13	2016-12-07	7	
4350	PushUps	60	2016-12-07	19	
4351	Planks	31	2016-12-07	19	
4352	Miles	4.5	2016-12-07	19	
4353	PushUps	15	2016-12-07	7	
4354	PushUps	16	2016-12-08	7	
4355	AirSquats	50	2016-12-07	16	
4356	PushUps	25	2016-12-07	16	
4357	Planks	15	2016-12-07	16	
4358	PushUps	7	2016-12-08	7	
4359	Miles	3	2016-12-08	7	
4360	PushUps	7	2016-12-08	7	
4361	PushUps	7	2016-12-08	7	
4362	AirSquats	150	2016-12-08	16	
4363	PushUps	75	2016-12-08	16	
4364	Planks	45	2016-12-08	16	
4365	PushUps	25	2016-12-08	16	
4366	Miles	1	2016-12-07	16	
4367	PushUps	20	2016-12-09	7	
4368	PushUps	10	2016-12-10	7	
4369	PushUps	10	2016-12-10	7	
4370	Miles	6.5	2016-12-10	7	
4371	PushUps	10	2016-12-10	7	
4372	PushUps	10	2016-12-10	7	
4373	PushUps	10	2016-12-10	7	
4374	AirSquats	150	2016-12-11	16	
4375	PushUps	75	2016-12-11	16	
4376	Planks	45	2016-12-11	16	
4377	Miles	1	2016-12-12	16	
4378	AirSquats	150	2016-12-13	16	
4379	PushUps	75	2016-12-13	16	
4380	Planks	45	2016-12-13	16	
4381	AirSquats	150	2016-12-14	16	
4382	PushUps	75	2016-12-14	16	
4383	Planks	45	2016-12-14	16	
4384	Miles	0.5	2016-12-14	16	
4385	Miles	0.5	2016-12-13	16	
4386	AirSquats	100	2016-12-15	16	
4387	PushUps	50	2016-12-15	16	
4388	Planks	30	2016-12-15	16	
4389	AirSquats	50	2016-12-15	16	
4390	PushUps	25	2016-12-15	16	
4391	Planks	15	2016-12-15	16	
4392	Miles	1	2016-12-16	16	
4393	AirSquats	150	2016-12-17	16	
4394	PushUps	75	2016-12-17	16	
4395	Planks	45	2016-12-17	16	
4396	Shot	1	2016-12-18	19	
4397	Miles	1	2016-12-17	16	
4398	Miles	1.2	2016-12-18	16	
4399	AirSquats	100	2016-12-20	16	
4400	PushUps	50	2016-12-20	16	
4401	Planks	30	2016-12-20	16	
4402	Miles	1.5	2016-12-19	16	
4403	AirSquats	100	2016-12-21	16	
4404	PushUps	50	2016-12-21	16	
4405	Planks	30	2016-12-21	16	
4406	AirSquats	50	2016-12-22	16	
4407	PushUps	25	2016-12-22	16	
4408	Planks	15	2016-12-22	16	
4409	AirSquats	150	2016-12-23	16	
4410	PushUps	75	2016-12-23	16	
4411	Planks	30	2016-12-23	16	
4412	Miles	0.6	2016-12-23	16	
4413	Miles	1	2016-12-24	16	
4414	AirSquats	175	2016-12-24	16	
4415	PushUps	100	2016-12-24	16	
4416	Planks	40	2016-12-24	16	
4417	Miles	4.2	2016-12-25	16	
4418	Shot	1	2016-12-25	7	
4419	PushUps	75	2016-12-25	16	
4420	Planks	30	2016-12-25	16	
4421	AirSquats	1	2016-12-25	37	
4422	PushUps	1	2016-12-25	37	
4423	Planks	1	2016-12-25	37	
4424	Shot	1	2016-12-25	37	
4425	Miles	1	2016-12-26	16	
4426	PushUps	50	2016-12-27	16	
4427	Planks	20	2016-12-27	16	
4428	PushUps	50	2016-12-27	16	
4429	Planks	20	2016-12-27	16	
4430	Miles	2.3	2016-12-27	16	
4431	Miles	4.2	2016-12-28	16	
4432	PushUps	175	2016-12-29	16	
4433	Planks	70	2016-12-29	16	
4434	Miles	1.7	2017-01-06	16	
4435	Miles	1.4	2017-01-07	16	
4436	Miles	1	2017-01-10	16	
4437	Miles	1	2017-01-10	29	
4438	Miles	0.6	2017-01-11	16	
4439	Miles	5	2017-01-13	16	
4440	Miles	4.4	2017-01-14	16	
\.


--
-- Name: EXERCISE_ENTRIES_2016_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bacardi
--

SELECT pg_catalog.setval('"EXERCISE_ENTRIES_2016_id_seq"', 4440, true);


--
-- Name: EXERCISE_ENTRIES_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bacardi
--

SELECT pg_catalog.setval('"EXERCISE_ENTRIES_id_seq"', 4378, true);


--
-- Data for Name: USERS; Type: TABLE DATA; Schema: public; Owner: bacardi
--

COPY "USERS" (id, email, username, password, admin, createdate, updatedate) FROM stdin;
3	fkearney8@gmail.com	Frank X Kearney	991620dd073b3af6e73803d7f41a48b9d57d9224	0	2015-01-12 08:47:03.911645	2015-01-12 08:47:03.911645
4	macdonm@umich.edu	macdonm	9652e4747b33145c2a138ef5fbf41230656a9939	0	2015-01-12 08:59:02.402937	2015-01-12 08:59:02.402937
6	dreammemento@gmail.com	Neilsbabymama	bc3889c5978a126377e213ae4519db9ae414491c	0	2015-01-12 09:51:01.438075	2015-01-12 09:51:01.438075
7	bholstine@gmail.com	bholstine	b02a9fb675039f4e2d71fd0b9ab4f1421eae7044	0	2015-01-12 10:49:57.025091	2015-01-12 10:49:57.025091
8	linearalzebra@gmail.com	AHunt	e370abe55f65ff48fcb26065d002694a598190f0	0	2015-01-12 11:51:25.391767	2015-01-12 11:51:25.391767
9	lizannehunt@gmail.com	Liz Hunt	8d8c6cbf35cdffcbb7921e6368260aeedbe884de	0	2015-01-12 12:15:09.240332	2015-01-12 12:15:09.240332
10	castillo.bryan@gmail.com	bcastill	9513ef87bd68e8c4f778325675ddb7863580cbb6	0	2015-01-12 15:29:44.542852	2015-01-12 15:29:44.542852
11	sherwoodhp@gmail.com	sherwoodhp	0f22da8d01dfdff2f4150a635ac8ef34c9160e60	0	2015-01-12 15:53:04.925165	2015-01-12 15:53:04.925165
12	john9art@pobox.com	John	72b3274ee265b65e5cf84d46c75cf216fb566e43	0	2015-01-12 15:57:29.200536	2015-01-12 15:57:29.200536
13	greg.swanson1@gmail.com	JudgeGregg	c8ef5c3e5305f21309215aabbcbd00abd82fead7	0	2015-01-12 17:07:29.100128	2015-01-12 17:07:29.100128
14	phillip.bernard1@gmail.com	ThunderChief	2f99ac724d970b8a57c2093b52be84d11daa0e27	0	2015-01-12 17:11:40.349874	2015-01-12 17:11:40.349874
15	alidaka@gmail.com	Pogo	2bd25827c6a2eaab5e6dcbdbda2ec5453e35ddb5	0	2015-01-12 17:43:26.644565	2015-01-12 17:43:26.644565
16	sara.boncha@gmail.com	sboncha	1c7a166569b8e95d693e04400f941afb29c97100	0	2015-01-12 18:07:59.163246	2015-01-12 18:07:59.163246
17	ayesha_misquith@hotmail.com	ayesham	fe83dd98ae3ccde090288ed5de2b710557a1d013	0	2015-01-12 18:14:29.046858	2015-01-12 18:14:29.046858
18	coopness@gmail.com	Coop	24336824f4e7897def9f75a0ae9f9b693056fb54	0	2015-01-12 18:42:55.838166	2015-01-12 18:42:55.838166
19	barthudson_co@yahoo.com	Luckey Haskins	173092b7292974aeaf38a68ac852d07303a244be	0	2015-01-12 21:19:36.460376	2015-01-12 21:19:36.460376
20	ckearney218@gmail.com	CKearney	352caf4a637ffd608ae588a93dfeba92a5002b9e	0	2015-01-12 21:19:41.824431	2015-01-12 21:19:41.824431
21	Dallanhague@gmail.com	Dallan	097ee1dbe28ad7203936d20be5679bd3dc88e130	0	2015-01-12 21:21:12.863306	2015-01-12 21:21:12.863306
22	jkearney556@gmail.com	joanmbfk	a1a001ba9c725165f44a7f47a4a640bbc16fef45	0	2015-01-12 21:36:32.762611	2015-01-12 21:36:32.762611
23	stirlarra@Gmail.com	stirlarra	83988a56cd9a703bf14d4265caaab3e7e8df70bf	0	2015-01-12 22:09:51.200957	2015-01-12 22:09:51.200957
24	lydia.islan+151@gmail.com	Lydia	fb6facf07004efd07e223f83607a4573ae4918c3	0	2015-01-13 02:31:11.871475	2015-01-13 02:31:11.871475
26	tjgates8@gmail.com	tjgates8	38ca5172d0d3d9a0453e84cd9050e7c0449c2b12	0	2015-01-13 03:14:23.426971	2015-01-13 03:14:23.426971
28	fkearney44@gmail.com	Karnac	f94a62d4d1d18d3d6bfd6f9820caddd1179f6fe2	0	2015-01-13 12:43:15.703774	2015-01-13 12:43:15.703774
29	jboncha2@gmail.com	miahsbelly	9e3b61f06591219a512f07b53d280ede8c910811	0	2015-01-13 18:50:08.280847	2015-01-13 18:50:08.280847
30	cosgriffhernandez@gmail.com	cosgriffhernandez	c3a40f595b0a42b5f9614383aea4bcc53b169082	0	2015-01-14 05:16:18.624521	2015-01-14 05:16:18.624521
31	anheya97@hotmail.com	HY	5717f5aa25baa411782c37cee2f2e2ded3025483	0	2015-01-14 05:53:48.864522	2015-01-14 05:53:48.864522
32	jimspappy@gmail.com	Jim	a90f8fcb5cfcf39cae5c5be9f4e1c72e43888fdc	0	2015-01-14 22:05:50.874825	2015-01-14 22:05:50.874825
33	rutishau@amazon.com	SamR	0c0c918868864cdbf45bddc85f344b68956f7580	0	2015-01-15 21:38:26.946129	2015-01-15 21:38:26.946129
34	kyraolds@gmail.com	kyraperrigo	96be64d5da7f0383dd5ef1c20ea21fd84408bb27	0	2015-01-15 23:32:32.418743	2015-01-15 23:32:32.418743
35	ktkearney7@gmail.com	Kate	58248fc8d6bae5f9ddfd6ac55408538fc15e7ef0	0	2015-01-19 01:07:08.576372	2015-01-19 01:07:08.576372
36	alpha.chen+151challenge@gmail.com	kejadlen	fa974d24d2f36d3b5bd0569a586bdf07eda1339a	0	2015-01-20 01:19:46.119399	2015-01-20 01:19:46.119399
37	bzzkill@gmail.com	dab	da94684760b77de5770f93bcfa61e5bc72fa2e0a	0	2015-01-20 17:39:36.165013	2015-01-20 17:39:36.165013
38	trungfoo@gmail.com	Trungfoo	e96c72fea3b0d725a477aa1e5e0e5915f54784e9	0	2015-01-21 01:16:33.201687	2015-01-21 01:16:33.201687
39	a.brooklee@gmail.com	trungsbuddy	fcdf9e061ef2a2c1ff35e55fe233e667380698e0	0	2015-01-21 20:42:05.242093	2015-01-21 20:42:05.242093
40	striker257@hotmail.com	Pineapple	6db7ee347c2faec6d57dce1f89866ce02eeb13bf	0	2015-01-22 00:45:24.174424	2015-01-22 00:45:24.174424
41	dsteventran@gmail.com	neilpallaversmells	3a17dc1cdbfd2860b16cab95c1d4ad4f3ecbba77	0	2015-01-23 01:15:43.786748	2015-01-23 01:15:43.786748
42	apollund@gmail.com	askoglund	fad01085410ede4b9bc1060f7ed954e6d870b848	0	2015-03-03 13:56:52.927468	2015-03-03 13:56:52.927468
5	pallaver@gmail.com	pallaver	12fb9dfe504c2ba28eb2634be12458002815d023	0	2015-01-12 09:38:35.913133	2016-01-11 07:01:41.571669
43	Youngbyle@gmail.com	Ajyoung 	5f587d680c8e0372df13a86f77bbd3a4f7626367	0	2016-01-15 05:30:55.470044	2016-01-15 05:30:55.470044
44	llw5@case.edu	thelloyd	fbbf14e0dcdfd32c09d85c1591c9c222b421a5d8	0	2016-01-15 19:14:00.588615	2016-01-15 19:14:00.588615
45	andreajyoung@gmail.com	andreayoung	5f587d680c8e0372df13a86f77bbd3a4f7626367	0	2016-01-15 22:10:39.546239	2016-01-15 22:10:39.546239
46	matthew.galen@gmail.com	MattGalen	c7305307f5224281571e64f4d9e1019a544aebba	0	2016-01-16 15:35:12.168429	2016-01-16 15:35:12.168429
25	agdavison@gmail.com	Alan Davison	52b46f493b028e52eb0f15504a94a355be451adf	0	2015-01-13 03:01:24.469446	2016-01-18 18:25:39.2043
47	oregonyouthultimate@gmail.com	abuermeyer	f3d250f29fc5cf2c457dd8169fc9752dbc3bdab3	0	2016-01-18 22:55:19.83346	2016-01-18 22:55:19.83346
48	wright9693@gmail.com	donwright	33daccd7428d2734b62ea411d9175f209765d3e9	0	2016-01-18 23:09:52.987576	2016-01-18 23:09:52.987576
49	Gperrigo@gmail.com	Grant	6e6ae18fd1adcbbe24a23f5118399d970de2d5b1	0	2016-01-19 19:18:27.027389	2016-01-19 19:18:27.027389
50	charlesfilson@gmail.com	charlesfilson	114f89dab529accd132f8347d41bcf81906cbaa4	0	2016-01-20 22:31:25.333207	2016-01-20 22:31:25.333207
51	ca5@hotmail.com	chrisxander	4337d5afd48cf985054bfa0afe78b6ff497715e8	0	2016-01-21 04:38:45.127885	2016-01-21 04:38:45.127885
52	anheya97@hotmail.com 	Heeyoung	eec1371f8186990f5f2e5b0bdb397406a6d730a6	0	2016-01-21 07:09:36.34312	2016-01-21 07:09:36.34312
53	alain@aracnet.com	alain	3a4549bc12502009b2c90db55aa06def5e141258	0	2016-01-28 05:05:56.14056	2016-01-28 05:05:56.14056
54	tabithaw.lindsay@gmail.com	TabithaLindsay	de62cc8c6560ffbc567abe12fbf5c84e6b726255	0	2016-01-29 08:27:35.316388	2016-01-29 08:27:35.316388
55	edward@echo22.com	scurrrrrrrrrrvy	65e5f2ebab9964123723b8de12469a4b9f55f1e7	0	2016-03-01 22:16:50.55712	2016-03-01 22:16:50.55712
56	Dreammemento@gmail.com	JennNbaby	47c878beda80b127306bd34641f16379c085c2c0	0	2016-03-15 07:26:33.954874	2016-03-15 07:26:33.954874
57	balavenb@amazon.com	balal1808	330eacce735582b6c19aa84694683c4946e62f78	0	2016-10-13 23:14:16.290055	2016-10-13 23:14:16.290055
\.


--
-- Data for Name: play_evolutions; Type: TABLE DATA; Schema: public; Owner: bacardi
--

COPY play_evolutions (id, hash, applied_at, apply_script, revert_script, state, last_problem) FROM stdin;
1	87a78f58d3add81206bccec1c2bed87dda6d424d	2015-01-12 00:00:00	CREATE OR REPLACE FUNCTION SET_UPDATE_DATE()\nRETURNS TRIGGER AS $$\nBEGIN\nNEW.updateDate = CURRENT_TIMESTAMP;;\nRETURN NEW;;\nEND;;\n$$ language 'plpgsql';\n\n\nDROP SEQUENCE IF EXISTS USER_ID_SEQUENCE;\n\nCREATE SEQUENCE USER_ID_SEQUENCE INCREMENT BY 1 START WITH 1 NO CYCLE;\n\nDROP TABLE IF EXISTS "USERS" CASCADE;\n\nCREATE TABLE "USERS" (\nid           INTEGER      NOT NULL PRIMARY KEY DEFAULT NEXTVAL('USER_ID_SEQUENCE'),\nemail        VARCHAR(255) NOT NULL,\nusername     VARCHAR(100) NOT NULL,\npassword     VARCHAR(255) NOT NULL,\nadmin        INTEGER      NOT NULL default 0,\ncreateDate   TIMESTAMP    NOT NULL default CURRENT_TIMESTAMP,\nupdateDate   TIMESTAMP    NOT NULL default CURRENT_TIMESTAMP\n);\n\nCREATE UNIQUE INDEX i_users_email on "USERS" (email);\nCREATE UNIQUE INDEX i_username on "USERS" (username);\n\nCREATE TRIGGER SET_USERS_UPDATE_DATE BEFORE UPDATE ON "USERS"\nFOR EACH ROW EXECUTE PROCEDURE SET_UPDATE_DATE();	DROP TABLE "USERS" CASCADE;\nDROP SEQUENCE USER_ID_SEQUENCE;\nDROP FUNCTION SET_UPDATE_DATE;	applied	
2	83f3ecfa0fbf3d7a78bf4e0982f023d90369b879	2015-01-12 00:00:00	DROP TABLE IF EXISTS "EXERCISE_ENTRIES" CASCADE;\n\nCREATE TABLE "EXERCISE_ENTRIES" (\nid SERIAL NOT NULL PRIMARY KEY,\nexerciseType varchar(64) NOT NULL,\nreps DECIMAL,\ndateDone DATE NOT NULL,\nuserId INTEGER NOT NULL,\ncomment TEXT,\nFOREIGN KEY (userId) REFERENCES "USERS" (id)\n);	DROP TABLE "EXERCISE_ENTRIES";	applied	
3	0dbce8a5f0c056f2cf1f59321317d18c4674387a	2016-01-11 00:00:00	ALTER TABLE "EXERCISE_ENTRIES" RENAME TO "EXERCISE_ENTRIES_2015";\n\nCREATE TABLE "EXERCISE_ENTRIES_2016" (\nid SERIAL NOT NULL PRIMARY KEY,\nexerciseType varchar(64) NOT NULL,\nreps DECIMAL,\ndateDone DATE NOT NULL,\nuserId INTEGER NOT NULL,\ncomment TEXT,\nFOREIGN KEY (userId) REFERENCES "USERS" (id)\n);	ALTER TABLE "EXERCISE_ENTRIES_2015" RENAME TO "EXERCISE_ENTRIES";\nDROP TABLE "EXERCISE_ENTRIES_2016" CASCADE;	applied	
\.


--
-- Name: user_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: bacardi
--

SELECT pg_catalog.setval('user_id_sequence', 57, true);


--
-- Name: EXERCISE_ENTRIES_2016_pkey; Type: CONSTRAINT; Schema: public; Owner: bacardi; Tablespace: 
--

ALTER TABLE ONLY "EXERCISE_ENTRIES_2016"
    ADD CONSTRAINT "EXERCISE_ENTRIES_2016_pkey" PRIMARY KEY (id);


--
-- Name: EXERCISE_ENTRIES_pkey; Type: CONSTRAINT; Schema: public; Owner: bacardi; Tablespace: 
--

ALTER TABLE ONLY "EXERCISE_ENTRIES_2015"
    ADD CONSTRAINT "EXERCISE_ENTRIES_pkey" PRIMARY KEY (id);


--
-- Name: USERS_pkey; Type: CONSTRAINT; Schema: public; Owner: bacardi; Tablespace: 
--

ALTER TABLE ONLY "USERS"
    ADD CONSTRAINT "USERS_pkey" PRIMARY KEY (id);


--
-- Name: play_evolutions_pkey; Type: CONSTRAINT; Schema: public; Owner: bacardi; Tablespace: 
--

ALTER TABLE ONLY play_evolutions
    ADD CONSTRAINT play_evolutions_pkey PRIMARY KEY (id);


--
-- Name: i_username; Type: INDEX; Schema: public; Owner: bacardi; Tablespace: 
--

CREATE UNIQUE INDEX i_username ON "USERS" USING btree (username);


--
-- Name: i_users_email; Type: INDEX; Schema: public; Owner: bacardi; Tablespace: 
--

CREATE UNIQUE INDEX i_users_email ON "USERS" USING btree (email);


--
-- Name: set_users_update_date; Type: TRIGGER; Schema: public; Owner: bacardi
--

CREATE TRIGGER set_users_update_date BEFORE UPDATE ON "USERS" FOR EACH ROW EXECUTE PROCEDURE set_update_date();


--
-- Name: EXERCISE_ENTRIES_2016_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bacardi
--

ALTER TABLE ONLY "EXERCISE_ENTRIES_2016"
    ADD CONSTRAINT "EXERCISE_ENTRIES_2016_userid_fkey" FOREIGN KEY (userid) REFERENCES "USERS"(id);


--
-- Name: EXERCISE_ENTRIES_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bacardi
--

ALTER TABLE ONLY "EXERCISE_ENTRIES_2015"
    ADD CONSTRAINT "EXERCISE_ENTRIES_userid_fkey" FOREIGN KEY (userid) REFERENCES "USERS"(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

