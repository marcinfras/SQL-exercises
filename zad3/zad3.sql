CREATE TABLE Departments (
    id SERIAL PRIMARY KEY,
    name TEXT,
    city TEXT
);

CREATE TABLE Mentors (
    id SERIAL PRIMARY KEY,
    name TEXT,
    surname TEXT,
    joining_date DATE,
    department_id INTEGER,
    FOREIGN KEY (department_id) REFERENCES Departments(id)
);

CREATE TABLE Customers (
    id SERIAL PRIMARY KEY,
    name TEXT,
    surname TEXT,
    joining_date DATE,
    gender TEXT,
    mentor_id INTEGER,
    FOREIGN KEY (mentor_id) REFERENCES Mentors(id)
);

CREATE TABLE TrainingMaterials (
    id SERIAL PRIMARY KEY,
    materials_link TEXT
);

CREATE TABLE Trainings (
    id SERIAL PRIMARY KEY,
    training_name TEXT,
    price DOUBLE PRECISION,
    duration INTERVAL,
    training_material_id INTEGER,
    FOREIGN KEY (training_material_id) REFERENCES TrainingMaterials(id)
);

CREATE TABLE Invoices (
    id SERIAL PRIMARY KEY,
    name TEXT,
    date DATE,
    amount DOUBLE PRECISION,
    customer_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES Customers(id)
);

CREATE TABLE Payments (
    id SERIAL PRIMARY KEY,
    date DATE,
    amount DOUBLE PRECISION,
    invoice_id INTEGER,
    FOREIGN KEY (invoice_id) REFERENCES Invoices(id)
);

CREATE TABLE Payrolls (
    id SERIAL PRIMARY KEY,
    date DATE,
    amount DOUBLE PRECISION,
    mentor_id INTEGER,
    FOREIGN KEY (mentor_id) REFERENCES Mentors(id)
);

CREATE TABLE TrainingsHistory (
    id SERIAL PRIMARY KEY,
    date_start DATE,
    date_end DATE,
    training_id INTEGER,
    customer_id INTEGER,
    mentor_id INTEGER,
    FOREIGN KEY (training_id) REFERENCES Trainings(id),
    FOREIGN KEY (customer_id) REFERENCES Customers(id),
    FOREIGN KEY (mentor_id) REFERENCES Mentors(id)
);

CREATE TABLE Notes (
    id SERIAL PRIMARY KEY,
    date DATE,
    content TEXT,
    trainings_history_id INTEGER,
    FOREIGN KEY (trainings_history_id) REFERENCES TrainingsHistory(id)
);

