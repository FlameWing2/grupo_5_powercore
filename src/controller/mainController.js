
const mainController = {
    index:(req,res)=>{
        res.render('index');
    },
    nosotros:(req,res)=>{
        res.render('quienes_somos');
    },
   

}

module.exports = mainController;