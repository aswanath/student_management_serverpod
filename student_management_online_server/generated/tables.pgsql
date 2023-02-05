--
-- Class Student as table student
--

CREATE TABLE "student" (
  "id" serial,
  "name" text NOT NULL,
  "age" integer NOT NULL,
  "currentClass" integer NOT NULL,
  "place" text NOT NULL
);

ALTER TABLE ONLY "student"
  ADD CONSTRAINT student_pkey PRIMARY KEY (id);


