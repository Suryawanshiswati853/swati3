const Joi = require("joi");

const issueIdValidationSchema = Joi.object({
  user_id: Joi.string().length(24).trim().required().messages({
    "string.base": "ID Should Be A Type Of String",
    "string.empty": "ID Must Contain A Value",
    "string.trim": "No space Allowed In ID",
    "any.required": "ID Is A Required Field",
  }),
  comment: Joi.string().default("Pending").messages({
    "any.required": "comment is a required field",
    "string.empty": "comment Must contain a value",
  }),
  issue_id: Joi.string().length(24).trim().required().messages({
    "string.base": "ID Should Be A Type Of String",
    "string.empty": "ID Must Contain A Value",
    "string.trim": "No space Allowed In ID",
    "any.required": "ID Is A Required Field",
  }),
});
module.exports = {
  issueIdValidationSchema,
};
