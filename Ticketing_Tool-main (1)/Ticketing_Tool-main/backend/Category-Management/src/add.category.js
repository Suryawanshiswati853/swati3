const express = require("express");
const bcrypt = require("bcrypt");
// const { UserModel } = require("../ticket_database");
const { CategoryModel } = require("../ticket_database");

exports.add_Category = async (req, res) => {
  let category_name = req.body.category_name;
  let primary_contact = req.body.primary_contact;
  console.log(category_name);
  console.log(primary_contact);

  const data = new CategoryModel({
    category_name,
    primary_contact,
  });

  // find existing user
  const unique_category = await CategoryModel.findOne({
    category_name: data.category_name,
    primary_contact: data.primary_contact,
  });

  if (unique_category) {
    if (unique_category.category_name == data.category_name) {
      return res.json({
        status: false,
        message: "Category already exit ",
        errorCode: 401,
      });
    }
  }
  if (unique_category) {
    if (unique_category.primary_contact == data.primary_contact) {
      return res.json({
        status: false,
        message: "Category already exit ",
        errorCode: 401,
      });
    }
  }

  //to save data

  const new_category = await data.save();

  // const new_user = await UserModel.insertOne({data});
  console.log(new_category, "============result=============");

  if (!new_category || new_category == null || new_category == "") {
    return res.json({
      status: false,
      message: "Category Not Added ",
      errorCode: 401,
    });
  } else {
    return res.json({
      status: true,
      message: "Category Added Successfully",
      category: new_category,
    });
  }
};
