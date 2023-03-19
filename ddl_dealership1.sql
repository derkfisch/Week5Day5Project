CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	name_id VARCHAR NOT NULL,
	age_id INTEGER NOT NULL
);

CREATE TABLE dealership(
	dealership_id SERIAL PRIMARY KEY,
	address_id VARCHAR NOT NULL,
	state_id VARCHAR NOT NULL
);

CREATE TABLE service_dept(
	service_id SERIAL PRIMARY KEY,
	type_id VARCHAR NOT NULL,
	dealership_id INTEGER NOT NULL,
	FOREIGN KEY (dealership_id) REFERENCES dealership(dealership_id)
);

CREATE TABLE sales_dept(
	sales_dept_id SERIAL PRIMARY KEY,
	type_id VARCHAR NOT NULL,
	dealership_id INTEGER NOT NULL,
	FOREIGN KEY (dealership_id) REFERENCES dealership(dealership_id)
);

CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	name_id VARCHAR NOT NULL,
	age_id INTEGER NOT NULL,
	sales_dept_id INTEGER NOT NULL,
	FOREIGN KEY (sales_dept_id) REFERENCES sales_dept(sales_dept_id)
);

CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	name_id VARCHAR NOT NULL,
	age_id INTEGER NOT NULL,
	service_id INTEGER NOT NULL,
	FOREIGN KEY (service_id) REFERENCES service_dept(service_id)
);

CREATE TABLE car(
	car_id SERIAL PRIMARY KEY,
	make_id VARCHAR NOT NULL,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY,
	card_id VARCHAR NOT NULL,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE car_invoice(
	car_id INTEGER NOT NULL,
	FOREIGN KEY (car_id) REFERENCES car(car_id),
	salesperson_id INTEGER NOT NULL,
	FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id)
);

CREATE TABLE service_ticket(
	ticket_id INTEGER NOT NULL,
	FOREIGN KEY (ticket_id) REFERENCES ticket(ticket_id),
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id)
);