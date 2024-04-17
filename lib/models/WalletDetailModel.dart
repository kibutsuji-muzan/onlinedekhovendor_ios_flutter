class WalletDetaiLModel{
  String? tranction_id;
  String? createddate;
  String? reference;
  String? amount;
  String? totalamount;
  String? status;
  String? walletbalance;


  WalletDetaiLModel(this.tranction_id, this.createddate, this.reference,
      this.amount, this.totalamount, this.status,this.walletbalance);

  WalletDetaiLModel.fromJson(Map<String,dynamic> json){
    tranction_id = json['tranction_id'];
    createddate = json['createddate'];
    reference = json['reference'];
    amount = json['amount'];
    totalamount = json['totalamount'];
    status = json['status'];
    walletbalance = json['walletbalance'];
  }

}
