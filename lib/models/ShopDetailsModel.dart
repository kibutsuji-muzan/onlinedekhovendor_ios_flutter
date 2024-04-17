class ProductDetailModel{
  String? subservicename;
  String? servicename;
  String? lable1;
  String? subserviceimg;
  String? price;
  String? unit;
  String? lable2;
  String? MRPhead;
  String? discountval;
  String? market;
  String? note;
  String? category;
  String? minimum_quantity;
  String? maximam_quantity;
  String? status;
  String? subserviceid;
  String? day;
  String? vendorid;
  String? shop_mob_no;


  ProductDetailModel(
      this.subservicename,
      this.servicename,
      this.lable1,
      this.subserviceimg,
      this.price,
      this.unit,
      this.lable2,
      this.MRPhead,
      this.discountval,
      this.note,
      this.category,
      this.minimum_quantity,
      this.maximam_quantity,
      this.status,
      this.subserviceid,
      this.day,
      this.vendorid,
      this.shop_mob_no,
      this.market);

  ProductDetailModel.fromJson(Map<String,dynamic> json){
    subservicename = json['subservicename'];
    servicename = json['servicename'];
    price = json['price'];
    unit = json['unit'];
    lable1=json['lable1'];
    subserviceimg = json['subserviceimg'];
    lable2 = json['lable2'];
    MRPhead = json['MRPhead'];
    discountval = json['discountval'];
    note=json['note'];
    category = json['category'];
    minimum_quantity = json['minimum_quantity'];
    maximam_quantity = json['maximam_quantity'];
    status = json['status'];
    subserviceid=json['subserviceid'];
    day = json['day'];
    vendorid = json['vendorid'];
    shop_mob_no = json['shop_mob_no'];
    market = json['market'];




  }

}
