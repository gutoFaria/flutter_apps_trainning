import 'package:flutter/material.dart';
import 'package:recipe/recipe.dart';
import 'package:recipe/recipe_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Recipe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: Center(
      
        child: ListView.builder(
          itemCount: Recipe.samples.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context){
                      return RecipeDetail(recipe: Recipe.samples[index]);
                    }
                  )
                );
              },
              child: buildRecipeCard(Recipe.samples[index])
              );
          })
        )
      ),
      
    );
  }

  Widget buildRecipeCard(Recipe recipe){
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(recipe.imageUrl),
            const SizedBox(height: 14.0,),
            Text(recipe.label,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              fontFamily: 'Palatino'
            ),)
          ],
        ),
      ),
    );
  }
}
