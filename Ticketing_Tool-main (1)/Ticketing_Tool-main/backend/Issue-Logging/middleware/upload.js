const path = require("path");
const multer = require("multer");
const uniqid = require("uniqid");

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, `Uploads/`);
  },
  filename: function (req, file, cb) {
    let ext = path.extname(file.originalname);
    cb(null, Date.now() + ext);
  },
});

const upload = multer({
  storage: storage,
  fileFilter: function (req, file, cb) {
    if (
      file.mimetype === "image/jpeg" ||
      file.mimetype === "image/png" ||
      file.mimetype === "application/pdf"
    ) {
      cb(null, true);
    } else {
      cb(
        {
          message: "File type not supported. Allowed format jpeg, png, pdf",
          status: false,
        },
        false
      );
    }
  },
});

module.exports = upload;
