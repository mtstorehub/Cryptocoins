import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:cryptocoins/service/service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List> coins;
  @override
  void initState() {
    super.initState();
    coins = getAllCoins();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cryptocoins')),
      body: Center(
        child: FutureBuilder(
          future: coins,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return RefreshIndicator(
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    final formatCurrency = NumberFormat.simpleCurrency();
                    var val = snapshot.data[index];
                    return Card(
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: ListTile(
                                leading: FadeInImage(
                                  placeholder:
                                      AssetImage('assets/icon/placeholder.png'),
                                  image: AssetImage(
                                      'assets/icon/${val.symbol.toLowerCase()}.png'),
                                  width: 65.0,
                                  height: 65.0,
                                ),
                                title: Text('${val.name}'),
                                subtitle: Text('${val.symbol}'),
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                      '${formatCurrency.format(double.parse(val.price))}'),
                                  Container(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      val.change.toString(),
                                      style: TextStyle(
                                          color: val.change.isNegative
                                              ? Colors.red
                                              : Colors.green),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                onRefresh: _handleRefresh,
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future<List> _handleRefresh() {
    setState(() {
      coins = getAllCoins();
    });
    return coins;
  }
}
