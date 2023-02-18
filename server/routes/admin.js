const express = require('express');
const adminRouter = express.Router();
const admin = require('../middlewares/admin');
const Product = require('../models/admin');

//Add Product
adminRouter.post('/admin/add-Product',admin,async(req,res)=>{
    try{
      
        const{name,description,quantity,images,category,price} = req.body;
        let product = new Product({
            name,
            description,
            quantity,
            images,
            category,
            price
        });

       product = await product.save();
       res.json(product);

    }catch(err){
        res.status(500).json({error:err.message});
    }
})