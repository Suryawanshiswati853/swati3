function issueStatusChanged(first_name, email, issue_status, assigned_to) {
  return `<h4>Dear ${first_name || email}</h4></br>
  <p> Your Issue Status Changed To ${issue_status}</p></br>
  <p> And It Is Assigned To ${assigned_to}</p>`;
}
module.exports = {
  issueStatusChanged,
};
