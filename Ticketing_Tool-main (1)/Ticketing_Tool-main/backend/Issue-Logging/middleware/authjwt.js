const jwt = require("jsonwebtoken");
require("dotenv").config();

//    function  authjwt(){

//      return (req,res,next)=>{
//            console.log(req.headers.authorization, '---------------')
//          if(req.headers.authorization){
//             console.log(req.headers.authorization,"===")

//             let privatekey = process.env.privatekey;
//       let token = req.headers.authorization.split(" ")[1];
//       console.log(token,"=============header tokeen===========")
//       let decodetoken = jwt.verify(token,privatekey)
//       console.log(decodetoken,"=========decode token===========")
//      req.userData = decodetoken;
//       next();
//          }else{
//             return res.json({
//                status:false,
//                message:"Invalid Token"
//             })
//          }
//       }

//    }

//   module.exports = { authjwt }

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
