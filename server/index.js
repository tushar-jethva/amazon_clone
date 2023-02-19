// IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");

// IMPORTS FROM OTHER FILES
const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");
const productRouter = require("./routes/product");

// INIT
const PORT = 3000;
const app = express();
const DB =
  "mongodb+srv://tushar_023:JETHvA9999@cluster0.excwvqv.mongodb.net/test";

// middleware

app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);


// Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
