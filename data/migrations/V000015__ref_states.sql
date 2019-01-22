CREATE TABLE ref_states (
    state_code character varying(2),
    state_description character varying(200)
);


COPY ref_states (state_code, state_description) FROM stdin;
AL	Alabama
AK	Alaska
AS	American Samoa
AZ	Arizona
AR	Arkansas
CA	California
CO	Colorado
CT	Connecticut
DE	Delaware
DC	District Of Columbia
FL	Florida
GA	Georgia
GU	Guam
HI	Hawaii
ID	Idaho
IL	Illinois
IN	Indiana
IA	Iowa
KS	Kansas
KY	Kentucky
LA	Louisiana
ME	Maine
MP	Northern Mariana Islands
MD	Maryland
MA	Massachusetts
MI	Michigan
MN	Minnesota
MS	Mississippi
MO	Missouri
MT	Montana
NE	Nebraska
NV	Nevada
NH	New Hampshire
NJ	New Jersey
NM	New Mexico
NY	New York
NC	North Carolina
ND	North Dakota
OH	Ohio
OK	Oklahoma
OR	Oregon
PA	Pennsylvania
PR	Puerto Rico
RI	Rhode Island
SC	South Carolina
SD	South Dakota
TN	Tennessee
TX	Texas
UT	Utah
VT	Vermont
VI	U.S. Virgin Islands
VA	Virginia
WA	Washington
WV	West Virginia
WI	Wisconsin
WY	Wyoming
ZZ	Foreign Countries
US	United States
AA	Armed Forces Americas
AE	Armed Forces Europe
AP	Armed Forces Pacific
\.



