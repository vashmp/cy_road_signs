import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:flutter/material.dart';
import 'package:cy_road_signs/widgets/common_widgets.dart';

class DonationButton extends StatelessWidget {
  final String productId = "donation_5usd"; // ID из Google Play Console
  const DonationButton({super.key});

  void _buyProduct() async {
    final InAppPurchase _iap = InAppPurchase.instance;
    final bool available = await _iap.isAvailable();
    if (!available) return;

    final ProductDetailsResponse response =
        await _iap.queryProductDetails({productId});
    if (response.notFoundIDs.isNotEmpty) return;

    final PurchaseParam purchaseParam =
        PurchaseParam(productDetails: response.productDetails.first);
    _iap.buyConsumable(purchaseParam: purchaseParam);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonStyle(Colors.white),
      onPressed: _buyProduct,
      child:
          Text("Support", style: TextStyle(fontSize: 20, color: Colors.black)),
    );
  }
}
