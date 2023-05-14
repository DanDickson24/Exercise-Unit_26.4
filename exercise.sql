-- Part 1
CREATE TABLE doctors (
  doctor_id INT PRIMARY KEY,
  name VARCHAR(50),
  specialty VARCHAR(50)
);

CREATE TABLE patients (
  patient_id INT PRIMARY KEY,
  name VARCHAR(50),
  dob DATE
);

CREATE TABLE diagnoses (
  diagnosis_id INT PRIMARY KEY,
  patient_id INT,
  doctor_id INT,
  diagnosis_date DATE,
  disease VARCHAR(50),
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
  FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE visits (
  visit_id INT PRIMARY KEY,
  patient_id INT,
  doctor_id INT,
  visit_date DATE,
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
  FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- Part 2
CREATE TABLE regions (
  region_id INT PRIMARY KEY,
  region_name VARCHAR(50) UNIQUE
);

CREATE TABLE users (
  user_id INT PRIMARY KEY,
  username VARCHAR(50),
  email VARCHAR(50),
  preferred_region_id INT,
  FOREIGN KEY (preferred_region_id) REFERENCES regions(region_id)
);

CREATE TABLE categories (
  category_id INT PRIMARY KEY,
  category_name VARCHAR(50) UNIQUE
);

CREATE TABLE posts (
  post_id INT PRIMARY KEY,
  title VARCHAR(100),
  text VARCHAR(1000),
  user_id INT,
  location VARCHAR(100),
  region_id INT,
  category_id INT,
  post_date DATE,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (region_id) REFERENCES regions(region_id),
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Part 3
CREATE TABLE teams (
  team_id INT PRIMARY KEY,
  team_name VARCHAR(50),
  team_location VARCHAR(50),
  coach_name VARCHAR(50)
);

CREATE TABLE players (
  player_id INT PRIMARY KEY,
  player_name VARCHAR(50),
  team_id INT,
  FOREIGN KEY (team_id) REFERENCES teams(team_id)
);

CREATE TABLE referees (
  referee_id INT PRIMARY KEY,
  referee_name VARCHAR(50)
);

CREATE TABLE games (
  game_id INT PRIMARY KEY,
  home_team_id INT,
  away_team_id INT,
  referee_id INT,
  game_date DATE,
  FOREIGN KEY (home_team_id) REFERENCES teams(team_id),
  FOREIGN KEY (away_team_id) REFERENCES teams(team_id),
  FOREIGN KEY (referee_id) REFERENCES referees(referee_id)
);

CREATE TABLE goals (
  goal_id INT PRIMARY KEY,
  game_id INT,
  player_id INT,
  team_id INT,
  goal_time TIME,
  FOREIGN KEY (game_id) REFERENCES games(game_id),
  FOREIGN KEY (player_id) REFERENCES players(player_id),
  FOREIGN KEY (team_id) REFERENCES teams(team_id)
);

CREATE TABLE seasons (
  season_id INT PRIMARY KEY,
  start_date DATE,
  end_date DATE
);

CREATE TABLE matches (
  match_id INT PRIMARY KEY,
  home_team_id INT,
  away_team_id INT,
  season_id INT,
  FOREIGN KEY (home_team_id) REFERENCES teams(team_id),
  FOREIGN KEY (away_team_id) REFERENCES teams(team_id),
  FOREIGN KEY (season_id) REFERENCES seasons(season_id)
);

