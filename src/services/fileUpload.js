/**Este archivo servirá para usarlo como middleware de subida de archivos, desde los formularios */
const multer = require('multer');
const path = require('node:path');

/**multer */
let storage = multer.diskStorage({
    destination: function(req,file,cb){
        cb(null,'/public/img/uploads');
    },
    filename: function(req, file,cb){
        cb(null,file.filename + '-' + Date.now() + path.extname(file.originalname));
    }
});

const fileUpload = storage({storage: storage});

module.exports = fileUpload;



