CREATE TABLE IF NOT EXISTS public."BOOKS"
(
    books_id integer NOT NULL,
    title character varying(255) COLLATE pg_catalog."default" NOT NULL,
    author character varying(255) COLLATE pg_catalog."default" NOT NULL,
    genre character varying(255) COLLATE pg_catalog."default",
    publish_date date,
    is_available boolean DEFAULT true,
    CONSTRAINT "BOOKS_pkey" PRIMARY KEY (books_id)
);

CREATE TABLE IF NOT EXISTS public."BORROWING / LOAN"
(
    loan_id integer NOT NULL,
    member_id integer NOT NULL,
    borrow_date date,
    return_date date,
    librarian_id integer NOT NULL,
    books_id integer,
    CONSTRAINT "BORROWING / LOAN_pkey" PRIMARY KEY (loan_id)
);

CREATE TABLE IF NOT EXISTS public."LIBRARIANS"
(
    librarian_id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default",
    email character varying(255) COLLATE pg_catalog."default",
    phone_no numeric,
    hire_date date,
    CONSTRAINT "LIBRARIANS_pkey" PRIMARY KEY (librarian_id)
);

CREATE TABLE IF NOT EXISTS public."MEMBERS"
(
    member_id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default",
    email character varying(255) COLLATE pg_catalog."default",
    phone_no numeric,
    join_date date,
    CONSTRAINT "MEMBERS_pkey" PRIMARY KEY (member_id)
);

ALTER TABLE IF EXISTS public."BORROWING / LOAN"
    ADD CONSTRAINT books_id FOREIGN KEY (books_id)
    REFERENCES public."BOOKS" (books_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."BORROWING / LOAN"
    ADD CONSTRAINT librarian_id FOREIGN KEY (librarian_id)
    REFERENCES public."LIBRARIANS" (librarian_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."BORROWING / LOAN"
    ADD CONSTRAINT member_id FOREIGN KEY (member_id)
    REFERENCES public."MEMBERS" (member_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;
