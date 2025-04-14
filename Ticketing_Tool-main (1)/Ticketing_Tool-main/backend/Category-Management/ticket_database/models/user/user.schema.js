const mongoose = require("mongoose");
// const validator = require('validator');
const bcrypt = require("bcrypt");
require("dotenv").config();
const { Schema } = mongoose;

const companySchema = new Schema(
  {
    first_name: {
      type: String,
      required: [true, "Please Enter Your Name."],
      maxlength: 50,
      lowercase: true,
    },
    last_name: {
      type: String,
      required: [true, "Please Enter Your Name."],
      maxlength: 50,
    },

    mobile_number: {
      type: String,
      // unique: true,
      min: [10, "Phone Number Must Contain 10 Digits"],
      required: [true, "Please Enter Your Phone Number"],
      // validate: [validator.isMobilePhone, 'Please Enter Correct Mobile Number'],
      // sparse:true
    },
    email: {
      type: String,
      required: [true, "Please Enter Your Email"],
      unique: true,
      //sparse: true,
      //   validate: [validator.isEmail, 'Please Enter Correct Email'],
    },
    password: {
      type: String,
      required: [true, "Please Enter Your Password"],
      //   min: [6, 'Minimum 6 Character Required, Got {VALUE}'],
      //   match: [
      //     /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,}$/,
      //     'Password Must Contain Correct Format',
      //   ],
      //   sparse: true
    },
    emp_id: {
      type: String,
      required: [true, "Please Enter Employee Id"],
      // min: [3, "Employee Id Must Contain 3 Digits"],
      unique: [true, "Employee should not be duplicate"],
    },
    // designation: {
    //   type: String,
    //   required: [true, "Please Enter Your Designation"],
    // },
    // fullName: {
    //   this.first_name,
    //   this.last_name,
    // },
    role: {
      type: String,
      required: [true, "Please Enter Your Role"],
    },
    status: {
      type: String,
      default: "Active",
    },

    createdAt: {
      type: Date,
      default: Date.now,
    },
    updatedAt: {
      type: Date,
      default: Date.now,
    },
  },
  {
    virtuals: {
      fullName: {
        get() {
          return this.first_name + " " + this.last_name;
        },
      },
    },

    toJSON: {
      virtuals: true,
    },

    toObject: {
      virtuals: true,
    },
  }
);
// companySchema.virtual("fullName").get(function () {
//   return this.first_name + " " + this.last_name;
// });
companySchema.set("toObject", { getters: true });
companySchema.set("toJSON", { getters: true });
companySchema.pre("save", async function (next) {
  try {
    const salt = await bcrypt.genSalt(10);
    const hashpassword = await bcrypt.hash(this.password, salt);
    this.password = hashpassword;
    next();
  } catch (error) {
    next(error);
  }
});

//companySchema.pre('save', async function (next) {
//   if (!this.isModified('password')) {
//     next();
//   }
//   if (!this.password) {
//     next();
//   }
//   const salt = await bcrypt.genSalt(10);
//   console.log('=====generated salt=====\n', salt);
//   const Salt = (await salt).toString();
//   this.password = await bcrypt.hash(this.password, Salt);
//   next();
// });

// companySchema.methods.passwordVerification = async function (password) {
//   return await bcrypt.compare(password, this.password);
// };

// companySchema.pre('updateOne', async function (next) {
//   this.options.runValidators = true;
//   next();
// });

// companySchema.pre("save", async function (next) {
//     if (!this.isModified("password")) {
//       next();
//     }

//     this.password = await bcrypt.hash(this.password, 10);
//   });
// //  compare password

// companySchema.methods.comparePassword = async function (password) {
//     return await bcrypt.compare(password, this.password)
//   }

module.exports = companySchema;
