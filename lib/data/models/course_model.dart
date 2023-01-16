/// id : 389
/// title : "Hikechangers "
/// img : ["http://skillzycp.com/upload/business/389_636896432064799384.jpg","http://skillzycp.com/upload/business/389_636896432315268827.jpg","http://skillzycp.com/upload/business/389_636896432445581923.jpg","http://skillzycp.com/upload/business/389_636896432574644899.jpg"]
/// interest : "سفاري"
/// price : 200
/// date : "2019-04-05T14:00:51.000Z"
/// address : "الثغر بلازا مقابل ساكو "
/// trainerName : "Hikechangers "
/// trainerImg : "https://skillzycp.com/upload/trainer/389_BaseImage_636896408382239890.jpg"
/// trainerInfo : "مغامروا الهايك"
/// occasionDetail : "يسر فريق hike changers ان تعلن عن رحلتها القادمه وبوجودكم في جُمعتنا تصير احلى جَمعة 😍😍\r\n\r\n\r\nشاركو معنا في رحلة مسائية من أجمل رحلات المغامره \r\nالهايك مشي🚶🏻‍♂🚶🏼‍♀ \r\nوانشطة وفعاليات عديده🃏🎴 \r\nسناكس 🍪🍩🍫 \r\nوجبة عشاء 🌭🥙🍱🥘 \r\nموعد التجمع الساعه /2مساء \r\nونهاية الفعاليه الساعه / 9:30مساء \r\nالسعر / ٢٠٠ريال تشمل التنقلات من نقطة التجمع الى الموقع وفعاليات الرحله وو جبة عشاء 🍢🥗🍱 \r\n \r\nللإستفسار التواصل على الرقم : 0598855557 \r\nواتس اب 0532905587"
/// latitude : "24.7535346921672"
/// longitude : "46.5850353240967"
/// isLiked : false
/// isSold : false
/// isPrivateEvent : false
/// hiddenCashPayment : false
/// specialForm : 0
/// questionnaire : null
/// questExplanation : null
/// reservTypes : [{"id":571,"name":"مغامر/ه هايك","count":40,"price":200}]

class CourseModel {
  CourseModel({
      this.id, 
      this.title, 
      this.img, 
      this.interest, 
      this.price, 
      this.date, 
      this.address, 
      this.trainerName, 
      this.trainerImg, 
      this.trainerInfo, 
      this.occasionDetail, 
      this.latitude, 
      this.longitude, 
      this.isLiked, 
      this.isSold, 
      this.isPrivateEvent, 
      this.hiddenCashPayment, 
      this.specialForm, 
      this.questionnaire, 
      this.questExplanation, 
      this.reservTypes,});

  CourseModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    img = json['img'] != null ? json['img'].cast<String>() : [];
    interest = json['interest'];
    price = json['price'];
    date = json['date'];
    address = json['address'];
    trainerName = json['trainerName'];
    trainerImg = json['trainerImg'];
    trainerInfo = json['trainerInfo'];
    occasionDetail = json['occasionDetail'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isLiked = json['isLiked'];
    isSold = json['isSold'];
    isPrivateEvent = json['isPrivateEvent'];
    hiddenCashPayment = json['hiddenCashPayment'];
    specialForm = json['specialForm'];
    questionnaire = json['questionnaire'];
    questExplanation = json['questExplanation'];
    if (json['reservTypes'] != null) {
      reservTypes = [];
      json['reservTypes'].forEach((v) {
        reservTypes?.add(ReservTypes.fromJson(v));
      });
    }
  }
  int? id;
  String? title;
  List<String>? img;
  String? interest;
  int? price;
  String? date;
  String? address;
  String? trainerName;
  String? trainerImg;
  String? trainerInfo;
  String? occasionDetail;
  String? latitude;
  String? longitude;
  bool? isLiked;
  bool? isSold;
  bool? isPrivateEvent;
  bool? hiddenCashPayment;
  int? specialForm;
  dynamic questionnaire;
  dynamic questExplanation;
  List<ReservTypes>? reservTypes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['img'] = img;
    map['interest'] = interest;
    map['price'] = price;
    map['date'] = date;
    map['address'] = address;
    map['trainerName'] = trainerName;
    map['trainerImg'] = trainerImg;
    map['trainerInfo'] = trainerInfo;
    map['occasionDetail'] = occasionDetail;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['isLiked'] = isLiked;
    map['isSold'] = isSold;
    map['isPrivateEvent'] = isPrivateEvent;
    map['hiddenCashPayment'] = hiddenCashPayment;
    map['specialForm'] = specialForm;
    map['questionnaire'] = questionnaire;
    map['questExplanation'] = questExplanation;
    if (reservTypes != null) {
      map['reservTypes'] = reservTypes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 571
/// name : "مغامر/ه هايك"
/// count : 40
/// price : 200

class ReservTypes {
  ReservTypes({
      this.id, 
      this.name, 
      this.count, 
      this.price,});

  ReservTypes.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    count = json['count'];
    price = json['price'];
  }
  int? id;
  String? name;
  int? count;
  int? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['count'] = count;
    map['price'] = price;
    return map;
  }

}