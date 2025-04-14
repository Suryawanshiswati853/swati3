const mongoose = require("mongoose");

// const DB = require('../../login.connection');

// require('dotenv').config();

const tool_database = mongoose.createConnection(
  `mongodb+srv://Ticketing_tool:Tech-trail@cluster0.xvmni6h.mongodb.net/TicketingTool?retryWrites=true&w=majority`,
  // `mongodb://127.0.0.1:27017/ticketingtool`,

  { maxPoolSize: 10 }
);
// console.log(userDB);
// mongoose.set('debug', true);
//
console.log("current users mongodb version:", mongoose.version);
console.log("users mongodb connection id", tool_database.id);
module.exports = tool_database;

// db.updateUser( "xuritiUser",
//   { roles : [
//     { role : "restore", db : "users"  },
//     { role : "backup", db : "users"  }
//   ] } )
