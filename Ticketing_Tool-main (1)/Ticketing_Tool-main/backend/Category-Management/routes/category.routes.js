const express = require("express");
const { categoryValidation } = require("../middleware/categoryValidation");

const category_managementRouter = express.Router();

category_managementRouter
  .route("/addcategory")
  .post(require("../src/add.category").add_Category);

category_managementRouter
  .route("/get_allcategory_list")
  .get(require("../src/get_Category_list").all_category_list);

category_managementRouter
  .route("/map_user_with_category")
  .post(require("../src/map.user.category").map_user_Category);

category_managementRouter
  .route("/edit_User_Category/:id")
  .patch(require("../src/edit_user_category").edit_User_Category);
category_managementRouter
  .route("/get_specific_category/:id")
  .get(require("../src/get_specific_category").get_specific_category);
category_managementRouter
  .route("/get_specific_category_users/:id")
  .get(
    require("../src/get_specific_category_user")
      .get_specific_category_users_By_ID
  );

module.exports = category_managementRouter;
