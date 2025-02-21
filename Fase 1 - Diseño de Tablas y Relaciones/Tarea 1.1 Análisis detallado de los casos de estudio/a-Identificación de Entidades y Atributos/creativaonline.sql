
-- ----------------------------
-- Sequence structure for cliente_id_cliente_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."cliente_id_cliente_seq";
CREATE SEQUENCE "public"."cliente_id_cliente_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for clientes_id_cliente_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."clientes_id_cliente_seq";
CREATE SEQUENCE "public"."clientes_id_cliente_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for comunicaciones_id_mensaje_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."comunicaciones_id_mensaje_seq";
CREATE SEQUENCE "public"."comunicaciones_id_mensaje_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for documentos_id_documento_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."documentos_id_documento_seq";
CREATE SEQUENCE "public"."documentos_id_documento_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for proyectos_id_proyecto_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."proyectos_id_proyecto_seq";
CREATE SEQUENCE "public"."proyectos_id_proyecto_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for razon_social_id_razon_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."razon_social_id_razon_seq";
CREATE SEQUENCE "public"."razon_social_id_razon_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for recurso_id_recurso_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."recurso_id_recurso_seq";
CREATE SEQUENCE "public"."recurso_id_recurso_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for recursos_id_recurso_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."recursos_id_recurso_seq";
CREATE SEQUENCE "public"."recursos_id_recurso_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for registro_tiempo_id_registro_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."registro_tiempo_id_registro_seq";
CREATE SEQUENCE "public"."registro_tiempo_id_registro_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for seguimiento_horas_id_registro_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seguimiento_horas_id_registro_seq";
CREATE SEQUENCE "public"."seguimiento_horas_id_registro_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tareas_id_tarea_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tareas_id_tarea_seq";
CREATE SEQUENCE "public"."tareas_id_tarea_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for cliente
-- ----------------------------
DROP TABLE IF EXISTS "public"."cliente";
CREATE TABLE "public"."cliente" (
  "id_cliente" int4 NOT NULL DEFAULT nextval('cliente_id_cliente_seq'::regclass),
  "nombre" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "id_razon" int4
)
;

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS "public"."clientes";
CREATE TABLE "public"."clientes" (
  "id_cliente" int4 NOT NULL DEFAULT nextval('clientes_id_cliente_seq'::regclass),
  "nombre" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "razon_social" varchar(255) COLLATE "pg_catalog"."default",
  "contacto_principal" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "telefono" varchar(20) COLLATE "pg_catalog"."default",
  "correo" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for comunicaciones
-- ----------------------------
DROP TABLE IF EXISTS "public"."comunicaciones";
CREATE TABLE "public"."comunicaciones" (
  "id_mensaje" int4 NOT NULL DEFAULT nextval('comunicaciones_id_mensaje_seq'::regclass),
  "id_remitente" int4 NOT NULL,
  "id_destinatario" int4 NOT NULL,
  "mensaje" text COLLATE "pg_catalog"."default" NOT NULL,
  "fecha_envio" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Table structure for documentos
-- ----------------------------
DROP TABLE IF EXISTS "public"."documentos";
CREATE TABLE "public"."documentos" (
  "id_documento" int4 NOT NULL DEFAULT nextval('documentos_id_documento_seq'::regclass),
  "nombre" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id_proyecto" int4 NOT NULL,
  "version" int4 DEFAULT 1,
  "url" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for proyecto_recurso
-- ----------------------------
DROP TABLE IF EXISTS "public"."proyecto_recurso";
CREATE TABLE "public"."proyecto_recurso" (
  "id_proyecto" int4 NOT NULL,
  "id_recurso" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for proyectos
-- ----------------------------
DROP TABLE IF EXISTS "public"."proyectos";
CREATE TABLE "public"."proyectos" (
  "id_proyecto" int4 NOT NULL DEFAULT nextval('proyectos_id_proyecto_seq'::regclass),
  "nombre" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "descripcion" text COLLATE "pg_catalog"."default",
  "id_cliente" int4 NOT NULL,
  "fecha_inicio" date NOT NULL,
  "fecha_fin" date,
  "presupuesto" numeric(15,2),
  "estado" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for razon_social
-- ----------------------------
DROP TABLE IF EXISTS "public"."razon_social";
CREATE TABLE "public"."razon_social" (
  "id_razon" int4 NOT NULL DEFAULT nextval('razon_social_id_razon_seq'::regclass),
  "descripcion" varchar(150) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for recurso
-- ----------------------------
DROP TABLE IF EXISTS "public"."recurso";
CREATE TABLE "public"."recurso" (
  "id_recurso" int4 NOT NULL DEFAULT nextval('recurso_id_recurso_seq'::regclass),
  "nombre" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "apellido" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "rol" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for recursos
-- ----------------------------
DROP TABLE IF EXISTS "public"."recursos";
CREATE TABLE "public"."recursos" (
  "id_recurso" int4 NOT NULL DEFAULT nextval('recursos_id_recurso_seq'::regclass),
  "nombre" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "apellidos" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "rol" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "disponibilidad" bool DEFAULT true,
  "habilidades" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for registro_tiempo
-- ----------------------------
DROP TABLE IF EXISTS "public"."registro_tiempo";
CREATE TABLE "public"."registro_tiempo" (
  "id_registro" int4 NOT NULL DEFAULT nextval('registro_tiempo_id_registro_seq'::regclass),
  "id_tarea" int4,
  "id_recurso" int4,
  "horas" int4 NOT NULL,
  "fecha" date NOT NULL DEFAULT CURRENT_DATE
)
;

-- ----------------------------
-- Table structure for seguimiento_horas
-- ----------------------------
DROP TABLE IF EXISTS "public"."seguimiento_horas";
CREATE TABLE "public"."seguimiento_horas" (
  "id_registro" int4 NOT NULL DEFAULT nextval('seguimiento_horas_id_registro_seq'::regclass),
  "id_recurso" int4 NOT NULL,
  "id_tarea" int4 NOT NULL,
  "horas_trabajadas" numeric(5,2) NOT NULL,
  "fecha_registro" date NOT NULL DEFAULT CURRENT_DATE
)
;

-- ----------------------------
-- Table structure for tareas
-- ----------------------------
DROP TABLE IF EXISTS "public"."tareas";
CREATE TABLE "public"."tareas" (
  "id_tarea" int4 NOT NULL DEFAULT nextval('tareas_id_tarea_seq'::regclass),
  "nombre" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "descripcion" text COLLATE "pg_catalog"."default",
  "id_proyecto" int4 NOT NULL,
  "id_responsable" int4,
  "fecha_inicio" date NOT NULL,
  "fecha_fin" date,
  "estado" varchar(50) COLLATE "pg_catalog"."default",
  "prioridad" varchar(20) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- View structure for vista_total_horas_recurso
-- ----------------------------
DROP VIEW IF EXISTS "public"."vista_total_horas_recurso";
CREATE VIEW "public"."vista_total_horas_recurso" AS  SELECT r.id_recurso,
    r.nombre,
    r.apellido,
    sum(sh.horas_trabajadas) AS total_horas
   FROM seguimiento_horas sh
     JOIN recurso r ON sh.id_recurso = r.id_recurso
  GROUP BY r.id_recurso, r.nombre, r.apellido;

-- ----------------------------
-- View structure for vista_resumen_tareas
-- ----------------------------
DROP VIEW IF EXISTS "public"."vista_resumen_tareas";
CREATE VIEW "public"."vista_resumen_tareas" AS  SELECT p.id_proyecto,
    p.nombre AS proyecto,
    t.estado,
    count(t.id_tarea) AS total_tareas
   FROM tareas t
     JOIN proyectos p ON t.id_proyecto = p.id_proyecto
  GROUP BY p.id_proyecto, p.nombre, t.estado;

-- ----------------------------
-- View structure for vista_clientes
-- ----------------------------
DROP VIEW IF EXISTS "public"."vista_clientes";
CREATE VIEW "public"."vista_clientes" AS  SELECT c.id_cliente,
    c.nombre,
    r.descripcion AS razon_social
   FROM cliente c
     LEFT JOIN razon_social r ON c.id_razon = r.id_razon;

-- ----------------------------
-- View structure for vista_proyectos
-- ----------------------------
DROP VIEW IF EXISTS "public"."vista_proyectos";
CREATE VIEW "public"."vista_proyectos" AS  SELECT p.id_proyecto,
    p.nombre AS proyecto,
    p.descripcion,
    cl.nombre AS cliente,
    p.fecha_inicio,
    p.fecha_fin,
    p.presupuesto,
    p.estado
   FROM proyectos p
     JOIN cliente cl ON p.id_cliente = cl.id_cliente;

-- ----------------------------
-- View structure for vista_tareas
-- ----------------------------
DROP VIEW IF EXISTS "public"."vista_tareas";
CREATE VIEW "public"."vista_tareas" AS  SELECT t.id_tarea,
    t.nombre AS tarea,
    t.descripcion,
    p.nombre AS proyecto,
    r.nombre AS responsable,
    t.fecha_inicio,
    t.fecha_fin,
    t.estado,
    t.prioridad
   FROM tareas t
     JOIN proyectos p ON t.id_proyecto = p.id_proyecto
     LEFT JOIN recurso r ON t.id_responsable = r.id_recurso;

-- ----------------------------
-- View structure for vista_recursos_proyectos
-- ----------------------------
DROP VIEW IF EXISTS "public"."vista_recursos_proyectos";
CREATE VIEW "public"."vista_recursos_proyectos" AS  SELECT pr.id_proyecto,
    p.nombre AS proyecto,
    r.id_recurso,
    r.nombre,
    r.apellido,
    r.rol
   FROM proyecto_recurso pr
     JOIN proyectos p ON pr.id_proyecto = p.id_proyecto
     JOIN recurso r ON pr.id_recurso = r.id_recurso;

-- ----------------------------
-- View structure for vista_seguimiento_horas
-- ----------------------------
DROP VIEW IF EXISTS "public"."vista_seguimiento_horas";
CREATE VIEW "public"."vista_seguimiento_horas" AS  SELECT sh.id_registro,
    r.nombre AS recurso,
    r.apellido,
    t.nombre AS tarea,
    sh.horas_trabajadas,
    sh.fecha_registro
   FROM seguimiento_horas sh
     JOIN recurso r ON sh.id_recurso = r.id_recurso
     JOIN tareas t ON sh.id_tarea = t.id_tarea;

-- ----------------------------
-- View structure for vista_documentos
-- ----------------------------
DROP VIEW IF EXISTS "public"."vista_documentos";
CREATE VIEW "public"."vista_documentos" AS  SELECT d.id_documento,
    d.nombre AS documento,
    p.nombre AS proyecto,
    d.version,
    d.url
   FROM documentos d
     JOIN proyectos p ON d.id_proyecto = p.id_proyecto;

-- ----------------------------
-- View structure for vista_comunicaciones
-- ----------------------------
DROP VIEW IF EXISTS "public"."vista_comunicaciones";
CREATE VIEW "public"."vista_comunicaciones" AS  SELECT cm.id_mensaje,
    r.nombre AS remitente,
    d.nombre AS destinatario,
    cm.mensaje,
    cm.fecha_envio
   FROM comunicaciones cm
     JOIN recurso r ON cm.id_remitente = r.id_recurso
     JOIN recurso d ON cm.id_destinatario = d.id_recurso;

-- ----------------------------
-- View structure for vista_recursos_disponibles
-- ----------------------------
DROP VIEW IF EXISTS "public"."vista_recursos_disponibles";
CREATE VIEW "public"."vista_recursos_disponibles" AS  SELECT id_recurso,
    nombre,
    apellidos,
    rol,
    disponibilidad,
    habilidades
   FROM recursos
  WHERE disponibilidad = true;

-- ----------------------------
-- View structure for vista_tareas_pendientes
-- ----------------------------
DROP VIEW IF EXISTS "public"."vista_tareas_pendientes";
CREATE VIEW "public"."vista_tareas_pendientes" AS  SELECT id_tarea,
    nombre AS tarea,
    estado,
    prioridad,
    fecha_inicio,
    fecha_fin
   FROM tareas
  WHERE estado::text = ANY (ARRAY['Planificado'::character varying, 'En Curso'::character varying]::text[]);

-- ----------------------------
-- View structure for vista_proyectos_en_curso
-- ----------------------------
DROP VIEW IF EXISTS "public"."vista_proyectos_en_curso";
CREATE VIEW "public"."vista_proyectos_en_curso" AS  SELECT id_proyecto,
    nombre AS proyecto,
    estado,
    fecha_inicio,
    fecha_fin
   FROM proyectos
  WHERE estado::text = 'En Curso'::text;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."cliente_id_cliente_seq"
OWNED BY "public"."cliente"."id_cliente";
SELECT setval('"public"."cliente_id_cliente_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."clientes_id_cliente_seq"
OWNED BY "public"."clientes"."id_cliente";
SELECT setval('"public"."clientes_id_cliente_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."comunicaciones_id_mensaje_seq"
OWNED BY "public"."comunicaciones"."id_mensaje";
SELECT setval('"public"."comunicaciones_id_mensaje_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."documentos_id_documento_seq"
OWNED BY "public"."documentos"."id_documento";
SELECT setval('"public"."documentos_id_documento_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."proyectos_id_proyecto_seq"
OWNED BY "public"."proyectos"."id_proyecto";
SELECT setval('"public"."proyectos_id_proyecto_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."razon_social_id_razon_seq"
OWNED BY "public"."razon_social"."id_razon";
SELECT setval('"public"."razon_social_id_razon_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."recurso_id_recurso_seq"
OWNED BY "public"."recurso"."id_recurso";
SELECT setval('"public"."recurso_id_recurso_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."recursos_id_recurso_seq"
OWNED BY "public"."recursos"."id_recurso";
SELECT setval('"public"."recursos_id_recurso_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."registro_tiempo_id_registro_seq"
OWNED BY "public"."registro_tiempo"."id_registro";
SELECT setval('"public"."registro_tiempo_id_registro_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."seguimiento_horas_id_registro_seq"
OWNED BY "public"."seguimiento_horas"."id_registro";
SELECT setval('"public"."seguimiento_horas_id_registro_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tareas_id_tarea_seq"
OWNED BY "public"."tareas"."id_tarea";
SELECT setval('"public"."tareas_id_tarea_seq"', 1, false);

-- ----------------------------
-- Primary Key structure for table cliente
-- ----------------------------
ALTER TABLE "public"."cliente" ADD CONSTRAINT "cliente_pkey" PRIMARY KEY ("id_cliente");

-- ----------------------------
-- Uniques structure for table clientes
-- ----------------------------
ALTER TABLE "public"."clientes" ADD CONSTRAINT "clientes_correo_key" UNIQUE ("correo");

-- ----------------------------
-- Primary Key structure for table clientes
-- ----------------------------
ALTER TABLE "public"."clientes" ADD CONSTRAINT "clientes_pkey" PRIMARY KEY ("id_cliente");

-- ----------------------------
-- Primary Key structure for table comunicaciones
-- ----------------------------
ALTER TABLE "public"."comunicaciones" ADD CONSTRAINT "comunicaciones_pkey" PRIMARY KEY ("id_mensaje");

-- ----------------------------
-- Indexes structure for table documentos
-- ----------------------------
CREATE INDEX "idx_documentos_proyecto" ON "public"."documentos" USING btree (
  "id_proyecto" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table documentos
-- ----------------------------
ALTER TABLE "public"."documentos" ADD CONSTRAINT "documentos_pkey" PRIMARY KEY ("id_documento");

-- ----------------------------
-- Primary Key structure for table proyecto_recurso
-- ----------------------------
ALTER TABLE "public"."proyecto_recurso" ADD CONSTRAINT "proyecto_recurso_pkey" PRIMARY KEY ("id_proyecto", "id_recurso");

-- ----------------------------
-- Indexes structure for table proyectos
-- ----------------------------
CREATE INDEX "idx_proyectos_cliente" ON "public"."proyectos" USING btree (
  "id_cliente" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Checks structure for table proyectos
-- ----------------------------
ALTER TABLE "public"."proyectos" ADD CONSTRAINT "proyectos_estado_check" CHECK (estado::text = ANY (ARRAY['Planificado'::character varying, 'En Curso'::character varying, 'Completado'::character varying, 'Cancelado'::character varying]::text[]));

-- ----------------------------
-- Primary Key structure for table proyectos
-- ----------------------------
ALTER TABLE "public"."proyectos" ADD CONSTRAINT "proyectos_pkey" PRIMARY KEY ("id_proyecto");

-- ----------------------------
-- Uniques structure for table razon_social
-- ----------------------------
ALTER TABLE "public"."razon_social" ADD CONSTRAINT "razon_social_descripcion_key" UNIQUE ("descripcion");

-- ----------------------------
-- Primary Key structure for table razon_social
-- ----------------------------
ALTER TABLE "public"."razon_social" ADD CONSTRAINT "razon_social_pkey" PRIMARY KEY ("id_razon");

-- ----------------------------
-- Checks structure for table recurso
-- ----------------------------
ALTER TABLE "public"."recurso" ADD CONSTRAINT "recurso_rol_check" CHECK (rol::text = ANY (ARRAY['Desarrollador'::character varying, 'Diseñador'::character varying, 'Analista'::character varying, 'Tester'::character varying, 'Gerente'::character varying]::text[]));

-- ----------------------------
-- Primary Key structure for table recurso
-- ----------------------------
ALTER TABLE "public"."recurso" ADD CONSTRAINT "recurso_pkey" PRIMARY KEY ("id_recurso");

-- ----------------------------
-- Primary Key structure for table recursos
-- ----------------------------
ALTER TABLE "public"."recursos" ADD CONSTRAINT "recursos_pkey" PRIMARY KEY ("id_recurso");

-- ----------------------------
-- Checks structure for table registro_tiempo
-- ----------------------------
ALTER TABLE "public"."registro_tiempo" ADD CONSTRAINT "registro_tiempo_horas_check" CHECK (horas > 0);

-- ----------------------------
-- Primary Key structure for table registro_tiempo
-- ----------------------------
ALTER TABLE "public"."registro_tiempo" ADD CONSTRAINT "registro_tiempo_pkey" PRIMARY KEY ("id_registro");

-- ----------------------------
-- Indexes structure for table seguimiento_horas
-- ----------------------------
CREATE INDEX "idx_horas_tarea" ON "public"."seguimiento_horas" USING btree (
  "id_tarea" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table seguimiento_horas
-- ----------------------------
ALTER TABLE "public"."seguimiento_horas" ADD CONSTRAINT "seguimiento_horas_pkey" PRIMARY KEY ("id_registro");

-- ----------------------------
-- Indexes structure for table tareas
-- ----------------------------
CREATE INDEX "idx_tareas_proyecto" ON "public"."tareas" USING btree (
  "id_proyecto" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_tareas_responsable" ON "public"."tareas" USING btree (
  "id_responsable" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Checks structure for table tareas
-- ----------------------------
ALTER TABLE "public"."tareas" ADD CONSTRAINT "tareas_estado_check" CHECK (estado::text = ANY (ARRAY['Pendiente'::character varying, 'En Progreso'::character varying, 'Completada'::character varying, 'Bloqueada'::character varying]::text[]));
ALTER TABLE "public"."tareas" ADD CONSTRAINT "tareas_prioridad_check" CHECK (prioridad::text = ANY (ARRAY['Baja'::character varying, 'Media'::character varying, 'Alta'::character varying]::text[]));

-- ----------------------------
-- Primary Key structure for table tareas
-- ----------------------------
ALTER TABLE "public"."tareas" ADD CONSTRAINT "tareas_pkey" PRIMARY KEY ("id_tarea");

-- ----------------------------
-- Foreign Keys structure for table cliente
-- ----------------------------
ALTER TABLE "public"."cliente" ADD CONSTRAINT "cliente_id_razon_fkey" FOREIGN KEY ("id_razon") REFERENCES "public"."razon_social" ("id_razon") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table comunicaciones
-- ----------------------------
ALTER TABLE "public"."comunicaciones" ADD CONSTRAINT "comunicaciones_id_destinatario_fkey" FOREIGN KEY ("id_destinatario") REFERENCES "public"."recursos" ("id_recurso") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."comunicaciones" ADD CONSTRAINT "comunicaciones_id_remitente_fkey" FOREIGN KEY ("id_remitente") REFERENCES "public"."recursos" ("id_recurso") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table documentos
-- ----------------------------
ALTER TABLE "public"."documentos" ADD CONSTRAINT "documentos_id_proyecto_fkey" FOREIGN KEY ("id_proyecto") REFERENCES "public"."proyectos" ("id_proyecto") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table proyectos
-- ----------------------------
ALTER TABLE "public"."proyectos" ADD CONSTRAINT "proyectos_id_cliente_fkey" FOREIGN KEY ("id_cliente") REFERENCES "public"."clientes" ("id_cliente") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table seguimiento_horas
-- ----------------------------
ALTER TABLE "public"."seguimiento_horas" ADD CONSTRAINT "seguimiento_horas_id_recurso_fkey" FOREIGN KEY ("id_recurso") REFERENCES "public"."recursos" ("id_recurso") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."seguimiento_horas" ADD CONSTRAINT "seguimiento_horas_id_tarea_fkey" FOREIGN KEY ("id_tarea") REFERENCES "public"."tareas" ("id_tarea") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tareas
-- ----------------------------
ALTER TABLE "public"."tareas" ADD CONSTRAINT "tareas_id_proyecto_fkey" FOREIGN KEY ("id_proyecto") REFERENCES "public"."proyectos" ("id_proyecto") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."tareas" ADD CONSTRAINT "tareas_id_responsable_fkey" FOREIGN KEY ("id_responsable") REFERENCES "public"."recursos" ("id_recurso") ON DELETE SET NULL ON UPDATE NO ACTION;
