import 'package:flutter/material.dart';

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  bool isSuccessful = false;

  List options =[
    "Yes",
    "No",
    "Maybe"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Demo App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          DragTarget(
            onWillAccept: (data) {
              return true;
            },
            onAccept: ((data) {
              if(data == "Yes"){
                setState(() {
                  isSuccessful= true;
                });
              }else{
                ScaffoldMessenger.of(context).showMaterialBanner(
                  MaterialBanner(
                    content:const Center(
                      child: Text('WRONG'),
                    ),
                    actions: [
                      TextButton(
                        onPressed: (){
                          ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                        },
                        child:const Text('Try again'),
                      ),
                      
                    ],
                  )
                );
              }
            }),
            builder: (context, candidateData, rejectedData) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
                  child: isSuccessful ? 
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(30),
                    child: const Center(
                      child: Text('Flutter is Aweesome Yes'),
                    ),
                  ) 
                  : 
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(30),
                    child: const Center(
                      child: Text('Flutter is Aweesome ____'),
                  ),)
                ),
              );
            }
            ),
          const SizedBox(
            height: 30,
          ),
           Center(
             child: SizedBox(
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: options.length,
                padding: const EdgeInsets.all(20.0),
                itemBuilder: (context, index) {
                  return Container(
                     margin: const EdgeInsets.only(right: 20.0),
                    child: Draggable(
                      data: options[index],
                      feedback: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey, 
                          ),
                          color: Colors.white
                        ),
                        child: Text(options[index].toString(),
                        style:const TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.black
                        ),),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey, 
                          ),
                          color: Colors.white
                        ),
                        child: Center(child: Text(options[index].toString())),
                      )
                    ),
                  );
                },
              ),
          ),
           )
        ]
      ),
    );
  }
}