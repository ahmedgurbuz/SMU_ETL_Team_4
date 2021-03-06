-- Create table and insert state names and ids
CREATE TABLE states(
	state_id int PRIMARY KEY,
	state_name varchar(50)
 );

INSERT INTO states (state_id, state_name)
VALUES
(	1	,	'Alabama'	)	,
(	2	,	'Alaska'	)	,
(	3	,	'Arizona'	)	,
(	4	,	'Arkansas'	)	,
(	5	,	'California'	)	,
(	6	,	'Colorado'	)	,
(	7	,	'Connecticut'	)	,
(	8	,	'Delaware'	)	,
(	9	,	'District of Columbia'	)	,
(	10	,	'Florida'	)	,
(	11	,	'Georgia'	)	,
(	12	,	'Hawaii'	)	,
(	13	,	'Idaho'	)	,
(	14	,	'Illinois'	)	,
(	15	,	'Indiana'	)	,
(	16	,	'Iowa'	)	,
(	17	,	'Kansas'	)	,
(	18	,	'Kentucky'	)	,
(	19	,	'Louisiana'	)	,
(	20	,	'Maine'	)	,
(	21	,	'Maryland'	)	,
(	22	,	'Massachusetts'	)	,
(	23	,	'Michigan'	)	,
(	24	,	'Minnesota'	)	,
(	25	,	'Mississippi'	)	,
(	26	,	'Missouri'	)	,
(	27	,	'Montana'	)	,
(	28	,	'Nebraska'	)	,
(	29	,	'Nevada'	)	,
(	30	,	'New Hampshire'	)	,
(	31	,	'New Jersey'	)	,
(	32	,	'New Mexico'	)	,
(	33	,	'New York'	)	,
(	34	,	'North Carolina'	)	,
(	35	,	'North Dakota'	)	,
(	36	,	'Ohio'	)	,
(	37	,	'Oklahoma'	)	,
(	38	,	'Oregon'	)	,
(	39	,	'Pennsylvania'	)	,
(	40	,	'Rhode Island'	)	,
(	41	,	'South Carolina'	)	,
(	42	,	'South Dakota'	)	,
(	43	,	'Tennessee'	)	,
(	44	,	'Texas'	)	,
(	45	,	'Utah'	)	,
(	46	,	'Vermont'	)	,
(	47	,	'Virginia'	)	,
(	48	,	'Washington'	)	,
(	49	,	'West Virginia'	)	,
(	50	,	'Wisconsin'	)	,
(	51	,	'Wyoming'	);

-- Create table named overdose
CREATE TABLE overdose (
    state_name varchar(30) primary key,
    population varchar(30),
    deaths varchar(30),
    abbrev varchar(4)    
);

-- Create table named prescriber
CREATE TABLE prescriber (
    state_name varchar(30),
    gender varchar(4),
    specialty varchar(100)    
);

-- Create table named age_adjusted_rate
CREATE TABLE age_adjusted_rate (
    state_name varchar(30) PRIMARY KEY,
    opioid_death_rate varchar(10),
    all_overdose_rate varchar(10),
	opioid_percent_change varchar(10),
	overdose_percent_change varchar(10)	
);

-- Define key relationship between tables
ALTER TABLE "overdose" ADD CONSTRAINT "fk_overdose_state_name" FOREIGN KEY("state_name")
REFERENCES "states" ("state_name");
ALTER TABLE "prescriber" ADD CONSTRAINT "fk_prescriber_state_name" FOREIGN KEY("state_name")
REFERENCES "states" ("state_name");
ALTER TABLE "age_adjusted_rate" ADD CONSTRAINT "fk_age_adjusted_rate_state_name" FOREIGN KEY("state_name")
REFERENCES "states" ("state_name");

-- Join overdose and prescriber table on state_name

SELECT overdose.state_name, overdose.population, prescriber.gender, prescriber.specialty
FROM overdose
FULL JOIN prescriber ON overdose.abbrev = prescriber.state_name;