const express = require('express');
const productRouter = express.Router();
const auth = require('../middlewares/auth');
const {Product} = require('../models/admin')
//as we can't give req.body in get api so we give body in apilink
//ex. /api/products?category=Essentials
//our  link will be look like above link
//if we want to access essentials we use req.query.category
productRouter.get('/api/products',auth,async(req,res)=>{
    try{
            //console.log(req.query.category);
            const product = await Product.find({category:req.query.category});
            res.json(product);
            
    }
    catch(e){
        res.status(500).json({error:e.message});
    }
})

productRouter.get('/api/product/search/:name',async(req,res)=>{
    try{
        const products = await Product.find({
            name:{$regex: req.params.name, $options: 'i'},
        });
        res.json(products);
    }
    catch(e){
        res.status(500).json({error:e.message});
    }
    
});

// productRouter.get('/api/products:name',async(req,res)=>{
//     try{
//             console.log(req.params);
//             const product = await Product.find({category:req.query.category, name:{$regex:req.params.query, $options:'i'}});
//             res.json(product);
//     }
//     catch(e){
//         res.status(500).json({error:e.message});
//     }
// });
productRouter.get('/api/product',auth,async(req,res)=>{
    try{
            console.log(req.query.query);
            const product = await Product.find({category:req.query.category, name:{$regex:req.query.query, $options:'i'}});
            console.log(product);
            res.json(product);
    }
    catch(e){
        res.status(500).json({error:e.message});
    }
});

productRouter.post('/api/product/rating',auth,async(req,res)=>{
    try{
        const{id,rating} = req.body;
        let product = await Product.findById(id);

        for(let i=0;i<product.rating.length;i++){
            if(product.rating[i].userId == req.user){
                product.rating.splice(i,1);
                break;
            }
        }

        const ratingSchema={
            userId:req.user,
            rating,
        }
        product.rating.push(ratingSchema);
        product = await product.save();
        res.json(product);
    }
    catch(e){
        res.status(500).json({error:e.message});
    }
});

productRouter.get('/api/deal-of-day',auth,async(req,res)=>{
    try{
        let product = await Product.find({});
      product = product.sort((a,b)=> {
            let aSum = 0;
            let bSum = 0;

            for(let i=0;i<a.rating.length;i++){
                aSum+=a.rating[i].rating;
            }
            for(let i=0;i<b.rating.length;i++){
                bSum+=b.rating[i].rating;
            }

            return aSum < bSum?1:-1;
        });

        res.json(product);
    }
    catch(e){
        res.status(500).json({error:e.message})
    }
})

productRouter.get('/api/discount-products',async(req,res)=>{

    try{
        let products = await Product.find({category:req.query.category});
        products = products.sort((a,b)=>{
            let aSum = 0;
            let bSum = 0;
            
            for(let i=0;i<a.rating.length;i++){
                aSum+=a.rating[i].rating;
            }
            for(let i=0;i<b.rating.length;i++){
                bSum+=b.rating[i].rating;
            }

            return aSum > bSum?1:-1;
            
        });
        res.json(products);

    }
    catch(e){
        res.status(500).json({error:e.message});
    }
})  
module.exports = productRouter;