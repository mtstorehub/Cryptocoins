import 'dart:convert';

Coin coinFromJson(String str) {
  final jsonData = json.decode(str);
  return Coin.fromJson(jsonData);
}

class Coin {
  Data data;
  Coin({this.data});
  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(data: Data.fromJson(json['data']));
  }
}

class Data {
  List<CoinElement> coins;
  Data({this.coins});
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      coins: List<CoinElement>.from(
        json['coins'].map((x) => CoinElement.fromJson(x)),
      ),
    );
  }
}

class CoinElement {
  String symbol;
  String name;
  String price;
  double change;
  CoinElement({this.symbol, this.name, this.price, this.change});
  factory CoinElement.fromJson(Map<String, dynamic> json) {
    return CoinElement(
      symbol: json['symbol'],
      name: json['name'],
      price: json['price'],
      change: json['change'].toDouble(),
    );
  }
}
