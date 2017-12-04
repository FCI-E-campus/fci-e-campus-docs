/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017-12-02 4:06:24 PM                        */
/*==============================================================*/


drop table if exists ADMIN;

drop table if exists ANNOUNCEMENT;

drop table if exists AUTHOR;

drop table if exists COMMENT;

drop table if exists COURSE;

drop table if exists COURSESCHEDULE;

drop table if exists DEPARTMENT;

drop table if exists EXTRAMATERIALS;

drop table if exists FORUM;

drop table if exists GROUP;

drop table if exists OFFICIALMATERIAL;

drop table if exists OFFICIALMATERIALUPLOADER;

drop table if exists POST;

drop table if exists PREREQUISITECOURSE;

drop table if exists PROFESSOR;

drop table if exists PROFESSORCOURSE;

drop table if exists SCHEDULEDAY;

drop table if exists SCHEDULEDAYSLOT;

drop table if exists STATICMAP;

drop table if exists STUDENT;

drop table if exists STUDENTCOURSE;

drop table if exists STUDENTDEPARTMENT;

drop table if exists TA;

drop table if exists TACOURSE;

drop table if exists TACOURSEGROUP;

drop table if exists TASK;

drop table if exists TASKCREATOR;

/*==============================================================*/
/* Table: ADMIN                                                 */
/*==============================================================*/
create table ADMIN
(
   ADMINUSERNAME        varchar(50) not null,
   PASSWORD             varchar(50) not null,
   FIRSTNAME            varchar(50) not null,
   LASTNAME             varchar(50) not null,
   primary key (ADMINUSERNAME)
);

/*==============================================================*/
/* Table: ANNOUNCEMENT                                          */
/*==============================================================*/
create table ANNOUNCEMENT
(
   ANNOUNCEMENTID       int not null,
   ADMINUSERNAME        varchar(50) not null,
   ANNOUNCEMENTTITLE    varchar(200) not null,
   ANNOUNCEMENTDESCRIPTION text not null,
   DATEPUBLISHED        datetime not null,
   primary key (ANNOUNCEMENTID)
);

/*==============================================================*/
/* Table: AUTHOR                                                */
/*==============================================================*/
create table AUTHOR
(
   AUTHORID             int not null,
   AUTHORUSERNAME       varchar(50) not null,
   AUTHORTYPE           varchar(4) not null,
   primary key (AUTHORID)
);

/*==============================================================*/
/* Table: COMMENT                                               */
/*==============================================================*/
create table COMMENT
(
   COMMENTID            int not null,
   AUTHORID             int not null,
   POSTID               int not null,
   COMMENTTEXT          text not null,
   primary key (COMMENTID)
);

/*==============================================================*/
/* Table: COURSE                                                */
/*==============================================================*/
create table COURSE
(
   COURSECODE           varchar(50) not null,
   DEPTID               int not null,
   COURSENAME           varchar(100) not null,
   DESCRIPTION          text,
   primary key (COURSECODE)
);

/*==============================================================*/
/* Table: COURSESCHEDULE                                        */
/*==============================================================*/
create table COURSESCHEDULE
(
   COURSESCHEDULEID     int not null,
   COURSECODE           varchar(50) not null,
   primary key (COURSESCHEDULEID)
);

/*==============================================================*/
/* Table: DEPARTMENT                                            */
/*==============================================================*/
create table DEPARTMENT
(
   DEPTID               int not null,
   NAME                 varchar(50) not null,
   DESCRIPTION          text,
   primary key (DEPTID)
);

/*==============================================================*/
/* Table: EXTRAMATERIALS                                        */
/*==============================================================*/
create table EXTRAMATERIALS
(
   EXTRAMATERIALID      int not null,
   STUDUSERNAME         varchar(50) not null,
   COURSECODE           varchar(50) not null,
   MATERIALNAME         varchar(100) not null,
   MATERIALDESCRIPTION  text,
   MATERIALFILEPATH     varchar(1024) not null,
   DATEADDED            datetime,
   primary key (EXTRAMATERIALID)
);

