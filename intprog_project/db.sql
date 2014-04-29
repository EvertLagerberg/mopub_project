use intprog_project;

drop table groups_weekdays;
drop table groups_users;
drop table users_events;
drop table users;
drop table events;
drop table groups;
drop table locations;


create table users (
    username varchar(64) NOT NULL,
    url varchar(200),
    email varchar(64),
    
	PRIMARY KEY (username)
) ENGINE=INNODB;


create table events (
	id int NOT NULL AUTO_INCREMENT,
    name varchar(256),
    description varchar(1024),
    starttime datetime,
    endtime datetime,
    location varchar(64),
    
	PRIMARY KEY (id)
) ENGINE=INNODB;


create table users_events (
	username varchar(64) NOT NULL,
	event_id int NOT NULL,
	
	PRIMARY KEY (username, event_id),
	
	INDEX (username),
	INDEX (event_id),
	
	FOREIGN KEY (username) REFERENCES users(username)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	
	FOREIGN KEY (event_id) REFERENCES events(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
	
	
) ENGINE=INNODB;

create table groups (
	id int NOT NULL AUTO_INCREMENT,
	name varchar(64),
	starttime time,
	endtime time,
	startdate date,
	enddate date,
	
	PRIMARY KEY (id)
) ENGINE=INNODB;


create table groups_weekdays (
	group_id int NOT NULL,
	wkday varchar(64) NOT NULL,
	
	PRIMARY KEY (group_id, wkday),
	
	INDEX (group_id),
	
	FOREIGN KEY (group_id) REFERENCES groups(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
	
) ENGINE=INNODB;

create table groups_users (
	group_id int NOT NULL,
	username varchar(64) NOT NULL,
	
	PRIMARY KEY (group_id, username),
	
	
	INDEX (group_id),
	INDEX (username),
	
	FOREIGN KEY (group_id) REFERENCES groups(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	
	FOREIGN KEY (username) REFERENCES users(username)
	ON DELETE CASCADE
	ON UPDATE CASCADE
	

) ENGINE=INNODB;

create table locations (
	room varchar(64) NOT NULL,
	longitude float NOT NULL,
	latitude float NOT NULL,
	
	PRIMARY KEY (room)
	

) ENGINE=INNODB;