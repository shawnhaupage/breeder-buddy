-- Create the dogs table
CREATE TABLE dogs (
    dog_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    breed VARCHAR(255) NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    date_of_birth DATE NOT NULL,
    date_of_death DATE
);

-- Create the mating_plans table
CREATE TABLE mating_plans (
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    male_dog_id INT NOT NULL,
    female_dog_id INT NOT NULL,
    planned_date DATE NOT NULL,
    FOREIGN KEY (male_dog_id) REFERENCES dogs(dog_id),
    FOREIGN KEY (female_dog_id) REFERENCES dogs(dog_id)
);

-- Create the puppies table
CREATE TABLE puppies (
    puppy_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    breed VARCHAR(255) NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    date_of_birth DATE NOT NULL,
    mother_id INT NOT NULL,
    father_id INT NOT NULL,
    FOREIGN KEY (mother_id) REFERENCES dogs(dog_id),
    FOREIGN KEY (father_id) REFERENCES dogs(dog_id)
);

-- Create the sales_history table
CREATE TABLE sales_history (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    puppy_id INT NOT NULL,
    sale_date DATE NOT NULL,
    sale_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (puppy_id) REFERENCES puppies(puppy_id)
);


-- Dumping data for table 'puppies'
INSERT INTO puppies (puppy_id, name, breed, gender, date_of_birth, mother, father, sale_price, sold_date)
VALUES (1, 'Rover', 'Golden Retriever', 'Male', '2022-01-01', 1, 2, 1000.0, '2022-03-01'),
(2, 'Buddy', 'Beagle', 'Male', '2022-02-01', 1, 2, 2000.0, '2022-03-05');

-- Add a new mating plan
INSERT INTO mating_plans (male_dog, female_dog, planned_date)
VALUES ('Rufus', 'Bella', '2022-10-01');

-- Update an existing mating plan
UPDATE mating_plans
SET male_dog = 'Max', female_dog = 'Daisy', planned_date = '2022-12-01'
WHERE id = 2;

-- Delete a mating plan
DELETE FROM mating_plans WHERE id = 3;

-- Add a new puppy
INSERT INTO puppies (name, date_of_birth, price, sold, buyer)
VALUES ('Rufus Jr.', '2022-11-01', 1000, false, null);

-- Update a puppy's information
UPDATE puppies
SET name = 'Max Jr.', date_of_birth = '2022-11-15', price = 800, sold = true, buyer = 'John Doe'
WHERE id = 2;

-- Delete a puppy
DELETE FROM puppies WHERE id = 3;

-- Add a new sale
INSERT INTO sales (puppy_id, date, buyer, price)
VALUES (1, '2022-12-01', 'John Doe', 1000);

-- Update a sale
UPDATE sales
SET puppy_id = 2, date = '2022-12-15', buyer = 'Jane Doe', price = 800
WHERE id = 2;

-- Add some sample data to the dogs table
INSERT INTO dogs (id, name, breed, gender, date_of_birth)
VALUES
  (1, 'Rufus', 'Labrador Retriever', 'Male', '2017-01-01'),
  (2, 'Daisy', 'Golden Retriever', 'Female', '2017-02-01'),
  (3, 'Max', 'German Shepherd', 'Male', '2017-03-01'),
  (4, 'Bella', 'Poodle', 'Female', '2017-04-01'),
  (5, 'Charlie', 'Beagle', 'Male', '2017-05-01');

-- Add some sample data to the mating_plans table
INSERT INTO mating_plans (id, male_dog, female_dog, planned_date)
VALUES
  (1, 1, 2, '2022-01-01'),
  (2, 3, 4, '2022-02-01'),
  (3, 5, 2, '2022-03-01');

-- Add some sample data to the puppies table
INSERT INTO puppies (id, mother, father, date_of_birth, sold, sale_date, sale_price)
VALUES
  (1, 2, 1, '2022-01-01', 1, '2022-05-01', 1000),
  (2, 4, 3, '2022-02-01', 1, '2022-06-01', 1500),
  (3, 2, 5, '2022-03-01', 0, null, null);

-- Add some sample data to the sales_history table
INSERT INTO sales_history (id, puppy, sale_date, sale_price)
VALUES
  (1, 1, '2022-05-01', 1000),
  (2, 2, '2022-06-01', 1500);
