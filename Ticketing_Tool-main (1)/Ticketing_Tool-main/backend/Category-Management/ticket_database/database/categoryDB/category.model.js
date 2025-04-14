const tool_database = require("./tool_database");

const CategoryModel = tool_database.model(
  "category",
  require("../../models/category/category.schema")
);

console.log(CategoryModel);

module.exports = CategoryModel;
