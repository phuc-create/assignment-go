-- student
-- teacher
-- subject
-- school
-- room
-- class
CREATE TABLE IF NOT EXISTS public.student
(
    id integer NOT NULL,
    name text DEFAULT 'Unknow',
    phone text,
    email text,
    CONSTRAINT "Student_pkey" PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.teacher
(
    id integer NOT NULL,
    name text,
    phone text,
    email text,
    CONSTRAINT "Teacher_pkey" PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.subject
(
    id integer NOT NULL,
    name text,
    CONSTRAINT "Subject_pkey" PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.school 
(
    id integer NOT NULL,
    name text,
    email text,
    CONSTRAINT "School_pkey" PRIMARY KEY (id)
);


ALTER TABLE IF EXISTS public.student OWNER to postgres;
ALTER TABLE IF EXISTS public.teacher OWNER to postgres;
ALTER TABLE IF EXISTS public.subject OWNER to postgres;
ALTER TABLE IF EXISTS public.school OWNER to postgres;
