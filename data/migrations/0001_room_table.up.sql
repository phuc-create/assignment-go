CREATE TABLE public.room
(
    id integer NOT NULL,
    student_id integer,
    teacher_id integer,
    seat_num integer,
    CONSTRAINT "Room_pkey" PRIMARY KEY (id),
    CONSTRAINT student_id_fk FOREIGN KEY (student_id)
        REFERENCES public.student (id) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
        NOT VALID,
    CONSTRAINT teacher_id_fk FOREIGN KEY (teacher_id)
        REFERENCES public.teacher (id) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
        NOT VALID
);

ALTER TABLE IF EXISTS public.room OWNER to postgres;
