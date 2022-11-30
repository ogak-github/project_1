import 'activity.dart';
import 'bank_card.dart';

class UserData {
  String id;
  String username;
  String name;
  String profileImage;
  String email;
  String phone;
  String balance;
  List<BankCard> bankCards;
  List<Activity> activities;

  UserData({
    required this.id,
    required this.username,
    required this.name,
    this.profileImage = "",
    required this.email,
    required this.phone,
    this.balance = "",
    this.bankCards = const [],
    this.activities = const [],
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    final bankCards = <BankCard>[];
    final activities = <Activity>[];

    if (json['cards'] != null) {
      json['cards'].forEach((v) {
        bankCards.add(BankCard.fromJson(v));
      });
    }

    if (json['activities'] != null) {
      json['activities'].forEach((v) {
        activities.add(Activity.fromJson(v));
      });
    }

    return UserData(
      id: json['id'] ?? '',
      username: json['username'] ?? '',
      name: json['name'] ?? '',
      profileImage: json['profile_image'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      balance: json['balance'] ?? '',
      bankCards: bankCards,
      activities: activities,
    );
  }
}
