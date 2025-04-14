const os = require("os");

const serverIP = process.env.server_ip;

const network = os.networkInterfaces();
let networkData = [];
Object.values(network).forEach((val) => {
  networkData.push(val);
});
const hostIP =
  os.hostname() === "Issue-Logging" ? serverIP : networkData[1][0].address;
// console.log('Host IP address is :', hostIP);
// ************************************************* //

// *****************SERVER HOST NAME*********************** //
const path =
  os.hostname() === "Issue-Logging"
    ? "/app/login"
    : `${os.homedir()}/ticketing_tool/Issue-Logging`;
// console.log('Host Path is:', path);
// ******************************************************** //

// *****************SERVER HOST NAME*********************** //
const hostName = os.hostname();
// console.log('Host name is:', hostName);
// ******************************************************** //

const db_ip = process.env.ip;

module.exports = {
  hostIP,
  path,
  hostName,
  db_ip,
};