/*==============================================================*/
/* Table: FORUM                                                 */
/*==============================================================*/
create table FORUM
(
   FORUMID              int not null,
   COURSECODE           varchar(50) not null,
   primary key (FORUMID)
);

/*==============================================================*/
/* Table: GROUP                                                 */
/*==============================================================*/
create table GROUP
(
   GROUPID              int not null,
   COURSECODE           varchar(50) not null,
   NAME                 varchar(50) not null,
   primary key (GROUPID)
);

/*==============================================================*/
/* Table: OFFICIALMATERIAL                                      */
/*==============================================================*/
create table OFFICIALMATERIAL
(
   MATERIALID           int not null,
   COURSECODE           varchar(50) not null,
   TASKID               int,
   UPLOADERID           int not null,
   MATERIALNAME         varchar(100) not null,
   MATERIALDESCRIPTION  text,
   MATERIALFILEPATH     varchar(1024) not null,
   DATEADDED            datetime,
   primary key (MATERIALID)
);

/*==============================================================*/
/* Table: OFFICIALMATERIALUPLOADER                              */
/*==============================================================*/
create table OFFICIALMATERIALUPLOADER
(
   UPLOADERID           int not null,
   UPLOADERUSERNAME     varchar(50) not null,
   UPLOADERTYPE         varchar(4) not null,
   primary key (UPLOADERID)
);

/*==============================================================*/
/* Table: POST                                                  */
/*==============================================================*/
create table POST
(
   POSTID               int not null,
   FORUMID              int not null,
   AUTHORID             int not null,
   POSTTITLE            varchar(100) not null,
   POSTCONTENT          text not null,
   ANSWERED             bool,
   DATEPUBLISHED        datetime not null,
   primary key (POSTID)
);

/*==============================================================*/
/* Table: PREREQUISITECOURSE                                    */
/*==============================================================*/
create table PREREQUISITECOURSE
(
   COURSECODE           varchar(50) not null,
   COU_COURSECODE       varchar(50) not null,
   primary key (COURSECODE, COU_COURSECODE)
);

/*==============================================================*/
/* Table: PROFESSOR                                             */
/*==============================================================*/
create table PROFESSOR
(
   PROFESSORUSERNAME    varchar(50) not null,
   DEPTID               int not null,
   EMAIL                varchar(75) not null,
   PHONENUMBER          varchar(11),
   DATEOFBIRTH          date,
   DEPARTMENTID         int not null,
   primary key (PROFESSORUSERNAME)
);

/*==============================================================*/
/* Table: PROFESSORCOURSE                                       */
/*==============================================================*/
create table PROFESSORCOURSE
(
   COURSECODE           varchar(50) not null,
   PROFESSORUSERNAME    varchar(50) not null,
   primary key (COURSECODE, PROFESSORUSERNAME)
);

/*==============================================================*/
/* Table: SCHEDULEDAY                                           */
/*==============================================================*/
create table SCHEDULEDAY
(
   DAYNAME              varchar(3) not null,
   COURSESCHEDULEID     int not null,
   primary key (DAYNAME)
);

/*==============================================================*/
/* Table: SCHEDULEDAYSLOT                                       */
/*==============================================================*/
create table SCHEDULEDAYSLOT
(
   SLOTID               int not null,
   DAYNAME              varchar(3) not null,
   STARTTIME            int not null,
   DURATION             int not null,
   SLOTTYPE             varchar(3) not null,
   primary key (SLOTID)
);

/*==============================================================*/
/* Table: STATICMAP                                             */
/*==============================================================*/
create table STATICMAP
(
   STATICMAPID          int not null,
   MAPIMAGEFILEPATH     varchar(1024) not null,
   primary key (STATICMAPID)
);

/*==============================================================*/
/* Table: STUDENT                                               */
/*==============================================================*/
create table STUDENT
(
   STUDUSERNAME         varchar(50) not null,
   EMAIL                varchar(75) not null,
   PHONENUMBER          varchar(11),
   DATEOFBIRTH          date,
   FACULTYID            varchar(15) not null,
   ISMODERATOR          bool not null,
   primary key (STUDUSERNAME)
);

