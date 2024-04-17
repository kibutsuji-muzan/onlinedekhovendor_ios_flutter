class OrderDetailModel{

  String? servicename;
  String? date;
  String? delivery_type;
  String? addressid;
 String? grandtotal;
  String? subservicename;
  String? price;
  String? unit;
  String? lable1;
  String? lable2;
  String? MRPvalue;
  String? bookingid;
  String? subserviceimg;
  String? totalprice;
  String? quantity;
  String? subserviceid;





  // "bookingid": "1042",
  // "date": "2023-07-14 09:25:00.000",
  // "addressid": "00, Matiyari, Kamta, Lucknow, Uttar Pradesh 226028, India",
  // "servicename": "Sahu Fruits",
  // "delivery_type": "Delivery",
  // "grandtotal": "85",
  // "subservicename": "Banana - Kela",
  // "price": "5",
  // "unit": "₹",
  // "lable2": "1 pc",
  // "lable1": "Qty",
  // "MRPvalue": ""


  OrderDetailModel({

     this.servicename,
      this.date,
      this.delivery_type,
      this.addressid,
      this.bookingid,
      this.grandtotal,
      this.subservicename,
      this.price,
      this.unit,
      this.lable1,
      this.lable2,
      this.MRPvalue,
      this.subserviceimg,
      this.totalprice,
      this.quantity,
      this.subserviceid


});

  OrderDetailModel.fromJson(Map<String,dynamic> json){
   bookingid = json['bookingid'];
   servicename = json['servicename'];
    date = json['date'];
    delivery_type = json['delivery_type'];
    addressid = json['addressid'];
    //tansstatus = json['tansstatus'];
    grandtotal = json['grandtotal'];
    subservicename = json['subservicename'];
    price = json['price'];
    unit = json['unit'];
    lable1 = json['lable1'];
    lable2 = json['lable2'];
    MRPvalue = json['MRPvalue'];
   subserviceimg = json['subserviceimg'];
   totalprice = json['totalprice'];
   quantity = json['quantity'];
   subserviceid = json['subserviceid'];






  }
}
