const express = require("express");
const { CategoryModel, UserModel } = require("../ticket_database");

exports.all_category_list = async (req, res) => {
  try {
    //build query
    const queryObj = { ...req.query };
    console.log(queryObj);
    // console.log(queryObj.toLowercase);
    const excludeField = ["page", "sort", "limit", "field"];
    excludeField.forEach((ele) => {
      delete queryObj[ele];
    });

    //execute query
    let query = CategoryModel.find(queryObj).populate({
      path: "primary_contact",
      model: UserModel,
      select: {
        _id: 1,
        first_name: 1,
        last_name: 1,
        mobile_number: 1,
        email: 1,
        designation: 1,
        role: 1,
      },
    });

    // sorting
    if (req.query.sort) {
      const sortBy = req.query.sort.split(",").join(" ");
      query = query.sort(sortBy);
    }
    const categorylist = await query;
    console.log(categorylist, "======= All User List=============");

    if (
      !categorylist ||
      categorylist == null ||
      categorylist == "" ||
      categorylist.length == 0 ||
      categorylist == "null"
    ) {
      return res.json({
        status: false,
        message: " Category Not Found ",
        errorCode: 401,
      });
    } else {
      return res.json({
        status: true,
        message: "All Category Details",
        categorylist: categorylist,
      });
    }
  } catch (error) {
    console.log(error);
    return res.json({
      status: false,
      message: "Something Went Wrong Please Try Again",
    });
  }
};
