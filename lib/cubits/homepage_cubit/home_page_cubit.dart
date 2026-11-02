import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/product.dart';
import '../../services/allcategories.dart';
import '../../services/allproducts.dart';
import '../../services/getcategory.dart';
import 'home_page_states.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit(super.initialState);

  List<ProductModel> productsList=[];
  List <dynamic> categoriesList= [];
  String selectedCategory = "All";

 void getAllProducts() async {

   emit(HomeLoading());

   try{
    productsList = await AllProducts().getAllProducts();
     emit(HomeSuccess());
   }catch(e){
     emit(HomeFailure());
   }

 }


 void getProductsByCategory({required String categoryName}) async {

   emit(HomeLoading());

   try{
     productsList = await ProductsByCategory().getProductsByCategory(categoryName: categoryName);
     emit(HomeSuccess());
   }catch(e){
     emit(HomeFailure());
   }


 }

  void getCategories() async {

    emit(HomeLoading());
    try{
      categoriesList = await AllCategories().getAllCategories();
      emit(HomeSuccess());
    }catch(e){
      emit(HomeFailure());
    }

  }

}

