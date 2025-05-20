CREATE DATABASE library;

USE library;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cedula VARCHAR(20) NOT NULL,
    name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(100) UNIQUE NOT NULL,
    user_type ENUM('Estudiante', 'Profesor', 'Administrador') NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    logged_in BOOLEAN DEFAULT 0,
    deleted BOOLEAN DEFAULT 0
);

CREATE TABLE courses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    category ENUM('PNF', 'PFG') NOT NULL,
    description TEXT NOT NULL,
    image_path VARCHAR(255)
);

CREATE TABLE proposal_courses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    category ENUM('PNF', 'PFG') NOT NULL,
    description TEXT NOT NULL,
    image_path VARCHAR(255)
);

CREATE TABLE projects (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    description TEXT NOT NULL, 
    project_path VARCHAR(255) NOT NULL
);

CREATE TABLE proposal_projects (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    description TEXT NOT NULL, 
    project_path VARCHAR(255) NOT NULL
);

CREATE TABLE books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    book_path VARCHAR(255) NOT NULL,
    image_path VARCHAR(255) NOT NULL,
    id_course INT NOT NULL,
    FOREIGN KEY (id_course) REFERENCES courses(id)
);

CREATE TABLE proposal_books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    book_path VARCHAR(255) NOT NULL,
    image_path VARCHAR(255) NOT NULL,
    id_course INT NOT NULL,
    FOREIGN KEY (id_course) REFERENCES courses(id)
);

-- Insertando datos a la tabla users
INSERT INTO users (cedula, name, last_name, phone_number, user_type, email, password) VALUES
('12345678', 'Juan', 'Estudiante', '04121234567', 'Estudiante', 'juan@gmail.com', '12345'),
('87654321', 'Maria', 'Profesor', '04127654321', 'Profesor', 'maria@gmail.com', '12345'),
('12348765', 'Carlos', 'Administrador', '04129876543', 'Administrador', 'carlos@gmail.com', '12345');