CREATE TABLE CustomersTrainings (
    customer_id INT NOT NULL,
    training_id INT NOT NULL,
    PRIMARY KEY (customer_id, training_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(id),
    FOREIGN KEY (training_id) REFERENCES Trainings(id)
);

CREATE TABLE MentorsTrainings (
    mentor_id INT NOT NULL,
    training_id INT NOT NULL,
    PRIMARY KEY (mentor_id, training_id),
    FOREIGN KEY (mentor_id) REFERENCES Mentors(id),
    FOREIGN KEY (training_id) REFERENCES Trainings(id)
);


-- INSERTS
INSERT INTO
    Departments (name, city)
VALUES
    ('HR', 'Warszawa'),
    ('IT', 'Gdynia');

INSERT INTO
    Mentors (name, surname, joining_date, department_id)
VALUES
    ('John', 'Doe', '2023-01-15', 1),
    ('Jane', 'Smith', '2022-11-30', 2),
    ('Michael', 'Johnson', '2023-02-28', 1),
    ('Emily', 'Brown', '2022-10-20', 2);

INSERT INTO
    Payrolls (date, amount, mentor_id)
VALUES
    ('2024-01-25', 1000, 1),
    ('2024-02-24', 1500, 2),
    ('2024-03-01', 1000, 3),
    ('2024-03-14', 2000, 4),
    ('2024-05-25', 3000, 1);

INSERT INTO
    Customers (name, surname, joining_date, gender, mentor_id)
VALUES
    ('Alice', 'Johnson', '2021-05-10', 'female', 1),
    ('Bob', 'Smith', '2021-06-15', 'male', 2),
    ('Carol', 'Williams', '2022-04-20', 'female', 3),
    ('David', 'Brown', '2023-07-01', 'male', 1);

INSERT INTO
    Invoices (name, date, amount, customer_id)
VALUES
    ('FV/001', '2023-05-20', 1250.75, 1),
    ('FV/002', '2023-06-25', 1450.50, 2),
    ('FV/003', '2023-04-30', 1300.00, 3),
    ('FV/004', '2023-07-10', 1150.25, 1);

INSERT INTO
    Payments (date, amount, invoice_id)
VALUES
    ('2023-06-11', 1250.75, 1),
    ('2023-06-30', 1450.50, 2),
    ('2023-05-11', 700, 3),
    ('2023-08-11', 600, 3);

INSERT INTO
    TrainingMaterials (materials_link)
VALUES
    ('www.sample-url-1.com'),
    ('www.sample-url-2.com'),
    ('www.sample-url-3.com');

INSERT INTO
    Trainings (training_name, price, duration, training_material_id)
VALUES
    ('Advanced SQL', 199.99, '20 hours', 1),
    ('Data Analysis with Python', 299.99, '60 hours', 2),
    ('Machine Learning Basics', 399.99, '40 hours', 3);

INSERT INTO
    TrainingsHistory (date_start, date_end, training_id, customer_id, mentor_id)
VALUES
    ('2023-01-15', '2023-01-20', 1, 1, 1),
    ('2023-02-01', '2023-02-05', 2, 2, 2),
    ('2023-03-10', '2023-03-15', 3, 3, 3),
    ('2023-04-01', '2023-04-05', 3, 1, 1);

INSERT INTO
    Notes (date, content, trainings_history_id)
VALUES
    ('2023-01-16', 'Day 1: Introduction to SQL and basic queries.', 1),
    ('2023-01-17', 'Day 2: Advanced SQL techniques.', 1),
    ('2023-02-02', 'Python basics and data analysis libraries.', 2),
    ('2023-02-03', 'Data visualization with Python.', 2),
    ('2023-03-11', 'Introduction to machine learning concepts.', 3),
    ('2023-03-12', 'Supervised vs unsupervised learning.', 3),
    ('2023-04-02', 'Setting up Django and creating models.', 1),
    ('2023-04-03', 'Django views and templates.', 3);

INSERT INTO
    CustomersTrainings (customer_id, training_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 2),
    (2, 3),
    (3, 1),
    (3, 3);

INSERT INTO
    MentorsTrainings (mentor_id, training_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 2),
    (2, 3),
    (3, 1),
    (3, 3);


--Zadania--------------------------------------------

/* 
Departments-Mentors 1:n
Mentors-Customers 1:n
TrainingMaterials-Trainings 1:n
Customers-Invoices 1:n
Invoices-Payments 1:n
Mentors-Payrolls 1:n	
Trainings-TrainingsHistory 1:n
Customers-TrainingsHistory 1:n
Mentors-TrainingsHistory 1:n
TrainingsHistory-Notes 1:n
Customers-Trainings(CustomersTrainings) m:n
Mentors-Trainings(MentorsTrainings) m:n
*/

--select * from customers

select * from customers where extract(year from joining_date) = 2021;
select * from customers where extract(year from joining_date) = extract(year from now()) - 1 and extract(month from joining_date) between 6 and 12;


select * from customers where gender = 'female' order by name asc;


select * from customers join mentors on customers.mentor_id = Mentors.id where customers.id = 1;
select name as student_name, surname as student_surname, (select name as mentor_name from mentors where id = mentor_id), (select surname as mentor_surname from mentors where id = mentor_id) from customers where id = 1;


select name, surname, age(current_date, joining_date) as staz,
case 
	when age(current_date, joining_date) > interval '12 months' then 'Klient Specjalny'
	else 'Normalny klient'
end as customer_type
from customers;


select c.name, c.surname, sum(i.amount) as "Całkowita zapłata" from customers c join invoices i on c.id = i.customer_id group by c.name, c.surname;


select c.name, c.surname, avg(p.amount) as "Średnia wpłat" from customers c join invoices i on c.id = i.customer_id join payments p on p.invoice_id = i.id where c.id = 1 group by c.name, c.surname;


select name from mentors 
union 
select name from customers
union
select name from invoices;



with avg_payments as (
select c.name, c.surname, avg(p.amount) as "Średnia wpłat" from customers c join invoices i on c.id = i.customer_id join payments p on p.invoice_id = i.id group by c.name, c.surname
)
select * from avg_payments;

















