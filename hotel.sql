create database hotel_management_system;
use  hotel_management_system;

CREATE TABLE customer (
    customer_id          int NOT NULL primary key,
    first_name             VARCHAR(20),
    last_name              VARCHAR(20),
    Gender                 VARCHAR(20),
    phone_number      int
);

INSERT INTO customer VALUES ('21225','Bryson','smithson','M','2233234');
INSERT INTO customer VALUES ('21226','Mani','Bains','M','2233235');
INSERT INTO customer VALUES ('21227','Kara','lena','F','2233236');
INSERT INTO customer VALUES ('21228','Shashi','Lnu','F','2233237');
INSERT INTO customer VALUES ('21229','Prince','Sr','M','2233238');
INSERT INTO customer VALUES ('21230','john','kell','M','2233239');
INSERT INTO customer VALUES ('21231','harry','Peter','M','2233240');
INSERT INTO customer VALUES ('21232','Ramesh','Kumar','M','2233241');
INSERT INTO customer VALUES ('21233','David','Cooper','M','2233242');
INSERT INTO customer VALUES ('21234','Steve','Duck','M','2233243');
INSERT INTO customer VALUES ('21235','Henry','Persic','M','2233244');

SELECT * FROM customer;

CREATE TABLE Booking (
    Booking_id          INT NOT NULL primary key,
    Book_type             VARCHAR(20),
    Book_date              date not null,
    Customer_id                   int  ,
    constraint fk_booking Foreign key( Customer_id) references customer( Customer_id)
);


INSERT INTO Booking VALUES ('31311','Third_Party','2024/02/21','21225');
INSERT INTO Booking VALUES ('31312','Direct','2024/02/22','21226');
INSERT INTO Booking VALUES ('31313','Direct','2024/03/21','21227');
INSERT INTO Booking VALUES ('31314','Third_Party','2024/04/12','21228');
INSERT INTO Booking VALUES ('31315','Third_Party','2024/05/21','21229');
INSERT INTO Booking VALUES ('31316','Direct','2024/06/05','21230');
INSERT INTO Booking VALUES ('31317','Direct','2024/05/01','21231');
INSERT INTO Booking VALUES ('31318','Third_Party','2024/02/26','21232');
INSERT INTO Booking VALUES ('31319','Direct','2024/08/02','21233');
INSERT INTO Booking VALUES ('31320','Third_Party','2024/05/21','21234');
INSERT INTO Booking VALUES ('31321','Direct','2024/04/21','21235');


select * from booking;

CREATE TABLE Address (
    Street             varchar(30),
    City              varchar(30),
    State        varchar(30),
    Country             varchar(20),
    Customer_id                   int  ,
    Zip_code                     int,
        constraint fk_address Foreign key( Customer_id) references customer( Customer_id)
);
INSERT INTO Address VALUES ('22 Oak Street','San Diego','CA','US','21225','92123');
INSERT INTO Address VALUES ('22 Jump Street','Los Angeles','CA','US','21226','91123');
INSERT INTO Address VALUES ('31 Hill Avenue','San Francisco','CA','US','21227','95126');
INSERT INTO Address VALUES ('44 Areo drive','Phonenix','AZ','US','21228','92123');
INSERT INTO Address VALUES ('29 What Street','San Diego','CA','US','21229','92123');
INSERT INTO Address VALUES ('550 Upas Street','New York','NY','US','21230','92123');
INSERT INTO Address VALUES ('123 Summer Lane','Birmingham','AL','US','21231','91123');
INSERT INTO Address VALUES ('4513 Pineville Road','Chicago','IL','US','21232','95126');
INSERT INTO Address VALUES ('987 Bubbly Lane','Baltimore','MD','US','21233','92133');
INSERT INTO Address VALUES ('555 Elwood Way','Los Angeles','CA','US','21234','92134');
INSERT INTO Address VALUES ('2102 Laurelhurst Drive','Eugene','OR','US','21235','92123');

select date_format(book_date,"%d/%m/%y") from booking;

CREATE TABLE Reservation (
    Res_id          int  primary key,
    check_in_date             Date,
    check_out_date              Date,
     No_of_days                 int,
    Customer_id                   int  ,
    Booking_id                     INT,
    FOREIGN key(customer_id) references customer(customer_id),
    FOREIGN key(booking_id) references booking(booking_id)
);

