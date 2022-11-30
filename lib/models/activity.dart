class Activity {
  String id;
  String activityName;
  String activityType;
  String income;
  String imageUrl;

  Activity({
    required this.id,
    required this.activityName,
    required this.activityType,
    required this.income,
    required this.imageUrl,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'],
      activityName: json['activity_name'],
      activityType: json['activity_type'],
      income: json['income'],
      imageUrl: json['image_url'],
    );
  }
}
