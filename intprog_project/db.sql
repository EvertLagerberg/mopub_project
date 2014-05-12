
drop table events_locations;
drop table events;
drop table locations;


create table events (
	id int NOT NULL AUTO_INCREMENT,
	username varchar(64) NOT NULL,
    name varchar(256),
    description varchar(1024),
    starttime datetime,
    endtime datetime,
    
	PRIMARY KEY (id)
) ENGINE=INNODB;



create table locations (
	room varchar(64) NOT NULL,
	longitude double NOT NULL,
	latitude double NOT NULL,
	
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