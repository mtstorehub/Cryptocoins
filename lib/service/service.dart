import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:cryptocoins/model/model.dart';

final String apiUrl = 'https://api.coinranking.com/v1/public/coins?limit=100';
Future<List<CoinElement>> getAllCoins() async {
  final response = await http.get(apiUrl);
  final coin = coinFromJson(response.body);
  return coin.data.coins;
}
