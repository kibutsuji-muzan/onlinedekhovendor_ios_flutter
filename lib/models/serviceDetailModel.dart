class ServiceDetailModel{
  String? serviceid;
  String? status;
  String? vendorid;



  ServiceDetailModel(
  this.serviceid,
  this.status,
  this.vendorid,
      );


  ServiceDetailModel.fromJson(Map<String,dynamic> json){
  serviceid = json['serviceid'];
  status = json['status'];
  vendorid = json['vendorid'];




  }

}