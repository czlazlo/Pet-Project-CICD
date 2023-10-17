
DROP TABLE IF EXISTS user_data;

CREATE TABLE user_data (
    id SERIAL PRIMARY KEY,
    email_address VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);

-- Insert sample data
INSERT INTO user_data (email_address, first_name, last_name) VALUES
    ('user1@example.com', 'user', 'name');
   

