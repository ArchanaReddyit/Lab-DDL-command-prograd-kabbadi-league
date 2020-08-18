-- PROGRESSION - 1


-- 1. **Create table city**

-- 2. **Create table referee**

-- 3. **Create table innings**

-- 4. **Create table extra_type**

-- 5. **Create table skill**

-- 6. **Create table team**

-- 7. **Create table player**

-- 8. **Create table venue**

-- 9. **Create table event**
-- 10. **Create table extra_event**

-- 11. **Create table outcome**

-- 12. **Create table game**

-- 13. **Drop table city**

-- 14. **Drop table innings**

-- 15. **Drop table skill**

-- 16. **Drop table extra_type**
CREATE TABLE CITY(ID INT,
NAME VARCHAR(50),
CONSTRAINT  CITY_PK PRIMARY KEY(ID));

CREATE TABLE REFEREE(ID INT,
NAME VARCHAR(50),
CONSTRAINT  REFEREE_PK PRIMARY KEY(ID));

Create table Innings
(
Id INT,
innings_number INT NOT NULL,
CONSTRAINT Innings_PK PRIMARY KEY(ID)
);

Create table extra_type
(
Id INT,
name VARCHAR(50) NOT NULL,
CONSTRAINT extra_type_PK PRIMARY KEY(ID)
);


Create table Skill
(
Id INT,
name VARCHAR(50) NOT NULL,
CONSTRAINT Skill_PK PRIMARY KEY(ID)
);


Create table Team
(
Id INT,
name VARCHAR(50) NOT NULL,
coach VARCHAR(50) NOT NULL,
home_city INT,
captain INT NOT NULL,
CONSTRAINT Team_PK PRIMARY KEY(ID),
CONSTRAINT Team_FK FOREIGN KEY(home_city) REFERENCES City(id)
);

Create table Player
(
Id INT,
name VARCHAR(50),
country VARCHAR(50),
skill_id INT,
team_id INT,
CONSTRAINT Player_PK PRIMARY KEY(ID),
CONSTRAINT Player_FK FOREIGN KEY(skill_id) REFERENCES Skill(id),
CONSTRAINT Player_FK1 FOREIGN KEY(team_id) REFERENCES Team(id)
);

Create table Venue
(
id INT,
stadium_name VARCHAR(50) NOT NULL,
city_id INT NOT NULL,
CONSTRAINT Venue_PK PRIMARY KEY(ID),
CONSTRAINT Venue_FK FOREIGN KEY(city_id) REFERENCES City(id)
);

Create table Event
(
id INT,
innings_id INT NOT NULL,
event_no INT NOT NULL,
raider_id INT NOT NULL,
raid_points INT NOT NULL,
defending_points INT NOT NULL,
clock_in_seconds INT NOT NULL,
team_one_score INT NOT NULL,
team_two_score INT NOT NULL,
CONSTRAINT Event_PK PRIMARY KEY(id),
CONSTRAINT Event_FK FOREIGN KEY(innings_id) REFERENCES Innings(Id),
CONSTRAINT event_fk1 FOREIGN KEY (raider_id) REFERENCES player(id)
);

Create table Extra_event
(
id INT,
event_id INT NOT NULL,
extra_type_id INT NOT NULL,
points INT NOT NULL,
scoring_team_id INT NOT NULL,
CONSTRAINT Extra_event_PK PRIMARY KEY(ID),
CONSTRAINT Extra_event_FK FOREIGN KEY(event_id)REFERENCES Event(id),
CONSTRAINT Extra_event_FK1 FOREIGN KEY(extra_type_id)REFERENCES Extra_type(id),
CONSTRAINT Extra_event_FK2 FOREIGN KEY(scoring_team_id)REFERENCES Team(id)
);

Create table Outcome
(
id INT,
status VARCHAR(100) NOT NULL,
winner_team_id INT NULL,
score INT NULL,
player_of_match INT NULL,
CONSTRAINT Outcome_PK PRIMARY KEY(id),
CONSTRAINT Outcome_FK FOREIGN KEY(winner_team_id)REFERENCES Team(id),
CONSTRAINT Outcome_FK1 FOREIGN KEY(player_of_match )REFERENCES Player(id)
);

Create table Game
(
id INT,
game_date DATE NOT NULL,
team_id_1 INT NOT NULL,
team_id_2 INT NOT NULL,
venue_id INT NOT NULL,
outcome_id INT NOT NULL,
referee_id_1 INT NOT NULL,
referee_id_2 INT NOT NULL,
first_innings_id INT NOT NULL,
second_innings_id INT NOT NULL,
CONSTRAINT Game_PK PRIMARY KEY(id),
CONSTRAINT Game_FK FOREIGN KEY(team_id_1)REFERENCES Team(id),
CONSTRAINT Game_FK1 FOREIGN KEY(team_id_2)REFERENCES Team(id),
CONSTRAINT Game_FK2 FOREIGN KEY(venue_id)REFERENCES Venue(id),
CONSTRAINT Game_FK3 FOREIGN KEY(outcome_id)REFERENCES Outcome(id),
CONSTRAINT Game_FK4 FOREIGN KEY(referee_id_1) REFERENCES Referee(ID),
CONSTRAINT Game_FK5 FOREIGN KEY(referee_id_2) REFERENCES Referee(ID),
CONSTRAINT Game_FK6 FOREIGN KEY(first_innings_id) REFERENCES Innings(Id),
CONSTRAINT Game_FK7 FOREIGN KEY(second_innings_id) REFERENCES Innings(Id)
);


Drop table CITY;

Drop table Innings;

Drop table Skill;

Drop table extra_type;


