class salonResponse {
  String _msg;
  List<SalonData> _data;
  bool _success;

  salonResponse({String msg, List<SalonData> data, bool success}) {
    this._msg = msg;
    this._data = data;
    this._success = success;
  }

  String get msg => _msg;
  set msg(String msg) => _msg = msg;
  List<SalonData> get data => _data;
  set data(List<SalonData> data) => _data = data;
  bool get success => _success;
  set success(bool success) => _success = success;

  salonResponse.fromJson(Map<String, dynamic> json) {
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = new List<SalonData>();
      json['data'].forEach((v) {
        _data.add(new SalonData.fromJson(v));
      });
    }
    _success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this._msg;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    data['success'] = this._success;
    return data;
  }
}

class SalonData {
  int _salonId;
  int _ownerId;
  String _name;
  String _image;
  String _logo;
  String _desc;
  String _gender;
  String _address;
  int _zipcode;
  String _city;
  String _state;
  String _country;
  Null _website;
  int _phone;
  String _sun;
  String _mon;
  String _tue;
  String _wed;
  String _thu;
  String _fri;
  String _sat;
  int _status;
  String _latitude;
  String _longitude;
  String _createdAt;
  String _updatedAt;
  Sunday _sunday;
  Monday _monday;
  Monday _tuesday;
  Monday _wednesday;
  Monday _thursday;
  Monday _friday;
  Monday _saturday;
  int _rate;
  String _imagePath;
  String _ownerName;
  OwnerDetails _ownerDetails;

  SalonData(
      {int salonId,
        int ownerId,
        String name,
        String image,
        String logo,
        String desc,
        String gender,
        String address,
        int zipcode,
        String city,
        String state,
        String country,
        Null website,
        int phone,
        String sun,
        String mon,
        String tue,
        String wed,
        String thu,
        String fri,
        String sat,
        int status,
        String latitude,
        String longitude,
        String createdAt,
        String updatedAt,
        Sunday sunday,
        Monday monday,
        Monday tuesday,
        Monday wednesday,
        Monday thursday,
        Monday friday,
        Monday saturday,
        int rate,
        String imagePath,
        String ownerName,
        OwnerDetails ownerDetails}) {
    this._salonId = salonId;
    this._ownerId = ownerId;
    this._name = name;
    this._image = image;
    this._logo = logo;
    this._desc = desc;
    this._gender = gender;
    this._address = address;
    this._zipcode = zipcode;
    this._city = city;
    this._state = state;
    this._country = country;
    this._website = website;
    this._phone = phone;
    this._sun = sun;
    this._mon = mon;
    this._tue = tue;
    this._wed = wed;
    this._thu = thu;
    this._fri = fri;
    this._sat = sat;
    this._status = status;
    this._latitude = latitude;
    this._longitude = longitude;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._sunday = sunday;
    this._monday = monday;
    this._tuesday = tuesday;
    this._wednesday = wednesday;
    this._thursday = thursday;
    this._friday = friday;
    this._saturday = saturday;
    this._rate = rate;
    this._imagePath = imagePath;
    this._ownerName = ownerName;
    this._ownerDetails = ownerDetails;
  }

  int get salonId => _salonId;
  set salonId(int salonId) => _salonId = salonId;
  int get ownerId => _ownerId;
  set ownerId(int ownerId) => _ownerId = ownerId;
  String get name => _name;
  set name(String name) => _name = name;
  String get image => _image;
  set image(String image) => _image = image;
  String get logo => _logo;
  set logo(String logo) => _logo = logo;
  String get desc => _desc;
  set desc(String desc) => _desc = desc;
  String get gender => _gender;
  set gender(String gender) => _gender = gender;
  String get address => _address;
  set address(String address) => _address = address;
  int get zipcode => _zipcode;
  set zipcode(int zipcode) => _zipcode = zipcode;
  String get city => _city;
  set city(String city) => _city = city;
  String get state => _state;
  set state(String state) => _state = state;
  String get country => _country;
  set country(String country) => _country = country;
  Null get website => _website;
  set website(Null website) => _website = website;
  int get phone => _phone;
  set phone(int phone) => _phone = phone;
  String get sun => _sun;
  set sun(String sun) => _sun = sun;
  String get mon => _mon;
  set mon(String mon) => _mon = mon;
  String get tue => _tue;
  set tue(String tue) => _tue = tue;
  String get wed => _wed;
  set wed(String wed) => _wed = wed;
  String get thu => _thu;
  set thu(String thu) => _thu = thu;
  String get fri => _fri;
  set fri(String fri) => _fri = fri;
  String get sat => _sat;
  set sat(String sat) => _sat = sat;
  int get status => _status;
  set status(int status) => _status = status;
  String get latitude => _latitude;
  set latitude(String latitude) => _latitude = latitude;
  String get longitude => _longitude;
  set longitude(String longitude) => _longitude = longitude;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;
  Sunday get sunday => _sunday;
  set sunday(Sunday sunday) => _sunday = sunday;
  Monday get monday => _monday;
  set monday(Monday monday) => _monday = monday;
  Monday get tuesday => _tuesday;
  set tuesday(Monday tuesday) => _tuesday = tuesday;
  Monday get wednesday => _wednesday;
  set wednesday(Monday wednesday) => _wednesday = wednesday;
  Monday get thursday => _thursday;
  set thursday(Monday thursday) => _thursday = thursday;
  Monday get friday => _friday;
  set friday(Monday friday) => _friday = friday;
  Monday get saturday => _saturday;
  set saturday(Monday saturday) => _saturday = saturday;
  int get rate => _rate;
  set rate(int rate) => _rate = rate;
  String get imagePath => _imagePath;
  set imagePath(String imagePath) => _imagePath = imagePath;
  String get ownerName => _ownerName;
  set ownerName(String ownerName) => _ownerName = ownerName;
  OwnerDetails get ownerDetails => _ownerDetails;
  set ownerDetails(OwnerDetails ownerDetails) => _ownerDetails = ownerDetails;

