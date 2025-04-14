const tool_database = require("./tool_database");

const UserCategoryModel = tool_database.model(
  "user_category",
  require("../../models/userCategoryModel/usercategorySchema")
);

console.log(UserCategoryModel);

module.exports = UserCategoryModel;
