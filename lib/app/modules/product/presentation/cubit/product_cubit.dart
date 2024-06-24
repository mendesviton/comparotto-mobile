import 'package:bloc/bloc.dart';
import 'package:comparotto/app/modules/core/validator/data_input_formatter.dart';
import 'package:comparotto/app/modules/core/validator/unity_quantity_input_formatter.dart';
import 'package:comparotto/app/modules/core/validator/weight_quantity_input_formatter.dart';
import 'package:comparotto/app/modules/product/presentation/view/create_product_details.dart';
import 'package:comparotto/app/modules/product/presentation/view/create_product_registration_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/validator/name_input_formatter.dart';

part 'product_state.dart';

enum UnitMeasurementTypes { und, kg }

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  UnitMeasurementTypes measurementType = UnitMeasurementTypes.und;
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController quantityEditingController = TextEditingController();
  TextEditingController priceEditingController = TextEditingController();
  bool salable = false;
  double initialQuantity = 0;
  TextEditingController dateEditingController = TextEditingController(
    text: DateFormat('dd/MM/yyyy').format(
      DateTime.now(),
    ),
  );
  String barCode = '';

  incInitialQuantity() {
    initialQuantity++;
    fetch();
  }

  decInitialQuantity() {
    initialQuantity--;
    fetch();
  }

  clearFields() {
    nameEditingController.clear();
    quantityEditingController.clear();
    priceEditingController.clear();
    initialQuantity = 0;
    salable = false;
    barCode = '';
    dateEditingController.text = DateFormat('dd/MM/yyyy').format(
      DateTime.now(),
    );
  }

  setSalable(bool value) {
    salable = value;
    fetch();
  }

  setMeasurementType(UnitMeasurementTypes measurementTypeParam) {
    measurementType = measurementTypeParam;
    quantityEditingController.clear();
    priceEditingController.clear();
    fetch();
  }

  fetch() {
    emit(const Fetching());
    emit(const Fetched());
  }

  Future<void> createProduct() async {}
  bool getButtonStatus(String route) {
    switch (route) {
      case CreateProductRegistrationData.route:
        return NameInputFormatter.validateName(nameEditingController.text) ==
                null &&
            DataInputFormatter.validateDate(dateEditingController.text) == null;
      case CreateProductDetails.route:
        return priceEditingController.text.isNotEmpty &&
            (measurementType == UnitMeasurementTypes.und
                ? UnityQuantityInputFormatter.validateNumber(
                      quantityEditingController.text,
                    ) ==
                    null
                : WeightQuantityInputFormatter.validateQuantity(
                      quantityEditingController.text,
                    ) ==
                    null);

      default:
        return false;
    }
  }
}
