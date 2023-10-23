CREATE TABLE IF NOT EXISTS movie (
	movie_id integer NOT NULL,
	movie_name_rus VARCHAR(255) NOT NULL,
	movie_name_eng VARCHAR(255) NOT NULL,
	movie_year DATE NOT NULL,
	movie_director_id VARCHAR(255) NOT NULL,
	movie_slogan VARCHAR(255) NOT NULL,
	movie_duration TIME NOT NULL,
	CONSTRAINT movie_pk PRIMARY KEY (movie_id)
) WITH (
  OIDS=FALSE
);
COMMENT ON TABLE IF NOT EXISTS movie IS "Фильм"
COMMENT ON COLUMN movie.movie_id ID "Номер фильма"
COMMENT ON COLUMN movie.movie_name_rus IS "Название фильма на русском"
COMMENT ON COLUMN movie.movie_name_eng IS "Название фильма на английском"
COMMENT ON COLUMN movie.movie_year IS "Год выхода фильма"
COMMENT ON COLUMN movie.movie_director IS "Режиссер фильма"
COMMENT ON COLUMN movie.movie_slogan IS "Слоган фильма"
COMMENT ON COLUMN movie.movie_duration IS "Продолжительность фильма"



CREATE TABLE IF NOT EXISTS box_office (
	office_id serial NOT NULL,
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



CREATE TABLE IF NOT EXISTS cinema_hall (
	hall_id serial NOT NULL,
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



CREATE TABLE IF NOT EXISTS session (
	session_id serial NOT NULL,
	session_start_date TIMESTAMP NOT NULL,
	session_end_date TIMESTAMP NOT NULL,
	session_movie_id VARCHAR(255) NOT NULL,
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



CREATE TABLE IF NOT EXISTS tickets (
	ticket_num serial NOT NULL,
	ticket_session_id integer NOT NULL,
	ticket_cost integer NOT NULL,
	ticket_seat_id integer NOT NULL,
	ticket_office_id integer NOT NULL,
	CONSTRAINT tickets_pk PRIMARY KEY (ticket_num)
) WITH (
  OIDS=FALSE
);
COMMENT ON TABLE tickets IS "Билет"
COMMENT ON COLUMN tickets.ticket_num IS "Номер билета"
COMMENT ON COLUMN tickets.ticket_session_id IS "Номер сеанса билета"
COMMENT ON COLUMN tickets.cost IS "Цена билета" 
COMMENT ON COLUMN tickets.ticket_seat_id IS "Номер места билета"
COMMENT ON COLUMN tickets.ticket_office_id IS "Номер кассы билета"



CREATE TABLE IF NOT EXISTS employees (
	employee_id serial NOT NULL,
	employee_first_name VARCHAR(255) NOT NULL,
	employee_last_name VARCHAR(255) NOT NULL,
	employee_birthday DATE NOT NULL,
	employee_email VARCHAR(255) NOT NULL,
	CONSTRAINT employees_pk PRIMARY KEY (employee_id)
) WITH (
  OIDS=FALSE
);
COMMENT ON TABLE employees IS "Работники"
COMMENT ON COLUMN employees.employee_id IS "Номер работника"
COMMENT ON COLUMN employees.employee_first_name IS "Имя работника"
COMMENT ON COLUMN employees.employee_last_name IS "Фамилия работника"
COMMENT ON COLUMN employees.employee_birthday IS "День рождения работника"
COMMENT ON COLUMN employees.employee_email IS "Электронная почта работника"



CREATE TABLE IF NOT EXISTS directors (
	director_id integer NOT NULL,
	director_name VARCHAR(255) NOT NULL,
	CONSTRAINT directors_pk PRIMARY KEY (director_id)
) WITH (
  OIDS=FALSE
);
COMMENT ON TABLE directors IS "Режисеры"
COMMENT ON COLUMN directors.director_id IS "Режисер"
COMMENT ON COLUMN directors.director_name IS "Имя режисера"



ALTER TABLE movie 
	ADD CONSTRAINT movie_fk_director_id FOREIGN KEY (movie_director_id) 
	REFERENCES directors(director_id)
	ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE box_office 
	ADD CONSTRAINT box_office_fk_employee FOREIGN KEY (office_employee_id) 
	REFERENCES employees(employee_id)
	ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE session 
	ADD CONSTRAINT session_fk_movie_id FOREIGN KEY (session_movie_id) 
	REFERENCES movie(movie_id)
	ON UPDATE CASCADE ON DELETE RESTRICT;
 
ALTER TABLE session 
	ADD CONSTRAINT session_fk_hall_id FOREIGN KEY (session_hall_id) 
	REFERENCES cinema_hall(hall_id)
	ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE tickets 
	ADD CONSTRAINT tickets_fk_session_id FOREIGN KEY (ticket_session_id) 
	REFERENCES session(session_id)
	ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE tickets 
	ADD CONSTRAINT tickets_fk_box_office_id FOREIGN KEY (ticket_office_id) 
	REFERENCES box_office(office_id)
	ON UPDATE CASCADE ON DELETE SET NULL;
