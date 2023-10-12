import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cryptocurrency_app/api/api_key.dart';
import 'package:cryptocurrency_app/models/crypto_data_model.dart';
import 'package:cryptocurrency_app/widgets/crypto_tile_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    fetchCurrencies();
  }

  List<Data> currenciesData = [];
  final queryParameters = {
    "limit": "50",
    "sort": "cmc_rank",
  };
  Future<List<Data>> fetchCurrencies() async {
    final url = Uri.https(
      "pro-api.coinmarketcap.com",
      "/v1/cryptocurrency/map",
      queryParameters,
    );
    final response = await http.get(url, headers: {
      "X-CMC_PRO_API_KEY": apiKey,
    });
    final resData = json.decode(response.body.toString());
    for (Map<String, dynamic> i in resData["data"]) {
      currenciesData.add(Data.fromJson(i));
    }
    return currenciesData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text("Explore"),
        centerTitle: true,
        elevation: 0.5,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.circleInfo),
          ),
        ],
      ),
      body: FutureBuilder(
          future: fetchCurrencies(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (ctx, index) {
                  return CryptoTileWidget(
                    name: snapshot.data![index].name.toString(),
                    symbol: snapshot.data![index].symbol.toString(),
                    rank: snapshot.data![index].rank.toString(),
                  );
                });
          }),
    );
  }
}
