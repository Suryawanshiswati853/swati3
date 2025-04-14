const { CategoryModel } = require("../ticket_database");
exports.edit_User_Category = async (req, res) => {
  try {
    const id = req.params.id;

    console.log(id.length);

    if (id.length !== 24 || id == null) {
      return res.json({
        status: false,
        message: "Please Provide Valid Id,Id should be 24 characters ",
      });
    }

    const edited_User_Category = await CategoryModel.findByIdAndUpdate(
      id,
      req.body,
      {
        new: true,
      }
    );
    console.log(edited_User_Category, "--------------");

    if (
      !edited_User_Category ||
      edited_User_Category == null ||
      edited_User_Category == "null"
    ) {
      return res.json({
        status: false,
        message: "Please Provide Correct Id Data Not Found With This ID",
      });
    } else {
      return res.json({
        status: true,
        message: "User Category Edited Successfully",
        edited_Data: edited_User_Category,
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
