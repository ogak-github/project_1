class BankCard {
  String cardId;
  String cardLogo;
  String cardName;
  String cardNumber;

  BankCard({
    required this.cardId,
    required this.cardLogo,
    required this.cardName,
    required this.cardNumber,
  });

  factory BankCard.fromJson(Map<String, dynamic> json) {
    return BankCard(
      cardId: json['card_id'],
      cardLogo: json['card_logo'],
      cardName: json['card_name'],
      cardNumber: json['card_number'],
    );
  }
}
