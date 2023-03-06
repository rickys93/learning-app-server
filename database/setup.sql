DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS tokens;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS answers;
DROP TABLE IF EXISTS user_answers;

CREATE TABLE users (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE tokens (
  id INT PRIMARY KEY,
  user_id INT NOT NULL,
  token VARCHAR(255) NOT NULL,
  expiration TIMESTAMP NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE categories (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description VARCHAR(500) NOT NULL
);

CREATE TABLE questions (
  id INT PRIMARY KEY,
  category_id INT NOT NULL,
  question TEXT NOT NULL,
  FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE answers (
  id INT PRIMARY KEY,
  question_id INT NOT NULL,
  answer TEXT NOT NULL,
  correct BOOLEAN NOT NULL,
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE user_answers (
  user_id INT NOT NULL,
  question_id INT NOT NULL,
  answer_id INT NOT NULL,
  correct BOOLEAN NOT NULL,
  timestamp TIMESTAMP NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (answer_id) REFERENCES answers(id),
  PRIMARY KEY (user_id, question_id, timestamp)
);

INSERT INTO categories (id, name, description)
VALUES
  (1, 'History', 'Questions related to historical events'),
  (2, 'Art', 'Questions related to scientific concepts'),
  (3, 'Music', 'Questions related to music'),
  (4, 'English', 'Questions related to English grammar and literature'),
  (5, 'Math', 'Questions related to mathematical concepts'),
  (6, 'Physics', 'Questions related to physics'' concepts'),
  (7, 'Chemistry', 'Questions related to chemistry'),
  (8, 'Biology', 'Questions related to bilogy, health and environement');

INSERT INTO questions (id, category_id, question)
VALUES
  (1, 1, 'In which  year the second world war started?'),
  (2, 1, 'Who was British Prime Minister when WWII started?'),
  (3, 1, 'When did the reign of Queen Elizabeth II start?'),
  (4, 1, 'How many Cabinet positions are currently in the government of the United Kingdom?'),
  (5, 1, 'How old was Mary Queen of Scots when she became queen?'),
  (6, 1, 'What word is used to describe the circular configuration of Edward I''s new castles in Wales?'),
  (7, 1, 'What was the name of Edward III''s son, who fought at the Battle of Crecy In 1346?'),
  (8, 1, 'Who commanded the Scottish forces at the Battle of Bannockburn in 1314?'),
  (9, 1, 'Which British commander during the Great War was referred to by his critics as "the Butcher of the Somme"?'),
  (10, 1, 'Which monarch signed the royal assent to the Reform Bill, thus completing its passage into law?'),
  (11, 2, 'Who painted Mona Lisa?'),
  (12, 2, 'Who is the author of sculpture of David?'),
  (13, 2, 'Who was an architect designing the St. Paus''s Cathedral?'),
  (14, 2, 'Which artist was a pioneer of Abstract Expressionism?'),
  (15, 2, 'Who is known as the father of European painting?'),
  (16, 2, 'Who is the author of this painting?'),
  (17, 2, 'Who is the author of this painting?'),
  (18, 2, 'Who is the author of this painting?'),
  (19, 2, 'Who sculpted the Pietà at St. Peter''s Basilica in Rome?'),
  (20, 2, 'What material was used to build the Statue of Liberty?'),
  (21, 3, 'Who was the lead singer of Nirvana?'),
  (22, 3, '"Firestarter" was a UK number one single for which group?'),
  (23, 3, 'What was Elvis Presley''s home called?'),
  (24, 3, 'Which group had the most UK number one singles in the 1960s?'),
  (25, 3, 'Gordon Sumner is the real name of which musician?'),
  (26, 3, 'Which Queen''s song has the lyrics “Is this the real life? Is this just fantasy?"'),
  (27, 3, 'Which country is Gangnam Style singer PSY from?'),
  (28, 3, 'What country is Rita Ora from?'),
  (29, 3, 'What did Ed Sheeran buy when he earned a Number One with his album?'),
  (30, 3, 'Whose song is “Halo”?'),
  (31, 4, 'Which two cities are the settings for Charles Dickens'' A Tale of Two Cities?'),
  (32, 4, 'Elizabeth Bennet is the protagonist of which Jane Austen novel?'),
  (33, 4, 'What pen name did Mary Anne Evans write her novels under?'),
  (34, 4, 'Which of these works is not by Geoffrey Chaucer? '),
  (35, 4, 'Which of the Harry Potter books was first?'),
  (36, 4, 'An example of figurative language which treats one thing as if it were another.'),
  (37, 4, 'Complete the sentence: Gordon, ...... nephew you met yesterday, will be visiting later.'),
  (38, 4, 'Complete the sentence: The ...... into the incident continued for several hours, with dozens of people being .....'),
  (39, 4, 'Which would be the modern equivalent of "thine"?'),
  (40, 4, 'A word which would only be used in an informal, familiar context is described as a...'),
  (41, 5, 'Decreased means:'),
  (42, 5, 'Circle:'),
  (43, 5, 'Probability:'),
  (44, 5, 'Symmetry:'),
  (45, 5, 'Scalene triangle:'),
  (46, 5, 'Combine:'),
  (47, 5, 'Cube:'),
  (48, 5, 'What is the term for any positive integer greater than 1 that is divisible only by itself and 1?'),
  (49, 5, 'What quantity is calculated by the formula hb/2?'),
  (50, 5, 'In Roman numerals, what is represented by the letter C?'),
  (51, 6, 'Who formulated the simple mathematical law governing the electrical resistance of materials?'),
  (52, 6, 'What is the unit of charge?'),
  (53, 6, 'What is electrical current?'),
  (54, 6, 'What is heated to produce steam in power stations?'),
  (55, 6, 'Which of the following is/are associated with the term "renewable energy"?'),
  (56, 6, 'What materials are used as fuels in nuclear power stations?'),
  (57, 6, 'What forces are assumed to exist between particles in a gas?'),
  (58, 6, 'As a substance changes state from a liquid to a gas, the amount of energy the particles have …'),
  (59, 6, 'What is the formula for gravitational potential energy?'),
  (60, 6, 'A lens which focuses light to a point is called a what?'),
  (61, 7, 'The mass number of an element tells us...'),
  (62, 7, 'The electrons are found...'),
  (63, 7, 'The copper oxide that is produced when copper carbonate is heated is what colour?'),
  (64, 7, 'What is used to identify an unsaturated compound?'),
  (65, 7, 'What type of bonding is present in metals?'),
  (66, 7, 'Mendeleev used what property of elements to sort them in his table?'),
  (67, 7, 'The non-metals are found...'),
  (68, 7, 'Carbon dioxide entered the early atmosphere when it was released from...'),
  (69, 7, 'Oxygen started to appear on Earth due to what organisms?'),
  (70, 7, 'A catalyst speeds up a chemical reaction by...'),
  (71, 8, 'Your body can develop a natural immunity to certain pathogens. What is the name of the cells responsible for this?'),
  (72, 8, 'In which gland are FSH and LH produced?'),
  (73, 8, 'Which two human sense organs have receptors specifically sensitive to chemicals?'),
  (74, 8, 'Which of the following are effectors?'),
  (75, 8, 'What part of the bacteria controls resistance?'),
  (76, 8, 'What is the chemical that causes cramp?'),
  (77, 8, 'Which of the following can be used to help protect your body from microorganisms?'),
  (78, 8, 'Why do polar bears have white fur?'),
  (79, 8, 'According to Darwin, new species evolve by which process?'),
  (80, 8, 'Why are antibiotics no good for treating colds and flu?');

INSERT INTO answers (id, question_id, answer, correct)
VALUES
  (	1	,	1	,	'	1938	'	,	FALSE	)	,
(	2	,	1	,	'	1940	'	,	FALSE	)	,
(	3	,	1	,	'	1939	'	,	TRUE	)	,
(	4	,	1	,	'	1941	'	,	FALSE	)	,
(	5	,	2	,	'	Neville Chamberlain	'	,	TRUE	)	,
(	6	,	2	,	'	Clement Attlee	'	,	FALSE	)	,
(	7	,	2	,	'	Sir Winston Churchill	'	,	FALSE	)	,
(	8	,	2	,	'	Stanley Baldwin	'	,	FALSE	)	,
(	9	,	3	,	'	6.02.1952	'	,	TRUE	)	,
(	10	,	3	,	'	8.10.1953	'	,	FALSE	)	,
(	11	,	3	,	'	2.06.1950	'	,	FALSE	)	,
(	12	,	3	,	'	9.08.1951	'	,	FALSE	)	,
(	13	,	4	,	'	20	'	,	FALSE	)	,
(	14	,	4	,	'	22	'	,	TRUE	)	,
(	15	,	4	,	'	24	'	,	FALSE	)	,
(	16	,	4	,	'	26	'	,	FALSE	)	,
(	17	,	5	,	'	1 year old	'	,	FALSE	)	,
(	18	,	5	,	'	10 years old	'	,	FALSE	)	,
(	19	,	5	,	'	6 days old	'	,	TRUE	)	,
(	20	,	5	,	'	On the day she was born	'	,	FALSE	)	,
(	21	,	6	,	'	Circular	'	,	FALSE	)	,
(	22	,	6	,	'	Round	'	,	FALSE	)	,
(	23	,	6	,	'	Concentric	'	,	TRUE	)	,
(	24	,	6	,	'	Orotund	'	,	FALSE	)	,
(	25	,	7	,	'	Edward Longshanks	'	,	FALSE	)	,
(	26	,	7	,	'	Piers Gaveston	'	,	FALSE	)	,
(	27	,	7	,	'	Edward the Black Prince	'	,	TRUE	)	,
(	28	,	7	,	'	John of Gaunt	'	,	FALSE	)	,
(	29	,	8	,	'	William Wallace	'	,	FALSE	)	,
(	30	,	8	,	'	Macbeth	'	,	FALSE	)	,
(	31	,	8	,	'	Edward Bruce	'	,	FALSE	)	,
(	32	,	8	,	'	Robert the Bruce	'	,	TRUE	)	,
(	33	,	9	,	'	Sir John French	'	,	FALSE	)	,
(	34	,	9	,	'	Rawlinson	'	,	FALSE	)	,
(	35	,	9	,	'	Lord Kitchener	'	,	FALSE	)	,
(	36	,	9	,	'	Haig	'	,	TRUE	)	,
(	37	,	10	,	'	Queen Victoria	'	,	FALSE	)	,
(	38	,	10	,	'	George IV	'	,	FALSE	)	,
(	39	,	10	,	'	William IV	'	,	TRUE	)	,
(	40	,	10	,	'	George III	'	,	FALSE	)	,
(	41	,	11	,	'	Michelangelo	'	,	FALSE	)	,
(	42	,	11	,	'	Leonardo Da Vinci	'	,	TRUE	)	,
(	43	,	11	,	'	Donatello	'	,	FALSE	)	,
(	44	,	11	,	'	Raphael	'	,	FALSE	)	,
(	45	,	12	,	'	Sandro Boticelli	'	,	FALSE	)	,
(	46	,	12	,	'	Michelangelo	'	,	TRUE	)	,
(	47	,	12	,	'	Giambologna	'	,	FALSE	)	,
(	48	,	12	,	'	Benvenuto Cellini	'	,	FALSE	)	,
(	49	,	13	,	'	Sir Christopher Wren	'	,	TRUE	)	,
(	50	,	13	,	'	John Nash	'	,	FALSE	)	,
(	51	,	13	,	'	Augustus Pugin	'	,	FALSE	)	,
(	52	,	13	,	'	Joseph Paxton	'	,	FALSE	)	,
(	53	,	14	,	'	John Altoon	'	,	FALSE	)	,
(	54	,	14	,	'	Romare Bearden	'	,	FALSE	)	,
(	55	,	14	,	'	Charles Alston	'	,	FALSE	)	,
(	56	,	14	,	'	Jackson Pollock	'	,	TRUE	)	,
(	57	,	15	,	'	Pierre Auguste Renoir	'	,	FALSE	)	,
(	58	,	15	,	'	Giotto	'	,	TRUE	)	,
(	59	,	15	,	'	Walter Satterlee	'	,	FALSE	)	,
(	60	,	15	,	'	Adolf Waldinge	'	,	FALSE	)	,
(	61	,	16	,	'	Slavery! Slavery! - by Kara Walker	'	,	FALSE	)	,
(	62	,	16	,	'	Nocturne in Black and Gold, the Falling Rocket - by James McNeill Whistler	'	,	FALSE	)	,
(	63	,	16	,	'	The Persistence of Memory -by Salvador Dalí	'	,	FALSE	)	,
(	64	,	16	,	'	The Starry Night - by Vincent Van Gogh	'	,	TRUE	)	,
(	65	,	17	,	'	Woman at Her Toilette - by Berthe Morisot	'	,	FALSE	)	,
(	66	,	17	,	'	Young Lady in 1866 - by Édouard Manet	'	,	FALSE	)	,
(	67	,	17	,	'	Girl with a Pearl Earring - by Johannes Vermeer	'	,	TRUE	)	,
(	68	,	17	,	'	The Birth of Venus - by Sandro Botticelli	'	,	FALSE	)	,
(	69	,	18	,	'	Les Fétiches - by Lois Mailou Jones	'	,	FALSE	)	,
(	70	,	18	,	'	Judith Beheading Holofernes - by Artemisia Gentileschi	'	,	FALSE	)	,
(	71	,	18	,	'	The Scream - by Edvard Munch	'	,	TRUE	)	,
(	72	,	18	,	'	American People #20: Die - by Faith Ringgold	'	,	FALSE	)	,
(	73	,	19	,	'	Michelangelo	'	,	TRUE	)	,
(	74	,	19	,	'	Leonardo da Vinci	'	,	FALSE	)	,
(	75	,	19	,	'	Raphael	'	,	FALSE	)	,
(	76	,	19	,	'	Auguste Rodin	'	,	FALSE	)	,
(	77	,	20	,	'	copper	'	,	TRUE	)	,
(	78	,	20	,	'	limestone	'	,	FALSE	)	,
(	79	,	20	,	'	gold	'	,	FALSE	)	,
(	80	,	20	,	'	marble	'	,	FALSE	)	,
(	81	,	21	,	'	Kurt Cobain	'	,	TRUE	)	,
(	82	,	21	,	'	Ozzy Osbourne	'	,	FALSE	)	,
(	83	,	21	,	'	Michael Jackson	'	,	FALSE	)	,
(	84	,	21	,	'	Mick Jagger	'	,	FALSE	)	,
(	85	,	22	,	'	Aerosmith	'	,	FALSE	)	,
(	86	,	22	,	'	The Prodigy	'	,	TRUE	)	,
(	87	,	22	,	'	Black Sabbath	'	,	FALSE	)	,
(	88	,	22	,	'	Metallica	'	,	FALSE	)	,
(	89	,	23	,	'	Graceland	'	,	TRUE	)	,
(	90	,	23	,	'	Hounted	'	,	FALSE	)	,
(	91	,	23	,	'	Enchanted	'	,	FALSE	)	,
(	92	,	23	,	'	Elm Close	'	,	FALSE	)	,
(	93	,	24	,	'	The Animals	'	,	FALSE	)	,
(	94	,	24	,	'	The Rolling Stones	'	,	FALSE	)	,
(	95	,	24	,	'	The Beatles	'	,	TRUE	)	,
(	96	,	24	,	'	The Zombies	'	,	FALSE	)	,
(	97	,	25	,	'	Seal	'	,	FALSE	)	,
(	98	,	25	,	'	Sting	'	,	TRUE	)	,
(	99	,	25	,	'	Eminem	'	,	FALSE	)	,
(	100	,	25	,	'	Bono	'	,	FALSE	)	,
(	101	,	26	,	'	Another One Bites the Dust	'	,	FALSE	)	,
(	102	,	26	,	'	Under Pressure	'	,	FALSE	)	,
(	103	,	26	,	'	Radio Ga Ga	'	,	FALSE	)	,
(	104	,	26	,	'	Bohemian Rhapsody	'	,	TRUE	)	,
(	105	,	27	,	'	Canada	'	,	FALSE	)	,
(	106	,	27	,	'	North Korea	'	,	FALSE	)	,
(	107	,	27	,	'	Germany	'	,	FALSE	)	,
(	108	,	27	,	'	South Korea	'	,	TRUE	)	,
(	109	,	28	,	'	Denmark	'	,	FALSE	)	,
(	110	,	28	,	'	France	'	,	FALSE	)	,
(	111	,	28	,	'	Wales	'	,	FALSE	)	,
(	112	,	28	,	'	Yugoslavia (now Kosovo)	'	,	TRUE	)	,
(	113	,	29	,	'	A big bag of Maltesers	'	,	FALSE	)	,
(	114	,	29	,	'	A massive TV	'	,	FALSE	)	,
(	115	,	29	,	'	A PS4 and loads of games	'	,	FALSE	)	,
(	116	,	29	,	'	LEGO Star Wars Millennium Falcon	'	,	TRUE	)	,
(	117	,	30	,	'	Gwen Stefani	'	,	FALSE	)	,
(	118	,	30	,	'	Beyoncé	'	,	TRUE	)	,
(	119	,	30	,	'	Carrie Underwood	'	,	FALSE	)	,
(	120	,	30	,	'	Taylor Swift	'	,	FALSE	)	,
(	121	,	31	,	'	Birmingham and Callais	'	,	FALSE	)	,
(	122	,	31	,	'	Bristol and Liverpool	'	,	FALSE	)	,
(	123	,	31	,	'	Manchester and London	'	,	FALSE	)	,
(	124	,	31	,	'	Paris and London	'	,	TRUE	)	,
(	125	,	32	,	'	Northanger Abbey	'	,	FALSE	)	,
(	126	,	32	,	'	Persuasion	'	,	FALSE	)	,
(	127	,	32	,	'	Pride and Prejudice	'	,	TRUE	)	,
(	128	,	32	,	'	Mansfield Park	'	,	FALSE	)	,
(	129	,	33	,	'	George Eliot	'	,	TRUE	)	,
(	130	,	33	,	'	Robert Galbraith	'	,	FALSE	)	,
(	131	,	33	,	'	Madeleine Wickham	'	,	FALSE	)	,
(	132	,	33	,	'	Richard Bachman	'	,	FALSE	)	,
(	133	,	34	,	'	Troilus and Criseyde	'	,	FALSE	)	,
(	134	,	34	,	'	The Canterbury Tales	'	,	FALSE	)	,
(	135	,	34	,	'	The Book of the Duchess	'	,	FALSE	)	,
(	136	,	34	,	'	A Farewell to Arms	'	,	TRUE	)	,
(	137	,	35	,	'	Half-Blood Prince	'	,	FALSE	)	,
(	138	,	35	,	'	Order of the Phoenix	'	,	FALSE	)	,
(	139	,	35	,	'	Philosopher''s Stone	'	,	TRUE	)	,
(	140	,	35	,	'	Prisoner of Azkaban	'	,	FALSE	)	,
(	141	,	36	,	'	Metaphor	'	,	TRUE	)	,
(	142	,	36	,	'	Alliteration	'	,	FALSE	)	,
(	143	,	36	,	'	Paradox	'	,	FALSE	)	,
(	144	,	36	,	'	Utopia	'	,	FALSE	)	,
(	145	,	37	,	'	whose	'	,	TRUE	)	,
(	146	,	37	,	'	which	'	,	FALSE	)	,
(	147	,	37	,	'	that	'	,	FALSE	)	,
(	148	,	37	,	'	whom	'	,	FALSE	)	,
(	149	,	38	,	'	enquiry, interogated	'	,	FALSE	)	,
(	150	,	38	,	'	enquirie, interrogated	'	,	FALSE	)	,
(	151	,	38	,	'	inquiry, interrogated	'	,	FALSE	)	,
(	152	,	38	,	'	inquiry, interrogated	'	,	TRUE	)	,
(	153	,	39	,	'	You 	'	,	FALSE	)	,
(	154	,	39	,	'	You''re	'	,	FALSE	)	,
(	155	,	39	,	'	Your	'	,	FALSE	)	,
(	156	,	39	,	'	Yours	'	,	TRUE	)	,
(	157	,	40	,	'	metaphor	'	,	FALSE	)	,
(	158	,	40	,	'	colloquialism	'	,	TRUE	)	,
(	159	,	40	,	'	ellipsis	'	,	FALSE	)	,
(	160	,	40	,	'	contraction	'	,	FALSE	)	,
(	161	,	41	,	'	multiplied by a fraction	'	,	FALSE	)	,
(	162	,	41	,	'	made greater in size, amount, or degree	'	,	FALSE	)	,
(	163	,	41	,	'	divided by	'	,	FALSE	)	,
(	164	,	41	,	'	made less in size, amount, or degree	'	,	TRUE	)	,
(	165	,	42	,	'	an infinite line extending from a point	'	,	FALSE	)	,
(	166	,	42	,	'	the line enclosing a plane area	'	,	FALSE	)	,
(	167	,	42	,	'	a geometric figure having an angle of 180°	'	,	FALSE	)	,
(	168	,	42	,	'	an infinite number of points in a plane that are the same distance from a centerpoint	'	,	TRUE	)	,
(	169	,	43	,	'	a set of numeric characteristics calculated from a sample	'	,	FALSE	)	,
(	170	,	43	,	'	a subset of discrete data	'	,	FALSE	)	,
(	171	,	43	,	'	the likelihood that an event will occur	'	,	TRUE	)	,
(	172	,	43	,	'	a characteristic that varies from one sample to another	'	,	FALSE	)	,
(	173	,	44	,	'	an equation having two equal fractions	'	,	FALSE	)	,
(	174	,	44	,	'	angles that share a common side and vertex	'	,	FALSE	)	,
(	175	,	44	,	'	the value of a variable	'	,	FALSE	)	,
(	176	,	44	,	'	the exact reflection of a form on opposite sides of a line	'	,	TRUE	)	,
(	177	,	45	,	'	a triangle having two unequal sides	'	,	FALSE	)	,
(	178	,	45	,	'	a triangle having three equal sides	'	,	FALSE	)	,
(	179	,	45	,	'	a triangle having three unequal sides	'	,	TRUE	)	,
(	180	,	45	,	'	a triangle having two equal sides	'	,	FALSE	)	,
(	181	,	46	,	'	to add	'	,	TRUE	)	,
(	182	,	46	,	'	to multiply	'	,	FALSE	)	,
(	183	,	46	,	'	to subtract	'	,	FALSE	)	,
(	184	,	46	,	'	to divide	'	,	FALSE	)	,
(	185	,	47	,	'	the product of two equal terms	'	,	FALSE	)	,
(	186	,	47	,	'	the product of three equal terms	'	,	TRUE	)	,
(	187	,	47	,	'	the product of four equal terms	'	,	FALSE	)	,
(	188	,	47	,	'	the product of six equal terms	'	,	FALSE	)	,
(	189	,	48	,	'	integer	'	,	FALSE	)	,
(	190	,	48	,	'	prime number	'	,	TRUE	)	,
(	191	,	48	,	'	natural number	'	,	FALSE	)	,
(	192	,	48	,	'	real number	'	,	FALSE	)	,
(	193	,	49	,	'	the volume of a cylinder	'	,	FALSE	)	,
(	194	,	49	,	'	the area of a triangle	'	,	TRUE	)	,
(	195	,	49	,	'	the area of a semicircle	'	,	FALSE	)	,
(	196	,	49	,	'	the length of a side of a square	'	,	FALSE	)	,
(	197	,	50	,	'	10	'	,	FALSE	)	,
(	198	,	50	,	'	100	'	,	TRUE	)	,
(	199	,	50	,	'	50	'	,	FALSE	)	,
(	200	,	50	,	'	1,000	'	,	FALSE	)	,
(	201	,	51	,	'	Alessandro Volta	'	,	FALSE	)	,
(	202	,	51	,	'	André-Marie Ampère	'	,	FALSE	)	,
(	203	,	51	,	'	Maud Leonora Menten	'	,	FALSE	)	,
(	204	,	51	,	'	Georg Simon Ohm	'	,	TRUE	)	,
(	205	,	52	,	'	Volts	'	,	FALSE	)	,
(	206	,	52	,	'	Ohms	'	,	FALSE	)	,
(	207	,	52	,	'	Coulombs	'	,	TRUE	)	,
(	208	,	52	,	'	Amperes	'	,	FALSE	)	,
(	209	,	53	,	'	Flow of electric charge	'	,	TRUE	)	,
(	210	,	53	,	'	Flow of protons	'	,	FALSE	)	,
(	211	,	53	,	'	Flow of neutrons	'	,	FALSE	)	,
(	212	,	53	,	'	Flow of water	'	,	FALSE	)	,
(	213	,	54	,	'	Coal	'	,	TRUE	)	,
(	214	,	54	,	'	Gas	'	,	FALSE	)	,
(	215	,	54	,	'	Water	'	,	FALSE	)	,
(	216	,	54	,	'	Sand	'	,	FALSE	)	,
(	217	,	55	,	'	Wind	'	,	FALSE	)	,
(	218	,	55	,	'	Solar panels	'	,	FALSE	)	,
(	219	,	55	,	'	Hydroelectric power	'	,	FALSE	)	,
(	220	,	55	,	'	All of the above	'	,	TRUE	)	,
(	221	,	56	,	'	Uranium and plutonium	'	,	TRUE	)	,
(	222	,	56	,	'	Carbon and argon	'	,	FALSE	)	,
(	223	,	56	,	'	Xenon and hydrogen	'	,	FALSE	)	,
(	224	,	56	,	'	Helium and oxygen	'	,	FALSE	)	,
(	225	,	57	,	'	Attractive	'	,	FALSE	)	,
(	226	,	57	,	'	Repulsive	'	,	TRUE	)	,
(	227	,	57	,	'	Both attractive and repulsive	'	,	FALSE	)	,
(	228	,	57	,	'	No force	'	,	TRUE	)	,
(	229	,	58	,	'	decreases	'	,	FALSE	)	,
(	230	,	58	,	'	increases	'	,	TRUE	)	,
(	231	,	58	,	'	stays the same	'	,	FALSE	)	,
(	232	,	58	,	'	varies	'	,	FALSE	)	,
(	233	,	59	,	'	GPE = m x h/g	'	,	FALSE	)	,
(	234	,	59	,	'	GPE = h x m/g	'	,	FALSE	)	,
(	235	,	59	,	'	GPE = g x h/m	'	,	FALSE	)	,
(	236	,	59	,	'	GPE = m x g x h	'	,	TRUE	)	,
(	237	,	60	,	'	A converging lens	'	,	TRUE	)	,
(	238	,	60	,	'	A diverging lens	'	,	FALSE	)	,
(	239	,	60	,	'	A meniscus lens	'	,	FALSE	)	,
(	240	,	60	,	'	A biconvex lens	'	,	FALSE	)	,
(	241	,	61	,	'	the number of protons in the nucleus	'	,	FALSE	)	,
(	242	,	61	,	'	the number of protons plus electrons	'	,	FALSE	)	,
(	243	,	61	,	'	the number of neutrons plus electrons	'	,	FALSE	)	,
(	244	,	61	,	'	the number of neutrons plus protons	'	,	TRUE	)	,
(	245	,	62	,	'	in the nucleus of the atom	'	,	FALSE	)	,
(	246	,	62	,	'	in orbit around the outside of the nucleus	'	,	TRUE	)	,
(	247	,	62	,	'	dotted throughout the atom	'	,	FALSE	)	,
(	248	,	62	,	'	in lines radiating out from the nucleus	'	,	FALSE	)	,
(	249	,	63	,	'	White	'	,	FALSE	)	,
(	250	,	63	,	'	Green	'	,	TRUE	)	,
(	251	,	63	,	'	Black	'	,	FALSE	)	,
(	252	,	63	,	'	Purple	'	,	FALSE	)	,
(	253	,	64	,	'	Bromine water	'	,	TRUE	)	,
(	254	,	64	,	'	Dilute nitric acid	'	,	FALSE	)	,
(	255	,	64	,	'	Barium sulfate	'	,	FALSE	)	,
(	256	,	64	,	'	Aluminium powder	'	,	FALSE	)	,
(	257	,	65	,	'	Covalent	'	,	FALSE	)	,
(	258	,	65	,	'	Ionic	'	,	FALSE	)	,
(	259	,	65	,	'	Hydrogen	'	,	FALSE	)	,
(	260	,	65	,	'	Metallic	'	,	TRUE	)	,
(	261	,	66	,	'	Atomic number	'	,	FALSE	)	,
(	262	,	66	,	'	Atomic mass	'	,	TRUE	)	,
(	263	,	66	,	'	Boiling point	'	,	FALSE	)	,
(	264	,	66	,	'	Initial letter	'	,	FALSE	)	,
(	265	,	67	,	'	on the left of the table	'	,	TRUE	)	,
(	266	,	67	,	'	on the right of the table	'	,	FALSE	)	,
(	267	,	67	,	'	in the centre of the table	'	,	FALSE	)	,
(	268	,	67	,	'	at the bottom of the table	'	,	FALSE	)	,
(	269	,	68	,	'	the oceans	'	,	FALSE	)	,
(	270	,	68	,	'	the volcanoes	'	,	TRUE	)	,
(	271	,	68	,	'	comets from space	'	,	FALSE	)	,
(	272	,	68	,	'	water in the atmosphere	'	,	FALSE	)	,
(	273	,	69	,	'	Blue-green algae	'	,	TRUE	)	,
(	274	,	69	,	'	Plants	'	,	FALSE	)	,
(	275	,	69	,	'	Humans	'	,	FALSE	)	,
(	276	,	69	,	'	Viruses	'	,	FALSE	)	,
(	277	,	70	,	'	reducing the amount of energy required by the particles to react	'	,	TRUE	)	,
(	278	,	70	,	'	increasing the amount of energy required by the particles to react	'	,	FALSE	)	,
(	279	,	70	,	'	increasing the pressure of the reactants	'	,	FALSE	)	,
(	280	,	70	,	'	increasing the temperature of the reactants	'	,	FALSE	)	,
(	281	,	71	,	'	Lymphocytes	'	,	TRUE	)	,
(	282	,	71	,	'	Leucocytes	'	,	FALSE	)	,
(	283	,	71	,	'	Phagocytes	'	,	FALSE	)	,
(	284	,	71	,	'	Virocytes	'	,	FALSE	)	,
(	285	,	72	,	'	Adrenal	'	,	FALSE	)	,
(	286	,	72	,	'	Thyroid	'	,	FALSE	)	,
(	287	,	72	,	'	Pituitary	'	,	TRUE	)	,
(	288	,	72	,	'	Hypothalmus	'	,	FALSE	)	,
(	289	,	73	,	'	Ears and eyes	'	,	TRUE	)	,
(	290	,	73	,	'	Eyes and nose	'	,	FALSE	)	,
(	291	,	73	,	'	Nose and tongue	'	,	FALSE	)	,
(	292	,	73	,	'	Eyes and skin	'	,	FALSE	)	,
(	293	,	74	,	'	Eyes and ears	'	,	FALSE	)	,
(	294	,	74	,	'	Teeth	'	,	FALSE	)	,
(	295	,	74	,	'	Bones and blood	'	,	FALSE	)	,
(	296	,	74	,	'	Muscles and glands	'	,	TRUE	)	,
(	297	,	75	,	'	Chromosomes	'	,	FALSE	)	,
(	298	,	75	,	'	Nucleus	'	,	FALSE	)	,
(	299	,	75	,	'	Cytoplasm	'	,	FALSE	)	,
(	300	,	75	,	'	Genes	'	,	TRUE	)	,
(	301	,	76	,	'	Glucose	'	,	FALSE	)	,
(	302	,	76	,	'	Lactose	'	,	FALSE	)	,
(	303	,	76	,	'	Glucosic acid	'	,	FALSE	)	,
(	304	,	76	,	'	Lactic acid	'	,	TRUE	)	,
(	305	,	77	,	'	Vaccination and antibiotics	'	,	TRUE	)	,
(	306	,	77	,	'	Antibiotics only	'	,	FALSE	)	,
(	307	,	77	,	'	Vaccination only	'	,	FALSE	)	,
(	308	,	77	,	'	Nothing	'	,	FALSE	)	,
(	309	,	78	,	'	To keep them warm when they lie on the ice	'	,	FALSE	)	,
(	310	,	78	,	'	To absorb infra-red radiation from the Sun	'	,	FALSE	)	,
(	311	,	78	,	'	To protect them from predators	'	,	FALSE	)	,
(	312	,	78	,	'	It is camoflage to stop their prey spotting them	'	,	TRUE	)	,
(	313	,	79	,	'	Unnatural selection	'	,	FALSE	)	,
(	314	,	79	,	'	Artificial selection	'	,	FALSE	)	,
(	315	,	79	,	'	Premium selection	'	,	FALSE	)	,
(	316	,	79	,	'	Natural selection	'	,	TRUE	)	,
(	317	,	80	,	'	Colds and flu are viruses	'	,	TRUE	)	,
(	318	,	80	,	'	Colds and flu are not viruses	'	,	FALSE	)	,
(	319	,	80	,	'	Colds and flu are caused by bacteria that are resistant to antibiotics	'	,	FALSE	)	,
(	320	,	80	,	'	Antibiotics work too slowly	'	,	FALSE	)	;

