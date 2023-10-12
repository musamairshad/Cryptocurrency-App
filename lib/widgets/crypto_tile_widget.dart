import 'package:flutter/material.dart';

class CryptoTileWidget extends StatelessWidget {
  final String name;
  final String symbol;
  final String rank;
  const CryptoTileWidget(
      {super.key,
      required this.name,
      required this.symbol,
      required this.rank});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(symbol),
        ),
        title: Text(name),
        subtitle: Text(symbol),
        trailing: Text(rank),
      ),
    );
  }
}
