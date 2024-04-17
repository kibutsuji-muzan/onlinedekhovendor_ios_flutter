class TodayModel{
String? total_sales;
String? average_sales;
String? pickup_count;

TodayModel(this.total_sales, this.average_sales, this.pickup_count);

TodayModel.fromJson(Map<String,dynamic> json){
  total_sales = json['total_sales'];
  average_sales = json['average_sales'];
  pickup_count = json['pickup_count'];

}
}