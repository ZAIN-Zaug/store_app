import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:store_app/cubits/upadatepage_cubit/update_page_cubit.dart';
import 'package:store_app/cubits/upadatepage_cubit/update_page_states.dart';
import 'package:store_app/helper/custom_Button.dart';
import 'package:store_app/helper/custom_Textfield.dart';
import 'package:store_app/helper/show_snack_bar.dart';
import 'package:store_app/models/product.dart';



class UpdateProduct extends StatelessWidget {

  static const String id = 'UpdateProduct';
  String? price;

  String? productName;

  String? description;

  String? image;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return BlocListener<UpdateCubit,UpdateStates>(

      listener: (BuildContext context, state) {
        if(state is UpdateFailure) {
          isLoading=false;
          showSnackBar(context,  " Something Went Wrong ");
        }else if( state is UpdateLoading)
          {
            isLoading=true;
          }
        else if( state is UpdateSuccess)
          {
            isLoading=false;
            showSnackBar(context,  " the Update Complete  ");
          }

      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text("Update Product"),
            elevation: 0,
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  CustomTextField(
                    hintText: "product Name",
                    onChanged: (data) {
                      productName = data;
                    },
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    hintText: "price",
                    onChanged: (data) {
                      price = data;
                    },
                    type: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    hintText: "description",
                    onChanged: (data) {
                      description = data;
                    },
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    hintText: "image",
                    onChanged: (data) {
                      image = data;
                    },
                  ),
                  SizedBox(height: 60),
                  CustomButton(
                    title: "Update",
                    OnTap: ()  {
                      BlocProvider.of<UpdateCubit>(context).updateProductMethod(product: product);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
