CREATE TABLE IF NOT EXISTS esquema."PROGRAMADORES"
(
    id_programador bigint NOT NULL,
    nombre text COLLATE pg_catalog."default",
    apellido1 text COLLATE pg_catalog."default",
    apellido2 text COLLATE pg_catalog."default",
    nick text COLLATE pg_catalog."default",
    email text COLLATE pg_catalog."default",
    especialidad text COLLATE pg_catalog."default",
    fecha_alta date,
    nacionalidad_usuario text COLLATE pg_catalog."default",
    CONSTRAINT "PROGRAMADORES_pkey" PRIMARY KEY (id_programador)
);

CREATE TABLE IF NOT EXISTS esquema."PROYECTOS"
(
    id_proyecto bigint NOT NULL,
    nombre text COLLATE pg_catalog."default",
    descripcion text COLLATE pg_catalog."default",
    localizacion_fisica text,
    fecha_inicio date,
    fecha_fin date,
    fecha_actualizacion date,
    coste number,
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
    prioridad text COLLATE pg_catalog."default",
    id_programador bigint,
    id_sprints bigint,
    CONSTRAINT "TAREAS_pkey" PRIMARY KEY (id_tarea)
);

CREATE TABLE IF NOT EXISTS esquema."ESTADO"
(
    id bigint,CONSTRAINT "TAREAS_pkey" PRIMARY KEY (id_tarea)
    descripcion text COLLATE pg_catalog."default",
    fecha_creacion date
    

);



CREATE TABLE IF NOT EXISTS esquema."ESTIMACION_TAREA"
(
    id_tarea bigint NOT NULL,
    horas_estimadas bigint,
    horas_totales bigint,
    horas_completadas bigint,
    CONSTRAINT "ESTIMACION_TAREA_pkey" PRIMARY KEY (id_tarea)
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
