import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cryptocurrency_app/api/api_key.dart';
import 'package:cryptocurrency_app/models/crypto_data_model.dart';
import 'package:cryptocurrency_app/widgets/crypto_tile_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    fetchCurrencies();
  }

  List<Data> currenciesData = [];
  Future<List<Data>> fetchCurrencies() async {
    final url =
        Uri.https("pro-api.coinmarketcap.com", "/v1/cryptocurrency/map");
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
            icon: const FaIcon(FontAwesomeIcons.gift),
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
