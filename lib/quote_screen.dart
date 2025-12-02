import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'quote_provider.dart';

class quoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<quoteProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Random Quotes'),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),

      body: provider.getQuote().isEmpty
          ? Center(child: Text("Press the button add a quote"))
          : ListView.builder(
              itemCount: provider.getQuote().length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(provider.getauther()[index]),
                  subtitle: Text(provider.getQuote()[index]),
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        child: Text('New quote'),
        onPressed: () {
          context.read<quoteProvider>().fetchQuote();
        },
      ),
    );
  }
}