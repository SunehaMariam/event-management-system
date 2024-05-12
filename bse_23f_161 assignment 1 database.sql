CREATE DATABASE event_management_system;
USE event_management_system;
CREATE table events(
event_id int auto_increment primary key,
event_name varchar(100) not null,
event_date date,
event_time time,
event_location varchar(100),
event_contact varchar(100)
);
CREATE table attendees(
attendee_id int auto_increment primary key,
event_id int,
attendee_name varchar(100) not null,
attendee_email varchar(100),
attendee_phone varchar(20),
foreign key (event_id) references events(event_id)
);
create table organizers(
organizer_id int auto_increment primary key,
event_id int,
organizer_name varchar(100) not null,
organizer_email varchar(100),
organizer_phone varchar(40),
foreign key (event_id) references events(event_id)
);
create table speakers(
speaker_id int auto_increment primary key,
event_id int,
speaker_name varchar(100) not null,
speaker_email varchar(100),
speaker_phone varchar(20),
foreign key (event_id) references events(event_id)
);
create table sponsors(
sponsor_id int auto_increment primary key,
event_id int,
sponsor_name varchar(100) not null,
sponsor_email varchar(100),
sponsor_phone varchar(20),
foreign key (event_id) references events(event_id)
);
create table venues(
venue_id int auto_increment primary key,
event_id int,
venue_name varchar(100) not null,
venue_address varchar(100),
foreign key (event_id) references events(event_id)
);
create table registrations(
registration_id int auto_increment primary key,
event_id int,
attendee_id int,
registration_date date,
foreign key (event_id) references events(event_id),
foreign key (attendee_id) references attendees(attendee_id)
);
create table payments(
payment_id int auto_increment primary key,
attendee_id int,
event_id int,
payment_amount DECIMAL(10,2),
payment_date date,
foreign key (attendee_id) references attendees(attendee_id),
foreign key (event_id) references events(event_id)
);
create table sessions(
session_id int auto_increment primary key,
event_id int,
session_name varchar(100) not null,
session_date date,
session_time time,
foreign key (event_id) references events(event_id)
);
create table feebacks(
feedback_id int auto_increment primary	key,
event_id int,
attendee_id int,
feedback_text text,
rating int,
foreign key (event_id) references events(event_id),
foreign key (attendee_id) references attendees(attendee_id)
);