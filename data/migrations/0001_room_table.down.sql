ALTER TABLE public.rooms DROP CONSTRAINT IF EXISTS teacher_id_fk;
ALTER TABLE public.rooms DROP CONSTRAINT IF EXISTS student_id_fk;

DROP TABLE IF EXISTS public.rooms;
