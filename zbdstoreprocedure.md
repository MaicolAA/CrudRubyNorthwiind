Store procedure for READ | SHOW  Employes from the DATABASE

create function getAllEmployes()
returns table(employee_id smallint, last_name VARCHAR, first_name VARCHAR, title varchar, title_of_courtesy VARCHAR, birth_date date, hire_date date, address varchar, city varchar, region varchar, postal_code varchar, country varchar, home_phone varchar, extension varchar, photo bytea, notes text, reports_to smallint, photo_path varchar)
as $$
begin
  return query select * from employees;
end;
$$ language plpgsql;









Store procedure for create New Employes in the DATABASE

CREATE OR REPLACE FUNCTION create_employee(
  employee_id smallint,
  last_name VARCHAR,
  first_name VARCHAR,
  title VARCHAR,
  title_of_courtesy VARCHAR,
  birth_date DATE,
  hire_date DATE,
  address VARCHAR,
  city VARCHAR,
  region VARCHAR,
  postal_code VARCHAR,
  country VARCHAR,
  home_phone VARCHAR,
  extension VARCHAR,
  photo BYTEA,
  notes TEXT,
  reports_to SMALLINT,
  photo_path VARCHAR
)
RETURNS VOID AS $$
BEGIN
  INSERT INTO employees (
    employee_id,
    last_name,
    first_name,
    title,
    title_of_courtesy,
    birth_date,
    hire_date,
    address,
    city,
    region,
    postal_code,
    country,
    home_phone,
    extension,
    photo,
    notes,
    reports_to,
    photo_path
  ) VALUES (
    employee_id,
    last_name,
    first_name,
    title,
    title_of_courtesy,
    birth_date,
    hire_date,
    address,
    city,
    region,
    postal_code,
    country,
    home_phone,
    extension,
    photo,
    notes,
    reports_to,
    photo_path
  );
END;
$$ LANGUAGE plpgsql;


EXAMPLE ABOUT ONE INSERCION 

SELECT create_employee(
  20::smallint,
  'Arroyave',
  'Maicol',
  'Title',
  'Dr',
  '2004-01-27'::date,
  '2023-10-14'::date,
  'Cr 77 #88a-79',
  'Medellin',
  'Antioquia',
  '12345',
  'Colombia',
  '3128797122',
  '10',
  NULL::bytea,
  'Notas',
  1::smallint, 
  'maicol.jpg'
);




Store procedure for DELETE Employes in the DATABASE

create or replace procedure delete_employee(employee_id_arg int)
language plpgsql
as $$
begin

delete from order_details where order_id in (select order_id from orders where employee_id = employee_id_arg);
  
delete from orders where employee_id = employee_id_arg;
  
delete from employee_territories where employee_id = employee_id_arg;
  
delete from employees where employee_id = employee_id_arg;
end;
$$;

EXAMPLE DELETE

Call delete_employee(20);




Store procedure for UPDATE Employes in the DATABASE


CREATE OR REPLACE FUNCTION update_employee(
  employee_id smallint,
  last_name VARCHAR,
  first_name VARCHAR,
  title VARCHAR,
  title_of_courtesy VARCHAR,
  birth_date DATE,
  hire_date DATE,
  address VARCHAR,
  city VARCHAR,
  region VARCHAR,
  postal_code VARCHAR,
  country VARCHAR,
  home_phone VARCHAR,
  extension VARCHAR,
  photo BYTEA,
  notes TEXT,
  reports_to SMALLINT,
  photo_path VARCHAR
)
RETURNS VOID AS $$
BEGIN
  UPDATE employees
  SET
    last_name = last_name,
    first_name = first_name,
    title = title,
    title_of_courtesy = title_of_courtesy,
    birth_date = birth_date,
    hire_date = hire_date,
    address = address,
    city = city,
    region = region,
    postal_code = postal_code,
    country = country,
    home_phone = home_phone,
    extension = extension,
    photo = photo,
    notes = notes,
    reports_to = reports_to,
    photo_path = photo_path
  WHERE employee_id = employee_id;
END;
$$ LANGUAGE plpgsql;




EXAMPLE FOR UPDATE Employes in the DATABASE With the store Procedure | Fucntion
SELECT update_employee(
  20::smallint, 
  'carlos', 
  'slim', 
  'paatron', 
  'dr', 
  '1990-01-01'::DATE,
  '2023-10-15'::DATE, 
  'cr 22',
  'NuevaCiudad', 
  'NuevaRegión',
  '25645', 
  'NuevoPaís', 
  '300', 
  '10', 
  NULL, 
  'NuevasNotas', 
  NULL, 
  'NuevaRutaDeFoto' 
);



Store procedure for get orders Create from one employee in the DATABASE

CREATE OR REPLACE FUNCTION get_orders_by_employee_id(employee_id smallint)
RETURNS TABLE (
    order_id integer,
    customer_id character varying,
    order_date date,
    required_date date,
    shipped_date date,
    ship_via smallint,
    freight real,
    ship_name character varying,
    ship_address character varying,
    ship_city character varying,
    ship_region character varying,
    ship_postal_code character varying,
    ship_country character varying
)
AS $$
BEGIN
    RETURN QUERY
    SELECT
        o.order_id,
        o.customer_id,
        o.order_date,
        o.required_date,
        o.shipped_date,
        o.ship_via,
        o.freight,
        o.ship_name,
        o.ship_address,
        o.ship_city,
        o.ship_region,
        o.ship_postal_code,
        o.ship_country
    FROM
        orders o
    WHERE
        o.employee_id = employee_id;
END;
$$ LANGUAGE plpgsql;


postgres SQL / plsql;