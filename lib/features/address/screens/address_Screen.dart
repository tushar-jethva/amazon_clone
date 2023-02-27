// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/common/Widgets/utills.dart';
import 'package:amazon_clone/features/address/services/address_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';

import 'package:amazon_clone/common/Widgets/MyTextField.dart';
import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:amazon_clone/providers/user_provider.dart';

class MyAddressScreen extends StatefulWidget {
  static const String routeName = '/address-screen';
  final String amount;
  const MyAddressScreen({
    Key? key,
    required this.amount,
  }) : super(key: key);

  @override
  State<MyAddressScreen> createState() => _MyAddressScreenState();
}

class _MyAddressScreenState extends State<MyAddressScreen> {
  final TextEditingController _flatBuildingController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _townCityController = TextEditingController();
  final AddressServices addressServices = AddressServices();
  final _addressFormKey = GlobalKey<FormState>();
  List<PaymentItem> paymentItems = [];
  String addressToBeUsed = "";

  final Future<PaymentConfiguration> _googlePayConfigFuture =
      PaymentConfiguration.fromAsset('gpay.json');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paymentItems.add(PaymentItem(
        amount: widget.amount,
        label: 'Total Amount',
        status: PaymentItemStatus.final_price));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _flatBuildingController.dispose();
    _areaController.dispose();
    _pincodeController.dispose();
    _townCityController.dispose();
  }

  void navigateToBack() {
    Navigator.pop(context);
  }

  void payPressed(String addressFromProvider) {
    addressToBeUsed = "";

    bool isForm = _flatBuildingController.text.isNotEmpty ||
        _pincodeController.text.isNotEmpty ||
        _areaController.text.isNotEmpty ||
        _townCityController.text.isNotEmpty;

    if (isForm) {
      if (_addressFormKey.currentState!.validate()) {
        addressToBeUsed =
            '${_flatBuildingController.text}, ${_areaController.text}, ${_townCityController.text} - ${_pincodeController.text}';
      } else {
        throw Exception('Please enter all the values');
      }
    } else if (addressFromProvider.isNotEmpty) {
      addressToBeUsed = addressFromProvider;
    } else {
      showSnackBar(context, 'ERROR');
    }
  }

  void onGooglePayResult(res) {
    if (Provider.of<UserProvider>(context,listen: false).user.address.isEmpty) {
      addressServices.saveUserAddress(
          context: context, Address: addressToBeUsed);
    }
    addressServices.placrOrder(
      context: context,
      Address: addressToBeUsed,
      totalSum: double.parse(widget.amount),
    );
  }

  @override
  Widget build(BuildContext context) {
    var address = context.watch<UserProvider>().user.address;
    //var address = '287, SantoshNagar Surat-6';
    return Scaffold(
      backgroundColor: MyGlobalVariables.greyBackgroundCOlor,
      appBar: AppBar(
        leading: InkWell(
          onTap: navigateToBack,
          child: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: MyGlobalVariables.appBarGradient,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (address.isNotEmpty)
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          address,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Gap(20),
                    const Text(
                      'OR',
                      style: TextStyle(fontSize: 18),
                    ),
                    Gap(20),
                  ],
                ),
              Form(
                key: _addressFormKey,
                child: Column(
                  children: [
                    MyCustomTextField(
                        controller: _flatBuildingController,
                        hintText: 'Flat, House no, Building'),
                    Gap(15),
                    MyCustomTextField(
                        controller: _areaController, hintText: 'Area, Street'),
                    Gap(15),
                    MyCustomTextField(
                        controller: _pincodeController, hintText: 'Pincode'),
                    Gap(15),
                    MyCustomTextField(
                        controller: _townCityController, hintText: 'Town/City'),
                    Gap(15),
                  ],
                ),
              ),
              FutureBuilder<PaymentConfiguration>(
                  future: _googlePayConfigFuture,
                  builder: (context, snapshot) => snapshot.hasData
                      ? GooglePayButton(
                          onPressed: () => payPressed(address),
                          paymentConfiguration: snapshot.data!,
                          paymentItems: paymentItems,
                          type: GooglePayButtonType.buy,
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 15.0),
                          height: 50,
                          onPaymentResult: onGooglePayResult,
                          loadingIndicator: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : const SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }
}