/*==============================================================*/
/* Table: STUDENTCOURSE                                         */
/*==============================================================*/
create table STUDENTCOURSE
(
   GROUPID              int not null,
   STUDUSERNAME         varchar(50) not null,
   COURSECODE           varchar(50) not null,
   TOTALGRADE           float
);

/*==============================================================*/
/* Table: STUDENTDEPARTMENT                                     */
/*==============================================================*/
create table STUDENTDEPARTMENT
(
   STUDUSERNAME         varchar(50) not null,
   DEPTID               int not null,
   primary key (STUDUSERNAME, DEPTID)
);

/*==============================================================*/
/* Table: TA                                                    */
/*==============================================================*/
create table TA
(
   TAUSERNAME           varchar(50) not null,
   DEPTID               int not null,
   PASSWORD             varchar(50) not null,
   FIRSTNAME            varchar(50) not null,
   LASTNAME             varchar(50) not null,
   EMAIL                varchar(75) not null,
   PHONENUMBER          varchar(11),
   DATEOFBIRTH          date,
   DEPARTMENTID         int not null,
   primary key (TAUSERNAME)
);

/*==============================================================*/
/* Table: TACOURSE                                              */
/*==============================================================*/
create table TACOURSE
(
   TACOURSEID           int not null,
   TAUSERNAME           varchar(50) not null,
   COURSECODE           varchar(50) not null,
   primary key (TACOURSEID)
);

/*==============================================================*/
/* Table: TACOURSEGROUP                                         */
/*==============================================================*/
create table TACOURSEGROUP
(
   TACOURSEID           int not null,
   GROUPID              int not null,
   primary key (TACOURSEID, GROUPID)
);

/*==============================================================*/
/* Table: TASK                                                  */
/*==============================================================*/
create table TASK
(
   TASKID               int not null,
   COURSECODE           varchar(50) not null,
   CREATORID            int not null,
   TASKNAME             varchar(100) not null,
   DESCRIPTION          text,
   DUEDATE              datetime not null,
   DATECREATED          datetime not null,
   primary key (TASKID)
);

/*==============================================================*/
/* Table: TASKCREATOR                                           */
/*==============================================================*/
create table TASKCREATOR
(
   CREATORID            int not null,
   CREATORUSERNAME      varchar(50) not null,
   CREATORTYPE          varchar(4) not null,
   primary key (CREATORID)
);

alter table ANNOUNCEMENT add constraint FK_RELATIONSHIP_26 foreign key (ADMINUSERNAME)
      references ADMIN (ADMINUSERNAME) on delete restrict on update restrict;

alter table COMMENT add constraint FK_RELATIONSHIP_28 foreign key (POSTID)
      references POST (POSTID) on delete restrict on update restrict;

alter table COMMENT add constraint FK_WRITTENBY foreign key (AUTHORID)
      references AUTHOR (AUTHORID) on delete restrict on update restrict;

alter table COURSE add constraint FK_COURSEDEPARTMENT foreign key (DEPTID)
      references DEPARTMENT (DEPTID) on delete restrict on update restrict;

alter table COURSESCHEDULE add constraint FK_RELATIONSHIP_23 foreign key (COURSECODE)
      references COURSE (COURSECODE) on delete restrict on update restrict;

alter table EXTRAMATERIALS add constraint FK_RELATIONSHIP_19 foreign key (STUDUSERNAME)
      references STUDENT (STUDUSERNAME) on delete restrict on update restrict;

alter table EXTRAMATERIALS add constraint FK_RELATIONSHIP_20 foreign key (COURSECODE)
      references COURSE (COURSECODE) on delete restrict on update restrict;

alter table FORUM add constraint FK_FORUMCLASS foreign key (COURSECODE)
      references COURSE (COURSECODE) on delete restrict on update restrict;

alter table GROUP add constraint FK_RELATIONSHIP_11 foreign key (COURSECODE)
      references COURSE (COURSECODE) on delete restrict on update restrict;

alter table OFFICIALMATERIAL add constraint FK_RELATIONSHIP_16 foreign key (COURSECODE)
      references COURSE (COURSECODE) on delete restrict on update restrict;

alter table OFFICIALMATERIAL add constraint FK_RELATIONSHIP_21 foreign key (TASKID)
      references TASK (TASKID) on delete restrict on update restrict;

