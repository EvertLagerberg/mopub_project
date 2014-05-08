SELECT events.*,users_events.username, groups_weekdays.wkday FROM groups_users INNER JOIN users_events ON groups_users.username=users_events.username INNER JOIN groups ON groups_users.group_id=groups.id INNER JOIN events ON users_events.event_id=events.id INNER JOIN groups_weekdays ON groups.id=groups_weekdays.group_id WHERE groups_users.group_id=1 AND (DATE(events.starttime) BETWEEN groups.startdate AND groups.enddate) AND (TIME(events.starttime) BETWEEN groups.starttime AND groups.endtime) AND binary groups_weekdays.wkday=binary dayname(events.starttime) ORDER BY events.starttime ASC;



select events.*, locations.* from events inner join events_locations on events.id=events_locations.event_id inner join locations on locations.room= events_locations.room;
