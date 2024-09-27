//cargamos lo necesario para usar las funciones de sequelize
const db = require('../database/models/index.js');
const bcrypt = require('bcrypt');
const crypto = require('crypto');

const usuariosController = {
    formLoginRegistro:(req,res)=>{
        res.render('usuarios/login',
            {
                aviso:"",
                infoUsuario: req.session.usuario ? req.session.usuario : null,
            }
        );
    },
    validarUsuario:async (req,res)=>{
        //recibo los datos del login
        const {nombre_personaje,clave} = req.body;
        //encripto la clave para el modelo de lineage interlude
        const encryptedPassword = l2jEncrypt(clave);
        //busco la clave en el usuario
        db.Accounts.findOne({
            where:{
                login:nombre_personaje,
                password: encryptedPassword
            }
        }).then(usuario=>{
            
            if(usuario!=null){
                req.session.usuario = usuario;
                console.log(req.session.usuario.apellido)
                res.render('usuarios/login',
                    {
                        aviso:"OK",
                        infoUsuario: req.session.usuario ? req.session.usuario : null,
                    }
                );
            }else{
                req.session.usuario = usuario;
                res.render('usuarios/login',
                    {
                        aviso:"Error",
                        infoUsuario: null,
                    }
                );
            }
            
        })

    },
    formContacto:async (req,res)=>{
        db.Areas.findAll()
        .then(areas=>{
            res.render('usuarios/contacto',
                {
                    Areas: areas,
                    aviso: ""
                }
            );
        })
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
    salir:(req,res)=>{
        if (req.session.usuario != null) {
            req.session.usuario = null;
            res.redirect("/usuarios/login");
          }
    },



}

module.exports = usuariosController;

function l2jEncrypt(password) {
    // Generar el hash SHA-1
    const sha1Hash = crypto.createHash('sha1').update(password, 'utf8').digest('hex');
    // Convertir el hash de hexadecimal a un buffer y luego codificarlo en base64
    return Buffer.from(sha1Hash, 'hex').toString('base64');
}