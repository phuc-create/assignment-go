CREATE TABLE IF NOT EXISTS public.rooms
(
    id text NOT NULL,
    student_id text,
    teacher_id text,
    seat_num text,
    PRIMARY KEY (id),
    CONSTRAINT student_id_fk FOREIGN KEY (student_id)
        REFERENCES public.students (id) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
        NOT VALID,
    CONSTRAINT teacher_id_fk FOREIGN KEY (teacher_id)
        REFERENCES public.teachers (id) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
        NOT VALID
);

ALTER TABLE IF EXISTS public.rooms OWNER to postgres;
