-- Chuyển đổi sang PostgreSQL
-- Tạo bảng Categories
CREATE TABLE Categories (
    Id SERIAL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    NameVN VARCHAR(50) NOT NULL
);

-- Tạo bảng Customers
CREATE TABLE Customers (
    Id VARCHAR(20) PRIMARY KEY,
    Password VARCHAR(50) NOT NULL,
    Fullname VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Photo VARCHAR(50) NOT NULL,
    Activated BOOLEAN NOT NULL,
    Admin BOOLEAN NOT NULL
);

-- Tạo bảng OrderDetails
CREATE TABLE OrderDetails (
    Id SERIAL PRIMARY KEY,
    OrderId INT NOT NULL,
    ProductId INT NOT NULL,
    UnitPrice FLOAT NOT NULL,
    Quantity INT NOT NULL,
    Discount FLOAT NOT NULL
);

-- Tạo bảng Orders
CREATE TABLE Orders (
    Id SERIAL PRIMARY KEY,
    CustomerId VARCHAR(20) NOT NULL REFERENCES Customers(Id),
    OrderDate TIMESTAMP NOT NULL,
    Address VARCHAR(60) NOT NULL,
    Amount FLOAT NOT NULL,
    Description VARCHAR(1000),
    Status INT
);

-- Tạo bảng Products
CREATE TABLE Products (
    Id SERIAL PRIMARY KEY,
    Name VARCHAR(60) NOT NULL,
    Image VARCHAR(50) NOT NULL,
    UnitPrice FLOAT NOT NULL,
    Discount FLOAT NOT NULL,
    Quantity INT NOT NULL,
    ProductDate DATE NOT NULL,
    Available BOOLEAN NOT NULL,
    CategoryId INT NOT NULL REFERENCES Categories(Id),
    Description TEXT,
    ViewCount INT
);

-- Insert dữ liệu vào bảng Categories
INSERT INTO categories (Name, NameVN) VALUES 
('Watches', 'Đồng hồ đeo tay'),
('Laptops', 'Máy tính xách tay'),
('Cameras', 'Máy ảnh');

-- Insert dữ liệu vào bảng Customers
INSERT INTO Customers (Id, Password, Fullname, Email, Photo, Activated, Admin) VALUES
('12134567', 'sssss', 'Trịnh Tuấn Vũ', 'test@gmail.com', 'Phôt.png', true, true),
('hien123', '123456', 'Dương Thị Hiền', 'trinhtuanvuu@gmail.com', 'user.png', true, false),
('hien123456', '123456', 'Dương Thị Hiền', 'hien.qthk12@gmail.com', 'user.png', false, false),
('trinhtuanvu', '123', 'Trịnh Tuấn Vũ', 'trinhtuanvuu@gmail.com', 'avata_cv.jpg', true, true),
('tuanvu', '123456', 'Trinh Tuan Vu', 'tuanvuplbp@gmail.com', 'avata_cv.jpg', true, true),
('vuongha', '123', 'Vương', 'tuanvuplbp@gmail.com', 'user.png', true, false);

-- Insert dữ liệu vào bảng OrderDetails
INSERT INTO OrderDetails (Id, OrderId, ProductId, UnitPrice, Quantity, Discount) VALUES 
(1, 8, 1016, 17.45, 1, 0),
(2, 9, 1044, 19.45, 1, 0),
(3, 9, 1003, 10, 1, 0),
(4, 10, 1043, 46, 1, 0),
(5, 10, 1076, 18, 1, 0),
(6, 10, 1069, 36, 1, 0),
(7, 10, 1071, 21.5, 1, 0),
(8, 11, 1072, 34.8, 1, 0),
(9, 11, 1043, 46, 1, 0),
(10, 11, 1067, 14, 1, 0),
(11, 12, 1001, 190, 1, 0),
(12, 12, 1019, 9.2, 1, 0),
(13, 12, 1021, 10, 1, 8),
(14, 13, 1024, 4.5, 3, 0),
(15, 14, 1016, 17.45, 2, 0),
(16, 15, 1059, 55, 1, 0),
(17, 15, 1027, 43.9, 1, 2),
(18, 16, 1015, 15.5, 1, 0),
(19, 17, 1044, 19.45, 10, 0),
(20, 18, 1081, 19, 1, 0);


