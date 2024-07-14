import 'dart:core';

class Appointment {
  int aptId;
  String aptDate;
  String aptTime;
  String aptPlace;
  String city;
  String? comments;
  int docId;
  int feesCollected;
  int totalFees;
  String partyName;
  String? paymentMode;
  int staffId;
  String partyType;
  String docTitle;
  String tokenNo;
  String? aptExecutive;
  String aptStatus;
  String contactNo;

  int get getAptId => this.aptId;

  set setAptId(int aptId) => this.aptId = aptId;

  get getDocId => this.docId;

  set setDocId(docId) => this.docId = docId;

  get getTokenNo => tokenNo;

  set setTokenNo(tokenNo) => this.tokenNo = tokenNo;

  get getDocTitle => docTitle;

  set setDocTitle(docTitle) => this.docTitle = docTitle;

  get getStaffId => this.staffId;

  set setStaffId(staffId) => this.staffId = staffId;

  get getPartyName => this.partyName;

  set setPartyName(partyName) => this.partyName = partyName;

  get getPartyType => this.partyType;

  set setPartyType(partyType) => this.partyType = partyType;

  get getAptDate => this.aptDate;

  set setAptDate(aptDate) => this.aptDate = aptDate;

  get getAptTime => this.aptTime;

  set setAptTime(aptTime) => this.aptTime = aptTime;

  get getAptPlace => this.aptPlace;

  set setAptPlace(aptPlace) => this.aptPlace = aptPlace;

  get getCity => this.city;

  set setCity(city) => this.city = city;

  get getFeesCollected => this.feesCollected;

  set setFeesCollected(feesCollected) => this.feesCollected = feesCollected;

  get getTotalFees => this.totalFees;

  set setTotalFees(totalFees) => this.totalFees = totalFees;

  get getPaymentMode => this.paymentMode;

  set setPaymentMode(paymentMode) => this.paymentMode = paymentMode;

  get getComments => this.comments;

  set setComments(comments) => this.comments = comments;

  get getAptExecutive => this.aptExecutive;

  set setAptExecutive(aptExecutive) => this.aptExecutive = aptExecutive;

  get getAptStatus => this.aptStatus;

  set setAptStatus(aptStatus) => this.aptStatus = aptStatus;

  get getContactNo => this.contactNo;

  set setContactNo(contactNo) => this.contactNo = contactNo;

  Appointment(
      {required this.aptId,
      required this.docId,
      required this.tokenNo,
      required this.docTitle,
      required this.staffId,
      required this.partyName,
      required this.partyType,
      required this.aptDate,
      required this.aptTime,
      required this.aptPlace,
      required this.city,
      required this.feesCollected,
      required this.totalFees,
      required this.paymentMode,
      required this.aptExecutive,
      required this.aptStatus,
      required this.contactNo,
      required this.comments});

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
        aptId: json['aptId'],
        docId: json['docId'],
        tokenNo: json['tokenNo'],
        docTitle: json['docTitle'],
        staffId: json['staffId'],
        partyName: json['partyName'],
        partyType: json['partyType'],
        aptDate: json['aptDate'],
        aptTime: json['aptTime'],
        aptPlace: json['aptPlace'],
        city: json['city'],
        feesCollected: json['feesCollected'],
        totalFees: json['totalFees'],
        paymentMode: json['paymentMode'] ?? "",
        aptExecutive: json['aptExecutive'] ?? '',
        aptStatus: json['aptStatus'],
        contactNo: json['contactNo'],
        comments: json['comments'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'aptId': aptId,
      'docId': docId,
      //'tokenNo': tokenNo,
      //'docTitle': docTitle,
      'staffId': staffId,
      'partyName': partyName,
      'type': partyType,
      'aptDate': aptDate,
      'aptTime': aptTime.toString(),
      'aptPlace': aptPlace,
      'city': city,
      'feesCollected': feesCollected,
      'totalFees': totalFees,
      'paymentMode': paymentMode,
      'aptExecutive': aptExecutive,
      'aptStatus': aptStatus,
      'contactNo': contactNo,
      'comments': comments,
    };
  }
}
