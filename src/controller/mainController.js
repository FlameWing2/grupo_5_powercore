
const mainController = {
    index:(req,res)=>{
        res.render('index',{
            infoUsuario: req.session.usuario ? req.session.usuario : null,
        });
    },
    nosotros:(req,res)=>{
        res.render('quienes_somos',{
            infoUsuario: req.session.usuario ? req.session.usuario : null,
        });
    },
   

}

module.exports = mainController;