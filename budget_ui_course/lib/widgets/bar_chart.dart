// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  const BarChart(this.expenses);

  final List<double> expenses;

  @override
  Widget build(BuildContext context) {
    double mostExpense = 0;
    // ignore: avoid_function_literals_in_foreach_calls
    expenses.forEach((double price){
      if(price > mostExpense){
        mostExpense = price;
      }
    });
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
         const Text('Weekly Spending',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2
          ),
          ),
          const SizedBox(height: 5.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: (){}, 
                icon:const Icon(Icons.arrow_back),
                iconSize: 30.0,
              ),
              const Text('Nov 10, 2019 - Nov 16, 2019',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2
              ),),
              IconButton(
                onPressed: (){}, 
                icon:const Icon(Icons.arrow_forward),
                iconSize: 30.0,
              ),
            ],
          ),
          const SizedBox(height: 30.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Bar(
                label:'Su',
                amountSpent: expenses[0],
                mostExpenses:mostExpense
              ),
              Bar(
                label:'Tu',
                amountSpent: expenses[2],
                mostExpenses:mostExpense
              ),
              Bar(
                label:'We',
                amountSpent: expenses[3],
                mostExpenses:mostExpense
              ),
              Bar(
                label:'Th',
                amountSpent: expenses[4],
                mostExpenses:mostExpense
              ),
              Bar(
                label:'Fr',
                amountSpent: expenses[5],
                mostExpenses:mostExpense
              ),
              Bar(
                label:'Sa',
                amountSpent: expenses[6],
                mostExpenses:mostExpense
              )

            ],
          )
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {

  final String label;
  final double amountSpent;
  final double mostExpenses;

  final double _maxBarHeight = 150.0;
  const Bar({
    Key? key,
    required this.label,
    required this.amountSpent,
    required this.mostExpenses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpenses * _maxBarHeight;
    return Column(
      children: [
        Text('\$${amountSpent.toStringAsFixed(2)}',
        style:const TextStyle(
          fontWeight: FontWeight.w600
        ),),
        const SizedBox(height: 6.0,),
        Container(
          height: barHeight,
          width: 18.0,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6.0)
          )
        ),
        const SizedBox(height: 6.0,),
        Text(label,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600
        ),)
      ],
    );
  }
}
