
-- Drop table

-- DROP TABLE public.oauth_client_details

CREATE TABLE public.oauth_client_details (
	client_id varchar(255) NOT NULL,
	client_secret varchar(255) NOT NULL,
	resource_ids varchar(255) NULL DEFAULT NULL::character varying,
	"scope" varchar(255) NULL DEFAULT NULL::character varying,
	authorized_grant_types varchar(255) NULL DEFAULT NULL::character varying,
	web_server_redirect_uri varchar(255) NULL DEFAULT NULL::character varying,
	authorities varchar(255) NULL DEFAULT NULL::character varying,
	access_token_validity numeric(11) NULL DEFAULT NULL::numeric,
	refresh_token_validity numeric(11) NULL DEFAULT NULL::numeric,
	additional_information varchar(4096) NULL DEFAULT NULL::character varying,
	autoapprove varchar(255) NULL DEFAULT NULL::character varying,
	CONSTRAINT oauth_client_details_pkey PRIMARY KEY (client_id)
);


INSERT INTO OAUTH_CLIENT_DETAILS (
	CLIENT_ID,CLIENT_SECRET,
	RESOURCE_IDS,
	SCOPE,
	AUTHORIZED_GRANT_TYPES,
	WEB_SERVER_REDIRECT_URI,AUTHORITIES,
	ACCESS_TOKEN_VALIDITY,REFRESH_TOKEN_VALIDITY,
	ADDITIONAL_INFORMATION,AUTOAPPROVE)
	VALUES(
    'USER_CLIENT_APP','{bcrypt}$2a$10$EOs8VROb14e7ZnydvXECA.4LoIhPOoFHKvVF/iBZ/ker17Eocz4Vi',
	'USER_CLIENT_RESOURCE,USER_ADMIN_RESOURCE',
	'role_admin,role_user',
	'authorization_code,password,refresh_token,implicit',
	NULL,NULL,
	900,3600,
	'{}',NULL);

INSERT INTO OAUTH_CLIENT_DETAILS (
	CLIENT_ID,CLIENT_SECRET,
	RESOURCE_IDS,
	SCOPE,
	AUTHORIZED_GRANT_TYPES,
	WEB_SERVER_REDIRECT_URI,AUTHORITIES,
	ACCESS_TOKEN_VALIDITY,REFRESH_TOKEN_VALIDITY,
	ADDITIONAL_INFORMATION,AUTOAPPROVE)
VALUES(
				'USER_CLIENT_APP','{bcrypt}$2a$05$KgqPYO9NPNp9kWD/xqcwXuOtKXziErZsPO74uhwt/Wdq8DsxHDcom',
				'USER_CLIENT_RESOURCE,USER_ADMIN_RESOURCE',
				'role_admin,role_user',
				'authorization_code,password,refresh_token,implicit',
				NULL,NULL,
				900,3600,
				'{}',NULL);


CREATE TABLE PERMISSION (
ID serial PRIMARY KEY  ,
NAME VARCHAR(60) );

INSERT INTO PERMISSION (NAME) VALUES
('can_create_user'),
('can_update_user'),
('can_read_user'),
('can_delete_user');



		CREATE TABLE ROLE
		(ID serial PRIMARY KEY ,
		NAME VARCHAR(60) );


		INSERT INTO ROLE (NAME) VALUES
		('role_admin'),('role_user');




	CREATE TABLE PERMISSION_ROLE(
    PERMISSION_ID INT,
    FOREIGN KEY(PERMISSION_ID) REFERENCES PERMISSION(ID),
    ROLE_ID INT,
    FOREIGN KEY(ROLE_ID) REFERENCES ROLE(ID));

    INSERT INTO PERMISSION_ROLE (PERMISSION_ID, ROLE_ID) VALUES
    (1,1), /* can_create_user assigned to role_admin */
    (2,1), /* can_update_user assigned to role_admin */
    (3,1), /* can_read_user assigned to role_admin */
    (4,1), /* can_delete_user assigned to role_admin */

    (3,2);  /* can_read_user assigned to role_user */





	CREATE TABLE users (
    ID serial PRIMARY KEY ,
    USERNAME VARCHAR(24)  NOT NULL,
    PASSWORD VARCHAR(255) NOT NULL,
    EMAIL VARCHAR(255) NOT NULL,
    ENABLED BIT(1) NOT NULL,
    ACCOUNT_EXPIRED BIT(1) NOT NULL,
    CREDENTIALS_EXPIRED BIT(1) NOT NULL,
    ACCOUNT_LOCKED BIT(1) NOT NULL);





	INSERT INTO USERs (
    USERNAME,PASSWORD,
    EMAIL,ENABLED,ACCOUNT_EXPIRED,CREDENTIALS_EXPIRED,ACCOUNT_LOCKED) VALUES (
    'admin','{bcrypt}$2a$10$EOs8VROb14e7ZnydvXECA.4LoIhPOoFHKvVF/iBZ/ker17Eocz4Vi',
    'william@gmail.com',1::bit,0::bit,0::bit,0::bit),
    ('user','{bcrypt}$2a$10$EOs8VROb14e7ZnydvXECA.4LoIhPOoFHKvVF/iBZ/ker17Eocz4Vi',
    'john@gmail.com',1::bit,0::bit,0::bit,0::bit);



	CREATE TABLE ROLE_USER (ROLE_ID INT,FOREIGN KEY(ROLE_ID) REFERENCES ROLE(ID),
    USER_ID INT, FOREIGN KEY(USER_ID) REFERENCES USERS(ID));


    INSERT INTO ROLE_USER (ROLE_ID, USER_ID)
    VALUES
    (1, 1) /* role_admin assigned to admin user */,
    (2, 2) /* role_user assigned to user user */ ;









