CREATE TABLE movie (
	movie_name_rus VARCHAR(255) NOT NULL,
	movie_name_eng VARCHAR(255) NOT NULL,
	movie_year DATE NOT NULL,
	movie_director VARCHAR(255) NOT NULL,
	movie_slogan VARCHAR(255) NOT NULL,
	movie_duration TIME NOT NULL,
	CONSTRAINT movie_pk PRIMARY KEY (movie_name_rus)
) WITH (
  OIDS=FALSE
);
COMMENT ON TABLE movie IS "Фильм"
COMMENT ON COLUMN movie.movie_name_rus IS "Название фильма на русском"
COMMENT ON COLUMN movie.movie_name_eng IS "Название фильма на английском"
COMMENT ON COLUMN movie.movie_year IS "Год выхода фильма"
COMMENT ON COLUMN movie.movie_director IS "Режиссер фильма"
COMMENT ON COLUMN movie.movie_slogan IS "Слоган фильма"
COMMENT ON COLUMN movie.movie_duration IS "Продолжительность фильма"


CREATE TABLE box_office (
	office_id serial NOT NULL UNIQUE,
	office_start_time TIME NOT NULL,
	office_end_time TIME NOT NULL,
	office_employee_id integer NOT NULL,
	CONSTRAINT box_office_pk PRIMARY KEY (office_id)
) WITH (
  OIDS=FALSE
);
COMMENT ON TABLE box_office IS "Касса"
COMMENT ON COLUMN box_office.office_id IS "Номер кассы"
COMMENT ON COLUMN box_office.office_start_time IS "Время начала работы кассы"
COMMENT ON COLUMN box_office.office_end_time IS "Время конца работы кассы"
COMMENT ON COLUMN box_office.employee_id IS "Номер работника кассы"


CREATE TABLE cinema_hall (
	hall_id serial NOT NULL UNIQUE,
	hall_capacity integer NOT NULL,
	hall_size_screen integer NOT NULL,
	hall_size_hall integer NOT NULL,
	CONSTRAINT cinema_hall_pk PRIMARY KEY (hall_id)
) WITH (
  OIDS=FALSE
);
COMMENT ON TABLE cinema_hall IS "Кинозал"
COMMENT ON COLUMN cinema_hall.hall_id IS "Номер кинозала"
COMMENT ON COLUMN cinema_hall.hall_capacity IS "Вместимость кинозала"
COMMENT ON COLUMN ciname_hall.hall_size_screen IS "Размер экрана кинозала"
COMMENT ON COLUMN cinema_hall.hall_size_hall IS "Размер кинозала"


CREATE TABLE session (
	session_id serial NOT NULL UNIQUE,
	session_start_date TIMESTAMP NOT NULL,
	session_end_date TIMESTAMP NOT NULL,
	session_movie_name VARCHAR(255) NOT NULL,
	session_hall_id integer NOT NULL,
	CONSTRAINT session_pk PRIMARY KEY (session_id)
) WITH (
  OIDS=FALSE
);
COMMENT ON TABLE session IS "Сеанс"
COMMENT ON COLUMN session.session_id IS "Номер сеанса"
COMMENT ON COLUMN session.session_start_date IS "Время начала сеанса"
COMMENT ON COLUMN session.session_end_date IS "Время окончания сеанса"
COMMENT ON COLUMN session.session_movie_name IS "Название фильма сеанса"
COMMENT ON COLUMN session.session_hall_id IS "Номер кинозала сеанса"


CREATE TABLE tickets (
	ticket_id serial NOT NULL UNIQUE,
	ticket_session integer NOT NULL,
	ticket_cost integer NOT NULL,
	ticket_seat_id integer NOT NULL,
	ticket_office_id integer NOT NULL,
	CONSTRAINT tickets_pk PRIMARY KEY (ticket_id)
) WITH (
  OIDS=FALSE
);


ALTER TABLE session 
	ADD CONSTRAINT session_fk_movie_name FOREIGN KEY (session_movie_name) 
	REFERENCES movie(movie_name_rus)
	ON UPDATE SET NULL ON DELETE CASCADE;

ALTER TABLE session 
	ADD CONSTRAINT session_fk_hall_id FOREIGN KEY (session_hall_id) 
	REFERENCES cinema_hall(hall_id)
	ON UPDATE SET NULL ON DELETE CASCADE;

ALTER TABLE tickets 
	ADD CONSTRAINT tickets_fk_session FOREIGN KEY (ticket_session) 
	REFERENCES session(session_id)
	ON UPDATE SET NULL ON DELETE CASCADE;

ALTER TABLE tickets 
	ADD CONSTRAINT tickets_fk_office_id FOREIGN KEY (ticket_office_id) 
	REFERENCES box_office(office_id)
	ON UPDATE SET NULL ON DELETE CASCADE;