alter table OFFICIALMATERIAL add constraint FK_UPLOADEDBY foreign key (UPLOADERID)
      references OFFICIALMATERIALUPLOADER (UPLOADERID) on delete restrict on update restrict;

alter table POST add constraint FK_POSTEDBY foreign key (AUTHORID)
      references AUTHOR (AUTHORID) on delete restrict on update restrict;

alter table POST add constraint FK_RELATIONSHIP_27 foreign key (FORUMID)
      references FORUM (FORUMID) on delete restrict on update restrict;

alter table PREREQUISITECOURSE add constraint FK_PREREQUISITECOURSE foreign key (COURSECODE)
      references COURSE (COURSECODE) on delete restrict on update restrict;

alter table PREREQUISITECOURSE add constraint FK_PREREQUISITECOURSE2 foreign key (COU_COURSECODE)
      references COURSE (COURSECODE) on delete restrict on update restrict;

alter table PROFESSOR add constraint FK_PROFESSORDEPARTMENT foreign key (DEPTID)
      references DEPARTMENT (DEPTID) on delete restrict on update restrict;

alter table PROFESSORCOURSE add constraint FK_PROFESSORCOURSE foreign key (COURSECODE)
      references COURSE (COURSECODE) on delete restrict on update restrict;

alter table PROFESSORCOURSE add constraint FK_PROFESSORCOURSE2 foreign key (PROFESSORUSERNAME)
      references PROFESSOR (PROFESSORUSERNAME) on delete restrict on update restrict;

alter table SCHEDULEDAY add constraint FK_RELATIONSHIP_24 foreign key (COURSESCHEDULEID)
      references COURSESCHEDULE (COURSESCHEDULEID) on delete restrict on update restrict;

alter table SCHEDULEDAYSLOT add constraint FK_RELATIONSHIP_25 foreign key (DAYNAME)
      references SCHEDULEDAY (DAYNAME) on delete restrict on update restrict;

alter table STUDENTCOURSE add constraint FK_RELATIONSHIP_10 foreign key (COURSECODE)
      references COURSE (COURSECODE) on delete restrict on update restrict;

alter table STUDENTCOURSE add constraint FK_RELATIONSHIP_12 foreign key (STUDUSERNAME)
      references STUDENT (STUDUSERNAME) on delete restrict on update restrict;

alter table STUDENTCOURSE add constraint FK_RELATIONSHIP_13 foreign key (GROUPID)
      references GROUP (GROUPID) on delete restrict on update restrict;

alter table STUDENTDEPARTMENT add constraint FK_STUDENTDEPARTMENT foreign key (STUDUSERNAME)
      references STUDENT (STUDUSERNAME) on delete restrict on update restrict;

alter table STUDENTDEPARTMENT add constraint FK_STUDENTDEPARTMENT2 foreign key (DEPTID)
      references DEPARTMENT (DEPTID) on delete restrict on update restrict;

alter table TA add constraint FK_TADEPARTMENT foreign key (DEPTID)
      references DEPARTMENT (DEPTID) on delete restrict on update restrict;

alter table TACOURSE add constraint FK_RELATIONSHIP_14 foreign key (TAUSERNAME)
      references TA (TAUSERNAME) on delete restrict on update restrict;

alter table TACOURSE add constraint FK_RELATIONSHIP_15 foreign key (COURSECODE)
      references COURSE (COURSECODE) on delete restrict on update restrict;

alter table TACOURSEGROUP add constraint FK_TACOURSEGROUP foreign key (TACOURSEID)
      references TACOURSE (TACOURSEID) on delete restrict on update restrict;

alter table TACOURSEGROUP add constraint FK_TACOURSEGROUP2 foreign key (GROUPID)
      references GROUP (GROUPID) on delete restrict on update restrict;

alter table TASK add constraint FK_CREATEDBY foreign key (CREATORID)
      references TASKCREATOR (CREATORID) on delete restrict on update restrict;

alter table TASK add constraint FK_RELATIONSHIP_22 foreign key (COURSECODE)
      references COURSE (COURSECODE) on delete restrict on update restrict;

