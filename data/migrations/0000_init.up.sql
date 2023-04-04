-- student
-- teacher
-- subject
-- school
-- room
-- class
CREATE TABLE IF NOT EXISTS public.students
(
    id integer NOT NULL,
    name text DEFAULT 'Unknow',
    phone text,
    email text,
    CONSTRAINT "Student_pkey" PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.teachers
(
    id integer NOT NULL,
    name text,
    phone text,
    email text,
    CONSTRAINT "Teacher_pkey" PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.subjects
(
    id integer NOT NULL,
    name text,
    CONSTRAINT "Subject_pkey" PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.schools
(
    id integer NOT NULL,
    name text,
    email text,
    CONSTRAINT "School_pkey" PRIMARY KEY (id)
);


ALTER TABLE IF EXISTS public.students OWNER to postgres;
ALTER TABLE IF EXISTS public.teachers OWNER to postgres;
ALTER TABLE IF EXISTS public.subjects OWNER to postgres;
ALTER TABLE IF EXISTS public.schools OWNER to postgres;