INSERT INTO Reservation VALUES ('1001','2024-05-01','2024-06-02','2','21225','31311');
INSERT INTO Reservation VALUES ('1002','2024-06-01','2024-07-02','1','21226','31312');
INSERT INTO Reservation VALUES ('1003','2024-07-01','2024-08-02','2','21227','31313');
INSERT INTO Reservation VALUES ('1004','2024-08-01','2024-09-02','3','21228','31314');
INSERT INTO Reservation VALUES ('1005','2024-10-01','2024-11-02','1','21229','31315');
INSERT INTO Reservation VALUES ('1006','2024-11-01','2024-12-02','1','21230','31316');
INSERT INTO Reservation VALUES ('1007','2024-09-01','2024-10-02','1','21231','31317');
INSERT INTO Reservation VALUES ('1008','2024-05-01','2024-06-02','2','21232','31318');
INSERT INTO Reservation VALUES ('1009','2024-05-01','2024-06-02','1','21233','31319');
INSERT INTO Reservation VALUES ('1010','2024-05-01','2024-06-02','1','21234','31320');
INSERT INTO Reservation VALUES ('1011','2024-05-01','2024-06-02','1','21235','31321');

select * from reservation;

CREATE TABLE Room (
    Room_no         INT NOT NULL  ,
    Room_type             varchar(20),
    Bed_type              varchar(20),
    No_of_occupants        int,
    Room_price             double,
    Customer_id                   int  ,
    res_id                  int   ,
    FOREIGN key(customer_id) references Customer (customer_id),
    FOREIGN key(res_id) references Reservation (res_id)
);

INSERT INTO Room VALUES ('101','Standard','Queen','1','80','21225','1001');
INSERT INTO Room VALUES ('504','President','King','2','190','21226','1002');
INSERT INTO Room VALUES ('402','Executive','Queen','2','130','21227','1003');
INSERT INTO Room VALUES ('404','Executive','Queen','1','110','21228','1004');
INSERT INTO Room VALUES ('408','Executive','Queen','2','110','21229','1005');
INSERT INTO Room VALUES ('401','Executive','Queen','2','130','21230','1006');
INSERT INTO Room VALUES ('409','Executive','Queen','2','130','21231','1007');
INSERT INTO Room VALUES ('402','Executive','Queen','2','110','21232','1008');
INSERT INTO Room VALUES ('504','President','King','2','190','21233','1009');
INSERT INTO Room VALUES ('103','Standard','Queen','1','80','21234','1010');
INSERT INTO Room VALUES ('108','Standard','Queen','1','100','21235','1011');

select * from room;

CREATE TABLE transactions (
    Trans_No         int NOT NULL primary key,
    Payment_Method            varchar(20),
    Payment_Date            date,
    Customer_id       int,
    FOREIGN key(customer_id) references Customer (customer_id)  
);

INSERT INTO transactions VALUES ('222444','cash','2024-05-03','21225');
INSERT INTO transactions VALUES ('222445','credit_card','2024-06-03','21226');
INSERT INTO transactions VALUES ('222446','Debit_card','2024-07-05','21227');
INSERT INTO transactions VALUES ('222447','credit_card','2024-05-12','21228');
INSERT INTO transactions VALUES ('222449','cash','2024-08-05','21229');
INSERT INTO transactions VALUES ('222450','Debit_card','2024-07-10','21230');
INSERT INTO transactions VALUES ('222451','cash','2024-09-15','21231');
INSERT INTO transactions VALUES ('222452','cash','2024-10-07','21232');
INSERT INTO transactions VALUES ('222453','cash','2024-10-10','21233');
INSERT INTO transactions VALUES ('222454','credit_card','2024-12-14','21234');
INSERT INTO transactions VALUES ('222455','credit_card','2024-12-02','21235');

select a.customer_id, a.first_name,a.last_name,a.gender,a.phone_number,b.booking_id,b.book_type,b.book_date
 from customer a 
 join booking b
 on a.customer_id=b.customer_id;
 
 select a.customer_id,a.first_name,a.last_name,a.gender,a.phone_number,b.street,b.city,b.state,b.country,b.zip_code
 from customer a 
 join address b
 on a.customer_id=b.customer_id;
 
 select a.customer_id, a.first_name,a.last_name,a.gender,a.phone_number,c.res_id,c.check_in_date,c.check_out_date,c.no_of_days,c.booking_id
 from customer a 
 join reservation c
 on a.customer_id=c.customer_id;
 
 select a.customer_id, a.first_name,a.last_name,a.gender,a.phone_number,b.room_price,b.room_type,b.room_no,b.res_id
 from customer a 
 join room b
 on a.customer_id=b.customer_id;
 
 select a.customer_id, a.first_name,a.last_name,a.gender,a.phone_number,b.payment_method,b.payment_date
 from customer a 
 join transactions b
 on a.customer_id=b.customer_id;