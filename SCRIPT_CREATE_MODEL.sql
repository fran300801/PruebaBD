CREATE TABLE IF NOT EXISTS esquema."PROGRAMADORES"
(
    id_programador bigint NOT NULL,
    nombre text COLLATE pg_catalog."default",
    apellido text COLLATE pg_catalog."default",
    email text COLLATE pg_catalog."default",
    especialidad text COLLATE pg_catalog."default",
    fecha_alta date,
    CONSTRAINT "PROGRAMADORES_pkey" PRIMARY KEY (id_programador)
);

CREATE TABLE IF NOT EXISTS esquema."PROYECTOS"
(
    id_proyecto bigint NOT NULL,
    nombre text COLLATE pg_catalog."default",
    descripcion text COLLATE pg_catalog."default",
    fecha_inicio date,
    fecha_fin date,
    CONSTRAINT "PROYECTOS_pkey" PRIMARY KEY (id_proyecto)
);

CREATE TABLE IF NOT EXISTS esquema."SPRINTS"
(
    id_sprint bigint NOT NULL,
    nombre text COLLATE pg_catalog."default",
    fecha_inicio date,
    fecha_fin date,
    estado boolean,
    id_proyecto bigint,
    CONSTRAINT "SPRINTS_pkey" PRIMARY KEY (id_sprint)
);

CREATE TABLE IF NOT EXISTS esquema."TAREAS"
(
    id_tarea bigint NOT NULL,
    titulo text COLLATE pg_catalog."default",
    descripcion text COLLATE pg_catalog."default",
    estado boolean,
    prioridad text COLLATE pg_catalog."default",
    horas_estimadas bigint,
    id_programador bigint,
    id_sprint bigint,
    CONSTRAINT "TAREAS_pkey" PRIMARY KEY (id_tarea)
);

ALTER TABLE IF EXISTS esquema."SPRINTS"
    ADD CONSTRAINT fk_proyecto FOREIGN KEY (id_proyecto)
    REFERENCES esquema."PROYECTOS" (id_proyecto) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS esquema."TAREAS"
    ADD CONSTRAINT fk_programador FOREIGN KEY (id_programador)
    REFERENCES esquema."PROGRAMADORES" (id_programador) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS esquema."TAREAS"
    ADD CONSTRAINT fk_sprint FOREIGN KEY (id_sprint)
    REFERENCES esquema."SPRINTS" (id_sprint) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
END;
