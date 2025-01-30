-- Table for Products
CREATE TABLE Products (
    ProductId INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(150) NOT NULL,
    Description NVARCHAR(MAX),
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL,
    CreatedDate DATETIME DEFAULT GETDATE()
);

-- Table for Orders
CREATE TABLE Orders (
    OrderId INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL FOREIGN KEY REFERENCES Users(UserId),
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10, 2) NOT NULL,
    Status NVARCHAR(50) DEFAULT 'Pending'
);

-- Table for OrderDetails
CREATE TABLE OrderDetails (
    OrderDetailId INT IDENTITY(1,1) PRIMARY KEY,
    OrderId INT NOT NULL FOREIGN KEY REFERENCES Orders(OrderId),
    ProductId INT NOT NULL FOREIGN KEY REFERENCES Products(ProductId),
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    TotalPrice AS (Quantity * UnitPrice) PERSISTED
);
--------------------------------------------------
-- Table for Flights
CREATE TABLE Flights (
    FlightId INT IDENTITY(1,1) PRIMARY KEY,
    FlightNumber NVARCHAR(50) NOT NULL,
    Airline NVARCHAR(100) NOT NULL,
    Source NVARCHAR(100) NOT NULL,
    Destination NVARCHAR(100) NOT NULL,
    DepartureTime DATETIME NOT NULL,
    ArrivalTime DATETIME NOT NULL,
    SeatCapacity INT NOT NULL,
    PricePerSeat DECIMAL(10, 2) NOT NULL,
    CreatedDate DATETIME DEFAULT GETDATE()
);

-- Table for FlightBookings
CREATE TABLE Bookings (
    BookingId INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL FOREIGN KEY REFERENCES Users(UserId),
    FlightId INT NOT NULL FOREIGN KEY REFERENCES Flights(FlightId),
    BookingDate DATETIME DEFAULT GETDATE(),
    NumberOfSeats INT NOT NULL,
    TotalPrice DECIMAL(10, 2) NOT NULL,
    Status NVARCHAR(50) DEFAULT 'Confirmed'
);

-- Table for FlightPassengers
CREATE TABLE Passengers (
    PassengerId INT IDENTITY(1,1) PRIMARY KEY,
    BookingId INT NOT NULL FOREIGN KEY REFERENCES FlightBookings(BookingId),
    PassengerName NVARCHAR(150) NOT NULL,
    Age INT NOT NULL,
    SeatNumber NVARCHAR(10) NOT NULL
);
--------------------------------------------------
-- Table for Hotels
CREATE TABLE Hotels (
    HotelId INT IDENTITY(1,1) PRIMARY KEY,
    HotelName NVARCHAR(150) NOT NULL,
    Location NVARCHAR(255) NOT NULL,
    StarRating INT NOT NULL,
    PricePerNight DECIMAL(10, 2) NOT NULL,
    CreatedDate DATETIME DEFAULT GETDATE()
);

-- Table for HotelRooms
CREATE TABLE HotelRooms (
    RoomId INT IDENTITY(1,1) PRIMARY KEY,
    HotelId INT NOT NULL FOREIGN KEY REFERENCES Hotels(HotelId),
    RoomType NVARCHAR(100) NOT NULL,
    IsAvailable BIT DEFAULT 1,
    PricePerNight DECIMAL(10, 2) NOT NULL,
    CreatedDate DATETIME DEFAULT GETDATE()
);

-- Table for HotelBookings
CREATE TABLE Bookings (
    BookingId INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL FOREIGN KEY REFERENCES Users(UserId),
    HotelId INT NOT NULL FOREIGN KEY REFERENCES Hotels(HotelId),
    RoomId INT NOT NULL FOREIGN KEY REFERENCES HotelRooms(RoomId),
    CheckInDate DATETIME NOT NULL,
    CheckOutDate DATETIME NOT NULL,
    NumberOfGuests INT NOT NULL,
    TotalPrice DECIMAL(10, 2) NOT NULL,
    BookingDate DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(50) DEFAULT 'Confirmed'
);
