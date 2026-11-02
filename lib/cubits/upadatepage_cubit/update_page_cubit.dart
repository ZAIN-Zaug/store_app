import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/upadatepage_cubit/update_page_states.dart';

import '../../models/product.dart';
import '../../services/updateproductservice.dart';

class UpdateCubit extends Cubit<UpdateStates> {
  UpdateCubit(super.initialState);

  Future<void> updateProductMethod({
    required ProductModel product,
    productName,
    price,
    description,
    image,
  }) async {

    emit(UpdateLoading());

    try {

      await UpdateProductService().updateProductServiceTo(
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price : price!,
        description: description == null ? product.description : description!,
        image: image == null ? product.image : image!,
        category: product.category,
      );
      emit(UpdateSuccess());

    } on Exception catch (e) {

      emit(UpdateFailure());

    }

  }

}
