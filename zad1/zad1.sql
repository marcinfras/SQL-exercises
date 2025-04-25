create table Departments 
(
	id int primary key,
	city varchar
);

create table TrainingMaterials
(
	id int primary key,
	materials text
);

create table Trainings
(
	id int primary key,
	training_name varchar,
	price integer,
  	duration integer,
  	training_material_id integer,
	foreign key (training_material_id) references TrainingMaterials(id)
);

create table Mentors
(
	id int primary key,
	name varchar,
  	surname varchar,
  	training_id integer,
  	department_id integer,
	foreign key (training_id) references Trainings(id),
	foreign key (department_id) references Departments(id)
);

create table Customers
(
 	id integer primary key,
 	name varchar,
  	surname varchar,
  	joining_date date,
  	training_id integer,
  	mentor_id integer,
	foreign key (training_id) references Trainings(id),
	foreign key (mentor_id) references Mentors(id)
);

create table Invoices
(
 	id integer primary key,
  	date date,
  	amount integer,
  	customer_id integer,
	foreign key (customer_id) references Customers(id)
);

create table Payments
(
	id integer primary key,
  	date date,
  	amount integer,
  	invoice_id integer,
	foreign key (invoice_id) references Invoices(id)
);

create table Payrolls
(
	id integer primary key,
  	date date,
  	amount integer,
  	mentor_id integer,
	foreign key (mentor_id) references Mentors(id)
);

create table TrainingsHistory
(
	id integer primary key,
  	date date,
  	training_id integer,
  	customer_id integer,
  	mentor_id integer,
	foreign key (training_id) references Trainings(id),
	foreign key (customer_id) references Customers(id),  
	foreign key (mentor_id) references Mentors(id)  
);

create table Notes
(
	id integer primary key,
	date date,
	description text,
	training_history_id integer,
	foreign key (training_history_id) references TrainingsHistory(id)
);
