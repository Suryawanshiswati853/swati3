function IssueAcknowledgement(first_name, email) {
  return `<h4>Dear ${first_name || email}</h4></br>
                    <p> Your Issue Register Successfully</p>`;
}

module.exports = {
  IssueAcknowledgement,
};
