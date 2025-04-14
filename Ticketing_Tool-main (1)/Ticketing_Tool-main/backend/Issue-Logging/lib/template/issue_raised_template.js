function IssueRaised(first_name, email) {
  return `<h4>Dear ${first_name || email}</h4></br>
                  <p> Issue Raised Against You</p>`;
}

module.exports = {
  IssueRaised,
};
