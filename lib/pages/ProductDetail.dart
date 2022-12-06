
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopnoithat/Screens/productDetailScreens/Detail.dart';
import 'package:shopnoithat/model/product.dart';

 class ProductDetail extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        child: Column(
          children: [
           Detail()
          ],
        ),
      ),
      // body: FutureBuilder<Product?>(
      //   future: readProduct(),
      //   builder: (context, snapshot) {
      //     if(snapshot.hasError){
      //       return Text('Something went wrong!, ${snapshot.error}');
      //     }else if(snapshot.hasData) {
      //       final products = snapshot.data!;
      //       return products == null ? Center(child: Text("No product")) : buildProduct(products);
      //     }else{
      //       return Center(child:CircularProgressIndicator());
      //     }
      //   }),
      );
  }
  Widget buildProduct (Product product) => Container(
    margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
    child: Row(
      children: [
        Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
            width: 165,
            height: 160,
            // color: Colors.tealAccent[400],
            decoration: const BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget> [
                Stack(
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                child: InkWell(
                                    onTap: () {
                                      // Navigator.pushNamed(context, 'productDetail');
                                    },
                                    child:Image.network('${product.img}')),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            )
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${product.name}', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                    Container(
                      // padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Icon(Icons.favorite),
                          Text("4.5 | "),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                                  child:Text("8,374 Sold"),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text('${product.price}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        height: 30,
                        width: 105,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              color: Colors.black,
                              onPressed: () {},
                              icon: const Icon(
                                CupertinoIcons.minus,
                                size: 15,
                              ),
                            ),
                            Text("1"),
                            IconButton(
                              color: Colors.black,
                              onPressed: () {},
                              icon: const Icon(
                                CupertinoIcons.add,
                                size: 15,
                              ),
                            ),
                          ],
                        )

                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
  //
  // Future<Product?> readProduct() async{
  //   final docProduct = FirebaseFirestore.instance.collection('products').doc('WUrBrSpZ785VccgUecfz');
  //   final snapShot = await docProduct.get();
  //   if(snapShot.exists) {
  //     return Product.fromJson(snapShot.data()!);
  //   }
  // }

 }