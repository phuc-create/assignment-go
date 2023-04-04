ALTER TABLE public.classes DROP CONSTRAINT IF EXISTS room_id_fk;
ALTER TABLE public.classes DROP CONSTRAINT IF EXISTS subject_id_fk;

DROP TABLE IF EXISTS classes
