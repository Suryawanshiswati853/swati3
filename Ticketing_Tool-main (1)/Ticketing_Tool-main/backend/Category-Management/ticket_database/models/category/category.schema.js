const mongoose = require("mongoose");
const bcrypt = require("bcrypt");
const UserModel = require("../../database/userDB/user.model");
// const CategoryModel = require("../../database/categoryDB/category.model");
const { Schema } = mongoose;

const categorySchema = new Schema({
  category_name: {
    type: String,
    required: [true, "Please Enter category"],
  },
  primary_contact: {
    type: Schema.Types.ObjectId,
    required: [true, "Please Enter primary_contact"],
  },
  createdAt: {
    type: Date,
    default: Date,
  },
  updatedAt: { type: Date },
  updatedBy: {
    type: Schema.Types.ObjectId,
  },
});

module.exports = categorySchema;
