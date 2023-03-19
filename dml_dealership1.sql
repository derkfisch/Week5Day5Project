SELECT *
FROM customer;

INSERT INTO customer(name_id, age_id)
VALUES ('Derek', 27);

SELECT *
FROM customer;

INSERT INTO customer(name_id, age_id)
VALUES ('Adam', 23);

SELECT *
FROM customer;

SELECT *
FROM dealership;

INSERT INTO dealership(address_id, state_id)
VALUES ('123 Fake St', 'Nevada');

INSERT INTO dealership(address_id, state_id)
VALUES ('345 Real Rd', 'Ohio');

SELECT*
FROM dealership;

SELECT *
FROM service_dept;

INSERT INTO service_dept(type_id, dealership_id)
VALUES ('Maintence', 1);

INSERT INTO service_dept(type_id, dealership_id)
VALUES ('Brakes', 2);

SELECT *
FROM service_dept;

SELECT *
FROM sales_dept;

INSERT INTO sales_dept(type_id, dealership_id)
VALUES ('Used', 1);

INSERT INTO sales_dept(type_id, dealership_id)
VALUES ('New', 2);

SELECT *
FROM sales_dept;

SELECT *
FROM salesperson;

INSERT INTO salesperson(name_id, age_id, sales_dept_id)
VALUES ('Jimmy', 30, 1);

INSERT INTO salesperson(name_id, age_id, sales_dept_id)
VALUES ('Julie', 32, 2);

SELECT *
FROM salesperson;

SELECT *
FROM mechanic;

INSERT INTO mechanic(name_id, age_id, service_id)
VALUES ('Jamie', 45, 1);

INSERT INTO mechanic(name_id, age_id, service_id)
VALUES ('Phil', 28, 2);

SELECT *
FROM mechanic;

SELECT *
FROM car;

INSERT INTO car(make_id, customer_id)
VALUES ('Honda', 1);

INSERT INTO car(make_id, customer_id)
VALUES ('BMW', 2);

SELECT *
FROM car;

SELECT *
FROM car_invoice;

INSERT INTO car_invoice(car_id, salesperson_id)
VALUES (2, 1);

INSERT INTO car_invoice(car_id, salesperson_id)
VALUES (3, 2);

SELECT *
FROM car_invoice;

SELECT *
FROM ticket;

INSERT INTO ticket(card_id, customer_id)
VALUES ('Visa', 1);

INSERT INTO ticket(card_id, customer_id)
VALUES ('Mastercard', 2);

SELECT *
FROM ticket;

SELECT *
FROM service_ticket;

INSERT INTO service_ticket(ticket_id, mechanic_id)
VALUES (1,1);

INSERT INTO service_ticket(ticket_id, mechanic_id)
VALUES (2,2);

SELECT *
FROM service_ticket;

--create 2 insert from a stored procedure

SELECT *
FROM customer;


CREATE OR REPLACE PROCEDURE add_customer(name_id VARCHAR, age_id INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO customer(name_id, age_id)
	VALUES(name_id, age_id);
END;
$$;

CALL add_customer('Nick', 18);
CALL add_customer('Tom', 57);

SELECT *
FROM customer;

SELECT *
FROM dealership;

CREATE OR REPLACE PROCEDURE add_dealership(address_id VARCHAR, state_id VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO dealership(address_id, state_id)
	VALUES(address_id, state_id);
END;
$$;

CALL add_dealership('678 Fun Pkwy', 'Florida');
CALL add_dealership('910 Your Mommas House Ave', 'new_state_never_heard_of_before');

SELECT *
FROM dealership;
