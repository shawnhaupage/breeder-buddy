-- SQL data dump for Breeder Buddy

-- Create the puppies table
CREATE TABLE puppies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    breed VARCHAR(255) NOT NULL,
    birthdate DATE NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Insert some sample data into the puppies table
INSERT INTO puppies (name, breed, birthdate, price)
VALUES
    ('Rufus', 'Labrador Retriever', '2022-01-01', 1000.00),
    ('Buddy', 'Golden Retriever', '2022-02-01', 1500.00),
    ('Daisy', 'Poodle', '2022-03-01', 2000.00),
    ('Max', 'German Shepherd', '2022-04-01', 1700.00),
    ('Charlie', 'Beagle', '2022-05-01', 800.00);

-- Create the mating_plans table
CREATE TABLE mating_plans (
    id INT AUTO_INCREMENT PRIMARY KEY,
    male_dog INT NOT NULL,
    female_dog INT NOT NULL,
    planned_date DATE NOT NULL,
    FOREIGN KEY (male_dog) REFERENCES puppies (id),
    FOREIGN KEY (female_dog) REFERENCES puppies (id)
);

-- Insert some sample data into the mating_plans table
INSERT INTO mating_plans (male_dog, female_dog, planned_date)
VALUES
    (1, 2, '2022-06-01'),
    (3, 4, '2022-07-01'),
    (5, 2, '2022-08-01');

-- Create the sales_history table
CREATE TABLE sales_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    puppy INT NOT NULL,
    sale_date DATE NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (puppy) REFERENCES puppies (id)
);

-- Insert some sample data into the sales_history table
INSERT INTO sales_history (puppy, sale_date, price)
VALUES
    (1, '2022-09-01', 1000.00),
    (2, '2022-10-01', 1500.00),
    (3, '2022-11-01', 2000.00),
    (4, '2022-12-01', 1700.00),
    (5, '2023-01-01', 800.00);
