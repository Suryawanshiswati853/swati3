import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:project/constants.dart';


class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  void _showSuccessDialog(Map params) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Payment Successful'),
          content: Text('Your payment was successful.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }


  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
      ),
      body:Center( 
    child:Column(
        children: [
          ElevatedButton(onPressed: (){
                                Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => UsePaypal(

            
                            sandboxMode: true,
                            clientId:
                                "${Constants.clientId}",
                            secretKey:
                                "${Constants.secretKey}",
                            returnURL: "${Constants.returnURL}",
                            cancelURL: "${Constants.cancelURL}",
                            transactions: const [
                              {
                                "amount": {
                                  "total": '10.12',
                                  "currency": "USD",
                                  "details": {
                                    "subtotal": '10.12',
                                    "shipping": '0',
                                    "shipping_discount": 0
                                  }
                                },
                                "description":
                                    "The payment transaction description.",
                              
                                "item_list": {
                                  "items": [
                                    {
                                      "name": "A demo product",
                                      "quantity": 1,
                                      "price": '10.12',
                                      "currency": "USD"
                                    }
                                  ],

                                  // shipping address is not required though
                                  "shipping_address": {
                                    "recipient_name": "Jane Foster",
                                    "line1": "Travis County",
                                    "line2": "",
                                    "city": "Austin",
                                    "country_code": "US",
                                    "postal_code": "73301",
                                    "phone": "+00000000",
                                    "state": "Texas"
                                  },
                                }
                              }
                            ],
                            note: "Contact us for any questions on your order.",
                            onSuccess: (Map params) async {
                               _showSuccessDialog(params); 
                              
                              print("onSuccess: $params");
                            },
                            onError: (error) {
                              print("onError: $error");
                            },
                            onCancel: (params) {
                              print('cancelled: $params');
                            })));

          }, child: Text("Make Payment "))
        ],
      ),
    ));
  }
}
