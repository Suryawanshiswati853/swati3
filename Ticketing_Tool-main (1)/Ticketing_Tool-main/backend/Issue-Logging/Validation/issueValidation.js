const Joi = require("joi");

const issueValidationSchema = Joi.object({
  assigned_to: Joi.string().length(24).trim().messages({
    "string.base": "Assigned_to Should be a type of string",
    "string.empty": "Assigned_to Must contain a value",
    "string.trim": "no space allowed in Assigned_to",
    "any.required": "Assigned_to is a required field",
  }),
  issue_title: Joi.string().trim().required().messages({
    "string.base": "issue_title Should be a type of string",
    "string.empty": "issue_title Must contain a value",
    "string.trim": "no space allowed in issue_title",
    "any.required": "issue_title is a required field",
  }),
  issue_type: Joi.string()
    .trim()
    // .required()
    .valid("HR", "Finance", "SystemAdmin")
    .messages({
      "string.base": "issue_type Should be a type of string",
      "string.empty": "issue_type Must contain a value",
      "string.trim": "no space allowed in issue_type",
      "any.required": "issue_type is a required field",
    }),
  issue_summery: Joi.string().trim().required().messages({
    "string.base": "issue_summery Should be a type of string",
    "string.empty": "issue_summery Must contain a value",
    "string.trim": "no space allowed in issue_summery",
    "any.required": "issue_summery is a required field",
  }),

  issue_status: Joi.string().default("Pending").messages({
    "any.required": "issue_status is a required field",
    "string.empty": "issue_status Must contain a value",
  }),
  user_ID: Joi.string().length(24).trim().messages({
    "string.base": "CreatedBy Should be a type of string",
    "string.empty": "CreatedBy Must contain a value",
    "string.trim": "no space allowed in CreatedBy",
    "any.required": "CreatedBy is a required field",
  }),
});
module.exports = {
  issueValidationSchema,
};
