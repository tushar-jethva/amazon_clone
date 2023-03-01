const express = require('express');
const adminRouter = express.Router();
const admin = require('../middlewares/admin');
const {Product} = require('../models/admin');
const Order = require('../models/order');

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
});

adminRouter.get('/admin/get-products',admin,async(req,res)=>{
    try{
        const product = await Product.find({})
        res.json(product);
    }
    catch(err){
        res.status(500).json({error:err.message});
    }
})

adminRouter.post('/admin/delete-product',admin,async(req,res)=>{
    try{
        const{id} = req.body;
        let product = await Product.findByIdAndDelete(id);
        res.json(product);
    }
    catch(err){
        res.status(500).json({error:err.message})
    }
})

adminRouter.get('/admin/orders',admin,async(req,res)=>{
    try{
        const orders = await Order.find({});
        res.json(orders);
    }
    catch(e){
        res.status(500).json({error:e.message});
    }
})

adminRouter.post('/admin/order-status',admin,async(req,res)=>{
    try{
        const{id,status} = req.body;
        let order = await Order.findById(id);
        order.status = status;
        order = await order.save();
        res.json(order);
    }
    catch(e){
        res.status(500).json({error:e.message})
    }
})

adminRouter.get('/admin/analytics',admin,async(req,res)=>{
    try{
        const orders = await Order.find({});
        let total = 0;
        for(let i=0;i<orders.length;i++){
            for(let j=0;j<orders[i].products.length;j++){
                total+= orders[i].products[j].product.price * orders[i].products[j].quantity;
            }
        }

        //CATEGORY WISE EARNINGS FETCHING
        let mobileEarnings = await fetchCategoryWiseProduct('Mobiles');
        let essentialsEarnings = await fetchCategoryWiseProduct('Essentials');
        let appliancesEarnings = await fetchCategoryWiseProduct('Appliances');
        let booksEarnings = await fetchCategoryWiseProduct('Books');
        let fashionEarnings = await fetchCategoryWiseProduct('Fashion');

        let earnings = {
            total,
            mobileEarnings,
            essentialsEarnings,
            appliancesEarnings,
            booksEarnings,
            fashionEarnings,
        };
        res.json(earnings);
    }
    catch(e){
        res.status(500).json({error:e.message});
    }
});

async function fetchCategoryWiseProduct(category){
    let earnings = 0;
    let categoryOrders = await Order.find({
      'products.product.category':category
    });

            for(let i=0;i<categoryOrders.length;i++){
            for(let j=0;j<categoryOrders[i].products.length;j++){
                earnings+= categoryOrders[i].products[j].product.price * categoryOrders[i].products[j].quantity;
            }
        }
    return earnings;
}

module.exports = adminRouter;