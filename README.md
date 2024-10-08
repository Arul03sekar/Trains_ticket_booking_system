Train Reservation System
Overview
The Train Reservation System is a SQL-based project designed to manage train bookings efficiently. This system allows users to view available trains, make bookings, and manage passenger information. It includes features such as tracking available seats, managing passenger details, and viewing booking histories.

Features
Train Management:

Add, update, and delete train information including train names, routes, departure/arrival times, total seats, and available seats.
Passenger Management:

Store and manage passenger details such as name, age, gender, and email.
Booking System:

Create bookings for passengers, including the number of seats booked and the booking date.
Update available seats dynamically based on bookings.
Reporting:

Generate reports on total bookings per train, average age of passengers, and more.
Retrieve lists of passengers without bookings and trains with a specified number of seats.
Database Schema
The database consists of three main tables:

Trains: Stores information about each train, including ID, name, starting point, destination, departure and arrival times, total seats, and available seats.

Passengers: Contains details about each passenger, including ID, name, age, gender, and email.

Bookings: Manages the relationship between trains and passengers, storing booking details such as booking ID, associated train ID, passenger ID, booking date, and seats booked.

SQL Queries
The project includes a variety of SQL queries for:

Retrieving data from the tables.
Inserting new records into the database.
Updating existing records based on bookings.
Deleting bookings when necessary.
Generating reports and summaries for analysis.
