import 'package:flutter/material.dart';
import 'package:get/get.dart';
class goldapp extends StatefulWidget {
  goldapp({super.key});
  @override
  State<goldapp> createState() => _goldappState();
}
class _goldappState extends State<goldapp> {
  double res=0.0;
  double goldPrice=0.0;
  double totalTolaPrice=0.0;
  double totalGramPrice=0.0;
  double totalRatiPrice=0.0;
  double totalPointPrice=0.0;
  TextEditingController goldPriceController=TextEditingController();
  TextEditingController tolaQuantityController=TextEditingController();
  TextEditingController gramQuantityController=TextEditingController();
  TextEditingController ratiQuantityController=TextEditingController();
  TextEditingController pointQuantityController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton(backgroundColor:Colors.purpleAccent,
              child:Icon(Icons.add),onPressed: ( ) {
            if(goldPriceController.text=='') {
              Get.snackbar("Error", "Gold Price must be filled");
            }
            else{
              if(tolaQuantityController.text=='') {
                tolaQuantityController.text = '0';
              } if(gramQuantityController.text=='') {
                gramQuantityController.text = '0';
              } if(ratiQuantityController.text=='') {
                ratiQuantityController.text = '0';
              } if(pointQuantityController.text=='') {
                pointQuantityController.text = '0';
              }

              double goldPrice=double.parse(goldPriceController.text);
              double tolaQuantity=double.parse(tolaQuantityController.text);
              double grams=double.parse(gramQuantityController.text);
              double rati=double.parse(ratiQuantityController.text);
              double points=double.parse(pointQuantityController.text);
              //----- find RS. of 1 gram----
              double pricePerGram=goldPrice/12;

              //---find total price of grams---
              totalGramPrice=pricePerGram*grams;
              totalTolaPrice=goldPrice*tolaQuantity;
              // -----to find per rati-------
              double priceperRati=goldPrice/96;
              totalRatiPrice=priceperRati*double.parse(ratiQuantityController.text);
              //-----to find per point----
              double pricePerPoint=goldPrice/960;
              totalPointPrice=priceperRati*double.parse(pointQuantityController.text);
              res=(goldPrice*tolaQuantity)+totalGramPrice+totalRatiPrice;
              setState(() {
              },
              );
            }
          }
          ),
          appBar: AppBar(title:Text('Goldapp',),backgroundColor: Colors.purple,
            centerTitle: true,),
          body: Padding(
              padding:  EdgeInsets.only(left:90 , top:40 ,right:90 ,bottom: 20,),
              child: Column(   //why we use pubspet yml in android studio using flutter
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.purpleAccent,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: goldPriceController,
                        decoration: InputDecoration(
                            hintText: 'Enter Total price'
                        ),
                      ),
                    ),
                    SizedBox(height:20,),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.purpleAccent,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: tolaQuantityController,
                            decoration: InputDecoration(
                                hintText: 'Enter Tola Quantity'))),
                    SizedBox(height:20,),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.purpleAccent,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: gramQuantityController,
                            decoration: InputDecoration(
                                hintText: 'Enter Gram Quantity'))),
                    SizedBox(height:20,),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.purpleAccent,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: ratiQuantityController,
                            decoration: InputDecoration(
                                hintText: 'Enter Ratti Quantity'))),
                    SizedBox(height:20,),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.purpleAccent,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: pointQuantityController,
                            decoration: InputDecoration(
                                hintText: 'Enter Point Quantity'))),
                    SizedBox(height: 10,),
                    Column(
                      children: [
                        SizedBox(height: 10,width: 5,),
                        Text('Total price=$res'),
                        SizedBox(height: 10,width: 5,),
                        Text('Tola Price=$totalTolaPrice'),
                        SizedBox(height: 10,width:5),
                        Text('Gram Price=$totalGramPrice'),
                        SizedBox(height: 10,width:5),
                        Text('Rati Price=$totalRatiPrice'),
                        SizedBox(height: 10,width:5),
                        Text('Point Price=$totalPointPrice'),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ]
              )
          ),
        )
    );
  }
}