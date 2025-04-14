const express = require("express");

const {
  CategoryModel,
  UserModel,
  UserCategoryModel,
} = require("../ticket_database");

exports.get_specific_category = async (req, res) => {
  try {
    let id = req.params.id;
    console.log(id, "=======");

    console.log(id.length);

    if (id.length !== 24) {
      return res.json({
        status: false,
        message: "Please Provide Valid Id,Id should be 24 characters",
      });
    }

    const specificCategory = await UserCategoryModel.find({
      category_id: id,
    }).populate({
      path: "user_id",
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
    // .populate({
    //   path: "category_id",
    //   model: CategoryModel,
    //   select: {
    //     category_name: 1,
    //   },
    // });
    console.log(specificCategory, "--------------");

    if (
      !specificCategory ||
      specificCategory == null ||
      specificCategory == "null"
    ) {
      return res.json({
        status: false,
        message: "Please Provide Correct Id Data Not Found With This ID",
      });
    } else {
      return res.json({
        status: true,
        message: "Category Found Successfully",
        user_data: specificCategory,
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
