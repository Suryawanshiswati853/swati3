import 'dart:convert';
import 'dart:core';

//import 'package:intl/intl.dart';

Document documnetModelJson(String str) => Document.fromJson(json.decode(str));

String documentModelToJson(Document data) => json.encode(data.toJson());

class Document {
  int docId;
  int tokenNo;
  String docTitle;
  String address;
  String city;
  String pinCode;
  String docType;
  String duration;
  String startDate;
  String endDate;
  String docStatus;
  //String createdAt;
  String rentDesc;
  String partyName;
  String createdBy;
  String? updatedBy;

  Document(
      {required this.docId,
      required this.tokenNo,
      required this.docTitle,
      required this.address,
      required this.city,
      required this.pinCode,
      required this.docType,
      required this.duration,
      required this.startDate,
      required this.endDate,
      required this.docStatus,
      //required this.createdAt,
      required this.rentDesc,
      required this.partyName,
      required this.createdBy,
      required this.updatedBy});

  get getDocId => docId;

  set setDocId(final docId) => this.docId = docId;

  get getTokenNo => tokenNo;

  set setTokenNo(tokenNo) => this.tokenNo = tokenNo;

  get getDocTitle => docTitle;

  set setDocTitle(docTitle) => this.docTitle = docTitle;

  get getAddress => address;

  set setAddress(address) => this.address = address;

  get getCity => city;

  set setCity(city) => this.city = city;

  get getPinCode => pinCode;

  set setPinCode(pinCode) => this.pinCode = pinCode;

  get getDocType => docType;

  set setDocType(docType) => this.docType = docType;

  get getDuration => duration;

  set setDuration(duration) => this.duration = duration;

  get getStartDate => startDate;

  set setStartDate(startDate) => this.startDate = startDate;

  get getEndDate => endDate;

  set setEndDate(endDate) => this.endDate = endDate;

  get getDocStatus => docStatus;

  set setDocStatus(final docStatus) => this.docStatus = docStatus;

  //get getcreatedAt => createdAt;

  //set setcreatedAt(final createdAt) => this.createdAt = createdAt;

  get getRentDesc => rentDesc;

  set setRentDesc(rentDesc) => this.rentDesc = rentDesc;

  get getPartyName => partyName;

  set setPartyName(partyName) => this.partyName = partyName;

  get getcreatedBy => createdBy;

  set setcreatedBy(createdBy) => this.createdBy = createdBy;
  get getupdatedBy => updatedBy;

  set setupdatedBy(updatedBy) => this.updatedBy = updatedBy;

  factory Document.fromJson(Map<String, dynamic> json) => Document(
      docId: json['docId'],
      tokenNo: json['tokenNo'],
      docTitle: json['docTitle'],
      address: json['address'],
      city: json['city'],
      pinCode: json['pinCode'],
      docType: json['docType'],
      duration: json['duration'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      docStatus: json['docStatus'],
      // createdAt: json['createdAt'],
      rentDesc: json['rentDesc'] ?? '',
      partyName: json['partyName'],
      createdBy: json['createdBy'],
      updatedBy: json['updatedBy']);

  Map<String, dynamic> toJson() => {
        'docId': docId,
        'tokenNo': tokenNo,
        'docTitle': docTitle,
        'address': address,
        'city': city,
        'pinCode': pinCode,
        'docType': docType,
        'duration': docId,
        'startDate': startDate,
        'endDate': endDate,
        'docStatus': docStatus,
        // 'createdAt': createdAt,
        'rentDesc': rentDesc,
        'partyName': partyName,
        'createdBy': createdBy,
        'updatedBy': updatedBy
      };
}
