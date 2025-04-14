const mongoose = require("mongoose");
const bcrypt = require("bcrypt");
const UserModel = require("../../database/userDB/user.model");
const CategoryModel = require("../../database/categoryDB/category.model");

const { Schema } = mongoose;

const userCategorySchema = new Schema({
  category_id: {
    type: Schema.Types.ObjectId,
    required: [true, "Please Enter categoryId ."],
  },
  user_id: {
    type: Schema.Types.ObjectId,
    required: [true, "Please Enter userId ."],
  },
});

module.exports = userCategorySchema;
