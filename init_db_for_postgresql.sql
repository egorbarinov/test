-- BEGIN;
-- drop schema IF EXISTS task_tracker_system cascade;
-- create schema task_tracker_system;
-- set search_path to task_tracker_system;alter table if exists task_tracker_system.projects_users drop constraint if exists FK84rxl8nqh56hi1e701b7fcsdy
alter table if exists task_tracker_system.projects_users drop constraint if exists FK81uegvc6bmldky5kqn52ddyio;
alter table if exists task_tracker_system.users_tasks drop constraint if exists FKld0lt93yib868lmnx5oruyrti;
alter table if exists task_tracker_system.users_tasks drop constraint if exists FKphskmyjd10svfk7iwnda2rib0;
drop table if exists task_tracker_system.projects cascade;
drop table if exists task_tracker_system.projects_users cascade;
drop table if exists task_tracker_system.tasks cascade;
drop table if exists task_tracker_system.users cascade;
drop table if exists task_tracker_system.users_tasks cascade;
create table task_tracker_system.projects (id bigint generated by default as identity, name varchar(255), primary key (id));
create table task_tracker_system.projects_tasks (projects_id bigint not null, tasks_id bigint not null);
create table task_tracker_system.projects_users (projects_id bigint not null, users_id bigint not null);
create table task_tracker_system.tasks (id bigint generated by default as identity, name varchar(255), primary key (id));
create table task_tracker_system.users (id bigint generated by default as identity, name varchar(255), primary key (id));
create table task_tracker_system.users_tasks (users_id bigint, tasks_id bigint not null, primary key (tasks_id));
alter table task_tracker_system.projects_tasks add constraint FKt6x9t4hfh5x0kplu5cy9nie04 foreign key (projects_id) references task_tracker_system.projects;
alter table task_tracker_system.projects_tasks add constraint FKtglcsgx2tbf8mpv3qp3dujqwg foreign key (tasks_id) references task_tracker_system.tasks;
alter table task_tracker_system.projects_users add constraint FK84rxl8nqh56hi1e701b7fcsdy foreign key (users_id) references task_tracker_system.users;
alter table task_tracker_system.projects_users add constraint FK81uegvc6bmldky5kqn52ddyio foreign key (projects_id) references task_tracker_system.projects;
alter table task_tracker_system.users_tasks add constraint FKld0lt93yib868lmnx5oruyrti foreign key (users_id) references task_tracker_system.users;
alter table task_tracker_system.users_tasks add constraint FKphskmyjd10svfk7iwnda2rib0 foreign key (tasks_id) references task_tracker_system.tasks;
INSERT INTO task_tracker_system.projects (name) VALUES ('First project'), ('Second project');
INSERT INTO task_tracker_system.users (name) VALUES ('Vasya Lozhkin'), ('Vasya Oblomov'), ('Gosha Cutcenko');
INSERT INTO task_tracker_system.tasks (name) VALUES ('Сreate a musical masterpiece'),('Write a beautiful picture'),('build a house');
INSERT INTO task_tracker_system.projects_users (projects_id, users_id) VALUES (1, 1), (1, 2), (2, 3);
INSERT INTO task_tracker_system.projects_tasks (projects_id, tasks_id) VALUES (1, 1), (1, 2), (2, 3);
INSERT INTO task_tracker_system.users_tasks (users_id, tasks_id) VALUES (1, 1), (1, 2), (2, 3);
-- COMMIT;
