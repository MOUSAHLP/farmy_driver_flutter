class StatisticsModel {
  Map<String, dynamic>? monthData;
  Map<String, dynamic>? weekData;

  StatisticsModel({this.monthData, this.weekData});

  StatisticsModel.fromJson(Map<String, dynamic> json) {
    monthData = json['month_data'];
    weekData = json['week_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['month_data'] = monthData;
    data['week_data'] = weekData;
    return data;
  }
}