-- Insert dữ liệu vào bảng Orders
INSERT INTO Orders (Id, CustomerId, OrderDate, Address, Amount, Description, Status) VALUES
(10, 'trinhtuanvu', '2020-10-26 00:00:00', '', 117.5, '', 0),
(11, 'vuongha', '2020-10-31 00:00:00', '25 man thiện p.hiep phu quận 9', 91.8, '<i><u style="background-color: rgb(51, 102, 153);"><font color="#6600ff">test</font></u></i>', 2),
(12, 'vuongha', '2020-11-03 00:00:00', '25 man thiện p.hiep phu quận 9', 214.2, '<br>', 4),
(13, 'tuanvu', '2020-11-08 00:00:00', '25 man thiện', 12.5, '', 1),
(14, 'tuanvu', '2020-11-08 00:00:00', '25 man thiện', 33.9, 'test', 0),
(15, 'tuanvu', '2020-11-14 00:00:00', '25 man thiện', 98.9, '', 1),
(16, 'tuanvu', '2022-03-02 00:00:00', 'binh phuoc', 15.5, '', 1),
(17, 'hien123', '2022-03-02 00:00:00', '28/28 Văn Chung Q .Tân Bình', 194.5, 'giao thứ 7', 0),
(18, 'hien123', '2022-03-02 00:00:00', '25 man thiện p.hiep phu quận 9', 19, '', 1);

