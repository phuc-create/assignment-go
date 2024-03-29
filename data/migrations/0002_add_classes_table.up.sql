CREATE TABLE IF NOT EXISTS public.classes
(
    class_id text NOT NULL,
    class_name text DEFAULT 'Unknow',
    attendants text DEFAULT 0,
    subject_id text,
    room_id text,
    PRIMARY KEY (class_id),
    CONSTRAINT subject_id_fk FOREIGN KEY (subject_id)
        REFERENCES public.subjects (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED
        NOT VALID,
    CONSTRAINT room_id_fk FOREIGN KEY (room_id)
        REFERENCES public.rooms (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED
        NOT VALID
);

ALTER TABLE IF EXISTS public.classes OWNER to postgres;
