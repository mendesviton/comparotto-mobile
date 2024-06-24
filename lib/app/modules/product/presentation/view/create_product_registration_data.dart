import 'package:comparotto/app/modules/core/extensions/app_theme.dart';
import 'package:comparotto/app/modules/core/extensions/context_extension.dart';
import 'package:comparotto/app/modules/core/res/app_image_assets.dart';
import 'package:comparotto/app/modules/core/validator/data_input_formatter.dart';
import 'package:comparotto/app/modules/core/validator/name_product_input_formatter.dart';
import 'package:comparotto/app/modules/core/widgets/standard_app_bar.dart';
import 'package:comparotto/app/modules/core/widgets/standard_button.dart';
import 'package:comparotto/app/modules/core/widgets/stardard_text_field.dart';
import 'package:comparotto/app/modules/product/presentation/cubit/product_cubit.dart';
import 'package:comparotto/app/modules/product/presentation/view/create_product_details.dart';
import 'package:comparotto/app/modules/product/presentation/widgets/image_picker_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CreateProductRegistrationData extends StatefulWidget {
  static const String route = '/create-product-registration-data';
  const CreateProductRegistrationData({super.key});

  @override
  State<CreateProductRegistrationData> createState() =>
      _CreateProductRegistrationDataState();
}

class _CreateProductRegistrationDataState
    extends State<CreateProductRegistrationData> {
  late ProductCubit productCubit;
  @override
  void initState() {
    productCubit = BlocProvider.of<ProductCubit>(context);
    super.initState();
  }

  String _scanBarcode = 'Unknown';

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  void dispose() {
    productCubit.clearFields();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StandardAppBar(
        title: 'Dados cadastrais',
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: SizedBox(
                            height: 150,
                            width: 150,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  surfaceTintColor:
                                      const MaterialStatePropertyAll(
                                          Colors.white),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                  elevation: const MaterialStatePropertyAll(10),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          Color.fromARGB(255, 255, 255, 255))),
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) =>
                                      const ImagePickerBottomSheet(),
                                );
                              },
                              child: const Icon(
                                Icons.add_photo_alternate_outlined,
                                size: 80,
                                color: Color.fromARGB(255, 205, 205, 205),
                              ),
                            ),
                          ),
                        ),
                        StandardTextField(
                          onChanged: (value) => productCubit.fetch(),
                          padding: const EdgeInsets.only(top: 30),
                          compoundableFormatter: NameProductInputFormatter(),
                          controller: productCubit.nameEditingController,
                        ),
                        StandardTextField(
                            onChanged: (value) => productCubit.fetch(),
                            padding: const EdgeInsets.only(top: 30),
                            compoundableFormatter: DataInputFormatter(
                                controller: productCubit.dateEditingController),
                            controller: productCubit.dateEditingController),
                        GestureDetector(
                          onTap: () {
                            scanBarcodeNormal();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 15,
                                        spreadRadius: 2,
                                        color:
                                            Color.fromARGB(255, 227, 227, 227)),
                                    BoxShadow(
                                        blurRadius: 15,
                                        spreadRadius: 2,
                                        color:
                                            Color.fromARGB(255, 232, 232, 232))
                                  ]),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: SizedBox(
                                      child: Visibility(
                                        visible:
                                            productCubit.barCode.isNotEmpty,
                                        replacement: Text(
                                          textAlign: TextAlign.center,
                                          style: context.theme.textTheme
                                              .smallGreyTextStyle,
                                          maxLines: 2,
                                          'Clique aqui para inserir o código de barras',
                                        ),
                                        child: Text(
                                          maxLines: 1,
                                          productCubit.barCode,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0),
                                      child: SizedBox(
                                        height: 40,
                                        child: SvgPicture.asset(
                                          AppIconAssets.barcodeIcon,
                                          color: const Color.fromARGB(
                                              255, 205, 205, 205),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                StandardButton(
                  onPressed: () => Navigator.of(context).pushNamed(
                    CreateProductDetails.route,
                  ),
                  text: 'Próximo',
                  enabled: productCubit
                      .getButtonStatus(CreateProductRegistrationData.route),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class ImagePickerBottomSheet extends StatelessWidget {
  const ImagePickerBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                // onPressed: () {},
              ),
            ],
          ),
          Text(
            'Escolha uma acão',
            style: context.theme.textTheme.mediumBlackTextStyle
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ImagePickerIcon(
                  iconPath: AppIconAssets.photoIcon,
                  title: 'Câmera',
                  onPressed: () {},
                ),
                ImagePickerIcon(
                  iconPath: AppIconAssets.galleryIcon,
                  title: 'Meus arquivos',
                  onPressed: () {},
                ),
                ImagePickerIcon(
                  iconPath: AppIconAssets.pathIcon,
                  title: 'Mídia',
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
