create table `matrimony`.`Matrimony_Customer_Info` (
Profile_Id		varchar(10)	not null,
Name			varchar(50)	not null,
Age  			varchar(15)	not null,
Date_of_Birth		date		not null,
Time_of_Birth		varchar(20)     not null,
Place_of_Birth		varchar(30)	not null,
Gender			varchar(6)	not null,
Height			varchar(10)	not null,
Weight			varchar(10)	not null,
Mother_Tongue		varchar(20)	not null,
Physical_Status		varchar(20)	not null,
Caste			varchar(20)	not null,
Sub_Caste		varchar(20)	not null,
Gotram			varchar(20)	not null,
Star			varchar(20)	not null,
Sun_Sign		varchar(20)	not null,
Kuja_Dosham		varchar(20)	not null,
Eating_Habits		varchar(50)	not null,
Education		varchar(20)	not null,
Occupation		varchar(20)	not null,
Annual_Income		Float(7,2)	not null,
City			varchar(20)	not null,
State			varchar(20)	not null,
Phoneno			varchar(20)	not null,
Regd_by			varchar(20)	not null,
Ref_by			varchar(20)	not null,
Marital_Status		varchar(15)	not null,
No_of_Children		int(2)		not null,
Childeren_Living_Status varchar(5)	not null,
Religion		varchar(30)	not null,
Country			varchar(30)	not null,
Citizenship		varchar(30)	not null,
Resident_Status		varchar(30)	not null,
Employed_In		varchar(30)	not null,
Email_Id		varchar(50)	not null,
Password		varchar(20)	not null,
			primary key (Profile_Id),
			unique  key (Email_Id)
)Engine=InnoDB;

create table `matrimony`. `Matrimony_Profiles` (
Profile_Id		varchar(10)	not null,
Email_Id		varchar(50)	not null,
Secure			varchar(5)	not null,
Photo			BLOB		,
			primary key (Profile_Id),
			unique  key (Email_Id),
foreign key(Profile_Id)    references Matrimony_Customer_Info(Profile_id) on delete cascade
) Engine=InnoDB;

CREATE TABLE `matrimony`.`Matrimony_Profile_Management` (
Profile_Id		varchar(10) NOT NULL,
Email_Id		varchar(50) not null,
Membership_Type		varchar(30) NOT NULL,
Duration		int(2)	    NOT NULL,
Amount			Float(5,2)  NOT NULL,
Card_Type		varchar(30) NOT NULL,
Card_No			varchar(30) NOT NULL,
Start_Date		date	    NOT NULL,
End_date		date	    NOT NULL,
			PRIMARY KEY  (Profile_Id),
			unique  key (Email_Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `Matrimony_profile_management`
ADD FOREIGN KEY `matrimony`.`Matrimony_profile_managemen`(Profile_Id) REFERENCES matrimony_customer_info (Profile_Id) ON DELETE CASCADE;

create table `matrimony`.`Matrimony_Partner_Specification` (
Profile_Id		varchar(10)	not null,
Email_Id		varchar(50)     not null,
Details			varchar(500)	not null,
Age  			varchar(15)	not null,
Marital_Status		varchar(15)	not null,
Have_Children		varchar(10)	not null,
Height			varchar(10)	not null,
Mother_Tongue		varchar(20)	not null,
Physical_Status		varchar(20)	not null,
Caste			varchar(20)	not null,
Religion		varchar(20)	not null,
Eating_Habits		varchar(50)	not null,
Education		varchar(30)	not null,
Citizenship		varchar(30)	not null,
Occupation		varchar(30)	not null,
Country			varchar(30)	not null,
State			varchar(30)	not null,
Resident_Status		varchar(30)	not null,
Conclusion		varchar(100)	not null,
			primary key (Profile_Id),
			unique  key (Email_Id),
foreign key(Profile_Id)    references Matrimony_Customer_Info(Profile_id) on delete cascade
)Engine=InnoDB;

create table `matrimony`.`Matrimony_Response`(
Source_Id		varchar(10)	not null,
Target_Id		varchar(10)	not null,
Status			varchar(10)	not null,
Marriage_Date		date		not null,
Remarks			varchar(100)	not null,
			primary key (Source_Id),
			 unique key  (Target_Id),
foreign key(Source_Id)    references Matrimony_Customer_Info(Profile_id) on delete cascade
) Engine=InnoDB;

create table `matrimony`.`Matrimony_Messages` (
msgid			int(5)		not null,
Source_Id		varchar(10)	not null,
Target_Id		varchar(10)	not null,
Subject			varchar(100)	not null,
Message			varchar(500)	not null,
Msgdate			DATE		not null,
			primary key	(msgid)
) Engine=InnoDB;

create table `matrimony`.`Matrimony_Horoscope`(
Profile_Id		varchar(10)	not null,
Groom_Name		varchar(50)	not null,
Groom_Dob		date		not null,
Groom_Tob		varchar(10)	not null,
Groom_Pob		varchar(50)	not null,
Bride_Name		varchar(50)	not null,
Bride_Dob		date		not null,
Bride_Tob		varchar(10)	not null,
Bride_Pob		varchar(50)	not null,
Email_id		varchar(50)	not null,
Matchwith		varchar(15)	not null
)Engine=InnoDB;