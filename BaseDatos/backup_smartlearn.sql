/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.7.2-MariaDB, for osx10.20 (arm64)
--
-- Host: localhost    Database: proyecto
-- ------------------------------------------------------
-- Server version	11.7.2-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `bitacora_productos`
--

DROP TABLE IF EXISTS `bitacora_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accion` varchar(20) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `nombre` text DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `tipo` text DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  `admin_id` int(11) NOT NULL,
  `nombre_antes` text DEFAULT NULL,
  `nombre_despues` text DEFAULT NULL,
  `precio_antes` decimal(10,2) DEFAULT NULL,
  `precio_despues` decimal(10,2) DEFAULT NULL,
  `tipo_antes` text DEFAULT NULL,
  `tipo_despues` text DEFAULT NULL,
  `consulta` text DEFAULT NULL,
  `contra_consulta` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora_productos`
--

LOCK TABLES `bitacora_productos` WRITE;
/*!40000 ALTER TABLE `bitacora_productos` DISABLE KEYS */;
INSERT INTO `bitacora_productos` VALUES
(1,'INSERTAR',20,NULL,NULL,NULL,'2025-05-14 18:49:07',3,NULL,'Felicidad 360°: hábitos diarios',NULL,499.00,NULL,'Auto-estudio (video + ebook)',NULL,NULL),
(2,'INSERTAR',21,NULL,NULL,NULL,'2025-05-14 18:49:49',3,NULL,'Mindfulness para la alegría cotidiana',NULL,650.00,NULL,'Taller en vivo (Zoom)',NULL,NULL),
(3,'INSERTAR',22,NULL,NULL,NULL,'2025-05-14 18:50:20',3,NULL,'Crea tu “mood-board” de vida feliz',NULL,399.00,NULL,'Curso creativo (video on-demand)',NULL,NULL),
(4,'INSERTAR',23,NULL,NULL,NULL,'2025-05-14 18:51:07',3,NULL,'Biohacking de la serotonina',NULL,750.00,NULL,'Masterclass (grabada)',NULL,NULL),
(5,'INSERTAR',24,NULL,NULL,NULL,'2025-05-14 18:51:56',3,NULL,'Relaciones que suman',NULL,550.00,NULL,'Curso con mentor (3 semanas)',NULL,NULL),
(6,'MODIFICAR',20,NULL,NULL,NULL,'2025-05-15 02:18:41',3,'Felicidad 360°: hábitos diarios','Felicidad 360°: hábitos diarios',499.00,600.00,'Auto-estudio (video + ebook)','Auto-estudio (video + ebook)','UPDATE productos SET nombreCurso=\'Felicidad 360°: hábitos diarios\', precioCurso=600, tipoCurso=\'Auto-estudio (video + ebook)\' WHERE id=20;','UPDATE productos SET nombreCurso=\'Felicidad 360°: hábitos diarios\', precioCurso=499, tipoCurso=\'Auto-estudio (video + ebook)\' WHERE id=20;'),
(7,'MODIFICAR',20,NULL,NULL,NULL,'2025-05-15 02:20:32',3,'Felicidad 360°: hábitos diarios','Felicidad 360°: hábitos diarios a diario',600.00,6000.00,'Auto-estudio (video + ebook)','Auto-estudio (video + ebook)','UPDATE productos SET nombreCurso=\'Felicidad 360°: hábitos diarios a diario\', precioCurso=6000, tipoCurso=\'Auto-estudio (video + ebook)\' WHERE id=20;','UPDATE productos SET nombreCurso=\'Felicidad 360°: hábitos diarios\', precioCurso=600, tipoCurso=\'Auto-estudio (video + ebook)\' WHERE id=20;'),
(8,'INSERTAR',25,NULL,NULL,NULL,'2025-05-15 03:06:18',3,NULL,'Test',NULL,500.00,NULL,'Online','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Test\', 500, \'Online\');',NULL),
(9,'ELIMINAR',25,NULL,NULL,NULL,'2025-05-15 03:06:28',3,'Test',NULL,500.00,NULL,'Online',NULL,'DELETE FROM productos WHERE id=25;','INSERT INTO productos(id,nombreCurso,precioCurso,tipoCurso) VALUES(25, \'Test\', 500, \'Online\');'),
(10,'INSERTAR',26,NULL,NULL,NULL,'2025-05-15 03:09:32',3,NULL,'test',NULL,600.00,NULL,'Online zoom ','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'test\', 600, \'Online zoom \');',NULL),
(11,'INSERTAR',27,NULL,NULL,NULL,'2025-05-15 03:14:44',5,NULL,'test4',NULL,4556.00,NULL,'online','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'test4\', 4556, \'online\');',NULL),
(12,'MODIFICAR',20,NULL,NULL,NULL,'2025-05-15 03:16:43',5,'Felicidad 360°: hábitos diarios a diario','Felicidad 360°: hábitos diarios a diario',6000.00,600000.00,'Auto-estudio (video + ebook)','Auto-estudio (video + ebook)','UPDATE productos SET nombreCurso=\'Felicidad 360°: hábitos diarios a diario\', precioCurso=600000, tipoCurso=\'Auto-estudio (video + ebook)\' WHERE id=20;','UPDATE productos SET nombreCurso=\'Felicidad 360°: hábitos diarios a diario\', precioCurso=6000, tipoCurso=\'Auto-estudio (video + ebook)\' WHERE id=20;'),
(13,'ELIMINAR',26,NULL,NULL,NULL,'2025-05-15 03:17:00',5,'test',NULL,600.00,NULL,'Online zoom ',NULL,'DELETE FROM productos WHERE id=26;','INSERT INTO productos(id,nombreCurso,precioCurso,tipoCurso) VALUES(26, \'test\', 600, \'Online zoom \');'),
(14,'INSERTAR',28,NULL,NULL,NULL,'2025-05-15 03:27:23',5,NULL,'hola',NULL,500.00,NULL,'online','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'hola\', 500, \'online\');',NULL),
(15,'ELIMINAR',28,NULL,NULL,NULL,'2025-05-15 03:31:06',5,'hola',NULL,500.00,NULL,'online',NULL,'DELETE FROM productos WHERE id=28;','INSERT INTO productos(id,nombreCurso,precioCurso,tipoCurso) VALUES(28, \'hola\', 500, \'online\');'),
(16,'MODIFICAR',27,NULL,NULL,NULL,'2025-05-15 03:31:28',5,'test4','hola123',4556.00,12.00,'online','online','UPDATE productos SET nombreCurso=\'hola123\', precioCurso=12, tipoCurso=\'online\' WHERE id=27;','UPDATE productos SET nombreCurso=\'test4\', precioCurso=4556, tipoCurso=\'online\' WHERE id=27;'),
(17,'INSERTAR',29,NULL,NULL,NULL,'2025-05-15 03:46:41',3,NULL,'Aris',NULL,500.00,NULL,'Online','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Aris\', 500, \'Online\');',NULL),
(18,'ELIMINAR',29,NULL,NULL,NULL,'2025-05-15 03:47:22',3,'Aris',NULL,500.00,NULL,'Online',NULL,'DELETE FROM productos WHERE id=29;','INSERT INTO productos(id,nombreCurso,precioCurso,tipoCurso) VALUES(29, \'Aris\', 500, \'Online\');'),
(19,'MODIFICAR',27,NULL,NULL,NULL,'2025-05-15 03:47:29',3,'hola123','hola123',12.00,1200.00,'online','online','UPDATE productos SET nombreCurso=\'hola123\', precioCurso=1200, tipoCurso=\'online\' WHERE id=27;','UPDATE productos SET nombreCurso=\'hola123\', precioCurso=12, tipoCurso=\'online\' WHERE id=27;'),
(20,'MODIFICAR',20,NULL,NULL,NULL,'2025-06-05 08:39:11',5,'Felicidad 360°: hábitos diarios a diario','Felicidad 360°: hábitos diarios a diario',600000.00,600000.00,'Auto-estudio (video + ebook)','Programación','UPDATE productos SET nombreCurso=\'Felicidad 360°: hábitos diarios a diario\', precioCurso=600000, tipoCurso=\'Programación\' WHERE id=20;','UPDATE productos SET nombreCurso=\'Felicidad 360°: hábitos diarios a diario\', precioCurso=600000, tipoCurso=\'Auto-estudio (video + ebook)\' WHERE id=20;'),
(21,'MODIFICAR',21,NULL,NULL,NULL,'2025-06-05 08:39:34',5,'Mindfulness para la alegría cotidiana','Mindfulness para la alegría cotidiana',650.00,650.00,'Taller en vivo (Zoom)','Negocios','UPDATE productos SET nombreCurso=\'Mindfulness para la alegría cotidiana\', precioCurso=650, tipoCurso=\'Negocios\' WHERE id=21;','UPDATE productos SET nombreCurso=\'Mindfulness para la alegría cotidiana\', precioCurso=650, tipoCurso=\'Taller en vivo (Zoom)\' WHERE id=21;'),
(22,'MODIFICAR',22,NULL,NULL,NULL,'2025-06-05 08:39:42',5,'Crea tu “mood-board” de vida feliz','Crea tu “mood-board” de vida feliz',399.00,399.00,'Curso creativo (video on-demand)','Música','UPDATE productos SET nombreCurso=\'Crea tu “mood-board” de vida feliz\', precioCurso=399, tipoCurso=\'Música\' WHERE id=22;','UPDATE productos SET nombreCurso=\'Crea tu “mood-board” de vida feliz\', precioCurso=399, tipoCurso=\'Curso creativo (video on-demand)\' WHERE id=22;'),
(23,'MODIFICAR',23,NULL,NULL,NULL,'2025-06-05 08:39:55',5,'Biohacking de la serotonina','Biohacking de la serotonina',750.00,750.00,'Masterclass (grabada)','Deportes','UPDATE productos SET nombreCurso=\'Biohacking de la serotonina\', precioCurso=750, tipoCurso=\'Deportes\' WHERE id=23;','UPDATE productos SET nombreCurso=\'Biohacking de la serotonina\', precioCurso=750, tipoCurso=\'Masterclass (grabada)\' WHERE id=23;'),
(24,'MODIFICAR',24,NULL,NULL,NULL,'2025-06-05 08:40:09',5,'Relaciones que suman','Relaciones que suman',550.00,550.00,'Curso con mentor (3 semanas)','Psicología','UPDATE productos SET nombreCurso=\'Relaciones que suman\', precioCurso=550, tipoCurso=\'Psicología\' WHERE id=24;','UPDATE productos SET nombreCurso=\'Relaciones que suman\', precioCurso=550, tipoCurso=\'Curso con mentor (3 semanas)\' WHERE id=24;'),
(25,'MODIFICAR',27,NULL,NULL,NULL,'2025-06-05 08:40:27',5,'hola123','hola123',1200.00,1200.00,'online','Diseño','UPDATE productos SET nombreCurso=\'hola123\', precioCurso=1200, tipoCurso=\'Diseño\' WHERE id=27;','UPDATE productos SET nombreCurso=\'hola123\', precioCurso=1200, tipoCurso=\'online\' WHERE id=27;'),
(26,'INSERTAR',30,NULL,NULL,NULL,'2025-06-05 08:49:11',5,NULL,'Introducción a la Psicología Positiva',NULL,450.00,NULL,'Psicología','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Introducción a la Psicología Positiva\', 450, \'Psicología\');',NULL),
(27,'INSERTAR',31,NULL,NULL,NULL,'2025-06-05 08:49:11',5,NULL,'Mindfulness para la Ansiedad',NULL,499.00,NULL,'Psicología','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Mindfulness para la Ansiedad\', 499, \'Psicología\');',NULL),
(28,'INSERTAR',32,NULL,NULL,NULL,'2025-06-05 08:49:11',5,NULL,'Psicología del Autoestima',NULL,475.00,NULL,'Psicología','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Psicología del Autoestima\', 475, \'Psicología\');',NULL),
(29,'INSERTAR',33,NULL,NULL,NULL,'2025-06-05 08:49:11',5,NULL,'Introducción a la Terapia Cognitivo-Conductual',NULL,520.00,NULL,'Psicología','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Introducción a la Terapia Cognitivo-Conductual\', 520, \'Psicología\');',NULL),
(30,'INSERTAR',34,NULL,NULL,NULL,'2025-06-05 08:49:19',5,NULL,'Diseño Gráfico desde Cero',NULL,600.00,NULL,'Diseño','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Diseño Gráfico desde Cero\', 600, \'Diseño\');',NULL),
(31,'INSERTAR',35,NULL,NULL,NULL,'2025-06-05 08:49:19',5,NULL,'UI/UX para Principiantes',NULL,700.00,NULL,'Diseño','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'UI/UX para Principiantes\', 700, \'Diseño\');',NULL),
(32,'INSERTAR',36,NULL,NULL,NULL,'2025-06-05 08:49:19',5,NULL,'Branding Personal',NULL,650.00,NULL,'Diseño','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Branding Personal\', 650, \'Diseño\');',NULL),
(33,'INSERTAR',37,NULL,NULL,NULL,'2025-06-05 08:49:19',5,NULL,'Diseño Editorial Digital',NULL,620.00,NULL,'Diseño','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Diseño Editorial Digital\', 620, \'Diseño\');',NULL),
(34,'INSERTAR',38,NULL,NULL,NULL,'2025-06-05 08:49:31',5,NULL,'Programación en Python desde Cero',NULL,499.00,NULL,'Programación','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Programación en Python desde Cero\', 499, \'Programación\');',NULL),
(35,'INSERTAR',39,NULL,NULL,NULL,'2025-06-05 08:49:31',5,NULL,'Introducción a HTML y CSS',NULL,450.00,NULL,'Programación','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Introducción a HTML y CSS\', 450, \'Programación\');',NULL),
(36,'INSERTAR',40,NULL,NULL,NULL,'2025-06-05 08:49:31',5,NULL,'JavaScript para Interacciones Web',NULL,520.00,NULL,'Programación','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'JavaScript para Interacciones Web\', 520, \'Programación\');',NULL),
(37,'INSERTAR',41,NULL,NULL,NULL,'2025-06-05 08:49:31',5,NULL,'Automatización con Python',NULL,550.00,NULL,'Programación','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Automatización con Python\', 550, \'Programación\');',NULL),
(38,'INSERTAR',42,NULL,NULL,NULL,'2025-06-05 08:49:36',5,NULL,'Hábitos para una Vida Plena',NULL,480.00,NULL,'Desarrollo personal','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Hábitos para una Vida Plena\', 480, \'Desarrollo personal\');',NULL),
(39,'INSERTAR',43,NULL,NULL,NULL,'2025-06-05 08:49:36',5,NULL,'Cómo Ser Más Productivo sin Agotarte',NULL,520.00,NULL,'Desarrollo personal','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Cómo Ser Más Productivo sin Agotarte\', 520, \'Desarrollo personal\');',NULL),
(40,'INSERTAR',44,NULL,NULL,NULL,'2025-06-05 08:49:36',5,NULL,'Autoconocimiento y Propósito de Vida',NULL,600.00,NULL,'Desarrollo personal','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Autoconocimiento y Propósito de Vida\', 600, \'Desarrollo personal\');',NULL),
(41,'INSERTAR',45,NULL,NULL,NULL,'2025-06-05 08:49:36',5,NULL,'Gestión del Tiempo y Energía',NULL,550.00,NULL,'Desarrollo personal','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Gestión del Tiempo y Energía\', 550, \'Desarrollo personal\');',NULL),
(42,'INSERTAR',46,NULL,NULL,NULL,'2025-06-05 08:49:44',5,NULL,'Emprende desde Cero',NULL,650.00,NULL,'Negocios','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Emprende desde Cero\', 650, \'Negocios\');',NULL),
(43,'INSERTAR',47,NULL,NULL,NULL,'2025-06-05 08:49:44',5,NULL,'Modelos de Negocio Exitosos',NULL,620.00,NULL,'Negocios','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Modelos de Negocio Exitosos\', 620, \'Negocios\');',NULL),
(44,'INSERTAR',48,NULL,NULL,NULL,'2025-06-05 08:49:44',5,NULL,'Marketing Digital Estratégico',NULL,700.00,NULL,'Negocios','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Marketing Digital Estratégico\', 700, \'Negocios\');',NULL),
(45,'INSERTAR',49,NULL,NULL,NULL,'2025-06-05 08:49:44',5,NULL,'Gestión Financiera para Emprendedores',NULL,675.00,NULL,'Negocios','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Gestión Financiera para Emprendedores\', 675, \'Negocios\');',NULL),
(46,'INSERTAR',50,NULL,NULL,NULL,'2025-06-05 08:49:50',5,NULL,'Fundamentos de Inteligencia Artificial',NULL,720.00,NULL,'Tecnología','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Fundamentos de Inteligencia Artificial\', 720, \'Tecnología\');',NULL),
(47,'INSERTAR',51,NULL,NULL,NULL,'2025-06-05 08:49:50',5,NULL,'Ciberseguridad para Todos',NULL,680.00,NULL,'Tecnología','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Ciberseguridad para Todos\', 680, \'Tecnología\');',NULL),
(48,'INSERTAR',52,NULL,NULL,NULL,'2025-06-05 08:49:50',5,NULL,'Introducción al Internet de las Cosas (IoT)',NULL,750.00,NULL,'Tecnología','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Introducción al Internet de las Cosas (IoT)\', 750, \'Tecnología\');',NULL),
(49,'INSERTAR',53,NULL,NULL,NULL,'2025-06-05 08:49:50',5,NULL,'Bases de Datos con SQL',NULL,600.00,NULL,'Tecnología','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Bases de Datos con SQL\', 600, \'Tecnología\');',NULL),
(50,'INSERTAR',54,NULL,NULL,NULL,'2025-06-05 08:49:58',5,NULL,'Producción Musical con tu Laptop',NULL,720.00,NULL,'Música','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Producción Musical con tu Laptop\', 720, \'Música\');',NULL),
(51,'INSERTAR',55,NULL,NULL,NULL,'2025-06-05 08:49:58',5,NULL,'Teoría Musical Básica',NULL,500.00,NULL,'Música','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Teoría Musical Básica\', 500, \'Música\');',NULL),
(52,'INSERTAR',56,NULL,NULL,NULL,'2025-06-05 08:49:58',5,NULL,'Guitarra para Principiantes',NULL,650.00,NULL,'Música','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Guitarra para Principiantes\', 650, \'Música\');',NULL),
(53,'INSERTAR',57,NULL,NULL,NULL,'2025-06-05 08:49:58',5,NULL,'Composición de Canciones Emocionales',NULL,620.00,NULL,'Música','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Composición de Canciones Emocionales\', 620, \'Música\');',NULL),
(54,'INSERTAR',58,NULL,NULL,NULL,'2025-06-05 08:50:04',5,NULL,'Autocuidado Emocional Diario',NULL,570.00,NULL,'Salud mental','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Autocuidado Emocional Diario\', 570, \'Salud mental\');',NULL),
(55,'INSERTAR',59,NULL,NULL,NULL,'2025-06-05 08:50:04',5,NULL,'Gestión de la Ansiedad sin Medicación',NULL,590.00,NULL,'Salud mental','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Gestión de la Ansiedad sin Medicación\', 590, \'Salud mental\');',NULL),
(56,'INSERTAR',60,NULL,NULL,NULL,'2025-06-05 08:50:04',5,NULL,'Reprograma tus Pensamientos Negativos',NULL,640.00,NULL,'Salud mental','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Reprograma tus Pensamientos Negativos\', 640, \'Salud mental\');',NULL),
(57,'INSERTAR',61,NULL,NULL,NULL,'2025-06-05 08:50:04',5,NULL,'Descanso Mental y Detox Digital',NULL,560.00,NULL,'Salud mental','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Descanso Mental y Detox Digital\', 560, \'Salud mental\');',NULL),
(58,'INSERTAR',62,NULL,NULL,NULL,'2025-06-05 08:53:58',5,NULL,'Inglés Básico para Viajes',NULL,600.00,NULL,'Idiomas','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Inglés Básico para Viajes\', 600, \'Idiomas\');',NULL),
(59,'INSERTAR',63,NULL,NULL,NULL,'2025-06-05 08:53:58',5,NULL,'Francés Express',NULL,650.00,NULL,'Idiomas','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Francés Express\', 650, \'Idiomas\');',NULL),
(60,'INSERTAR',64,NULL,NULL,NULL,'2025-06-05 08:53:58',5,NULL,'Portugués Conversacional',NULL,600.00,NULL,'Idiomas','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Portugués Conversacional\', 600, \'Idiomas\');',NULL),
(61,'INSERTAR',65,NULL,NULL,NULL,'2025-06-05 08:53:58',5,NULL,'Japonés desde Cero',NULL,600.00,NULL,'Idiomas','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Japonés desde Cero\', 600, \'Idiomas\');',NULL),
(62,'INSERTAR',66,NULL,NULL,NULL,'2025-06-05 08:54:04',5,NULL,'Cocina Mexicana Tradicional',NULL,600.00,NULL,'Cocina','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Cocina Mexicana Tradicional\', 600, \'Cocina\');',NULL),
(63,'INSERTAR',67,NULL,NULL,NULL,'2025-06-05 08:54:04',5,NULL,'Panadería Casera',NULL,600.00,NULL,'Cocina','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Panadería Casera\', 600, \'Cocina\');',NULL),
(64,'INSERTAR',68,NULL,NULL,NULL,'2025-06-05 08:54:04',5,NULL,'Recetas Saludables Express',NULL,570.00,NULL,'Cocina','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Recetas Saludables Express\', 570, \'Cocina\');',NULL),
(65,'INSERTAR',69,NULL,NULL,NULL,'2025-06-05 08:54:04',5,NULL,'Cocina Vegana Fácil',NULL,570.00,NULL,'Cocina','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Cocina Vegana Fácil\', 570, \'Cocina\');',NULL),
(66,'INSERTAR',70,NULL,NULL,NULL,'2025-06-05 08:54:09',5,NULL,'Finanzas Personales para Jóvenes',NULL,450.00,NULL,'Finanzas','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Finanzas Personales para Jóvenes\', 450, \'Finanzas\');',NULL),
(67,'INSERTAR',71,NULL,NULL,NULL,'2025-06-05 08:54:09',5,NULL,'Ahorro e Inversión Inteligente',NULL,499.00,NULL,'Finanzas','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Ahorro e Inversión Inteligente\', 499, \'Finanzas\');',NULL),
(68,'INSERTAR',72,NULL,NULL,NULL,'2025-06-05 08:54:09',5,NULL,'Gestión de Deudas',NULL,650.00,NULL,'Finanzas','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Gestión de Deudas\', 650, \'Finanzas\');',NULL),
(69,'INSERTAR',73,NULL,NULL,NULL,'2025-06-05 08:54:09',5,NULL,'Cripto y Economía Digital',NULL,499.00,NULL,'Finanzas','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Cripto y Economía Digital\', 499, \'Finanzas\');',NULL),
(70,'INSERTAR',74,NULL,NULL,NULL,'2025-06-05 08:54:13',5,NULL,'Rutinas en Casa sin Equipamiento',NULL,520.00,NULL,'Deportes','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Rutinas en Casa sin Equipamiento\', 520, \'Deportes\');',NULL),
(71,'INSERTAR',75,NULL,NULL,NULL,'2025-06-05 08:54:13',5,NULL,'Yoga para Principiantes',NULL,499.00,NULL,'Deportes','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Yoga para Principiantes\', 499, \'Deportes\');',NULL),
(72,'INSERTAR',76,NULL,NULL,NULL,'2025-06-05 08:54:13',5,NULL,'Cardio y Resistencia',NULL,570.00,NULL,'Deportes','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Cardio y Resistencia\', 570, \'Deportes\');',NULL),
(73,'INSERTAR',77,NULL,NULL,NULL,'2025-06-05 08:54:13',5,NULL,'Nutrición Deportiva Básica',NULL,600.00,NULL,'Deportes','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Nutrición Deportiva Básica\', 600, \'Deportes\');',NULL),
(74,'INSERTAR',78,NULL,NULL,NULL,'2025-06-05 08:54:18',5,NULL,'Fundamentos de Marketing Digital',NULL,499.00,NULL,'Marketing','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Fundamentos de Marketing Digital\', 499, \'Marketing\');',NULL),
(75,'INSERTAR',79,NULL,NULL,NULL,'2025-06-05 08:54:18',5,NULL,'Publicidad en Redes Sociales',NULL,650.00,NULL,'Marketing','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Publicidad en Redes Sociales\', 650, \'Marketing\');',NULL),
(76,'INSERTAR',80,NULL,NULL,NULL,'2025-06-05 08:54:18',5,NULL,'Email Marketing Efectivo',NULL,600.00,NULL,'Marketing','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Email Marketing Efectivo\', 600, \'Marketing\');',NULL),
(77,'INSERTAR',81,NULL,NULL,NULL,'2025-06-05 08:54:18',5,NULL,'SEO para Principiantes',NULL,480.00,NULL,'Marketing','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'SEO para Principiantes\', 480, \'Marketing\');',NULL),
(78,'INSERTAR',82,NULL,NULL,NULL,'2025-06-05 08:54:22',5,NULL,'Cómo Validar tu Idea',NULL,499.00,NULL,'Emprendimiento','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Cómo Validar tu Idea\', 499, \'Emprendimiento\');',NULL),
(79,'INSERTAR',83,NULL,NULL,NULL,'2025-06-05 08:54:22',5,NULL,'Mentalidad Emprendedora',NULL,520.00,NULL,'Emprendimiento','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Mentalidad Emprendedora\', 520, \'Emprendimiento\');',NULL),
(80,'INSERTAR',84,NULL,NULL,NULL,'2025-06-05 08:54:22',5,NULL,'Primeros Pasos como Freelancer',NULL,570.00,NULL,'Emprendimiento','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Primeros Pasos como Freelancer\', 570, \'Emprendimiento\');',NULL),
(81,'INSERTAR',85,NULL,NULL,NULL,'2025-06-05 08:54:22',5,NULL,'Lanzamiento de Productos Digitales',NULL,620.00,NULL,'Emprendimiento','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Lanzamiento de Productos Digitales\', 620, \'Emprendimiento\');',NULL),
(82,'INSERTAR',86,NULL,NULL,NULL,'2025-06-05 10:22:34',3,NULL,'Prueba',NULL,100.00,NULL,'Salud mental, Psicología','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'Prueba\', 100, \'Salud mental, Psicología\');',NULL),
(83,'ELIMINAR',86,NULL,NULL,NULL,'2025-06-05 10:28:07',3,'Prueba',NULL,100.00,NULL,'Salud mental, Psicología',NULL,'DELETE FROM productos WHERE id=86;','INSERT INTO productos(id,nombreCurso,precioCurso,tipoCurso) VALUES(86, \'Prueba\', 100, \'Salud mental, Psicología\');'),
(84,'INSERTAR',87,NULL,NULL,NULL,'2025-06-05 10:34:27',3,NULL,'pryeba',NULL,23.00,NULL,'Idiomas','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'pryeba\', 23, \'Idiomas\');',NULL),
(85,'MODIFICAR',87,NULL,NULL,NULL,'2025-06-05 10:35:03',3,'pryeba','pryeba',23.00,23.00,'Idiomas','Cocina','UPDATE productos SET nombreCurso=\'pryeba\', precioCurso=23, tipoCurso=\'Cocina\' WHERE id=87;','UPDATE productos SET nombreCurso=\'pryeba\', precioCurso=23, tipoCurso=\'Idiomas\' WHERE id=87;'),
(86,'ELIMINAR',87,NULL,NULL,NULL,'2025-06-05 10:37:37',3,'pryeba',NULL,23.00,NULL,'Cocina',NULL,'DELETE FROM productos WHERE id=87;','INSERT INTO productos(id,nombreCurso,precioCurso,tipoCurso) VALUES(87, \'pryeba\', 23, \'Cocina\');'),
(87,'INSERTAR',88,NULL,NULL,NULL,'2025-06-05 10:41:16',3,NULL,'test',NULL,1.00,NULL,'Idiomas, Cocina','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'test\', 1, \'Idiomas, Cocina\');',NULL),
(88,'ELIMINAR',88,NULL,NULL,NULL,'2025-06-05 10:41:36',3,'test',NULL,1.00,NULL,'Idiomas, Cocina',NULL,'DELETE FROM productos WHERE id=88;','INSERT INTO productos(id,nombreCurso,precioCurso,tipoCurso) VALUES(88, \'test\', 1, \'Idiomas, Cocina\');'),
(89,'MODIFICAR',85,NULL,NULL,NULL,'2025-06-05 10:43:50',3,'Lanzamiento de Productos Digitales','Lanzamiento de Productos Digitales',620.00,620.00,'Emprendimiento','Emprendimiento, Negocios','UPDATE productos SET nombreCurso=\'Lanzamiento de Productos Digitales\', precioCurso=620, tipoCurso=\'Emprendimiento, Negocios\' WHERE id=85;','UPDATE productos SET nombreCurso=\'Lanzamiento de Productos Digitales\', precioCurso=620, tipoCurso=\'Emprendimiento\' WHERE id=85;'),
(90,'INSERTAR',89,NULL,NULL,NULL,'2025-06-05 16:23:10',3,NULL,'test',NULL,123.00,NULL,'Tecnología, Negocios','INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(\'test\', 123, \'Tecnología, Negocios\');',NULL);
/*!40000 ALTER TABLE `bitacora_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` VALUES
(29,8,22,1),
(32,9,21,1);
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `fecha_compra` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES
(1,4,20,'2025-06-05 03:05:37'),
(2,4,21,'2025-06-05 03:05:37'),
(3,21,21,'2025-06-05 03:06:40'),
(4,21,22,'2025-06-05 03:06:40'),
(5,25,21,'2025-06-05 03:18:18'),
(6,25,27,'2025-06-05 03:18:18'),
(7,25,21,'2025-06-05 03:18:24'),
(8,25,27,'2025-06-05 03:18:24'),
(9,25,21,'2025-06-05 03:18:39'),
(10,25,27,'2025-06-05 03:18:39'),
(11,25,31,'2025-06-05 03:21:31'),
(12,28,21,'2025-06-05 03:44:14'),
(13,4,37,'2025-06-05 04:14:07'),
(14,4,84,'2025-06-05 04:17:19'),
(15,4,85,'2025-06-05 04:17:19'),
(16,29,82,'2025-06-05 04:18:17'),
(17,29,83,'2025-06-05 04:18:17'),
(18,4,84,'2025-06-05 06:05:24'),
(19,4,83,'2025-06-05 09:51:31'),
(20,23,74,'2025-06-05 09:55:35'),
(21,23,75,'2025-06-05 09:55:35'),
(22,31,32,'2025-06-05 10:19:12'),
(23,31,33,'2025-06-05 10:19:12'),
(24,32,34,'2025-06-05 10:20:16'),
(25,32,35,'2025-06-05 10:20:16'),
(26,32,33,'2025-06-05 10:20:36'),
(27,32,34,'2025-06-05 10:20:36'),
(28,22,72,'2025-06-05 11:29:23'),
(29,22,73,'2025-06-05 11:29:23');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grafo_intereses`
--

