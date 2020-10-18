
CREATE TABLE OC_P6_Test.Address (
                id INTEGER NOT NULL,
                street_name VARCHAR NOT NULL,
                street_number SMALLINT NOT NULL,
                city VARCHAR NOT NULL,
                zip_code INTEGER NOT NULL,
                is_restaurant BOOLEAN NOT NULL,
                comment VARCHAR,
                CONSTRAINT address_pk PRIMARY KEY (id)
);


CREATE TABLE OC_P6_Test.Restaurant (
                id INTEGER NOT NULL,
                address_id INTEGER NOT NULL,
                name VARCHAR NOT NULL,
                phone_number INTEGER NOT NULL,
                is_open BOOLEAN NOT NULL,
                CONSTRAINT restaurant_pk PRIMARY KEY (id, address_id)
);


CREATE TABLE OC_P6_Test.Ingredients (
                id INTEGER NOT NULL,
                name VARCHAR NOT NULL,
                price REAL NOT NULL,
                CONSTRAINT ingredients_pk PRIMARY KEY (id)
);


CREATE TABLE OC_P6_Test.Quantity_stocks (
                restaurant_id INTEGER NOT NULL,
                ingredient_id INTEGER NOT NULL,
                address_id INTEGER NOT NULL,
                CONSTRAINT quantity_stocks_pk PRIMARY KEY (restaurant_id, ingredient_id, address_id)
);


CREATE TABLE OC_P6_Test.Pizza (
                id INTEGER NOT NULL,
                name VARCHAR NOT NULL,
                price REAL NOT NULL,
                CONSTRAINT pizza_pk PRIMARY KEY (id)
);


CREATE TABLE OC_P6_Test.Recipe (
                pizza_id INTEGER NOT NULL,
                ingredient_id INTEGER NOT NULL,
                recipe_webpage VARCHAR NOT NULL,
                CONSTRAINT recipe_pk PRIMARY KEY (pizza_id, ingredient_id)
);


CREATE TABLE OC_P6_Test.Order (
                id INTEGER NOT NULL,
                pizza_id INTEGER NOT NULL,
                date_ordered TIMESTAMP NOT NULL,
                is_paid BOOLEAN NOT NULL,
                is_delivery BOOLEAN NOT NULL,
                stage VARCHAR NOT NULL,
                cx_comment VARCHAR,
                CONSTRAINT order_pk PRIMARY KEY (id)
);


CREATE TABLE OC_P6_Test.Account (
                id INTEGER NOT NULL,
                type VARCHAR NOT NULL,
                phone_number INTEGER NOT NULL,
                email VARCHAR NOT NULL,
                password_hash TEXT NOT NULL,
                CONSTRAINT account_pk PRIMARY KEY (id)
);


CREATE TABLE OC_P6_Test.Order_history (
                id INTEGER NOT NULL,
                order_number INTEGER NOT NULL,
                CONSTRAINT order_history_pk PRIMARY KEY (id, order_number)
);


CREATE TABLE OC_P6_Test.Staff (
                id INTEGER NOT NULL,
                place_of_work_id INTEGER NOT NULL,
                address_id INTEGER NOT NULL,
                role VARCHAR NOT NULL,
                first_name VARCHAR NOT NULL,
                last_name VARCHAR NOT NULL,
                is_on_shift BOOLEAN NOT NULL,
                CONSTRAINT staff_pk PRIMARY KEY (id, place_of_work_id, address_id)
);


CREATE TABLE OC_P6_Test.Customer (
                id INTEGER NOT NULL,
                address_id INTEGER NOT NULL,
                first_name VARCHAR NOT NULL,
                last_name VARCHAR NOT NULL,
                CONSTRAINT customer_pk PRIMARY KEY (id, address_id)
);


ALTER TABLE OC_P6_Test.Customer ADD CONSTRAINT address_customer_fk
FOREIGN KEY (address_id)
REFERENCES OC_P6_Test.Address (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE OC_P6_Test.Restaurant ADD CONSTRAINT address_restaurant_fk
FOREIGN KEY (address_id)
REFERENCES OC_P6_Test.Address (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE OC_P6_Test.Staff ADD CONSTRAINT restaurant_staff_fk
FOREIGN KEY (place_of_work_id, address_id)
REFERENCES OC_P6_Test.Restaurant (id, address_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE OC_P6_Test.Quantity_stocks ADD CONSTRAINT restaurant_quantity_stocks_fk
FOREIGN KEY (restaurant_id, address_id)
REFERENCES OC_P6_Test.Restaurant (id, address_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE OC_P6_Test.Quantity_stocks ADD CONSTRAINT ingredients_quantity_stocks_fk
FOREIGN KEY (ingredient_id)
REFERENCES OC_P6_Test.Ingredients (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE OC_P6_Test.Recipe ADD CONSTRAINT ingredients_recipe_fk
FOREIGN KEY (ingredient_id)
REFERENCES OC_P6_Test.Ingredients (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE OC_P6_Test.Recipe ADD CONSTRAINT pizza_recipe_fk
FOREIGN KEY (pizza_id)
REFERENCES OC_P6_Test.Pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE OC_P6_Test.Order ADD CONSTRAINT pizza_order_fk
FOREIGN KEY (pizza_id)
REFERENCES OC_P6_Test.Pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE OC_P6_Test.Order_history ADD CONSTRAINT order_order_history_fk
FOREIGN KEY (order_number)
REFERENCES OC_P6_Test.Order (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE OC_P6_Test.Staff ADD CONSTRAINT account_staff_fk
FOREIGN KEY (id)
REFERENCES OC_P6_Test.Account (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE OC_P6_Test.Customer ADD CONSTRAINT account_customer_fk
FOREIGN KEY (id)
REFERENCES OC_P6_Test.Account (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE OC_P6_Test.Order_history ADD CONSTRAINT account_order_history_fk
FOREIGN KEY (id)
REFERENCES OC_P6_Test.Account (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
