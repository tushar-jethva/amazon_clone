const express = require('express');
const productRouter = express.Router();
const auth = require('../middlewares/auth');
const Product = require('../models/admin')
//as we can't give req.body in get api so we give body in apilink
//ex. /api/products?category=Essentials
//our  link will be look like above link
//if we want to access essentials we use req.query.category
productRouter.get('/api/products',auth,async(req,res)=>{
    try{
            console.log(req.query.category);
            const product = await Product.find({category:req.query.category});
            res.json(product);
    }
    catch(e){
        res.status(500).json({error:e.message});
    }
})

module.exports = productRouter;