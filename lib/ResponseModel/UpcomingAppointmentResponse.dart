
import 'dart:convert';

List<UpcomingAppointmentResponse> upcomingAppointmentResponseFromJson(String str) => List<UpcomingAppointmentResponse>.from(json.decode(str).map((x) => UpcomingAppointmentResponse.fromJson(x)));

String upcomingAppointmentResponseToJson(List<UpcomingAppointmentResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class UpcomingAppointmentResponse {
  int id;
  List<ServicesDetail> servicesDetail;
  String appointmentDate;
  double amount;
  String status;
  int firstServices;
  int secondServices;
  int thirdServices;
  int fourServices;
  int fiveServices;
  int user;

  UpcomingAppointmentResponse(
      {this.id,
        this.servicesDetail,
        this.appointmentDate,
        this.amount,
        this.status,
        this.firstServices,
        this.secondServices,
        this.thirdServices,
        this.fourServices,
        this.fiveServices,
        this.user});

  UpcomingAppointmentResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['services_detail'] != null) {
      servicesDetail = new List<ServicesDetail>();
      json['services_detail'].forEach((v) {
        servicesDetail.add(new ServicesDetail.fromJson(v));
      });
    }
    appointmentDate = json['appointment_date'];
    amount = json['amount'];
    status = json['status'];
    firstServices = json['first_services'];
    secondServices = json['second_services'];
    thirdServices = json['third_services'];
    fourServices = json['four_services'];
    fiveServices = json['five_services'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.servicesDetail != null) {
      data['services_detail'] =
          this.servicesDetail.map((v) => v.toJson()).toList();
    }
    data['appointment_date'] = this.appointmentDate;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['first_services'] = this.firstServices;
    data['second_services'] = this.secondServices;
    data['third_services'] = this.thirdServices;
    data['four_services'] = this.fourServices;
    data['five_services'] = this.fiveServices;
    data['user'] = this.user;
    return data;
  }
}

class ServicesDetail {
  int id;
  String servicesName;
  int servicesPrice;
  String servicesImage;
  int shopArtistName;

  ServicesDetail(
      {this.id,
        this.servicesName,
        this.servicesPrice,
        this.servicesImage,
        this.shopArtistName});

  ServicesDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    servicesName = json['services_name'];
    servicesPrice = json['Services_price'];
    servicesImage = json['services_image'];
    shopArtistName = json['shop_artist_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['services_name'] = this.servicesName;
    data['Services_price'] = this.servicesPrice;
    data['services_image'] = this.servicesImage;
    data['shop_artist_name'] = this.shopArtistName;
    return data;
  }
}