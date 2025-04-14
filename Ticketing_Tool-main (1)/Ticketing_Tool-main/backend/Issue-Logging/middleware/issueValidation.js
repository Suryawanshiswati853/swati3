const { issueValidationSchema } = require("../Validation/issueValidation");
const {
  issueStatusValidationSchema,
} = require("../Validation/issueStatusValidation");
const { routeSchema } = require("../Validation/routesValidation");
const { issueIdValidationSchema } = require("../Validation/issueIdValidation");
module.exports = {
  issuevalidation: async (req, res, next) => {
    const value = await issueValidationSchema.validate(req.body, {
      abortEarly: false,
    });
    // console.log(value);

    if (value.error) {
      res.json({
        // success: 0,
        message: value.error.details[0].message,
        //error: resp,
      });
    } else {
      next();
    }
  },
  issueStatusValidation: async (req, res, next) => {
    const value = await issueStatusValidationSchema.validate(req.body, {
      abortEarly: false,
    });
    // console.log(value);

    if (value.error) {
      res.json({
        // success: 0,
        message: value.error.details[0].message,
        //error: resp,
      });
    } else {
      next();
    }
  },
  issueIdValidation: async (req, res, next) => {
    const value = await issueIdValidationSchema.validate(req.body, {
      abortEarly: false,
    });
    // console.log(value);

    if (value.error) {
      res.json({
        // success: 0,
        message: value.error.details[0].message,
        //error: resp,
      });
    } else {
      next();
    }
  },
  routeValidation: async (req, res, next) => {
    const value = await routeSchema.validate(req.body, {
      abortEarly: false,
    });
    // console.log(value);

    if (value.error) {
      res.json({
        // success: 0,
        message: value.error.details[0].message,
        //error: resp,
      });
    } else {
      next();
    }
  },
};
