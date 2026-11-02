import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/screens/homepage.dart';

import 'package:store_app/screens/updateproduct.dart';

import 'cubits/homepage_cubit/home_page_cubit.dart';
import 'cubits/homepage_cubit/home_page_states.dart';
import 'cubits/upadatepage_cubit/update_page_cubit.dart';
import 'cubits/upadatepage_cubit/update_page_states.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>HomeCubit(HomeInitial())),
        BlocProvider(create: (context)=>UpdateCubit(UpdateInitial())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomePage.id:(context)=>HomePage(),
          UpdateProduct.id: (context)=> UpdateProduct(),
        },
        initialRoute: HomePage.id,
      ),
    );
  }


  }

