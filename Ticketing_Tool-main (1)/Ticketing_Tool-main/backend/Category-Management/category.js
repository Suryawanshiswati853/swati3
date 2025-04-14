const express = require("express");
const morgan = require("morgan");
const jwt = require("jsonwebtoken");
require("dotenv").config();
const helmet = require("helmet");
const nodemailer = require("nodemailer");
const cors = require("cors");
const compression = require("compression");
const cookieParser = require("cookie-parser");
const figlet = require("figlet");
const { hostIP, path, hostName, db_ip } = require("./config/config");

const category_managementRouter = require("./routes/category.routes");
const app = express();
app.use(express.json());
app.use(morgan("combined"));
app.use(helmet());
app.use(compression());
app.use(cookieParser());

app.use("/category_management", cors(), category_managementRouter);

const PORT = process.env.port || 7003;

const server = app.listen(PORT, () => {
  figlet("Category-Management", async (err, data) => {
    if (err) {
      console.log("Something Went Wrong With figlet");
      console.dir(err);
      return;
    }
    console.log(data);
    console.log(`Running on Port: ${PORT} with process id: ${process.pid}`);
    console.log("HOST IP Address: ", hostIP);
    console.log("HOST Name: ", hostName);
    console.log("Host Path: ", path);
  });
});
