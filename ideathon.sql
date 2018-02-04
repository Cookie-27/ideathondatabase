# ideathondatabase

USE ideathon;

DROP TABLE IF EXISTS Credentials;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Posts;
DROP TABLE IF EXISTS Comments;
DROP TABLE IF EXISTS User_Post;
DROP TABLE IF EXISTS User_Comment;
DROP TABLE IF EXISTS Post_Comment;
DROP TABLE IF EXISTS User_Like;
DROP TABLE IF EXISTS Like_Post;

create table Users (
user_id char(10) not null primary key,
user_name varchar(20) references Credentials.user_name
);

insert into Users (user_id, user_name)
    values("01", "alex");
insert into Users (user_id, user_name)
    values("02", "bill");
insert into Users (user_id, user_name)
    values("03", "carl");
insert into Users (user_id, user_name)
    values("04", "dave");
insert into Users (user_id, user_name)
    values("05", "emma");

create table Credentials (
user_name varchar(20),
pwd varchar(30),
creation_date date
);

insert into Credentials (user_name, pwd, creation_date)
    values("alex", "abcde", '2014-01-02');
insert into Credentials (user_name, pwd, creation_date)
    values("bill", "bcdea", '2013-02-03');
insert into Credentials (user_name, pwd, creation_date)
    values("carl", "cdeab", '2012-04-11');
insert into Credentials (user_name, pwd, creation_date)
    values("dave", "deabc", '2016-11-23');
insert into Credentials (user_name, pwd, creation_date)
    values("emma", "eabcd", '2015-07-15');

create table Posts (
post_id char(10) not null primary key,
post_content text(500),
user_id char(10) references Users.user_id
);

insert into Posts (post_id, post_content, user_id)
    values("01", "A light-up scarf", "01");
insert into Posts (post_id, post_content, user_id)
    values("02", "A light-up bracelet", "02");
insert into Posts (post_id, post_content, user_id)
    values("03", "A light-up hat", "03");
insert into Posts (post_id, post_content, user_id)
    values("04", "A light-up jacket", "04");
insert into Posts (post_id, post_content, user_id)
    values("05", "A light-up ring", "05");

create table Comments (
comment_id char(10) not null primary key,
comment_content text(200),
user_id char(10) references Users.user_id,
post_id char(10) references Posts.post_id
);

insert into Comments (comment_id, comment_content, user_id, post_id)
    values("01", "Nice idea!", "02", "04");
insert into Comments (comment_id, comment_content, user_id, post_id)
    values("02", "Here's a picture!", "03", "05");
insert into Comments (comment_id, comment_content, user_id, post_id)
    values("03", "This could use improvement.", "04", "01");
insert into Comments (comment_id, comment_content, user_id, post_id)
    values("04", "I really like this idea!", "05", "02");
insert into Comments (comment_id, comment_content, user_id, post_id)
    values("05", "Can I build this?", "01", "03");

create table User_Like_Post (
user_id char(10) references Users.user_id,
post_id char(10) references Posts.post_id
);

insert into User_Like_Post (user_id, post_id)
	values ("02","01");
insert into User_Like_Post (user_id, post_id)
	values ("03","01");
insert into User_Like_Post (user_id, post_id)
	values ("05","01");
insert into User_Like_Post (user_id, post_id)
	values ("01","02");
insert into User_Like_Post (user_id, post_id)
	values ("05","02");
insert into User_Like_Post (user_id, post_id)
	values ("01","04");
insert into User_Like_Post (user_id, post_id)
	values ("01","03");
insert into User_Like_Post (user_id, post_id)
	values ("01","03");
insert into User_Like_Post (user_id, post_id)
	values ("02","04");
insert into User_Like_Post (user_id, post_id)
	values ("03","05");
