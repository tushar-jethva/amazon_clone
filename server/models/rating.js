const mongoose = require('mongoose');

const ratingSchema = mongoose.Schema({

    userId:{
        type:String,
        required:true,
    },
    rating:{
        type:Number,
        require:true,
    }
});

module.exports = ratingSchema;