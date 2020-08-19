drop table BloodBankEmployee cascade constraints;
Create Table BloodBankEmployee(
    Employee_SSN char(9) not null,
    Work_Address varchar2(31),
    First_Name varchar(15),
    Last_Name varchar(15),
    primary key (Employee_SSN)
);

drop table Donation_Site cascade constraints;
Create Table Donation_Site(
    Donation_Site_ID varchar2(5) not null,
    Address varchar(100),
    primary key (Donation_Site_ID)
);

Alter Table BloodBankEmployee Add(
    foreign key (Work_Address) references Donation_Site(Donation_Site_ID)
);    

drop table Donors cascade constraints;
Create Table Donors(
    SSN char(9) not null,
    FName varchar(15),
    LName varchar(15),
    --Blood_Type varchar2(5),
    Eligible varchar2(5),
    Age number(3),
    Weight number(4),
    Iron_Level varchar2(5),
    Last_Donation varchar2(12),
    primary key(SSN)
);



drop table Blood cascade constraints;
Create Table Blood(
    Blood_ID varchar2(5) not null,
    Blood_Type varchar2(5),
    Donor_SSN char(9),
    Amount number(10,2),
    Donation_Location varchar2(30),
    Hospital_Sent_To varchar2(20),
    primary key(Blood_ID),
    foreign key (Donation_Location) references Donation_Site(Donation_Site_ID),
    foreign key (Donor_SSN) references Donors(SSN)
);

--Alter Table Donors Add(
--    foreign key (Blood_Type) references Blood(Blood_Type)
--); 

drop table Hospital cascade constraints;
Create Table Hospital(
    Hospital_ID varchar2(5),
    Hospital_Address varchar2(100),
    primary key(Hospital_ID)
);

Alter Table Blood Add(
    foreign key (Hospital_Sent_To) references Hospital(Hospital_ID)
);    

drop table Donee cascade constraints;
Create Table Donee(
    SSN char(9),
    Age varchar2(3),
    Reason varchar2(50),
    Blood_Type varchar2(5),
    Hospital_Location varchar2(30),
    primary key(SSN),
    foreign key (Hospital_Location) references Hospital(Hospital_ID)
);    