DROP TABLE IF EXISTS `grafo_intereses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `grafo_intereses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interes` varchar(100) DEFAULT NULL,
  `curso_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `curso_id` (`curso_id`),
  CONSTRAINT `grafo_intereses_ibfk_1` FOREIGN KEY (`curso_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grafo_intereses`
--

LOCK TABLES `grafo_intereses` WRITE;
/*!40000 ALTER TABLE `grafo_intereses` DISABLE KEYS */;
INSERT INTO `grafo_intereses` VALUES
(1,'Programación',20),
(2,'Negocios',21),
(3,'Música',22),
(4,'Deportes',23),
(5,'Psicología',24),
(6,'Diseño',27),
(7,'Psicología',30),
(8,'Psicología',31),
(9,'Psicología',32),
(10,'Psicología',33),
(11,'Diseño',34),
(12,'Diseño',35),
(13,'Diseño',36),
(14,'Diseño',37),
(15,'Programación',38),
(16,'Programación',39),
(17,'Programación',40),
(18,'Programación',41),
(19,'Desarrollo personal',42),
(20,'Desarrollo personal',43),
(21,'Desarrollo personal',44),
(22,'Desarrollo personal',45),
(23,'Negocios',46),
(24,'Negocios',47),
(25,'Negocios',48),
(26,'Negocios',49),
(27,'Tecnología',50),
(28,'Tecnología',51),
(29,'Tecnología',52),
(30,'Tecnología',53),
(31,'Música',54),
(32,'Música',55),
(33,'Música',56),
(34,'Música',57),
(35,'Salud mental',58),
(36,'Salud mental',59),
(37,'Salud mental',60),
(38,'Salud mental',61),
(39,'Idiomas',62),
(40,'Idiomas',63),
(41,'Idiomas',64),
(42,'Idiomas',65),
(43,'Cocina',66),
(44,'Cocina',67),
(45,'Cocina',68),
(46,'Cocina',69),
(47,'Finanzas',70),
(48,'Finanzas',71),
(49,'Finanzas',72),
(50,'Finanzas',73),
(51,'Deportes',74),
(52,'Deportes',75),
(53,'Deportes',76),
(54,'Deportes',77),
(55,'Marketing',78),
(56,'Marketing',79),
(57,'Marketing',80),
(58,'Marketing',81),
(59,'Emprendimiento',82),
(60,'Emprendimiento',83),
(61,'Emprendimiento',84),
(62,'Emprendimiento',85),
(63,'Negocios',85),
(64,'Tecnología',89),
(65,'Negocios',89);
/*!40000 ALTER TABLE `grafo_intereses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCurso` varchar(100) NOT NULL,
  `precioCurso` varchar(50) NOT NULL,
  `fechaCurso` date NOT NULL,
  `tipoCurso` varchar(100) NOT NULL,
  `desColumna` varchar(255) NOT NULL,
  `imagenCurso` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES
(20,'Felicidad 360°: hábitos diarios a diario','600000','2025-05-23','Programación','Aprende los micro-hábitos respaldados por la psicología positiva que elevan tu estado de ánimo en menos de 21 días. Incluye rutinas de gratitud, ejercicio consciente y un plan descargable para medir tu progreso.\r\n','test3.jpeg'),
(21,'Mindfulness para la alegría cotidiana','650','2025-05-30','Negocios','Seis sesiones guiadas para integrar meditación, atención plena y respiración activa. Reduce estrés, incrementa la autocompasión y entrena tu cerebro para detectar “momentos de oro” a lo largo del día.\r\n','test2.jpeg'),
(22,'Crea tu “mood-board” de vida feliz','399','2025-06-01','Música','Usa técnicas de diseño visual y neurociencia para trazar metas emocionales. Construirás un tablero digital que alinea valores, hobbies y propósitos, convirtiéndolo en tu brújula diaria de bienestar.\r\n','test3.jpeg'),
(23,'Biohacking de la serotonina','750','2025-06-13','Deportes','Descubre cómo sueño, luz solar, ejercicio y alimentación influyen en tus neurotransmisores. Plan semanal de comidas + rutina HIIT de 15 min para subir niveles de serotonina de forma natural y segura.\r\n','test3.jpeg'),
(24,'Relaciones que suman','550','2025-06-30','Psicología','Mejora tu red de apoyo: lenguaje apreciativo, escucha activa y límites sanos. Incluye foros privados, ejercicios de empatía y una sesión 1-a-1 con el mentor para diseñar tu plan de conexión social.\r\n','test5.jpeg'),
(27,'hola123','1200','2025-05-24','Diseño','fsedgs','test3.jpeg'),
(30,'Introducción a la Psicología Positiva','450','2025-07-01','Psicología','Aprende a identificar fortalezas y aumentar el bienestar emocional.','test1.jpeg'),
(31,'Mindfulness para la Ansiedad','499','2025-07-05','Psicología','Técnicas prácticas para reducir el estrés y controlar pensamientos ansiosos.','test2.jpeg'),
(32,'Psicología del Autoestima','475','2025-07-08','Psicología','Mejora tu relación contigo mismo y tus decisiones personales.','test3.jpeg'),
(33,'Introducción a la Terapia Cognitivo-Conductual','520','2025-07-10','Psicología','Conoce la base de la TCC y cómo aplicarla en la vida diaria.','test4.jpeg'),
(34,'Diseño Gráfico desde Cero','600','2025-07-02','Diseño','Domina herramientas visuales para crear contenido gráfico impactante.','test1.jpeg'),
(35,'UI/UX para Principiantes','700','2025-07-06','Diseño','Aprende experiencia de usuario y diseño de interfaces modernas.','test2.jpeg'),
(36,'Branding Personal','650','2025-07-09','Diseño','Construye tu identidad visual para destacar en el mercado.','test3.jpeg'),
(37,'Diseño Editorial Digital','620','2025-07-12','Diseño','Crea publicaciones digitales como revistas, ebooks o catálogos.','test4.jpeg'),
(38,'Programación en Python desde Cero','499','2025-07-03','Programación','Aprende lógica de programación con uno de los lenguajes más versátiles.','test1.jpeg'),
(39,'Introducción a HTML y CSS','450','2025-07-07','Programación','Crea páginas web desde cero con estructura y estilo profesional.','test2.jpeg'),
(40,'JavaScript para Interacciones Web','520','2025-07-11','Programación','Haz que tus sitios web cobren vida con scripts dinámicos.','test3.jpeg'),
(41,'Automatización con Python','550','2025-07-13','Programación','Automatiza tareas aburridas como reportes, correos o gestión de archivos.','test4.jpeg'),
(42,'Hábitos para una Vida Plena','480','2025-07-04','Desarrollo personal','Crea rutinas efectivas y sostenibles que transformen tu día a día.','test1.jpeg'),
(43,'Cómo Ser Más Productivo sin Agotarte','520','2025-07-08','Desarrollo personal','Descubre herramientas para equilibrar eficiencia y bienestar.','test2.jpeg'),
(44,'Autoconocimiento y Propósito de Vida','600','2025-07-14','Desarrollo personal','Reconecta con tus valores, fortalezas y visión de vida.','test3.jpeg'),
(45,'Gestión del Tiempo y Energía','550','2025-07-15','Desarrollo personal','Aprende a priorizar, delegar y diseñar tu día ideal.','test4.jpeg'),
(46,'Emprende desde Cero','650','2025-07-16','Negocios','Aprende a validar tu idea, construir un plan y lanzar tu negocio.','test1.jpeg'),
(47,'Modelos de Negocio Exitosos','620','2025-07-18','Negocios','Explora casos reales y herramientas como el Canvas Model.','test2.jpeg'),
(48,'Marketing Digital Estratégico','700','2025-07-20','Negocios','Diseña campañas efectivas en redes sociales y plataformas digitales.','test3.jpeg'),
(49,'Gestión Financiera para Emprendedores','675','2025-07-22','Negocios','Administra tu dinero y toma decisiones inteligentes con números.','test4.jpeg'),
(50,'Fundamentos de Inteligencia Artificial','720','2025-07-17','Tecnología','Descubre cómo funciona la IA y cómo se aplica en la vida real.','test1.jpeg'),
(51,'Ciberseguridad para Todos','680','2025-07-19','Tecnología','Protege tus dispositivos y datos personales con buenas prácticas.','test2.jpeg'),
(52,'Introducción al Internet de las Cosas (IoT)','750','2025-07-21','Tecnología','Conecta dispositivos físicos a la nube y automatiza tareas.','test3.jpeg'),
(53,'Bases de Datos con SQL','600','2025-07-23','Tecnología','Aprende a crear, consultar y administrar bases de datos relacionales.','test4.jpeg'),
(54,'Producción Musical con tu Laptop','720','2025-07-24','Música','Crea beats y tracks desde casa usando software gratuito.','test1.jpeg'),
(55,'Teoría Musical Básica','500','2025-07-26','Música','Aprende a leer partituras y entender acordes sin complicaciones.','test2.jpeg'),
(56,'Guitarra para Principiantes','650','2025-07-28','Música','Toca tus primeras canciones con técnicas fáciles paso a paso.','test3.jpeg'),
(57,'Composición de Canciones Emocionales','620','2025-07-30','Música','Convierte tus sentimientos en letras y melodías poderosas.','test4.jpeg'),
(58,'Autocuidado Emocional Diario','570','2025-08-01','Salud mental','Rutinas sencillas para mantener tu mente y ánimo equilibrados.','test1.jpeg'),
(59,'Gestión de la Ansiedad sin Medicación','590','2025-08-03','Salud mental','Técnicas naturales y hábitos para reducir ataques de ansiedad.','test2.jpeg'),
(60,'Reprograma tus Pensamientos Negativos','640','2025-08-05','Salud mental','Transforma creencias limitantes y pensamientos recurrentes.','test3.jpeg'),
(61,'Descanso Mental y Detox Digital','560','2025-08-07','Salud mental','Aprende a desconectarte, respirar y recargar energía mental.','test4.jpeg'),
(62,'Inglés Básico para Viajes','600','2025-08-30','Idiomas','Inglés Básico para Viajes - Curso práctico e introductorio sobre idiomas.','test1.jpeg'),
(63,'Francés Express','650','2025-09-01','Idiomas','Francés Express - Curso práctico e introductorio sobre idiomas.','test2.jpeg'),
(64,'Portugués Conversacional','600','2025-09-03','Idiomas','Portugués Conversacional - Curso práctico e introductorio sobre idiomas.','test3.jpeg'),
(65,'Japonés desde Cero','600','2025-09-05','Idiomas','Japonés desde Cero - Curso práctico e introductorio sobre idiomas.','test4.jpeg'),
(66,'Cocina Mexicana Tradicional','600','2025-08-30','Cocina','Curso práctico e introductorio sobre cocina tradicional mexicana.','test1.jpeg'),
(67,'Panadería Casera','600','2025-09-01','Cocina','Curso práctico e introductorio sobre técnicas básicas de panadería.','test2.jpeg'),
(68,'Recetas Saludables Express','570','2025-09-03','Cocina','Curso práctico e introductorio para comer rico y sano.','test3.jpeg'),
(69,'Cocina Vegana Fácil','570','2025-09-05','Cocina','Curso práctico e introductorio sobre cocina vegana accesible.','test4.jpeg'),
(70,'Finanzas Personales para Jóvenes','450','2025-08-30','Finanzas','Curso práctico e introductorio sobre finanzas personales.','test1.jpeg'),
(71,'Ahorro e Inversión Inteligente','499','2025-09-01','Finanzas','Aprende a planear tu futuro financiero desde hoy.','test2.jpeg'),
(72,'Gestión de Deudas','650','2025-09-03','Finanzas','Curso práctico e introductorio para ordenar tus finanzas.','test3.jpeg'),
(73,'Cripto y Economía Digital','499','2025-09-05','Finanzas','Curso práctico e introductorio sobre criptomonedas y activos digitales.','test4.jpeg'),
(74,'Rutinas en Casa sin Equipamiento','520','2025-08-30','Deportes','Ejercicios básicos para hacer en casa con tu peso corporal.','test1.jpeg'),
(75,'Yoga para Principiantes','499','2025-09-01','Deportes','Curso práctico e introductorio de yoga suave y guiado.','test2.jpeg'),
(76,'Cardio y Resistencia','570','2025-09-03','Deportes','Mejora tu resistencia física con rutinas de intensidad media.','test3.jpeg'),
(77,'Nutrición Deportiva Básica','600','2025-09-05','Deportes','Aliméntate para rendir mejor y recuperarte más rápido.','test4.jpeg'),
(78,'Fundamentos de Marketing Digital','499','2025-08-30','Marketing','Conoce las bases para crear campañas en redes y buscadores.','test1.jpeg'),
(79,'Publicidad en Redes Sociales','650','2025-09-01','Marketing','Aprende a pautar en Facebook, Instagram y más.','test2.jpeg'),
(80,'Email Marketing Efectivo','600','2025-09-03','Marketing','Automatiza correos que conviertan lectores en clientes.','test3.jpeg'),
(81,'SEO para Principiantes','480','2025-09-05','Marketing','Lleva tu página a los primeros lugares de Google.','test4.jpeg'),
(82,'Cómo Validar tu Idea','499','2025-08-30','Emprendimiento','Aprende a probar si tu idea realmente tiene mercado.','test1.jpeg'),
(83,'Mentalidad Emprendedora','520','2025-09-01','Emprendimiento','Desarrolla la actitud necesaria para emprender sin miedo.','test2.jpeg'),
(84,'Primeros Pasos como Freelancer','570','2025-09-03','Emprendimiento','Cobra por lo que sabes hacer desde hoy.','test3.jpeg'),
(85,'Lanzamiento de Productos Digitales','620','2025-09-05','Emprendimiento, Negocios','Crea, publica y vende cursos, ebooks o software.','test4.jpeg'),
(89,'test','123','2025-06-21','Tecnología, Negocios','fw','test1.jpeg');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trigger_insert_producto
AFTER INSERT ON productos
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_productos (
    accion, id_producto,
    nombre_despues, precio_despues, tipo_despues,
    consulta, contra_consulta, admin_id
  ) VALUES (
    'INSERTAR', NEW.id,
    NEW.nombreCurso, NEW.precioCurso, NEW.tipoCurso,
    
    CONCAT(
      'INSERT INTO productos(nombreCurso, precioCurso, tipoCurso) VALUES(',
      QUOTE(NEW.nombreCurso),', ',
      NEW.precioCurso,', ',
      QUOTE(NEW.tipoCurso),
      ');'
    ),
    
    NULL,
    @admin_id
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trigger_update_producto
AFTER UPDATE ON productos
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_productos (
    accion, id_producto,
    nombre_antes, nombre_despues,
    precio_antes, precio_despues,
    tipo_antes, tipo_despues,
    consulta, contra_consulta, admin_id
  ) VALUES (
    'MODIFICAR', NEW.id,
    OLD.nombreCurso, NEW.nombreCurso,
    OLD.precioCurso, NEW.precioCurso,
    OLD.tipoCurso, NEW.tipoCurso,
    
    CONCAT(
      'UPDATE productos SET ',
      'nombreCurso=', QUOTE(NEW.nombreCurso),', ',
      'precioCurso=', NEW.precioCurso,', ',
      'tipoCurso=',   QUOTE(NEW.tipoCurso),
      ' WHERE id=', NEW.id, ';'
    ),
    
    CONCAT(
      'UPDATE productos SET ',
      'nombreCurso=', QUOTE(OLD.nombreCurso),', ',
      'precioCurso=', OLD.precioCurso,', ',
      'tipoCurso=',   QUOTE(OLD.tipoCurso),
      ' WHERE id=', OLD.id, ';'
    ),
    @admin_id
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trigger_delete_producto
AFTER DELETE ON productos
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_productos (
    accion, id_producto,
    nombre_antes, precio_antes, tipo_antes,
    consulta, contra_consulta, admin_id
  ) VALUES (
    'ELIMINAR', OLD.id,
    OLD.nombreCurso, OLD.precioCurso, OLD.tipoCurso,
    
    CONCAT(
      'DELETE FROM productos WHERE id=', OLD.id, ';'
    ),
    
    CONCAT(
      'INSERT INTO productos(id,nombreCurso,precioCurso,tipoCurso) VALUES(',
      OLD.id, ', ',
      QUOTE(OLD.nombreCurso), ', ',
      OLD.precioCurso, ', ',
      QUOTE(OLD.tipoCurso),
      ');'
    ),
    @admin_id
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `relaciones_cursos`
--

DROP TABLE IF EXISTS `relaciones_cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `relaciones_cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curso_origen_id` int(11) NOT NULL,
  `curso_destino_id` int(11) NOT NULL,
  `peso` int(11) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `curso_origen_id` (`curso_origen_id`),
  KEY `curso_destino_id` (`curso_destino_id`),
  CONSTRAINT `relaciones_cursos_ibfk_1` FOREIGN KEY (`curso_origen_id`) REFERENCES `productos` (`id`),
  CONSTRAINT `relaciones_cursos_ibfk_2` FOREIGN KEY (`curso_destino_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relaciones_cursos`
--

LOCK TABLES `relaciones_cursos` WRITE;
/*!40000 ALTER TABLE `relaciones_cursos` DISABLE KEYS */;
INSERT INTO `relaciones_cursos` VALUES
(1,20,21,15),
(2,21,22,15),
(3,21,27,14),
(4,21,31,12),
(5,27,31,12),
(6,20,37,10),
(7,21,37,10),
(8,20,84,9),
(9,20,85,9),
(10,21,84,9),
(11,21,85,9),
(12,37,84,9),
(13,37,85,9),
(14,84,85,9),
(15,82,83,8),
(16,20,83,6),
(17,21,83,6),
(18,37,83,6),
(19,83,84,6),
(20,83,85,6),
(21,74,75,5),
(22,32,33,4),
(23,34,35,3),
(24,33,34,2),
(25,33,35,2),
(26,72,73,1);
/*!40000 ALTER TABLE `relaciones_cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `correo` varchar(100) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `rol` enum('cliente','admin') NOT NULL DEFAULT 'cliente',
  `intereses` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES
(1,'fs','fs','fs','cliente','Programación,Deportes,Marketing,Salud mental,Psicología'),
(2,'tilin@g','tilin','tilin','cliente','Programación,Negocios,Finanzas,Diseño,Arte'),
(3,'admin@admin.com','Admin','Aris','admin',NULL),
(4,'test@gmail.com','Tilin','Tilin','cliente','Deportes,Psicología,Diseño,Marketing,Emprendimiento'),
(5,'admin1@admin.com','Admin1','Aris','admin',NULL),
(8,'chonpi99@gmail.com','Aris','Tilin','cliente','Diseño,Psicología,Deportes,Cocina,Emprendimiento'),
(9,'a23310164@ceti.mx','Claudio','Tilin','cliente','Finanzas,Desarrollo personal,Marketing,Tecnología,Arte'),
(21,'test3@gmail.com','test3','Tilin','cliente','Cocina,Tecnología,Diseño,Marketing,Desarrollo personal'),
(22,'test4@gmail.com','test4','Tilin','cliente','Emprendimiento,Finanzas,Programación,Marketing,Desarrollo personal'),
(23,'test5@gmail.com','test5','Tilin','cliente','Emprendimiento,Idiomas,Tecnología,Psicología,Arte'),
(24,'test6@gmail.com','test6','Tilin','cliente','Diseño,Marketing,Deportes,Psicología,Desarrollo personal'),
(25,'test7@gmail.com','test7','Tilin','cliente','Psicología,Tecnología,Música,Salud mental,Diseño'),
(26,'Clau@gmail.com','Clau','Tilin','cliente','Programación,Diseño,Finanzas,Música,Marketing'),
(28,'test2@gmail.com','test2','Tilin','cliente','Tecnología,Arte,Música,Cocina,Finanzas'),
(29,'test8@gmail.com','test8','Tilin','cliente','Tecnología,Negocios,Música,Psicología,Marketing'),
(30,'test9@gmail.com','test9','Tilin','cliente','Salud mental,Tecnología,Negocios,Arte,Música'),
(31,'test10@gmail.com','test10','Tilin','cliente','Arte,Música,Idiomas,Cocina,Desarrollo personal'),
(32,'test11@gmail.com','test11','Tilin','cliente','Salud mental,Desarrollo personal,Diseño,Marketing,Emprendimiento');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-06-12 11:24:37
