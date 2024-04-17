class PaymentDetailModel{
 String? orderid;
String? commisionamount;
String? createddate;
String? amount;
String? status;
String? tansstatus;

PaymentDetailModel({this.orderid, this.commisionamount, this.createddate,
      this.amount, this.status, this.tansstatus});

 PaymentDetailModel.fromJson(Map<String,dynamic> json){
  orderid = json['orderid'];
  commisionamount = json['commisionamount'];
  createddate = json['createddate'];
  amount = json['amount'];
  status = json['status'];
  tansstatus = json['tansstatus'];
}

}
