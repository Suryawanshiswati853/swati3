const Joi = require("joi");

const categoryValidationSchema = Joi.object({
  category_name: Joi.string().trim().required().messages({
    "string.base": "Category_name Should be a type of string",
    "string.empty": "Category_name Must contain a value",
    "string.trim": "no space allowed in Category_name",
    "any.required": "Category_name is a required field",
  }),
});
module.exports = {
  categoryValidationSchema,
};
