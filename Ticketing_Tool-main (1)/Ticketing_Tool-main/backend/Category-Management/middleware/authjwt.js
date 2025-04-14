const jwt = require("jsonwebtoken");
require("dotenv").config();

module.exports = {
  verifytoken: (req, res, next) => {
    if (!req.headers["authorization"])
      return next(
        res.json({
          status: false,
          message: "Please provide authorization token",
        })
      );
    const authheader = req.headers["authorization"];
    const bearerToken = authheader.split(" ");
    const token = bearerToken[1];
    console.log(token, "===========verify token===========");
    jwt.verify(token, process.env.privatekey, (err, payload) => {
      if (err) {
        return next(
          res.json({
            status: false,
            message: " Invalid token",
          })
        );
      }
      req.payload = payload;
      next();
    });
  },
};
