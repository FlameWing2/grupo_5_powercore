//cargamos lo necesario para usar las funciones de sequelize
const db = require('../database/models/index.js');
const bcrypt = require('bcrypt');
const crypto = require('crypto');
const os = require('os');

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
                    aviso: "",
                    infoUsuario: req.session.usuario ? req.session.usuario : null,
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
                aviso: "OK",
                infoUsuario: req.session.usuario ? req.session.usuario : null,
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
                aviso: "Error",
                infoUsuario: req.session.usuario ? req.session.usuario : null,
            });
        }
    },    
    formPerfil:(req,res)=>{
        res.render('usuarios/perfil',{
            aviso: "",
            infoUsuario: req.session.usuario ? req.session.usuario : null,
        });
    },
    actualizarPerfil:(req,res)=>{
        console.log(req.body);
        const {apellido,nombre,direccion,telefono,email,clave,clave_original,user} = req.body;
        let encryptedPassword = "";
        if (clave !== clave_original) {
            encryptedPassword = l2jEncrypt(clave);
        } else {
            encryptedPassword = clave_original;
        }

        const datosActualizados = {
            password: encryptedPassword,
            email,
            nombre,
            apellido,
            direccion,
            telefono
        };

        db.Accounts.update(datosActualizados, {
            where: {
                login: user 
            }
        })
        .then(resultado => {
            if (resultado[0] > 0) {
                db.Accounts.findOne({
                    where:{
                        login:user
                    }
                }).then(usuario=>{
                    req.session.usuario = usuario
                    res.render('usuarios/perfil', {
                        aviso: "OK",
                        infoUsuario: usuario
                    });
                })
                
            } else {
                res.render('usuarios/perfil', {
                    aviso: "Error: No se encontró el usuario o no se hicieron cambios.",
                    infoUsuario: null
                });
            }
        })
        .catch(error => {
            console.error(error);
            res.render('usuarios/perfil', {
                aviso: "Error: No se pudo actualizar el usuario.",
                infoUsuario: null
            });
        });
    },
    salir:(req,res)=>{
        if (req.session.usuario != null) {
            req.session.usuario = null;
            res.redirect("/usuarios/login");
          }
    },
    registrarUsuario:(req,res)=>{
        console.log(req.body);
        //capturo los datos
        const {nombre_personaje,clave,email,nombre,apellido} = req.body;
        //encripto la clave para el modelo de lineage interlude
        const encryptedPassword = l2jEncrypt(clave);

        //armo el paquete a enviar
        const nuevoUsuario = {
            login:nombre_personaje,
            password:encryptedPassword,
            lastactive:0,
            access_level:0,
            lastIP:req.headers['x-forwarded-for'] || req.socket.remoteAddress,
            lastServer:1,
            avatar:"avatar-male.jpg",
            apellido,
            nombre,
            direccion:"Sin datos",
            telefono:"Sin datos",
            email
        }
        //verifico si no hay otro usuario con el mismo dato
        db.Accounts.findOne({
            where:{
                login:nombre_personaje
            }
        }).then(usuario=>{
            
            if (usuario == null) {
                // Si no hay usuario, lo creo
                db.Accounts.create(nuevoUsuario)
                .then(resultado => {
                    // Usuario creado con éxito
                    res.render('usuarios/login', {
                        aviso: "Registro",
                        infoUsuario: resultado,
                    });
                })
                .catch(error => {
                    console.error(error);
                    res.render('usuarios/login', {
                        aviso: "Error",
                        infoUsuario: null,
                    });
                });
            } else {
                // Usuario ya existe, mostrar error
                req.session.usuario = usuario;
                res.render('usuarios/login', {
                    aviso: "Error",
                    infoUsuario: null,
                });
            }
            
        })
    },



}

module.exports = usuariosController;

function l2jEncrypt(password) {
    // Generar el hash SHA-1
    const sha1Hash = crypto.createHash('sha1').update(password, 'utf8').digest('hex');
    // Convertir el hash de hexadecimal a un buffer y luego codificarlo en base64
    return Buffer.from(sha1Hash, 'hex').toString('base64');
}
