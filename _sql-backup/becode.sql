-- Adminer 4.7.7 PostgreSQL dump

DROP TABLE IF EXISTS "articles";
DROP SEQUENCE IF EXISTS articles_id_seq;
CREATE SEQUENCE articles_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."articles" (
    "id" integer DEFAULT nextval('articles_id_seq') NOT NULL,
    "title" character varying,
    "author_id" integer,
    "content" character varying,
    "date" character varying,
    "categorie_id" integer,
    CONSTRAINT "articles_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "articles_author_id_fkey" FOREIGN KEY (author_id) REFERENCES users(id) ON DELETE SET NULL NOT DEFERRABLE,
    CONSTRAINT "articles_categorie_id_fkey" FOREIGN KEY (categorie_id) REFERENCES categories(id) ON DELETE SET NULL NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "articles" ("id", "title", "author_id", "content", "date", "categorie_id") VALUES
(7,	'Maecenas pharetra ac risus a interdum.',	1,	'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',	'28/02/19',	2),
(4,	'Quisque pharetra tellus orci.',	3,	'Etiam et imperdiet est. Vestibulum eget laoreet elit. Praesent leo neque, posuere viverra libero sit amet, ultrices facilisis nisl. Aenean eleifend, urna nec pharetra auctor, libero elit dignissim nunc, sed malesuada ante leo vel libero. Nullam nec odio mi. Nulla pretium cursus dignissim.',	'28/02/19',	2),
(6,	'Interdum et malesuada fames ac ante ipsum primis in faucibus',	3,	'Nam a mollis est, id congue magna. Aenean non molestie metus. Mauris sit amet lacus augue. Etiam in vestibulum sem. Integer commodo, quam vitae imperdiet mattis, nibh erat rhoncus lectus, id pharetra leo leo in urna. Sed ut leo nec ex auctor volutpat. Nam elementum metus eget odio mollis semper. Phasellus ultricies elit sagittis, rutrum augue ac, maximus arcu. Integer sit amet mattis dolor.',	'28/02/19',	3),
(5,	'Integer semper eu enim at aliquet.',	4,	'Proin ultricies ultrices mauris ut placerat. Integer congue mattis sem eu accumsan. Pellentesque porttitor sem nec leo aliquet pretium. Quisque faucibus mi lacus, eget molestie eros semper vel. Donec tristique mi odio, a consequat urna varius sed. Donec rutrum pulvinar enim, sed ornare metus egestas ut',	'28/02/19',	1),
(8,	'Proin eu mauris varius, scelerisque ipsum id, bibendum massa.',	2,	'Mauris sed neque vestibulum, efficitur odio non, placerat sem. Fusce sem orci, posuere a urna eu, pellentesque convallis tellus. Nullam sed felis risus. Donec bibendum commodo fermentum. Duis at condimentum felis, sit amet euismod est. Vivamus auctor nisl venenatis ex lacinia, non dictum erat molestie. Aliquam velit dui, venenatis posuere molestie vitae, efficitur eu lorem. Vivamus a convallis arcu, sed tempus sapien.',	'28/02/19',	1);

DROP TABLE IF EXISTS "categories";
DROP SEQUENCE IF EXISTS categories_id_seq;
CREATE SEQUENCE categories_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."categories" (
    "id" integer DEFAULT nextval('categories_id_seq') NOT NULL,
    "categorie" character varying,
    CONSTRAINT "categories_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "categories" ("id", "categorie") VALUES
(1,	'Cat1'),
(2,	'Cat2'),
(3,	'Cat3');

DROP TABLE IF EXISTS "comments";
DROP SEQUENCE IF EXISTS comments_id_seq;
CREATE SEQUENCE comments_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."comments" (
    "id" integer DEFAULT nextval('comments_id_seq') NOT NULL,
    "author_id" integer,
    "article_id" integer,
    "content" character varying,
    "date" character varying,
    CONSTRAINT "comments_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "comments_article_id_fkey" FOREIGN KEY (article_id) REFERENCES articles(id) ON DELETE CASCADE NOT DEFERRABLE,
    CONSTRAINT "comments_author_id_fkey" FOREIGN KEY (author_id) REFERENCES users(id) ON DELETE SET NULL NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "comments" ("id", "author_id", "article_id", "content", "date") VALUES
(6,	5,	8,	'Suspendisse potenti. Quisque id libero ligula. Aliquam bibendum orci et consequat faucibus. Nam consectetur ex sit amet nulla tristique accumsan. ',	'09/10/20');

DROP TABLE IF EXISTS "labels";
CREATE TABLE "public"."labels" (
    "id" integer NOT NULL,
    "user_label" character varying,
    CONSTRAINT "labels_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "labels" ("id", "user_label") VALUES
(1,	'user'),
(2,	'author'),
(3,	'admin');

DROP TABLE IF EXISTS "users";
DROP SEQUENCE IF EXISTS users_id_seq;
CREATE SEQUENCE users_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."users" (
    "id" integer DEFAULT nextval('users_id_seq') NOT NULL,
    "username" character varying,
    "password" character varying,
    "label_id" integer,
    CONSTRAINT "users_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "users_username_key" UNIQUE ("username"),
    CONSTRAINT "users_label_id_fkey" FOREIGN KEY (label_id) REFERENCES labels(id) NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "users" ("id", "username", "password", "label_id") VALUES
(4,	'Louis',	'$2y$10$roIxStO3oFUYxkM4VOCKRORD8jPsFiH0DALvFC0fo8ipNQY/g1HBq',	3),
(1,	'Joé',	'$2y$10$AdsFAkBwIHgVdNfT5IdUtOxKFsyWvhqluW3zI/1oPZev.XyhGak6u',	2),
(2,	'Vincent',	'$2y$10$J43vAL83hfVmuE33bhM6NOo2RXQOFMmokH3P2xBIeVJFFp.5Z/YZW',	2),
(5,	'Raigyo',	'$2y$10$AlbmS9ODNTpsM2rESzgbReXCFIvqgfhDProNebVa04hFbTTnMTnoe',	3),
(3,	'Matthieu',	'$2y$10$LxlwjD1FXjETb77KcL7WxeS3Xdm5wwwPgydGFIYdkEYQPlmPtm6iu',	2);

-- 2020-10-11 14:02:18.301233+00
