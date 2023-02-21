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

productRouter.get('/api/product/search/:name',auth,async(req,res)=>{
    try{
        const products = await Product.find({
            name:{$regex: req.params.name, $options: 'i'},
        });
        res.json(products);
    }
    catch(e){
        res.status(500).json({error:e.message});
    }
    
})

// productRouter.get('/api/products:name',async(req,res)=>{
//     try{
//             console.log(req.params);
//             const product = await Product.find({category:req.query.category, name:{$regex:req.params.query, $options:'i'}});
//             res.json(product);
//     }
//     catch(e){
//         res.status(500).json({error:e.message});
//     }
// })
productRouter.get('/api/product',auth,async(req,res)=>{
    try{
            console.log(req.query.query);
            const product = await Product.find({category:req.query.category, name:{$regex:req.query.query, $options:'i'}});
            res.json(product);
    }
    catch(e){
        res.status(500).json({error:e.message});
    }
})



module.exports = productRouter;