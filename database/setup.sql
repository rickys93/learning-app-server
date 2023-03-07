DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS tokens CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS questions CASCADE;
DROP TABLE IF EXISTS answers CASCADE;
DROP TABLE IF EXISTS user_answers CASCADE;

CREATE TABLE users (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE tokens (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id INT NOT NULL,
  token VARCHAR(255) NOT NULL,
  expiration TIMESTAMP NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE categories (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id INT,
  name VARCHAR(50) NOT NULL,
  description VARCHAR(500) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE questions (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  category_id INT NOT NULL,
  question TEXT NOT NULL,
  FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE answers (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
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

INSERT INTO categories (name, description)
VALUES
  ('History', 'Questions related to historical events'),
  ('Art', 'Questions related to scientific concepts'),
  ('Music', 'Questions related to music'),
  ('English', 'Questions related to English grammar and literature'),
  ('Math', 'Questions related to mathematical concepts'),
  ('Physics', 'Questions related to physics'' concepts'),
  ('Chemistry', 'Questions related to chemistry'),
  ('Biology', 'Questions related to bilogy, health and environement');

INSERT INTO questions (category_id, question)
VALUES
  (1, 'In which  year the second world war started?'),
  (1, 'Who was British Prime Minister when WWII started?'),
  (1, 'When did the reign of Queen Elizabeth II start?'),
  (1, 'How many Cabinet positions are currently in the government of the United Kingdom?'),
  (1, 'How old was Mary Queen of Scots when she became queen?'),
  (1, 'What word is used to describe the circular configuration of Edward I''s new castles in Wales?'),
  (1, 'What was the name of Edward III''s son, who fought at the Battle of Crecy In 1346?'),
  (1, 'Who commanded the Scottish forces at the Battle of Bannockburn in 1314?'),
  (1, 'Which British commander during the Great War was referred to by his critics as "the Butcher of the Somme"?'),
  (1, 'Which monarch signed the royal assent to the Reform Bill, thus completing its passage into law?'),
  (2, 'Who painted Mona Lisa?'),
  (2, 'Who is the author of sculpture of David?'),
  (2, 'Who was an architect designing the St. Paus''s Cathedral?'),
  (2, 'Which artist was a pioneer of Abstract Expressionism?'),
  (2, 'Who is known as the father of European painting?'),
  (2, 'Who is the author of this painting?'),
  (2, 'Who is the author of this painting?'),
  (2, 'Who is the author of this painting?'),
  (2, 'Who sculpted the Pietà at St. Peter''s Basilica in Rome?'),
  (2, 'What material was used to build the Statue of Liberty?'),
  (3, 'Who was the lead singer of Nirvana?'),
  (3, '"Firestarter" was a UK number one single for which group?'),
  (3, 'What was Elvis Presley''s home called?'),
  (3, 'Which group had the most UK number one singles in the 1960s?'),
  (3, 'Gordon Sumner is the real name of which musician?'),
  (3, 'Which Queen''s song has the lyrics “Is this the real life? Is this just fantasy?"'),
  (3, 'Which country is Gangnam Style singer PSY from?'),
  (3, 'What country is Rita Ora from?'),
  (3, 'What did Ed Sheeran buy when he earned a Number One with his album?'),
  (3, 'Whose song is “Halo”?'),
  (4, 'Which two cities are the settings for Charles Dickens'' A Tale of Two Cities?'),
  (4, 'Elizabeth Bennet is the protagonist of which Jane Austen novel?'),
  (4, 'What pen name did Mary Anne Evans write her novels under?'),
  (4, 'Which of these works is not by Geoffrey Chaucer? '),
  (4, 'Which of the Harry Potter books was first?'),
  (4, 'An example of figurative language which treats one thing as if it were another.'),
  (4, 'Complete the sentence: Gordon, ...... nephew you met yesterday, will be visiting later.'),
  (4, 'Complete the sentence: The ...... into the incident continued for several hours, with dozens of people being .....'),
  (4, 'Which would be the modern equivalent of "thine"?'),
  (4, 'A word which would only be used in an informal, familiar context is described as a...'),
  (5, 'Decreased means:'),
  (5, 'Circle:'),
  (5, 'Probability:'),
  (5, 'Symmetry:'),
  (5, 'Scalene triangle:'),
  (5, 'Combine:'),
  (5, 'Cube:'),
  (5, 'What is the term for any positive integer greater than 1 that is divisible only by itself and 1?'),
  (5, 'What quantity is calculated by the formula hb/2?'),
  (5, 'In Roman numerals, what is represented by the letter C?'),
  (6, 'Who formulated the simple mathematical law governing the electrical resistance of materials?'),
  (6, 'What is the unit of charge?'),
  (6, 'What is electrical current?'),
  (6, 'What is heated to produce steam in power stations?'),
  (6, 'Which of the following is/are associated with the term "renewable energy"?'),
  (6, 'What materials are used as fuels in nuclear power stations?'),
  (6, 'What forces are assumed to exist between particles in a gas?'),
  (6, 'As a substance changes state from a liquid to a gas, the amount of energy the particles have …'),
  (6, 'What is the formula for gravitational potential energy?'),
  (6, 'A lens which focuses light to a point is called a what?'),
  (7, 'The mass number of an element tells us...'),
  (7, 'The electrons are found...'),
  (7, 'The copper oxide that is produced when copper carbonate is heated is what colour?'),
  (7, 'What is used to identify an unsaturated compound?'),
  (7, 'What type of bonding is present in metals?'),
  (7, 'Mendeleev used what property of elements to sort them in his table?'),
  (7, 'The non-metals are found...'),
  (7, 'Carbon dioxide entered the early atmosphere when it was released from...'),
  (7, 'Oxygen started to appear on Earth due to what organisms?'),
  (7, 'A catalyst speeds up a chemical reaction by...'),
  (8, 'Your body can develop a natural immunity to certain pathogens. What is the name of the cells responsible for this?'),
  (8, 'In which gland are FSH and LH produced?'),
  (8, 'Which two human sense organs have receptors specifically sensitive to chemicals?'),
  (8, 'Which of the following are effectors?'),
  (8, 'What part of the bacteria controls resistance?'),
  (8, 'What is the chemical that causes cramp?'),
  (8, 'Which of the following can be used to help protect your body from microorganisms?'),
  (8, 'Why do polar bears have white fur?'),
  (8, 'According to Darwin, new species evolve by which process?'),
  (8, 'Why are antibiotics no good for treating colds and flu?');

INSERT INTO answers (question_id, answer, correct)
VALUES
  (1	,	'	1938	'	,	FALSE	)	,
  (1	,	'	1940	'	,	FALSE	)	,
  (1	,	'	1939	'	,	TRUE	)	,
  (1	,	'	1941	'	,	FALSE	)	,
  (2	,	'	Neville Chamberlain	'	,	TRUE	)	,
  (2	,	'	Clement Attlee	'	,	FALSE	)	,
  (2	,	'	Sir Winston Churchill	'	,	FALSE	)	,
  (2	,	'	Stanley Baldwin	'	,	FALSE	)	,
  (3	,	'	6.02.1952	'	,	TRUE	)	,
  (3	,	'	8.10.1953	'	,	FALSE	)	,
  (3	,	'	2.06.1950	'	,	FALSE	)	,
  (3	,	'	9.08.1951	'	,	FALSE	)	,
  (4	,	'	20	'	,	FALSE	)	,
  (4	,	'	22	'	,	TRUE	)	,
  (4	,	'	24	'	,	FALSE	)	,
  (4	,	'	26	'	,	FALSE	)	,
  (5	,	'	1 year old	'	,	FALSE	)	,
  (5	,	'	10 years old	'	,	FALSE	)	,
  (5	,	'	6 days old	'	,	TRUE	)	,
  (5	,	'	On the day she was born	'	,	FALSE	)	,
  (6	,	'	Circular	'	,	FALSE	)	,
  (6	,	'	Round	'	,	FALSE	)	,
  (6	,	'	Concentric	'	,	TRUE	)	,
  (6	,	'	Orotund	'	,	FALSE	)	,
  (7	,	'	Edward Longshanks	'	,	FALSE	)	,
  (7	,	'	Piers Gaveston	'	,	FALSE	)	,
  (7	,	'	Edward the Black Prince	'	,	TRUE	)	,
  (7	,	'	John of Gaunt	'	,	FALSE	)	,
  (8	,	'	William Wallace	'	,	FALSE	)	,
  (8	,	'	Macbeth	'	,	FALSE	)	,
  (8	,	'	Edward Bruce	'	,	FALSE	)	,
  (8	,	'	Robert the Bruce	'	,	TRUE	)	,
  (9	,	'	Sir John French	'	,	FALSE	)	,
  (9	,	'	Rawlinson	'	,	FALSE	)	,
  (9	,	'	Lord Kitchener	'	,	FALSE	)	,
  (9	,	'	Haig	'	,	TRUE	)	,
  (10	,	'	Queen Victoria	'	,	FALSE	)	,
  (10	,	'	George IV	'	,	FALSE	)	,
  (10	,	'	William IV	'	,	TRUE	)	,
  (10	,	'	George III	'	,	FALSE	)	,
  (11	,	'	Michelangelo	'	,	FALSE	)	,
  (11	,	'	Leonardo Da Vinci	'	,	TRUE	)	,
  (11	,	'	Donatello	'	,	FALSE	)	,
  (11	,	'	Raphael	'	,	FALSE	)	,
  (12	,	'	Sandro Boticelli	'	,	FALSE	)	,
  (12	,	'	Michelangelo	'	,	TRUE	)	,
  (12	,	'	Giambologna	'	,	FALSE	)	,
  (12	,	'	Benvenuto Cellini	'	,	FALSE	)	,
  (13	,	'	Sir Christopher Wren	'	,	TRUE	)	,
  (13	,	'	John Nash	'	,	FALSE	)	,
  (13	,	'	Augustus Pugin	'	,	FALSE	)	,
  (13	,	'	Joseph Paxton	'	,	FALSE	)	,
  (14	,	'	John Altoon	'	,	FALSE	)	,
  (14	,	'	Romare Bearden	'	,	FALSE	)	,
  (14	,	'	Charles Alston	'	,	FALSE	)	,
  (14	,	'	Jackson Pollock	'	,	TRUE	)	,
  (15	,	'	Pierre Auguste Renoir	'	,	FALSE	)	,
  (15	,	'	Giotto	'	,	TRUE	)	,
  (15	,	'	Walter Satterlee	'	,	FALSE	)	,
  (15	,	'	Adolf Waldinge	'	,	FALSE	)	,
  (16	,	'	Slavery! Slavery! - by Kara Walker	'	,	FALSE	)	,
  (16	,	'	Nocturne in Black and Gold, the Falling Rocket - by James McNeill Whistler	'	,	FALSE	)	,
  (16	,	'	The Persistence of Memory -by Salvador Dalí	'	,	FALSE	)	,
  (16	,	'	The Starry Night - by Vincent Van Gogh	'	,	TRUE	)	,
  (17	,	'	Woman at Her Toilette - by Berthe Morisot	'	,	FALSE	)	,
  (17	,	'	Young Lady in 1866 - by Édouard Manet	'	,	FALSE	)	,
  (17	,	'	Girl with a Pearl Earring - by Johannes Vermeer	'	,	TRUE	)	,
  (17	,	'	The Birth of Venus - by Sandro Botticelli	'	,	FALSE	)	,
  (18	,	'	Les Fétiches - by Lois Mailou Jones	'	,	FALSE	)	,
  (18	,	'	Judith Beheading Holofernes - by Artemisia Gentileschi	'	,	FALSE	)	,
  (18	,	'	The Scream - by Edvard Munch	'	,	TRUE	)	,
  (18	,	'	American People #20: Die - by Faith Ringgold	'	,	FALSE	)	,
  (19	,	'	Michelangelo	'	,	TRUE	)	,
  (19	,	'	Leonardo da Vinci	'	,	FALSE	)	,
  (19	,	'	Raphael	'	,	FALSE	)	,
  (19	,	'	Auguste Rodin	'	,	FALSE	)	,
  (20	,	'	copper	'	,	TRUE	)	,
  (20	,	'	limestone	'	,	FALSE	)	,
  (20	,	'	gold	'	,	FALSE	)	,
  (20	,	'	marble	'	,	FALSE	)	,
  (21	,	'	Kurt Cobain	'	,	TRUE	)	,
  (21	,	'	Ozzy Osbourne	'	,	FALSE	)	,
  (21	,	'	Michael Jackson	'	,	FALSE	)	,
  (21	,	'	Mick Jagger	'	,	FALSE	)	,
  (22	,	'	Aerosmith	'	,	FALSE	)	,
  (22	,	'	The Prodigy	'	,	TRUE	)	,
  (22	,	'	Black Sabbath	'	,	FALSE	)	,
  (22	,	'	Metallica	'	,	FALSE	)	,
  (23	,	'	Graceland	'	,	TRUE	)	,
  (23	,	'	Hounted	'	,	FALSE	)	,
  (23	,	'	Enchanted	'	,	FALSE	)	,
  (23	,	'	Elm Close	'	,	FALSE	)	,
  (24	,	'	The Animals	'	,	FALSE	)	,
  (24	,	'	The Rolling Stones	'	,	FALSE	)	,
  (24	,	'	The Beatles	'	,	TRUE	)	,
  (24	,	'	The Zombies	'	,	FALSE	)	,
  (25	,	'	Seal	'	,	FALSE	)	,
  (25	,	'	Sting	'	,	TRUE	)	,
  (25	,	'	Eminem	'	,	FALSE	)	,
  (25	,	'	Bono	'	,	FALSE	)	,
  (26	,	'	Another One Bites the Dust	'	,	FALSE	)	,
  (26	,	'	Under Pressure	'	,	FALSE	)	,
  (26	,	'	Radio Ga Ga	'	,	FALSE	)	,
  (26	,	'	Bohemian Rhapsody	'	,	TRUE	)	,
  (27	,	'	Canada	'	,	FALSE	)	,
  (27	,	'	North Korea	'	,	FALSE	)	,
  (27	,	'	Germany	'	,	FALSE	)	,
  (27	,	'	South Korea	'	,	TRUE	)	,
  (28	,	'	Denmark	'	,	FALSE	)	,
  (28	,	'	France	'	,	FALSE	)	,
  (28	,	'	Wales	'	,	FALSE	)	,
  (28	,	'	Yugoslavia (now Kosovo)	'	,	TRUE	)	,
  (29	,	'	A big bag of Maltesers	'	,	FALSE	)	,
  (29	,	'	A massive TV	'	,	FALSE	)	,
  (29	,	'	A PS4 and loads of games	'	,	FALSE	)	,
  (29	,	'	LEGO Star Wars Millennium Falcon	'	,	TRUE	)	,
  (30	,	'	Gwen Stefani	'	,	FALSE	)	,
  (30	,	'	Beyoncé	'	,	TRUE	)	,
  (30	,	'	Carrie Underwood	'	,	FALSE	)	,
  (30	,	'	Taylor Swift	'	,	FALSE	)	,
  (31	,	'	Birmingham and Callais	'	,	FALSE	)	,
  (31	,	'	Bristol and Liverpool	'	,	FALSE	)	,
  (31	,	'	Manchester and London	'	,	FALSE	)	,
  (31	,	'	Paris and London	'	,	TRUE	)	,
  (32	,	'	Northanger Abbey	'	,	FALSE	)	,
  (32	,	'	Persuasion	'	,	FALSE	)	,
  (32	,	'	Pride and Prejudice	'	,	TRUE	)	,
  (32	,	'	Mansfield Park	'	,	FALSE	)	,
  (33	,	'	George Eliot	'	,	TRUE	)	,
  (33	,	'	Robert Galbraith	'	,	FALSE	)	,
  (33	,	'	Madeleine Wickham	'	,	FALSE	)	,
  (33	,	'	Richard Bachman	'	,	FALSE	)	,
  (34	,	'	Troilus and Criseyde	'	,	FALSE	)	,
  (34	,	'	The Canterbury Tales	'	,	FALSE	)	,
  (34	,	'	The Book of the Duchess	'	,	FALSE	)	,
  (34	,	'	A Farewell to Arms	'	,	TRUE	)	,
  (35	,	'	Half-Blood Prince	'	,	FALSE	)	,
  (35	,	'	Order of the Phoenix	'	,	FALSE	)	,
  (35	,	'	Philosopher''s Stone	'	,	TRUE	)	,
  (35	,	'	Prisoner of Azkaban	'	,	FALSE	)	,
  (36	,	'	Metaphor	'	,	TRUE	)	,
  (36	,	'	Alliteration	'	,	FALSE	)	,
  (36	,	'	Paradox	'	,	FALSE	)	,
  (36	,	'	Utopia	'	,	FALSE	)	,
  (37	,	'	whose	'	,	TRUE	)	,
  (37	,	'	which	'	,	FALSE	)	,
  (37	,	'	that	'	,	FALSE	)	,
  (37	,	'	whom	'	,	FALSE	)	,
  (38	,	'	enquiry, interogated	'	,	FALSE	)	,
  (38	,	'	enquirie, interrogated	'	,	FALSE	)	,
  (38	,	'	inquiry, interrogated	'	,	FALSE	)	,
  (38	,	'	inquiry, interrogated	'	,	TRUE	)	,
  (39	,	'	You 	'	,	FALSE	)	,
  (39	,	'	You''re	'	,	FALSE	)	,
  (39	,	'	Your	'	,	FALSE	)	,
  (39	,	'	Yours	'	,	TRUE	)	,
  (40	,	'	metaphor	'	,	FALSE	)	,
  (40	,	'	colloquialism	'	,	TRUE	)	,
  (40	,	'	ellipsis	'	,	FALSE	)	,
  (40	,	'	contraction	'	,	FALSE	)	,
  (41	,	'	multiplied by a fraction	'	,	FALSE	)	,
  (41	,	'	made greater in size, amount, or degree	'	,	FALSE	)	,
  (41	,	'	divided by	'	,	FALSE	)	,
  (41	,	'	made less in size, amount, or degree	'	,	TRUE	)	,
  (42	,	'	an infinite line extending from a point	'	,	FALSE	)	,
  (42	,	'	the line enclosing a plane area	'	,	FALSE	)	,
  (42	,	'	a geometric figure having an angle of 180°	'	,	FALSE	)	,
  (42	,	'	an infinite number of points in a plane that are the same distance from a centerpoint	'	,	TRUE	)	,
  (43	,	'	a set of numeric characteristics calculated from a sample	'	,	FALSE	)	,
  (43	,	'	a subset of discrete data	'	,	FALSE	)	,
  (43	,	'	the likelihood that an event will occur	'	,	TRUE	)	,
  (43	,	'	a characteristic that varies from one sample to another	'	,	FALSE	)	,
  (44	,	'	an equation having two equal fractions	'	,	FALSE	)	,
  (44	,	'	angles that share a common side and vertex	'	,	FALSE	)	,
  (44	,	'	the value of a variable	'	,	FALSE	)	,
  (44	,	'	the exact reflection of a form on opposite sides of a line	'	,	TRUE	)	,
  (45	,	'	a triangle having two unequal sides	'	,	FALSE	)	,
  (45	,	'	a triangle having three equal sides	'	,	FALSE	)	,
  (45	,	'	a triangle having three unequal sides	'	,	TRUE	)	,
  (45	,	'	a triangle having two equal sides	'	,	FALSE	)	,
  (46	,	'	to add	'	,	TRUE	)	,
  (46	,	'	to multiply	'	,	FALSE	)	,
  (46	,	'	to subtract	'	,	FALSE	)	,
  (46	,	'	to divide	'	,	FALSE	)	,
  (47	,	'	the product of two equal terms	'	,	FALSE	)	,
  (47	,	'	the product of three equal terms	'	,	TRUE	)	,
  (47	,	'	the product of four equal terms	'	,	FALSE	)	,
  (47	,	'	the product of six equal terms	'	,	FALSE	)	,
  (48	,	'	integer	'	,	FALSE	)	,
  (48	,	'	prime number	'	,	TRUE	)	,
  (48	,	'	natural number	'	,	FALSE	)	,
  (48	,	'	real number	'	,	FALSE	)	,
  (49	,	'	the volume of a cylinder	'	,	FALSE	)	,
  (49	,	'	the area of a triangle	'	,	TRUE	)	,
  (49	,	'	the area of a semicircle	'	,	FALSE	)	,
  (49	,	'	the length of a side of a square	'	,	FALSE	)	,
  (50	,	'	10	'	,	FALSE	)	,
  (50	,	'	100	'	,	TRUE	)	,
  (50	,	'	50	'	,	FALSE	)	,
  (50	,	'	1,000	'	,	FALSE	)	,
  (51	,	'	Alessandro Volta	'	,	FALSE	)	,
  (51	,	'	André-Marie Ampère	'	,	FALSE	)	,
  (51	,	'	Maud Leonora Menten	'	,	FALSE	)	,
  (51	,	'	Georg Simon Ohm	'	,	TRUE	)	,
  (52	,	'	Volts	'	,	FALSE	)	,
  (52	,	'	Ohms	'	,	FALSE	)	,
  (52	,	'	Coulombs	'	,	TRUE	)	,
  (52	,	'	Amperes	'	,	FALSE	)	,
  (53	,	'	Flow of electric charge	'	,	TRUE	)	,
  (53	,	'	Flow of protons	'	,	FALSE	)	,
  (53	,	'	Flow of neutrons	'	,	FALSE	)	,
  (53	,	'	Flow of water	'	,	FALSE	)	,
  (54	,	'	Coal	'	,	TRUE	)	,
  (54	,	'	Gas	'	,	FALSE	)	,
  (54	,	'	Water	'	,	FALSE	)	,
  (54	,	'	Sand	'	,	FALSE	)	,
  (55	,	'	Wind	'	,	FALSE	)	,
  (55	,	'	Solar panels	'	,	FALSE	)	,
  (55	,	'	Hydroelectric power	'	,	FALSE	)	,
  (55	,	'	All of the above	'	,	TRUE	)	,
  (56	,	'	Uranium and plutonium	'	,	TRUE	)	,
  (56	,	'	Carbon and argon	'	,	FALSE	)	,
  (56	,	'	Xenon and hydrogen	'	,	FALSE	)	,
  (56	,	'	Helium and oxygen	'	,	FALSE	)	,
  (57	,	'	Attractive	'	,	FALSE	)	,
  (57	,	'	Repulsive	'	,	TRUE	)	,
  (57	,	'	Both attractive and repulsive	'	,	FALSE	)	,
  (57	,	'	No force	'	,	TRUE	)	,
  (58	,	'	decreases	'	,	FALSE	)	,
  (58	,	'	increases	'	,	TRUE	)	,
  (58	,	'	stays the same	'	,	FALSE	)	,
  (58	,	'	varies	'	,	FALSE	)	,
  (59	,	'	GPE = m x h/g	'	,	FALSE	)	,
  (59	,	'	GPE = h x m/g	'	,	FALSE	)	,
  (59	,	'	GPE = g x h/m	'	,	FALSE	)	,
  (59	,	'	GPE = m x g x h	'	,	TRUE	)	,
  (60	,	'	A converging lens	'	,	TRUE	)	,
  (60	,	'	A diverging lens	'	,	FALSE	)	,
  (60	,	'	A meniscus lens	'	,	FALSE	)	,
  (60	,	'	A biconvex lens	'	,	FALSE	)	,
  (61	,	'	the number of protons in the nucleus	'	,	FALSE	)	,
  (61	,	'	the number of protons plus electrons	'	,	FALSE	)	,
  (61	,	'	the number of neutrons plus electrons	'	,	FALSE	)	,
  (61	,	'	the number of neutrons plus protons	'	,	TRUE	)	,
  (62	,	'	in the nucleus of the atom	'	,	FALSE	)	,
  (62	,	'	in orbit around the outside of the nucleus	'	,	TRUE	)	,
  (62	,	'	dotted throughout the atom	'	,	FALSE	)	,
  (62	,	'	in lines radiating out from the nucleus	'	,	FALSE	)	,
  (63	,	'	White	'	,	FALSE	)	,
  (63	,	'	Green	'	,	TRUE	)	,
  (63	,	'	Black	'	,	FALSE	)	,
  (63	,	'	Purple	'	,	FALSE	)	,
  (64	,	'	Bromine water	'	,	TRUE	)	,
  (64	,	'	Dilute nitric acid	'	,	FALSE	)	,
  (64	,	'	Barium sulfate	'	,	FALSE	)	,
  (64	,	'	Aluminium powder	'	,	FALSE	)	,
  (65	,	'	Covalent	'	,	FALSE	)	,
  (65	,	'	Ionic	'	,	FALSE	)	,
  (65	,	'	Hydrogen	'	,	FALSE	)	,
  (65	,	'	Metallic	'	,	TRUE	)	,
  (66	,	'	Atomic number	'	,	FALSE	)	,
  (66	,	'	Atomic mass	'	,	TRUE	)	,
  (66	,	'	Boiling point	'	,	FALSE	)	,
  (66	,	'	Initial letter	'	,	FALSE	)	,
  (67	,	'	on the left of the table	'	,	TRUE	)	,
  (67	,	'	on the right of the table	'	,	FALSE	)	,
  (67	,	'	in the centre of the table	'	,	FALSE	)	,
  (67	,	'	at the bottom of the table	'	,	FALSE	)	,
  (68	,	'	the oceans	'	,	FALSE	)	,
  (68	,	'	the volcanoes	'	,	TRUE	)	,
  (68	,	'	comets from space	'	,	FALSE	)	,
  (68	,	'	water in the atmosphere	'	,	FALSE	)	,
  (69	,	'	Blue-green algae	'	,	TRUE	)	,
  (69	,	'	Plants	'	,	FALSE	)	,
  (69	,	'	Humans	'	,	FALSE	)	,
  (69	,	'	Viruses	'	,	FALSE	)	,
  (70	,	'	reducing the amount of energy required by the particles to react	'	,	TRUE	)	,
  (70	,	'	increasing the amount of energy required by the particles to react	'	,	FALSE	)	,
  (70	,	'	increasing the pressure of the reactants	'	,	FALSE	)	,
  (70	,	'	increasing the temperature of the reactants	'	,	FALSE	)	,
  (71	,	'	Lymphocytes	'	,	TRUE	)	,
  (71	,	'	Leucocytes	'	,	FALSE	)	,
  (71	,	'	Phagocytes	'	,	FALSE	)	,
  (71	,	'	Virocytes	'	,	FALSE	)	,
  (72	,	'	Adrenal	'	,	FALSE	)	,
  (72	,	'	Thyroid	'	,	FALSE	)	,
  (72	,	'	Pituitary	'	,	TRUE	)	,
  (72	,	'	Hypothalmus	'	,	FALSE	)	,
  (73	,	'	Ears and eyes	'	,	TRUE	)	,
  (73	,	'	Eyes and nose	'	,	FALSE	)	,
  (73	,	'	Nose and tongue	'	,	FALSE	)	,
  (73	,	'	Eyes and skin	'	,	FALSE	)	,
  (74	,	'	Eyes and ears	'	,	FALSE	)	,
  (74	,	'	Teeth	'	,	FALSE	)	,
  (74	,	'	Bones and blood	'	,	FALSE	)	,
  (74	,	'	Muscles and glands	'	,	TRUE	)	,
  (75	,	'	Chromosomes	'	,	FALSE	)	,
  (75	,	'	Nucleus	'	,	FALSE	)	,
  (75	,	'	Cytoplasm	'	,	FALSE	)	,
  (75	,	'	Genes	'	,	TRUE	)	,
  (76	,	'	Glucose	'	,	FALSE	)	,
  (76	,	'	Lactose	'	,	FALSE	)	,
  (76	,	'	Glucosic acid	'	,	FALSE	)	,
  (76	,	'	Lactic acid	'	,	TRUE	)	,
  (77	,	'	Vaccination and antibiotics	'	,	TRUE	)	,
  (77	,	'	Antibiotics only	'	,	FALSE	)	,
  (77	,	'	Vaccination only	'	,	FALSE	)	,
  (77	,	'	Nothing	'	,	FALSE	)	,
  (78	,	'	To keep them warm when they lie on the ice	'	,	FALSE	)	,
  (78	,	'	To absorb infra-red radiation from the Sun	'	,	FALSE	)	,
  (78	,	'	To protect them from predators	'	,	FALSE	)	,
  (78	,	'	It is camoflage to stop their prey spotting them	'	,	TRUE	)	,
  (79	,	'	Unnatural selection	'	,	FALSE	)	,
  (79	,	'	Artificial selection	'	,	FALSE	)	,
  (79	,	'	Premium selection	'	,	FALSE	)	,
  (79	,	'	Natural selection	'	,	TRUE	)	,
  (80	,	'	Colds and flu are viruses	'	,	TRUE	)	,
  (80	,	'	Colds and flu are not viruses	'	,	FALSE	)	,
  (80	,	'	Colds and flu are caused by bacteria that are resistant to antibiotics	'	,	FALSE	)	,
  (80	,	'	Antibiotics work too slowly	'	,	FALSE	)	;

