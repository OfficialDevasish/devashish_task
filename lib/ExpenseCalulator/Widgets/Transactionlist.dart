import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 620,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: transactions.isEmpty ? Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
          const Text('No transactions added yet', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          const Padding(padding: EdgeInsets.symmetric(vertical: 50)),
          Container(
              height: 200,
              child: Image.asset('assets/image/waiting.png', fit: BoxFit.fill,))
        ],
      ): ListView.builder(
        itemBuilder: (ctx, index){
          var DateFormat;
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          width: 2,
                          style: BorderStyle.solid
                      )
                  ),
                  padding: const EdgeInsets.all(10),
                  // child: Text(
                  //   // 'Rs ${transactions[index].amount.toStringAsFixed(2)}',
                  //   style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Text(style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18), transactions[index].title,),
                    //Text(transactions[index].date , style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10),),
                    // Text(DateFormat.yMMMMEEEEd().format(transactions[index].date) , style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10),),
                  ],
                ),
                //Padding(padding: EdgeInsets.symmetric(horizontal: 40)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  // children: <Widget>[
                  //   const SizedBox(
                  //     width: 65,
                  //   ),
                  //   IconButton(icon: const Icon(Icons.delete, color: Colors.red,), onPressed: () => deleteTx(transactions[index].id), alignment: Alignment.centerRight,),
                  // ],
                )
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}