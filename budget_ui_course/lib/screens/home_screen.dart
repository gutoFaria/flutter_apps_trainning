import 'package:budget_ui_course/models/category_model.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';
import '../helpers/color_helper.dart';
import '../models/expense_model.dart';
import '../widgets/bar_chart.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    _buildCategory(Category category, double totalAmountSpent) {
      return GestureDetector(
        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>CategoryScreen(category: category))),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(20.0),
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, offset: Offset(0, 2), blurRadius: 6.0)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                
                Text(category.name,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),),
                Text(
                    '\$${(category.maxAmount - totalAmountSpent).toStringAsFixed(2)} / \$${category.maxAmount}',
                     style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600
                ),)
              ]),
              const SizedBox(height: 10.0,),
              LayoutBuilder(
                builder: ((context, constraints) {
                  final double maxBarWidth = constraints.maxWidth;
                  final double percent = (category.maxAmount - totalAmountSpent)/category.maxAmount;
                  double barWidth = percent * maxBarWidth;
      
                  if(barWidth < 0 ){
                    barWidth = 0;
                  }
                   return Stack(
                    children: [
                      Container(
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(15.0)
                        ),
                      ),
                      Container(
                        height: 20.0,
                        width: barWidth,
                         decoration: BoxDecoration(
                          color: getColor(context,percent),
                          borderRadius: BorderRadius.circular(15.0)
                        ),
                      )
                    ],
                  );
                }),
               
                
              ),
          
          ],
          ),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            forceElevated: true,
            floating: true,
            //pinned: true,
            expandedHeight: 100.0,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
              iconSize: 30.0,
            ),
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Simple Budget'),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
                iconSize: 30.0,
              )
            ],
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            if (index == 0) {
              return Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(0, 2),
                          blurRadius: 6.0)
                    ],
                    borderRadius: BorderRadius.circular(10.0)),
                child: BarChart(weeklySpending),
              );
            } else {
              final Category category = categories[index - 1];
              double totalAmountSpent = 0;
              for (var expense in category.expenses) {
                totalAmountSpent += expense.cost;
              }
              return _buildCategory(category, totalAmountSpent);
            }
          }, childCount: 1 + categories.length))
        ],
      ),
    );
  }
}
