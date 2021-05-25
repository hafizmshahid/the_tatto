import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
//import 'package:stripe_payment/stripe_payment.dart';
//import 'package:stripe_payment/stripe_payment.dart';
//import 'package:stripe_payment/stripe_payment.dart';

class StripeTransactionResponse {
  String message;
  bool success;
  StripeTransactionResponse({this.message, this.success});
}

/*class StripeService {
  static String apiBase = 'https://api.stripe.com/v1';
  static String paymentApiUrl = '${StripeService.apiBase}/payment_intents';
  static String secret = 'sk_test_51IuxjAFk9pCiSvTWYpBnBvfQ5mpFMYBzyYnE3sKVIfsty2jHQ8Nu0SIROKa4S4aWRCrneUFhivhZD3s9EltaXM8w00BcWMNNFI';
  static Map<String, String> headers = {
    'Authorization': 'Bearer ${StripeService.secret}',
    'Content-Type': 'application/x-www-form-urlencoded'
  };
   static init() {
    StripePayment.setOptions(StripeOptions(
      androidPayMode: 'test',
      publishableKey: "pk_test_51IuxjAFk9pCiSvTW3kMRoOOybVHE9VZtN5WLBI35xgPn8qlboP3XvuO7Bexx4qRevxo4bxKDdHWGd3PFvLNadUYU00dBFgRpvV",
    ));
  }



  static Future<StripeTransactionResponse> payWithNewCard({String amount, String currency,BuildContext context}) async {
    try {
      var paymentMethod = await StripePayment.paymentRequestWithCardForm(
        CardFormPaymentRequest()
      );
      var paymentIntent = await StripeService.createPaymentIntent(
        amount,
        currency
      );
      var response = await StripePayment.confirmPaymentIntent(

        PaymentIntent(
          clientSecret: paymentIntent['client_secret'],
          paymentMethodId: paymentMethod.id
        )
      );
      print("-----------------${response.status}--------------");
      if (response.status == 'succeeded') {
        return new StripeTransactionResponse(
          message: 'Transaction successful',
          success: true
        );
      } else {
        return new StripeTransactionResponse(
          message: 'Transaction failed',
          success: false
        );
      }
    } on PlatformException catch(err) {

      return StripeService.getPlatformExceptionErrorResult(err);
    } catch (err) {
      print("--------------------$err-------------------");
      return new StripeTransactionResponse(
        message: 'Transaction failed: ${err.toString()}',
        success: false
      );
    }
  }
  static getPlatformExceptionErrorResult(err) {
    String message = 'Something went wrong';
    if (err.code == 'cancelled') {
      message = 'Transaction cancelled';
    }

    return new StripeTransactionResponse(
        message: message,
        success: false
    );
  }

  static Future<Map<String, dynamic>> createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          StripeService.paymentApiUrl,
          body: body,
          headers: StripeService.headers
      );
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
    return null;
  }
}*/
