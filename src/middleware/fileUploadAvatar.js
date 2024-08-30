/**Este archivo servirá para usarlo como middleware de subida de archivos, desde los formularios */
const multer = require('multer');
const path = require('node:path');

/**multer */
let storage = multer.diskStorage({
    destination: function(req,file,cb){
        cb(null,path.join(__dirname, '../../public/images/users'));
    },
    filename: function(req, file,cb){
        const uniqueSuffix = Date.now() + path.extname(file.originalname);
        const filename = file.fieldname + '-' + uniqueSuffix;
        cb(null, filename);
        req.imagen = filename;
    }
});

const fileUpload = multer({storage: storage});

module.exports = fileUpload;



