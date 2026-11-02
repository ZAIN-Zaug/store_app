import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product.dart';

import 'package:store_app/widget/custom_card.dart';

import '../cubits/homepage_cubit/home_page_cubit.dart';
import '../cubits/homepage_cubit/home_page_states.dart';
import '../helper/show_snack_bar.dart';

class HomePage extends StatelessWidget {
  static String id = 'HomePage';
  // This variable holds the current request (All or Category specific)



  @override
  Widget build(BuildContext context) {

     if (BlocProvider.of<HomeCubit>(context).state is HomeInitial) {
       BlocProvider.of<HomeCubit>(context).getCategories();
       BlocProvider.of<HomeCubit>(context).getAllProducts();
     }

    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (BuildContext context, HomeStates state) {
        if( state is HomeFailure){
          showSnackBar(context, "Something went wrong");
        }

      },
      builder: (BuildContext context, HomeStates state) {
        List <dynamic>  categories = ["All", ...BlocProvider.of<HomeCubit>(context).categoriesList];
        List<ProductModel> productsFuture = BlocProvider.of<HomeCubit>(context).productsList;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart, color: Colors.black, size: 30),
              ),
            ],
            title: Center(child: Text("New trend")),
          ),
          body: ModalProgressHUD(
            inAsyncCall: state is HomeLoading,
            child: Stack(
              children: [
                //1. The Product Grid (Placed first so it is at the bottom of the Stack)
                Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        // Add extra top padding so the first row starts below the categories
                        padding: const EdgeInsets.only(
                          top: 130,
                          left: 16,
                          right: 16,
                          bottom: 20,
                        ),
                        //clipBehavior: Clip.none,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.4,
                              mainAxisSpacing: 100,
                              crossAxisSpacing: 10,
                            ),
                        itemCount: productsFuture.length,
                        itemBuilder: (context, index) {
                          return CustomCard(product: productsFuture[index]);
                        },
                      ),
                    ),
                  ],
                ),

                // 2. Horizontal Category List (Placed last so it is "On Top" of the grid)
                Positioned(

                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors
                        .white, // Solid background to hide products passing under
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    height: 60,
                    child:
                    ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                    return GestureDetector(
                    onTap: () async {
                    BlocProvider.of<HomeCubit>(context).selectedCategory = categories[index];
                    if (BlocProvider.of<HomeCubit>(context).selectedCategory == "All") {
                    BlocProvider.of<HomeCubit>(
                    context,
                    ).getAllProducts();
                    } else {
                    BlocProvider.of<HomeCubit>(
                    context,
                    ).getProductsByCategory(
                    categoryName: BlocProvider.of<HomeCubit>(context).selectedCategory,
                    );
                    }
                    },
                    child: Container(
                    margin: const EdgeInsets.symmetric(
                    horizontal: 8,
                    ),
                    padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    ),
                    decoration: BoxDecoration(
                    color: BlocProvider.of<HomeCubit>(context).selectedCategory == categories[index]
                    ? Colors.blue
              : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                    categories[index].toString().toUpperCase(),
                    style: TextStyle(
                    color:BlocProvider.of<HomeCubit>(context).selectedCategory == categories[index]
                    ? Colors.white
              : Colors.black,
                    fontWeight: FontWeight.bold,
                    ),
                    ),
                    ),
                    );
                    },
                    ),

                    // Keep empty while loading to avoid jumps

                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:store_app/models/product.dart';
// import 'package:store_app/services/allproducts.dart';
// import 'package:store_app/widget/custom_card.dart';
//
// class HomePage extends StatefulWidget {
//    const HomePage({super.key});
//    static String id='HomePage';
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   late Future<List<ProductModel>> productsFuture;
//   String selectedCategory = "All";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//          elevation: 0,
//         backgroundColor: Colors.white ,
//          actions: [
//            IconButton(onPressed: (){},
//                icon:Icon(
//                  Icons.shopping_cart,color: Colors.black,
//                  size: 30,)
//            )
//          ],
//         title:
//         Center(
//             child: Text("New trend")
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 60,left: 16,right: 16),
//           child: FutureBuilder<List<ProductModel>>(
//             future:AllProducts().getAllProducts(),
//             builder: (context,snapshot){
//              if(snapshot.hasError)
//                return Center(child: Text("Something went wrong"));
//              else if(snapshot.hasData){
//               List<ProductModel> products =snapshot.data!;
//                return GridView.builder(
//                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
//                        crossAxisCount: 2,
//                        crossAxisSpacing: 10,
//                         mainAxisSpacing: 100,
//                         childAspectRatio: 1.3
//                    ),
//                     clipBehavior: Clip.none,
//                    itemCount: products.length ,
//                    itemBuilder: (context,index){
//                      return CustomCard(product: products[index]);
//                    }
//                    );
//              }
//              else {
//                return CircularProgressIndicator();
//              }
//             }
//           )
//
//
//
//
//         ),
//             ),
//
//     );
//
//   }
// }
//