-- Insert dữ liệu vào bảng Products
INSERT INTO Products (Id, Name, Image, UnitPrice, Discount, Quantity, ProductDate, Available, CategoryId, Description, ViewCount) VALUES
(1002, 'Change', '1002.jpg', 19, 0, 19, '1982-12-18', TRUE, 1, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily.<b> <font color="#cc3399">For example</font></b>,<i> in JavaS</i><i>cript, you can use the following statement to troubleshoot errors&nbsp;&nbsp;</i><img src="https://i.imgur.com/9zayofL.gif" width="128">', 4),
(1003, 'Aniseed Syrup', '1003.jpg', 10, 0, 10, '1973-06-14', TRUE, 2, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 5),
(1004, 'Chef Anton''s Cajun Seasoning', '1004.jpg', 22, 0, 22, '1976-03-10', TRUE, 2, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 5),
(1005, 'Chef Anton''s Gumbo Mix', '1005.jpg', 21.35, 5, 21, '1978-12-06', TRUE, 3, '', 0),
(1006, 'Grandma''s Boysenberry Spread', '1006.jpg', 25, 0, 25, '1981-09-03', TRUE, 2, '<b style="color: rgb(153, 51, 153);">EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. </b><font size="3" style="" color="#660099"><b style="">For example</b></font><b style="color: rgb(153, 51, 153);">, in JavaScript, you can use the following statement to troubleshoot errors</b>', 0),
(1008, 'Northwoods Cranberry Sauce', '1008.jpg', 40, 0, 40, '1972-02-26', FALSE, 2, NULL, 5),
(1011, 'Queso Cabrales', '1011.jpg', 21, 0, 21, '1985-11-28', TRUE, 3, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0),
(1012, 'Queso Manchego La Pastora', '1012.jpg', 38, 10, 38, '1988-08-27', TRUE, 3, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 11),
(1015, 'Genen Shouyu', '1015.jpg', 15.5, 0, 15, '1991-05-04', TRUE, 2, NULL, 4),
(1016, 'Pavlova', '1016.jpg', 17.45, 0, 17, '1996-11-09', TRUE, 3, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 5),
(1019, 'Teatime Chocolate Biscuits', '1019.jpg', 9.2, 0, 9, '2005-02-02', TRUE, 3, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 7),
(1020, 'Sir Rodney''s Marmalade', '1020.jpg', 81, 0, 81, '2007-11-01', TRUE, 3, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 1),
(1021, 'Sir Rodney''s Scones', '1021.jpg', 10, 8, 10, '2010-07-29', TRUE, 3, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0),
(1024, 'Guarana¡ Fanta¡stica', '1024.jpg', 4.5, 0, 4, '2008-03-13', FALSE, 1, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 5),
(1025, 'NuNuCa NuaaŸ-Nougat-Creme', '1025.jpg', 14, 0, 14, '2011-07-20', TRUE, 3, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 1),
(1026, 'Gumbar Gummibarchen', '1026.jpg', 31.23, 0, 31, '2009-04-17', TRUE, 3, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0),
(1027, 'Schoggi Schokolade', '1027.jpg', 43.9, 2, 43, '2007-01-14', true, 3, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 3),
(1031, 'Gorgonzola Telino', '1031.jpg', 12.5, 0, 12, '2010-10-30', false, 3, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 5),
(1032, 'Mascarpone Fabioli', '1032.jpg', 32, 0, 32, '2011-07-30', false, 3, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 3),
(1033, 'Geitost', '1033.png', 2.5, 0, 2, '2010-04-29', true, 3, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 2),
(1034, 'Sasquatch Ale', '1034.jpg', 14, 0, 14, '2010-07-30', true, 1, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0),
(1035, 'Steeleye Stout', '1035.jpg', 18, 0, 18, '2011-04-25', true, 1, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 1),
(1038, 'Cate de Blaye', '1038.jpg', 263.5, 0, 263, '1981-07-12', true, 1, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 4),
(1039, 'Chartreuse verte', '1039.jpg', 18, 0, 18, '1984-04-08', true, 1, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 1),
(1043, 'Ipoh Coffee', '1043.jpg', 46, 0, 46, '1980-03-20', true, 1, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 4),
(1044, 'Gula Malacca', '1044.jpg', 19.45, 0, 19, '1970-10-25', true, 2, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 11),
(1047, 'Zaanse koeken', '1047.jpg', 9.5, 0, 9, '1981-11-25', true, 3, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0),
(1048, 'Chocolade', '1048.jpg', 12.75, 0, 12, '1984-08-24', false, 3, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 2),
(1049, 'Maxilaku', '1049.jpg', 20, 0, 20, '1987-05-23', false, 3, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 2),
(1050, 'Valkoinen suklaa', '1050.jpg', 16.25, 0, 16, '1990-02-17', false, 3, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 1),
(1059, 'Raclette Courdavault', '1059.jpg', 55, 0, 55, '2007-09-22', true, 3, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 6),
(1060, 'Camembert Pierrot', '1060.jpg', 34, 0, 34, '2010-06-20', false, 3, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0),
(1061, 'Sirop d''aOrable', '1061.jpg', 28.5, 0, 28, '2007-05-29', false, 2, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0),
(1062, 'Tarte au sucre', '1062.jpg', 49.3, 0, 49, '2008-01-21', true, 3, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0),
(1063, 'Vegie-spread', '1063.jpg', 43.9, 0, 43, '2007-11-21', true, 2, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 7),
(1065, 'Louisiana Fiery Hot Pepper Sauce', '1065.jpg', 21.05, 0, 21, '2008-05-15', true, 2, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0),
(1066, 'Louisiana Hot Spiced Okra', '1066.jpg', 17, 0, 17, '2011-02-10', true, 2, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 3),
(1067, 'Laughing Lumberjack Lager', '1067.jpg', 14, 0, 14, '2010-12-05', true, 1, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 3),
(1068, 'Scottish Longbreads', '1068.jpg', 12.5, 0, 12, '2009-07-08', false, 3, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 2),
(1069, 'Gudbrandsdalsost', '1069.jpg', 36, 0, 36, '2011-03-09', false, 3, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 3),
(1070, 'Outback Lager', '1070.jpg', 15, 0, 15, '2009-02-21', true, 1, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 1),
(1071, 'Flotemysost', '1071.jpg', 21.5, 0, 21, '1980-09-04', true, 3, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0),
(1072, 'Mozzarella di Giovanni', '1072.jpg', 34.8, 0, 34, '1983-06-03', true, 3, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 18),
(1075, 'RhanbrAu Klosterbier', '1075.jpg', 7.75, 0, 7, '1982-10-31', true, 1, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 1),
(1076, 'Lakkalik AAri', '1076.jpg', 18, 0, 18, '1970-07-28', true, 1, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 1),
(1077, 'Original Frankfurter grane SoaŸe', '1077.gif', 13, 0, 13, '1976-04-04', true, 2, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 2),
(1081, 'Chai', '1081.jpg', 19, 0, 19, '1984-04-04', true, 1, 'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 4);


-- Tạo stored procedure trong PostgreSQL
-- Lấy tất cả sản phẩm
CREATE OR REPLACE FUNCTION SP_getAllProduct()
RETURNS TABLE (
    Id INT,
    Name VARCHAR,
    Image VARCHAR,
    UnitPrice FLOAT,
    Discount FLOAT,
    Quantity INT,
    ProductDate DATE,
    Available BOOLEAN,
    CategoryId INT,
    Description TEXT,
    ViewCount INT
) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Products;
END;
$$ LANGUAGE plpgsql;

-- Thêm danh mục
CREATE OR REPLACE FUNCTION sp_insertCategory(
    Na VARCHAR,
    NaVN VARCHAR
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Categories (Name, NameVN) VALUES (Na, NaVN);
END;
$$ LANGUAGE plpgsql;

-- Tìm kiếm sản phẩm theo khoảng giá
CREATE OR REPLACE FUNCTION SP_SearchProducts(
    MinPrice FLOAT,
    MaxPrice FLOAT
)
RETURNS TABLE (
    Id INT,
    Name VARCHAR,
    Image VARCHAR,
    UnitPrice FLOAT,
    Discount FLOAT,
    Quantity INT,
    ProductDate DATE,
    Available BOOLEAN,
    CategoryId INT,
    Description TEXT,
    ViewCount INT
) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Products WHERE UnitPrice BETWEEN MinPrice AND MaxPrice;
END;
$$ LANGUAGE plpgsql;
