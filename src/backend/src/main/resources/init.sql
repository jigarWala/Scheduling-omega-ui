create database if not exists smartinterviewdb;
use smartinterviewdb;

drop table if exists admin_configuration;
drop table if exists available_slot;
drop table if exists candidate;
drop table if exists employee;
drop table if exists interviewer;
drop table if exists interviewer_levels;
drop table if exists interviewer_technologies;
drop table if exists level;
drop table if exists schedule_slot;
drop table if exists technology;
create table admin_configuration (id bigint not null auto_increment, interview_duration_minutes integer not null, primary key (id)) engine=MyISAM
create table available_slot (id bigint  not null AUTO_INCREMENT, from_timestamp datetime, scheduled bit not null, to_timestamp datetime, interviewer_id bigint,active bit default 1, primary key (id)) engine=MyISAM;
create table candidate (id bigint  not null AUTO_INCREMENT, name varchar(255), phone_num varchar(255), primary key (id)) engine=MyISAM;
create table employee (id bigint not null AUTO_INCREMENT, email varchar(255), name varchar(255), phone_number varchar(255), wissen_id varchar(255), primary key (id)) engine=MyISAM;
create table interviewer (id bigint not null, primary key (id)) engine=MyISAM;
create table interviewer_levels (interviewer_id bigint not null, levels_id bigint not null) engine=MyISAM;
create table interviewer_technologies (interviewer_id bigint not null, technologies_id bigint not null) engine=MyISAM;
create table level (id bigint not null AUTO_INCREMENT, level varchar(255), primary key (id)) engine=MyISAM;
create table schedule_slot (id bigint not null AUTO_INCREMENT, cancellation_reason varchar(255), cancelled bit not null,status integer,feedback varchar(255), interview_description varchar(255), candidate_id bigint, hr_id bigint, interviewer_id bigint, slot_id bigint,level_id bigint(20),technology_id bigint(20),active bit default 1, primary key (id)) engine=MyISAM;
create table technology (id bigint not null AUTO_INCREMENT, technology varchar(255), primary key (id)) engine=MyISAM;
alter table level add constraint UK_blg2y05fyk7ri0xragjn8ypu4 unique (level);
alter table technology add constraint UK_317pgmod8mshudr7jmpn0e66i unique (technology);
alter table available_slot add constraint FKf8ct05mewh6ebxrbai5x64jx6 foreign key (interviewer_id) references interviewer (id);
alter table interviewer add constraint FKgqbkdjmgxfkacl08pb3jwgnrf foreign key (id) references employee (id);
alter table interviewer_levels add constraint FKeshk09n5che6hkwtat0enxkil foreign key (levels_id) references level (id);
alter table interviewer_levels add constraint FKapbu0yfi9vp3hrwpqjkl5xik0 foreign key (interviewer_id) references interviewer (id);
alter table interviewer_technologies add constraint FKuqrwsw9ys2g7yc8dswb04q5y foreign key (technologies_id) references technology (id);
alter table interviewer_technologies add constraint FK4bo9p3m6lwk4hxdqe94csk3xe foreign key (interviewer_id) references interviewer (id);
alter table schedule_slot add constraint FKtbda1k1vaaqe0h3cv1fdn6htg foreign key (candidate_id) references candidate (id);
alter table schedule_slot add constraint FK6llu4npaxqdqk4qxun22975hq foreign key (hr_id) references employee (id);
alter table schedule_slot add constraint FK1gvh4jd33gmuh8iabisf9kqdr foreign key (interviewer_id) references interviewer (id);
alter table schedule_slot add constraint FKexydkhbx4xnjvaobfu5dtgyxx foreign key (slot_id) references available_slot (id) ;
alter table schedule_slot add constraint FK6ry4ayib5uu3dap126yqt3ol8 foreign key (technology_id) references technology (id);
alter table schedule_slot add constraint FKbcms0lo2uguad1ksef86farft foreign key (level_id) references level (id);