
drop table events_locations;
drop table users_events;
drop table users;
drop table events;
drop table locations;

create table users (
    username varchar(64) NOT NULL,
	PRIMARY KEY (username)
) ENGINE=INNODB;


create table events (
	id int NOT NULL AUTO_INCREMENT,
    name varchar(256),
    description varchar(1024),
    starttime datetime,
    endtime datetime,
    
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

create table locations (
	room varchar(64) NOT NULL,
	longitude float NOT NULL,
	latitude float NOT NULL,
	
	PRIMARY KEY (room)
	

) ENGINE=INNODB;



create table events_locations (
	event_id int NOT NULL,
	room varchar(64) NOT NULL,
	
	PRIMARY KEY (event_id, room),
	
	INDEX (event_id),
	INDEX (room),
	
	FOREIGN KEY (event_id) REFERENCES events(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	
	FOREIGN KEY (room) REFERENCES locations(room)
	ON DELETE CASCADE
	ON UPDATE CASCADE
	
) ENGINE=INNODB;