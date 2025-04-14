const Joi = require("joi");

const issueStatusValidationSchema = Joi.object({
  issue_status: Joi.string()
    .default("Open")
    .required()
    .valid("In-Progress", "Open", "Close")
    .messages({
      "any.required": "issue_status is a required field",
      "string.empty": "issue_status Must contain a value",
    }),
});
module.exports = {
  issueStatusValidationSchema,
};
