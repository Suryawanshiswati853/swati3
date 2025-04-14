function IssueCommentAdded(first_name, email) {
  return `<h4>Dear ${first_name || email}</h4></br>
                      <p> Your Comment Added Successfully</p>`;
}

module.exports = {
  IssueCommentAdded,
};
