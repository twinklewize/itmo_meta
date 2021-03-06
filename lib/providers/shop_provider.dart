import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import '../entities/enventory_item.dart';
import '../entities/trade.dart';
import 'package:http/http.dart' as http;

class ShopProvider with ChangeNotifier {
  // список наименований в магазине (каталог)
  List<Trade> lots = [];

  // список вещей в shop
  List<EnventoryItem> itemsInMarket = [
    EnventoryItem(
      id: 'id0',
      name: 'Худи',
      uniqId: 'uniqId0',
      imageAsset: 'assets/images/hoodie.png',
      type: 'Одежда',
      rarity: 'Basic',
      amount: 25,
    ),
    EnventoryItem(
      id: 'id1',
      uniqId: 'uniqId1',
      name: 'Худи 2',
      imageAsset: 'assets/images/hoodie_2.png',
      type: 'Одежда',
      rarity: 'Basic',
      amount: 35,
    ),
    EnventoryItem(
      id: 'id2',
      name: 'Бластер',
      uniqId: 'uniqId2',
      imageAsset: 'assets/images/blaster.png',
      type: 'В руку',
      rarity: 'Rare',
      amount: 100,
    ),
    EnventoryItem(
      id: 'id3',
      uniqId: 'uniqId3',
      name: 'Шляпа ковбоя',
      imageAsset: 'assets/images/cowboy-hat.png',
      type: 'Шапки',
      rarity: 'Legendary',
      amount: 50,
    ),
  ];

  Future<void> getShop() async {
    final url =
        Uri.parse('http://192.168.50.158:2021/ItmoMeta/api/shop/getShop');
    final response = await http.post(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    print(response.statusCode);
    if (response.statusCode != 200) {
      print(response.statusCode);
    }
    print(response.body);
    notifyListeners();
  }

  // покупка в магазине (от приложения)
  Future<void> buy(Trade trade) async {
    final url = Uri.parse('http://192.168.50.158:2021/ItmoMeta/api/shop/buy');
    final response = await http.post(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: json.encode(
        {
          'userId': trade.userId,
          'lotId': trade.lotId,
        },
      ),
    );
    print(response.statusCode);
    if (response.statusCode != 200) {
      print(response.statusCode);
    }
    print(response.body);
    notifyListeners();
  }
}
