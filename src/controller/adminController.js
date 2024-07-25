// asi vamos a manejar las rutas src/controllers/indexController.js
//agrego la ruta para poder usar path
const path = require('path');

let adminController = {
    edit: (req, res)=>{
        const datos={
            titulo: "PowerCore",
            pie: "&copy; 2024 PowerCore. Trabajo grupal N&deg; 5.",
            msg: "Producto XXXX editado de forma exitosa"
        }
        res.render('admin/editProduct',{'datos':datos});
    },
    create: (req, res)=>{
        const datos={
            titulo: "PowerCore",
            pie: "&copy; 2024 PowerCore. Trabajo grupal N&deg; 5.",
            msg: ""
        }
        res.render('admin/listProduct',{'datos':datos});
    },
    register: (req, res)=>{
        const datos={
            titulo: "PowerCore",
            pie: "&copy; 2024 PowerCore. Trabajo grupal N&deg; 5."
        }
        res.render('admin/registerProduct',{'datos':datos});
    }

}

module.exports = adminController;