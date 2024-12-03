import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import '../../utils.dart';
import '../TransactionError.dart';
import '../responses/standard_response.dart';
import '../subaccount.dart';
import 'customer.dart';
import 'customizations.dart';

class StandardRequest {
  String txRef;
  String amount;
  Customization customization;
  Customer customer;
  bool isTestMode;
  String publicKey;
  String paymentOptions;
  String redirectUrl;
  String? currency;
  String? paymentPlanId;
  List<SubAccount>? subAccounts;
  Map<dynamic, dynamic>? meta;

  StandardRequest({required this.txRef,
    required this.amount,
    required this.customer,
    required this.paymentOptions,
    required this.customization,
    required this.isTestMode,
    required this.publicKey,
    required this.redirectUrl,
    this.currency,
    this.paymentPlanId,
    this.subAccounts,
    this.meta});

  @override
  String toString() => jsonEncode(_toJson());


  /// Converts this instance to json
  Map<String, dynamic> _toJson() {
    return {
      "tx_ref": txRef,
      "publicKey": publicKey,
      "amount": amount,
      "currency": currency,
      "payment_options": paymentOptions,
      "payment_plan": paymentPlanId,
      "redirect_url": redirectUrl,
      "customer": customer.toJson(),
      "subaccounts": subAccounts?.map((e) => e.toJson()).toList(),
      "meta": meta,
      "customizations": customization.toJson()
    };
  }

  /// Executes network call to initiate transactions
  Future<StandardResponse> execute(Client client) async {
    final url = Utils.getBaseUrl(isTestMode) + Utils.STANDARD_PAYMENT;
    final uri = Uri.parse(url);
    try {
      final response = await client.post(uri,
          headers: {
            HttpHeaders.authorizationHeader: publicKey,
            HttpHeaders.contentTypeHeader: 'application/json'
          },
          body: json.encode(_toJson()));
      final responseBody = json.decode(response.body);
      if (responseBody["status"] == "error") {
        throw TransactionError(responseBody["message"] ??
            "An unexpected error occurred. Please try again.");
      }
      return StandardResponse.fromJson(responseBody);
    } catch (error) {
      rethrow;
    }
  }
}
