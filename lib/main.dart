import 'package:flutter/material.dart';
import "package:intl/intl.dart";

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: "t1",
        title: "New Shoes from someone",
        amount: 69.9,
        date: DateTime.now()),
    Transaction(
        id: "t2",
        title: "Weekly Groceries",
        amount: 16.53,
        date: DateTime.now()),
  ];

  // String titleInput;
  // String amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            width: double.infinity,
            child: Card(
              child: Text("Chart!"),
              elevation: 5,
              color: Colors.deepOrange,
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Title",
                    ),
                    controller: titleController,
                    // onChanged: (val) => titleInput = val,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Amount",
                    ),
                    controller: amountController,
                    // onChanged: (val) => amountInput = val,
                  ),
                  TextButton(
                      onPressed: null,
                      child: Text(
                        "Add transaction",
                        style: TextStyle(color: Colors.purple),
                      ))
                ],
              ),
            ),
          ),
          Column(
            children: transactions.map((transaction) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        "\$ ${transaction.amount}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      ),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat("yyyy-MM-dd").format(transaction.date),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
