
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/screens/updateproduct.dart';

class CustomCard extends StatelessWidget {


   const CustomCard({
    required this.product,
  });

   final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context,UpdateProduct.id,arguments: product);
      },
      child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 30,
                        color: Colors.grey.shade100,
                        spreadRadius: 0,
                        offset: Offset(10,10)

                    )
                  ]
              ),

              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(6)
                ) ,
                elevation: 20,
                shadowColor: Colors.grey,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Text(product.title.substring(0,10),style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 17
                      ),),
                      SizedBox(
                        height: 3,
                      ),
                      Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(r"$" "${product.price}",style:
                          TextStyle(fontSize: 17),),
                          Icon(Icons.favorite,color: Colors.red,
                            size: 25,)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -60,
              right: 22,
                height: 100,

      child: Image.network(product.image,
      width: 100,),
      ),
        ]
            ),
    );


  }
}