INSERT INTO courses (title, category, description, image_path) VALUES
('Estudios Jurídicos', 'PFG', 'En la actualidad, la Universidad Bolivariana de Venezuela (UBV) desde la política del Nuevo Comienzo impulsada por nuestro Presidente Constitucional Nicolás Maduro Moros y por nuestro joven Rector César Trómpiz, plantea nuevos quehaceres, que promuevan una comprensión geopolítica-jurídica que busque la paz-equilibrio planetaria, que entienda al derecho comparado como menú de herramientas para la comunalización endógena nuestro-venezolana, la paz como política con asidero constitucional y andamiaje legal, en especial la paz económica-productiva que debemos de viabilizar en el período de prosperidad que apostamos en este momento histórico de la Patria. Estas razones, una vez más exigen que la Universidad Bolivariana de Venezuela, a dieciséis años de su fundación, reitere a los Estudios Jurídicos a su oferta formativa, haciendo suya la necesidad del Estado y de la sociedad venezolana de contar con ciudadanos profesionales preparados para aportar, desde el campo jurídico, a seguir haciendo posible la justeza del Socialismo del Siglo XXI, que supere las injusticias,desigualdades, discriminación y marginación social, cultural, política y económica generada por las pretensiones hegemónicas del capitalismo neoliberal.

Un desafío que obliga a abordar el Derecho, como ciencia social y objeto de estudio, mediante una vinculación diferente entre la teoría y la práctica, con un determinante razonamiento productivo; entendiendo la complejidad de las categorías jurídicas que ordenan, en el todo social, las diferentes dimensiones de las prácticas jurídicas en su propia estructura interna y en sus relaciones e interrelaciones culturales, políticas o económicas.

El Programa de Formación de Grado en Estudios Jurídicos acoge la perspectiva desde la cual la formación del profesional está fundamentada desde el Liderazgo Productivo, desde la integración de saberes entre disciplinas científicas, capacidades técnicas, experiencias y prácticas comunitarias transformadoras por vía de la Educación.

Como Eje transversal interdisciplinar, contamos con Proyecto Académico Comunitario (PAC), que nos lleva directamente al ámbito comunitario trasladando a nuestros estudiantes al sentir vivo de lo cotidiano y así asimilar las diferentes experiencias para generar posturas y propuesta jurídicas ubicadas en la actualidad social, combinando así la práctica con la enseñanza académica proveniente de los docentes en los salones de clases, que a su vez se articula con el Plan de la Patria 2019-2025 en su objetivo 1.5.3.1. que nos insta a “fortalecer el marco jurídico para la erradicación de toda forma de discriminación por motivos de origen social, sexismo, racismo, xenofobia, posición política, discapacidad”; como también el objetivo 1.5.5.2. que nos conlleva a “establecer el marco jurídico para que la acción de las instituciones privadas se adecue al proceso de descolonización”.

Este proceso de integración de lo jurídico en lo social encuentra, en la República Bolivariana de Venezuela, unas condiciones especiales. En efecto, la soberanía popular se ha expresado dotándose de una Constitución que, legitimada democráticamente, positiviza los mandatos, valores y principios que dirigen el proceso de transformaciones de los que la sociedad venezolana ha querido dotarse. Quiere con ello garantizar su voluntad de convertir a la justicia en el valor supremo mediante el que: terminar con la impunidad, la exclusión social y la desigualdad, y avanzar en la conformación de una nueva estructura social que universalice el disfrute de los Derechos Sociales.

Este Programa considera que el principio Robinsoniano de integración entre la educación y el trabajo asumido por la Constitución de la República Bolivariana de Venezuela, en su artículo 3, es el fundamento de la estructura del aprendizaje, cuya manifestación se encuentra materializada a través del Proyecto Académico Comunitario (PAC), que enaltece el Diálogo de Saberes a través de la Integración Socio Educativa.', '/uploads/1726831218647-estudios-juridicos.jpg'),

('Medicina Integral Comunitaria', 'PNF', 'El Programa Nacional de Formación en Medicina Integral Comunitaria es una política del Estado venezolano en materia de formación de talento humano para la salud, concebido para dar cumplimiento a lo establecido en la Constitución de la República Bolivariana de Venezuela en cuanto a garantizar el derecho a la salud integral de la población como derecho fundamental.', '/uploads/1726831287670-enfermeria-comunitaria.png'),

('Agroecología', 'PFG', 'El Programa de Formación de Grado en Agroecología coordina esfuerzos de formación integral para dar respuestas a los retos actuales de transformación socialista desde el ámbito de la sustentabilidad del ambiente, de los agroecosistemas y de la producción agropecuaria y acuícola, a fin de coadyuvar a alcanzar la soberanía y seguridad agroalimentaria del País.

De igual manera, forma a las y los ciudadanos universitarios, para actuar en concordancia con las políticas de desarrollo dirigidas por el Gobierno Bolivariano de Venezuela, orientadas a la construcción del nuevo sistema socioeconómico socialista. Este Programa promueve y gestiona el desarrollo integral de las comunidades, al concebir la actividad agropecuaria como hecho complejo, transdisciplinario y multidimensional, no sólo desde la perspectiva socioeconómica, sino también, la ecológica.', '/uploads/1726831385898-agroecologia.jpg'),

('Comunicación Social', 'PFG', 'El Programa de Formación de Grado de Comunicación Social de la UBV tiene como finalidad fundamental la formación de profesionales en el área acordes a las necesidades del proyecto país, capaces de comprender la complejidad de los procesos comunicacionales, de afrontar los retos que los múltiples cambios científicos-tecnológicos inducen en materia de información y comunicación, y de ejercer su profesión bajo los principios fundamentales de la convivencia, la solidaridad, la democracia participativa y protagónica, la libertad, la justicia, el equilibrio y la responsabilidad social.

En virtud de ello la comunicación es estudiada en nuestra Universidad como un objeto multidimensional y complejo, siempre abierto a su propio desarrollo, en tránsito constante hacia nuevas realidades, como el tejido condicionante de las practicas socioculturales, la percepción y construcción de la realidad, el imaginario social, los patrones de consumo, y las formas y espacios de ejercicio de la democracia.

El PFG Comunicación Social, así como todos los demás programas de la Universidad Bolivariana de Venezuela, tiene como eje fundamental el desarrollo de proyectos de interacción socioeducativa. Los Proyectos constituyen las unidades centrales que articulan al resto de las unidades y los contenidos a desarrollar dentro de cada uno de los cuatro años (en el caso de estudiantes del turno diurno), o cinco años (en el caso del nocturno municipalizado) y del conjunto del Plan de Estudios.', '/uploads/1726831425337-Comunicacion-Social.jpg'),

('Gestión Ambiental', 'PFG', 'El Programa de Formación de Grado en Gestión Ambiental se propone promover el desarrollo humano integral de los estudiantes, los docentes, el personal universitario en general y el de las comunidades vinculadas a los programas, proyectos, programas y actividades de la universidad. El Programa de Formación de Grado en Gestión Ambiental constituye una propuesta académica para contribuir con la transformación social mediante la sistematización, difusión y aprovechamiento creativo de los saberes y quehaceres inherentes a las diversidades culturales y naturales del país.', '/uploads/1726831460129-Gestion-Ambiental.jpg'),

('Gestión De Salud Pública', 'PFG', 'Formar sujetos históricos que apunten a la construcción de la nueva institucionalidad, consolidación del Sistema Público Único Nacional de Salud, construcción de soberanía científico-tecnológica y consolidación del poder popular; con alto sentido ético, pertinencia social y consustanciado con la salud colectiva desde una militancia socio política para el Socialismo Bolivariano del Siglo XXI.', '/uploads/1726831530681-salud-publica.jpg'),

('Gestión Social Para El Desarrollo Local', 'PFG', 'El Programa de Formación de Grado en Gestión Social para el Desarrollo Local provee a los/las participantes una formación integral en el campo de la gestión social y el desarrollo local, obteniendo conocimientos en metodologías de planificación participativa y diseño, análisis, seguimiento y evaluación de planes, programas y proyectos sociocomunitarios en el sector social de la política pública y políticas sociales en el fortalecimiento del Estado Comunal, fundamento del Estado Democrático y Social de Derecho y de Justicia.', '/uploads/1726831607809-gestion-social.jpg'),

('Pesca y Agricultura', 'PFG', 'Venezuela constituye un país de gran vocación pesquera, con sus 2300 Km. de costas y su vasta hidrografía conformada por más de 124 ríos importantes que poseen cuencas mayores de 1.000 Km. Según las estadísticas oficiales reportadas por la FAO Venezuela ocupa cerca del puesto 40 entre los 239 países registrados en este organismo, con una producción cercana a las 400.000 TM, lo que significa cerca del 73% de la captura total de la región del Caribe. Esta importante producción pesquera se distribuye en cerca de 300 especies y dan empleo directo a unos 35.000 pescadores. La Universidad Bolivariana de Venezuela ha crecido conforme a las exigencias de cada región donde se encuentra establecida, permitiendo de esta manera ampliar sus opciones en cuanto a programas ofrecidos en esta casa de estudios. Dentro de estas opciones se encuentra el Programa de Formación de Grado de Pesca y Acuicultura (PFG-PA) que nace en el año 2014 cuando fue aprobado según Resolución emanada del Consejo Universitario Nº CU-02-50 de fecha 25 de febrero de 2014, Este PFG tiene como finalidad dar soluciones a las necesidades de desarrollo local, regional y nacional para garantizar la soberanía alimentaria, haciendo uso de una pesca y acuicultura integral y sostenible que procure un equilibrio entre el aprovechamiento de las potencialidades acuícolas y pesqueras y el patrimonio natural.', '/uploads/1726831652266-pesca-agricultura.jpg'),

('Educación', 'PNF', 'Somos el Programa responsable de formar el (la) nuevo(a) educador(a) que necesita la República Bolivariana de Venezuela, tomando en cuenta el humanismo bolivariano con un enfoque socio–histórico, donde el sujeto que aprende es un ser social, protagonista de la reconstrucción y/o construcción de su conocimiento, que busca soluciones a los problemas de su entorno. El Programa, tiene una concepción abierta y flexible que considera su constante enriquecimiento en la interacción de lo local, regional, nacional e internacional, con la finalidad de promover el desarrollo endógeno. El proceso formativo se basa en una Pedagogía que coloca al sujeto como centro del quehacer educativo, tomando en cuenta el papel dinámico, protagónico y transformador, no solo del (la) estudiante, sino de todos los actores inmersos en dicho proceso. El PNFE, ofrece un modelo innovador, dinámico e interactivo, para la formación de un(a) educador(a), que bajo un enfoque dialéctico, desarrolle sus potencialidades, de forma integral e integrando las necesidades de su ambiente educativo y de la comunidad a sus aprendizajes, en correspondencia con los ámbitos particulares de la diversidad geográfica de la Nación.', '/uploads/1726831689898-educacion.jpg');

