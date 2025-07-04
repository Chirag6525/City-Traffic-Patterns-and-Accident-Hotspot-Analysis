-- Create database
CREATE DATABASE traffic_analysis;

-- Connect to the database and create tables
-- \c traffic_analysis;

-- Crashes table
CREATE TABLE crashes (
    crash_id SERIAL PRIMARY KEY,
    collision_id VARCHAR(50) UNIQUE,
    crash_date DATE,
    crash_time TIME,
    borough VARCHAR(50),
    zip_code VARCHAR(10),
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8),
    on_street_name VARCHAR(100),
    cross_street_name VARCHAR(100),
    persons_injured INTEGER,
    persons_killed INTEGER,
    pedestrians_injured INTEGER,
    pedestrians_killed INTEGER,
    cyclists_injured INTEGER,
    cyclists_killed INTEGER,
    motorists_injured INTEGER,
    motorists_killed INTEGER,
    contributing_factor_1 VARCHAR(100),
    contributing_factor_2 VARCHAR(100),
    vehicle_type_1 VARCHAR(50),
    vehicle_type_2 VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Vehicles table
CREATE TABLE vehicles (
    vehicle_id SERIAL PRIMARY KEY,
    collision_id VARCHAR(50),
    vehicle_type VARCHAR(50),
    vehicle_make VARCHAR(50),
    vehicle_model VARCHAR(50),
    vehicle_year INTEGER,
    travel_direction VARCHAR(20),
    vehicle_occupants INTEGER,
    driver_sex VARCHAR(10),
    driver_license_status VARCHAR(30),
    driver_license_jurisdiction VARCHAR(20),
    pre_crash VARCHAR(50),
    point_of_impact VARCHAR(50),
    vehicle_damage VARCHAR(50),
    FOREIGN KEY (collision_id) REFERENCES crashes(collision_id)
);

-- Weather table
CREATE TABLE weather (
    weather_id SERIAL PRIMARY KEY,
    date DATE,
    temperature DECIMAL(5, 2),
    humidity INTEGER,
    wind_speed DECIMAL(5, 2),
    precipitation DECIMAL(5, 2),
    weather_condition VARCHAR(50),
    visibility DECIMAL(5, 2)
);

-- Create indexes for performance
CREATE INDEX idx_crashes_date ON crashes(crash_date);
CREATE INDEX idx_crashes_location ON crashes(latitude, longitude);
CREATE INDEX idx_crashes_borough ON crashes(borough);
CREATE INDEX idx_vehicles_collision ON vehicles(collision_id);
CREATE INDEX idx_weather_date ON weather(date);