use intprog_project;

drop table groups_weekdays;
drop table groups_users;
drop table users_events;
drop table users;
drop table events;
drop table groups;

create table users (
	id int NOT NULL AUTO_INCREMENT,
    username varchar(64),
    url varchar(200),
    email varchar(64),
    
	PRIMARY KEY (id)
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
	user_id int NOT NULL,
	event_id int NOT NULL,
	
	PRIMARY KEY (user_id, event_id),
	
	INDEX (user_id),
	INDEX (event_id),
	
	FOREIGN KEY (user_id) REFERENCES users(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	
	FOREIGN KEY (event_id) REFERENCES events(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
	
	
) ENGINE=INNODB;

create table groups (
	id int NOT NULL AUTO_INCREMENT,
	name varchar(64),
	startime int,
	endtime int,
	startdate datetime,
	enddate datetime,
	
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
	user_id int NOT NULL,
	
	PRIMARY KEY (group_id, user_id),
	
	
	INDEX (group_id),
	INDEX (user_id),
	
	FOREIGN KEY (group_id) REFERENCES groups(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	
	FOREIGN KEY (user_id) REFERENCES users(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
	

) ENGINE=INNODB;


	
	