  SalonData.fromJson(Map<String, dynamic> json) {
    _salonId = json['salon_id'];
    _ownerId = json['owner_id'];
    _name = json['name'];
    _image = json['image'];
    _logo = json['logo'];
    _desc = json['desc'];
    _gender = json['gender'];
    _address = json['address'];
    _zipcode = json['zipcode'];
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _website = json['website'];
    _phone = json['phone'];
    _sun = json['sun'];
    _mon = json['mon'];
    _tue = json['tue'];
    _wed = json['wed'];
    _thu = json['thu'];
    _fri = json['fri'];
    _sat = json['sat'];
    _status = json['status'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _sunday =
    json['sunday'] != null ? new Sunday.fromJson(json['sunday']) : null;
    _monday =
    json['monday'] != null ? new Monday.fromJson(json['monday']) : null;
    _tuesday =
    json['tuesday'] != null ? new Monday.fromJson(json['tuesday']) : null;
    _wednesday = json['wednesday'] != null
        ? new Monday.fromJson(json['wednesday'])
        : null;
    _thursday =
    json['thursday'] != null ? new Monday.fromJson(json['thursday']) : null;
    _friday =
    json['friday'] != null ? new Monday.fromJson(json['friday']) : null;
    _saturday =
    json['saturday'] != null ? new Monday.fromJson(json['saturday']) : null;
    _rate = json['rate'];
    _imagePath = json['imagePath'];
    _ownerName = json['ownerName'];
    _ownerDetails = json['ownerDetails'] != null
        ? new OwnerDetails.fromJson(json['ownerDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['salon_id'] = this._salonId;
    data['owner_id'] = this._ownerId;
    data['name'] = this._name;
    data['image'] = this._image;
    data['logo'] = this._logo;
    data['desc'] = this._desc;
    data['gender'] = this._gender;
    data['address'] = this._address;
    data['zipcode'] = this._zipcode;
    data['city'] = this._city;
    data['state'] = this._state;
    data['country'] = this._country;
    data['website'] = this._website;
    data['phone'] = this._phone;
    data['sun'] = this._sun;
    data['mon'] = this._mon;
    data['tue'] = this._tue;
    data['wed'] = this._wed;
    data['thu'] = this._thu;
    data['fri'] = this._fri;
    data['sat'] = this._sat;
    data['status'] = this._status;
    data['latitude'] = this._latitude;
    data['longitude'] = this._longitude;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    if (this._sunday != null) {
      data['sunday'] = this._sunday.toJson();
    }
    if (this._monday != null) {
      data['monday'] = this._monday.toJson();
    }
    if (this._tuesday != null) {
      data['tuesday'] = this._tuesday.toJson();
    }
    if (this._wednesday != null) {
      data['wednesday'] = this._wednesday.toJson();
    }
    if (this._thursday != null) {
      data['thursday'] = this._thursday.toJson();
    }
    if (this._friday != null) {
      data['friday'] = this._friday.toJson();
    }
    if (this._saturday != null) {
      data['saturday'] = this._saturday.toJson();
    }
    data['rate'] = this._rate;
    data['imagePath'] = this._imagePath;
    data['ownerName'] = this._ownerName;
    if (this._ownerDetails != null) {
      data['ownerDetails'] = this._ownerDetails.toJson();
    }
    return data;
  }
}

class Sunday {
  Null _open;
  Null _close;

  Sunday({Null open, Null close}) {
    this._open = open;
    this._close = close;
  }

  Null get open => _open;
  set open(Null open) => _open = open;
  Null get close => _close;
  set close(Null close) => _close = close;

  Sunday.fromJson(Map<String, dynamic> json) {
    _open = json['open'];
    _close = json['close'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['open'] = this._open;
    data['close'] = this._close;
    return data;
  }
}

class Monday {
  String _open;
  String _close;

  Monday({String open, String close}) {
    this._open = open;
    this._close = close;
  }

  String get open => _open;
  set open(String open) => _open = open;
  String get close => _close;
  set close(String close) => _close = close;

  Monday.fromJson(Map<String, dynamic> json) {
    _open = json['open'];
    _close = json['close'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['open'] = this._open;
    data['close'] = this._close;
    return data;
  }
}

class OwnerDetails {
  int _id;
  String _name;
  String _image;
  String _email;
  Null _otp;
  Null _addedBy;
  Null _emailVerifiedAt;
  String _code;
  String _phone;
  int _status;
  int _role;
  int _verify;
  Null _deviceToken;
  int _notification;
  int _mail;
  String _createdAt;
  String _updatedAt;
  String _imagePath;
  String _salonName;

  OwnerDetails(
      {int id,
        String name,
        String image,
        String email,
        Null otp,
        Null addedBy,
        Null emailVerifiedAt,
        String code,
        String phone,
        int status,
        int role,
        int verify,
        Null deviceToken,
        int notification,
        int mail,
        String createdAt,
        String updatedAt,
        String imagePath,
        String salonName}) {
    this._id = id;
    this._name = name;
    this._image = image;
    this._email = email;
    this._otp = otp;
    this._addedBy = addedBy;
    this._emailVerifiedAt = emailVerifiedAt;
    this._code = code;
    this._phone = phone;
    this._status = status;
    this._role = role;
    this._verify = verify;
    this._deviceToken = deviceToken;
    this._notification = notification;
    this._mail = mail;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._imagePath = imagePath;
    this._salonName = salonName;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get image => _image;
  set image(String image) => _image = image;
  String get email => _email;
  set email(String email) => _email = email;
  Null get otp => _otp;
  set otp(Null otp) => _otp = otp;
  Null get addedBy => _addedBy;
  set addedBy(Null addedBy) => _addedBy = addedBy;
  Null get emailVerifiedAt => _emailVerifiedAt;
  set emailVerifiedAt(Null emailVerifiedAt) =>
      _emailVerifiedAt = emailVerifiedAt;
  String get code => _code;
  set code(String code) => _code = code;
  String get phone => _phone;
  set phone(String phone) => _phone = phone;
  int get status => _status;
  set status(int status) => _status = status;
  int get role => _role;
  set role(int role) => _role = role;
  int get verify => _verify;
  set verify(int verify) => _verify = verify;
  Null get deviceToken => _deviceToken;
  set deviceToken(Null deviceToken) => _deviceToken = deviceToken;
  int get notification => _notification;
  set notification(int notification) => _notification = notification;
  int get mail => _mail;
  set mail(int mail) => _mail = mail;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;
  String get imagePath => _imagePath;
  set imagePath(String imagePath) => _imagePath = imagePath;
  String get salonName => _salonName;
  set salonName(String salonName) => _salonName = salonName;

  OwnerDetails.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _email = json['email'];
    _otp = json['otp'];
    _addedBy = json['added_by'];
    _emailVerifiedAt = json['email_verified_at'];
    _code = json['code'];
    _phone = json['phone'];
    _status = json['status'];
    _role = json['role'];
    _verify = json['verify'];
    _deviceToken = json['device_token'];
    _notification = json['notification'];
    _mail = json['mail'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _imagePath = json['imagePath'];
    _salonName = json['salonName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['image'] = this._image;
    data['email'] = this._email;
    data['otp'] = this._otp;
    data['added_by'] = this._addedBy;
    data['email_verified_at'] = this._emailVerifiedAt;
    data['code'] = this._code;
    data['phone'] = this._phone;
    data['status'] = this._status;
    data['role'] = this._role;
    data['verify'] = this._verify;
    data['device_token'] = this._deviceToken;
    data['notification'] = this._notification;
    data['mail'] = this._mail;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['imagePath'] = this._imagePath;
    data['salonName'] = this._salonName;
    return data;
  }
}