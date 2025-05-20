const multer = require('multer');
const path = require('path');

// Configuración del almacenamiento
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, path.join(__dirname, '../public/uploads'));
    },
    filename: (req, file, cb) => {
        cb(null, `${Date.now()}-${file.originalname}`);
    }
});

// Filtro de archivos para controlar qué tipos de archivos son permitidos
const fileFilter = (req, file, cb) => {
    // Lista de tipos de archivos permitidos
    const allowedTypes = [
        'image/jpeg',
        'image/png',
        'application/pdf',
        'application/msword',
        'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
    ];

    // Verificar si el tipo de archivo está en la lista de permitidos
    if (allowedTypes.includes(file.mimetype)) {
        cb(null, true); // Aceptar archivo
    } else {
        cb(null, false); // Rechazar archivo
    }
};

// Opciones de Multer
const uploadOptions = {
    storage: storage,
    fileFilter: fileFilter,
    limits: {
        fileSize: 1024 * 1024 * 5 // 5 MB como límite de tamaño de archivo
    }
};

// Crear middleware de carga con las opciones configuradas
const upload = multer(uploadOptions);

module.exports = upload;
