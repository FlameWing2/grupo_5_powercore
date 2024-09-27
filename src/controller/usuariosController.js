//cargamos lo necesario para usar las funciones de sequelize
const db = require('../database/models/index.js');

const usuariosController = {
    formLoginRegistro:(req,res)=>{

        res.render('usuarios/login');
    },
    formContacto:async (req,res)=>{
        const Areas = await db.Areas.findAll();
        
        const formateoAreas = Areas.map(area => ({
            id_area: area.dataValues.id_area,
            nombre_area: area.dataValues.nombre_area
        }));

        res.render('usuarios/contacto',
            {
                Areas: formateoAreas,
                aviso: ""
            }
        );
    },
    crearContacto: async (req, res) => {
        let { nombre, email, area, mensaje } = req.body;
    
        try {
            const contactoCreado = await db.Contactos.create({
                apenom:nombre,
                email,
                id_area:area,
                mensaje
            });
    
            console.log('Contacto creado:', contactoCreado);
    
            const areas = await db.Areas.findAll();
    
            const formateoAreas = areas.map(area => ({
                id_area: area.dataValues.id_area,
                nombre_area: area.dataValues.nombre_area
            }));
    
            res.render('usuarios/contacto', {
                Areas: formateoAreas,
                aviso: "OK"
            });
        } catch (err) {
            console.error('Error al crear el contacto:', err);
            
            const areas = await db.Areas.findAll();
            const formateoAreas = areas.map(area => ({
                id_area: area.dataValues.id_area,
                nombre_area: area.dataValues.nombre_area
            }));
    
            res.render('usuarios/contacto', {
                Areas: formateoAreas,
                aviso: "Error"
            });
        }
    },    
    formPerfil:(req,res)=>{
        res.render('usuarios/perfil');
    },

    validarUsuario:(req,res)=>{
        console.log(req.body);
        res.render('usuarios/login');
    },

}

module.exports = usuariosController;