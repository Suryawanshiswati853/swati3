const tool_database = require("./tool_database");

const UserModel = tool_database.model(
  "user",
  require("../../models/user/user.schema")
);

console.log(UserModel);

module.exports = UserModel;
