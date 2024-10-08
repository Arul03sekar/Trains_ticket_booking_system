-- create schema SQLPROJECT;
use SQLPROJECT;

/*CREATE TABLE Trains (
    TrainID INT PRIMARY KEY,
    TrainName VARCHAR(100),
	startingpoint VARCHAR(100),
    Destination VARCHAR(100),
    DepartureTime DATETIME,
    ArrivalTime DATETIME,
    TotalSeats INT,
    AvailableSeats INT
);*/

select*from trains;

/*CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Email VARCHAR(100)
);*/

/*CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    TrainID INT,
    PassengerID INT,
    BookingDate DATETIME,
    SeatsBooked INT,
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID),
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID)
);*/


INSERT INTO Trains (TrainID, TrainName, startingpoint, Destination, DepartureTime, ArrivalTime, TotalSeats, AvailableSeats)VALUES
(1432, 'chennai express', 'pollachi', 'chennai', '2024-11-22 09:21:30', '2024-11-23 21:40:35', 100, 55),
(2432, 'rajdhani express', 'chennai', 'delhi', '2024-11-22 10:20:15', '2024-11-23 23:34:21', 150, 97),
(3246, 'duronto express', 'coimbotore', 'mumbai', '2024-11-22 11:25:15', '2024-11-23 23:40:02', 135, 76),
(5637, 'shatabdi express', 'Kolkata', 'palakadu', '2024-11-22 04:35:23', '2024-11-23 21:23:30', 242, 126),
(3234, 'gatimaan express', 'palakadu', 'chennai', '2024-11-22 05:45:43', '2024-11-23 23:21:33', 250, 96),
(9542, 'humsafar express', 'chennai', 'trichy', '2024-11-22 07:35:22', '2024-11-23 23:56:45', 102,42 ),
(7432, 'tejas express', 'bangalore', 'kolkata', '2024-11-22 03:45:32', '2024-11-23 07:32:32', 147,54 ),
(8343, 'garib express', 'chennai', 'bangalore', '2024-11-22 06:35:44', '2024-11-23 02:16:34', 182,90 ),
(2315, 'sampark kranti express', 'pollachi', 'trichy', '2024-11-22 03:45:21', '2024-11-23 23:56:45', 102,42 ),
(9465, 'ganadevata express', 'coimputor', 'chennai', '2024-11-22 09:27:52', '2024-11-23 21:32:35', 243,74 ),
(2145, 'jan shatabdi express', 'palani', 'karur', '2024-11-22 17:32:45', '2024-11-23 22:21:55', 133,47 ),
(7864, 'china express', 'madauri', 'chennai', '2024-11-22 19:43:28', '2024-11-23 18:46:42', 192,86),
(2314, 'palani express', 'karala', 'trichy', '2024-11-22 01:55:36', '2024-11-23 23:53:47', 123,62);


INSERT INTO Passengers (PassengerID, Name, Age, Gender, Email)VALUES 
(3388, 'John Doe', 30, 'Male', 'john@example.com'),
(9442, 'Jane Smith', 25, 'Female', 'jane@example.com'),
(2904, 'Alice Johnson', 28, 'Female', 'alice@example.com'),
(4641, 'Bob Brown', 32, 'Male', 'bob@example.com'),
(5514, 'Charlie Davis', 22, 'Male', 'charlie@example.com'),
(8782, 'Diana Evans', 27, 'Female', 'diana@example.com'),
(7887, 'Ethan Wilson', 35, 'Male', 'ethan@example.com'),
(8567, 'Fiona Garcia', 29, 'Female', 'fiona@example.com'),
(9758, 'George Martinez', 31, 'Male', 'george@example.com'),
(6543, 'Hannah Lee', 24, 'Female', 'hannah@example.com'),
(8501, 'Ian Kim', 26, 'Male', 'ian@example.com'),
(9527, 'Julia Patel', 33, 'Female', 'julia@example.com');

select*from trains;


SELECT AvailableSeats FROM Trains WHERE TrainID = 1;


INSERT INTO Bookings (BookingID, TrainID, PassengerID, BookingDate, SeatsBooked)VALUES
(9876, 1432, 9525, NOW(), 2),
(1234, 5678, 9101, NOW(), 3),
(2468, 1357, 8642, NOW(), 1),
(1111, 2222, 3333, NOW(), 4),
(7777, 8888, 9999, NOW(), 5),
(4321, 6789, 5432, NOW(), 2),
(5555, 6666, 7777, NOW(), 0),
(1230, 4560, 7890, NOW(), 6),
(9990, 8881, 7772, NOW(), 7),
(1010, 2020, 3030, NOW(), 8),
(3333, 4444, 5555, NOW(), 9);

UPDATE Trains
SET AvailableSeats = AvailableSeats - 2
WHERE TrainID = 1;



SELECT b.BookingID, p.Name, t.TrainName, b.SeatsBooked, b.BookingDate
FROM Bookings b
JOIN Passengers p ON b.PassengerID = p.PassengerID
JOIN Trains t ON b.TrainID = t.TrainID;


SELECT * FROM Bookings WHERE BookingID = 1;


DELETE FROM Bookings WHERE BookingID = 1;

UPDATE Trains
SET AvailableSeats = AvailableSeats + 2
WHERE TrainID = 1;


SELECT t.TrainName, COUNT(b.BookingID) AS TotalBookings
FROM Trains t
LEFT JOIN Bookings b ON t.TrainID = b.TrainID
GROUP BY t.TrainName;


SELECT b.BookingID, p.Name AS PassengerName, t.TrainName, b.SeatsBooked, b.BookingDate
FROM Bookings b
JOIN Passengers p ON b.PassengerID = p.PassengerID
JOIN Trains t ON b.TrainID = t.TrainID;


SELECT t.TrainName, COUNT(b.BookingID) AS TotalBookings
FROM Trains t
LEFT JOIN Bookings b ON t.TrainID = b.TrainID
GROUP BY t.TrainName;

SELECT AVG(p.Age) AS AverageAge
FROM Passengers p
JOIN Bookings b ON p.PassengerID = b.PassengerID;


SELECT p.Name, COUNT(b.BookingID) AS NumberOfBookings
FROM Passengers p
JOIN Bookings b ON p.PassengerID = b.PassengerID
GROUP BY p.PassengerID
HAVING COUNT(b.BookingID) > 1;


SELECT t.TrainName, SUM(b.SeatsBooked) AS TotalSeatsBooked
FROM Trains t
LEFT JOIN Bookings b ON t.TrainID = b.TrainID
GROUP BY t.TrainID;


SELECT p.Name 
FROM Passengers p
LEFT JOIN Bookings b ON p.PassengerID = b.PassengerID
WHERE b.BookingID IS NULL;


SELECT TrainName 
FROM Trains 
WHERE TotalSeats > 100;


SELECT t.TrainName, COUNT(b.BookingID) AS BookingCount, t.AvailableSeats
FROM Trains t
LEFT JOIN Bookings b ON t.TrainID = b.TrainID
GROUP BY t.TrainID;


SELECT p.Name, MAX(p.Age) AS HighestAge
FROM Passengers p
JOIN Bookings b ON p.PassengerID = b.PassengerID
GROUP BY p.PassengerID
ORDER BY HighestAge DESC
LIMIT 1;

