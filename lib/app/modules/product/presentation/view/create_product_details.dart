import 'package:comparotto/app/modules/core/extensions/app_theme.dart';
import 'package:comparotto/app/modules/core/extensions/context_extension.dart';
import 'package:comparotto/app/modules/core/res/app_image_assets.dart';
import 'package:comparotto/app/modules/core/validator/data_input_formatter.dart';
import 'package:comparotto/app/modules/core/validator/name_input_formatter.dart';
import 'package:comparotto/app/modules/core/validator/unity_quantity_input_formatter.dart';
import 'package:comparotto/app/modules/core/validator/weight_quantity_input_formatter.dart';
import 'package:comparotto/app/modules/core/widgets/checkbox_label.dart';
import 'package:comparotto/app/modules/core/widgets/standard_app_bar.dart';
import 'package:comparotto/app/modules/core/widgets/standard_button.dart';
import 'package:comparotto/app/modules/core/widgets/stardard_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/validator/currency_input_formatter.dart';
import '../cubit/product_cubit.dart';

class CreateProductDetails extends StatefulWidget {
  static const String route = '/create-product-details';
  const CreateProductDetails({super.key});

  @override
  State<CreateProductDetails> createState() => _CreateProductDetailsState();
}

class _CreateProductDetailsState extends State<CreateProductDetails> {
  late ProductCubit productCubit;
  @override
  void initState() {
    productCubit = BlocProvider.of<ProductCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StandardAppBar(
        title: 'Detalhes do produto',
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selecione a unidade de medida',
                      style: context.theme.textTheme.mediumBlackTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          UnitMeasurementButton(
                            title: 'UND',
                            selected: productCubit.measurementType ==
                                UnitMeasurementTypes.und,
                            onPressed: () => productCubit
                                .setMeasurementType(UnitMeasurementTypes.und),
                            description:
                                '(produtos inteiros ex:um fardo ou uma latinha) ',
                          ),
                          UnitMeasurementButton(
                            title: 'KG',
                            selected: productCubit.measurementType ==
                                UnitMeasurementTypes.kg,
                            onPressed: () => productCubit
                                .setMeasurementType(UnitMeasurementTypes.kg),
                            description:
                                '(produtos a fracionar ex:pacote de 5kg) ',
                          ),
                        ],
                      ),
                    ),
                    StandardTextField(
                      showSuffixIcon: true,
                      suffixIconPath: AppIconAssets.barcodeIcon,
                      onChanged: (value) => productCubit.fetch(),
                      padding: const EdgeInsets.only(top: 30),
                      compoundableFormatter: productCubit.measurementType ==
                              UnitMeasurementTypes.und
                          ? UnityQuantityInputFormatter(
                              controller:
                                  productCubit.quantityEditingController,
                            )
                          : WeightQuantityInputFormatter(
                              controller:
                                  productCubit.quantityEditingController,
                            ),
                      controller: productCubit.quantityEditingController,
                    ),
                    StandardTextField(
                      showSuffixIcon: true,
                      suffixIconPath: AppIconAssets.barcodeIcon,
                      onChanged: (value) => productCubit.fetch(),
                      padding: const EdgeInsets.only(top: 30),
                      compoundableFormatter: CurrencyInputFormatter(
                          controller: productCubit.priceEditingController),
                      controller: productCubit.priceEditingController,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: CheckboxLabelClickable(
                          value: productCubit.salable,
                          label: 'Esse produto será vendido para o cliente',
                          onChanged: productCubit.setSalable),
                    )
                  ],
                ),
                StandardButton(
                  onPressed: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => const ChangeQuantityProduct(),
                  ),
                  text: 'Finalizar',
                  enabled:
                      productCubit.getButtonStatus(CreateProductDetails.route),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class ChangeQuantityProduct extends StatefulWidget {
  const ChangeQuantityProduct({
    super.key,
  });

  @override
  State<ChangeQuantityProduct> createState() => _ChangeQuantityProductState();
}

class _ChangeQuantityProductState extends State<ChangeQuantityProduct> {
  late ProductCubit productCubit;
  @override
  void initState() {
    productCubit = BlocProvider.of<ProductCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 40,
                  height: 5,
                ),
                Center(
                  child: Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.greyFFE4E4E4,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.close,
                    color: context.theme.colorScheme.greyFF5C6164,
                  ),
                ),
              ],
            ),
            Text('Quantidade de produtos',
                style: context.theme.textTheme.large24BlackTextStyle),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Text('quantos produtos iniciais',
                  style: context.theme.textTheme.mediumGreyTextStyle),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.teal,
                  ),
                  child: IconButton(
                    onPressed: () => productCubit.decInitialQuantity(),
                    icon: const Icon(
                      Icons.remove,
                      size: 50,
                    ),
                    color: Colors.white,
                  ),
                ),
                Text(productCubit.initialQuantity.toInt().toString(),
                    style: context.theme.textTheme.large24BlackTextStyle),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromARGB(255, 37, 151, 251),
                  ),
                  child: IconButton(
                    onPressed: () => productCubit.incInitialQuantity(),
                    icon: const Icon(
                      Icons.add,
                      size: 50,
                    ),
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                )
              ],
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 40, bottom: 30, left: 30, right: 30),
              child: StandardButton(
                text: 'Finalizar',
              ),
            )
          ],
        );
      },
    );
  }
}

class UnitMeasurementButton extends StatelessWidget {
  const UnitMeasurementButton({
    super.key,
    required this.title,
    required this.selected,
    this.onPressed,
    required this.description,
  });
  final String title;
  final String description;
  final bool selected;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 160,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: ElevatedButton(
            style: ButtonStyle(
                surfaceTintColor: const MaterialStatePropertyAll(Colors.white),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
                elevation: const MaterialStatePropertyAll(10),
                backgroundColor: MaterialStatePropertyAll(selected
                    ? const Color.fromARGB(255, 37, 151, 251)
                    : const Color.fromARGB(255, 255, 255, 255))),
            onPressed: onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: !selected
                        ? context.theme.textTheme.large24greyBoldTextStyle
                        : context.theme.textTheme.large24WhiteTextStyle,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    description,
                    style: !selected
                        ? context.theme.textTheme.smallGreyTextStyle
                        : context.theme.textTheme.smallWhiteTextStyle,
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
