const express = require("express");
const bcrypt = require("bcrypt");
const { UserModel } = require("../ticket_database");
const { CategoryModel } = require("../ticket_database");
const { UserCategoryModel } = require("../ticket_database");

exports.map_user_Category = async (req, res) => {
  let user_id = req.body.user_id;
  let category_id = req.body.category_id;
  if (user_id.length !== 24) {
    return res.json({
      status: false,
      message: "Please Provide Valid Id,Id should be 24 characters ",
    });
  }

  if (category_id.length !== 24) {
    return res.json({
      status: false,
      message: "Please Provide Valid Id,Id should be 24 characters ",
    });
  }

  const data = new UserCategoryModel({
    user_id,
    category_id,
  });

  //to save data

  const new_category = await data.save();

  // const new_category = await UserModel.insertOne({data});
  console.log(new_category, "============result=============");
  const user = await UserModel.findOne({
    _id: new_category.user_id,
  });

  const category = await CategoryModel.findOne({
    _id: new_category.category_id,
  });

  if (user) {
    new_category._doc.user = user;
  }

  if (category) {
    new_category._doc.category = category;
  }

  if (!new_category || new_category == null || new_category == "") {
    return res.json({
      status: false,
      message: "User Category Not Mapped ",
      errorCode: 401,
    });
  } else {
    return res.json({
      status: true,
      message: "User Category Map Successfully",
      category: new_category,
    });
  }
};
