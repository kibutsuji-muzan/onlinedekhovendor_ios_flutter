
class OrderInitiatedModel{
  String? bookingid;
  String? date;
  String? deliveryboy_name;
  String? deliveryboy_mobileno;
  String? deliverystatus;
  String? servicename;
   String? user_name;
  String? user_mobileno;
  String? delivery_type;

  OrderInitiatedModel({
      this.bookingid,
      this.date,
      this.deliveryboy_name,
      this.deliveryboy_mobileno,
      this.deliverystatus,
      this.servicename,
      this.user_name,
      this.user_mobileno,
      this.delivery_type,


  });


  OrderInitiatedModel.fromJson(Map<String,dynamic>json){
bookingid = json['bookingid'];
date=json['date'];
deliveryboy_name=json['deliveryboy_name'];
deliveryboy_mobileno=json['deliveryboy_mobileno'];
deliverystatus=json['deliverystatus'];
servicename=json['servicename'];
user_name=json['user_name'];
user_mobileno=json['user_mobileno'];
delivery_type=json['delivery_type'];
 }
}