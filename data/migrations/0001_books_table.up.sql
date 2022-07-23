CREATE TABLE IF NOT EXISTS books
(
    id integer NOT NULL,
    book_name text COLLATE pg_catalog."default" NOT NULL,
    book_price integer NOT NULL,
    author_id integer,
    CONSTRAINT "Books_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.books
    OWNER to postgres;
