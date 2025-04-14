const Joi = require("joi");

const routeSchema = Joi.object({
  issue_Id: Joi.string().guid().required(),
}).unknown(true);
module.exports = {
  routeSchema,
};
