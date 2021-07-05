import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:grpc/grpc.dart';
import 'package:tonbrains_quanton_mobile_app/common/apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/common/customWidgets.dart';
import 'package:tonbrains_quanton_mobile_app/controls/controls_animations.dart';
import 'package:tonbrains_quanton_mobile_app/controls/helper_functions.dart';
import 'package:tonbrains_quanton_mobile_app/fontawesome/font_awesome_flutter.dart';
import 'package:tonbrains_quanton_mobile_app/proto_services/ton_mobile.pbgrpc.dart';
import 'package:tonbrains_quanton_mobile_app/services/api.dart';

import '../globals.dart';
import 'home_page.dart';

class PaymentScreen extends StatefulWidget {
  final int productid;
  PaymentScreen({Key key, this.productid}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;
  var listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = getTopBarOpacity();
  AnimationController animationController;
  double screenMaxWidth;
  static final String tokenizationKey = 'sandbox_4xrwy9rb_sbm9sk2wvjqy6y8j';

  var productName = "";
  var productDescription = "";
  var productPice = 0.0;
  var productCurrency = "USD";

  var busy = false;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    topBarAnimation = getTopBarAnimation(animationController);

    if (widget.productid == 1) {
      productName = "10 000 QUANY";
      productDescription = deactionText3;
      productPice = 999.98;
    } else if (widget.productid == 2) {
      productName = "1 000 QUANY";
      productDescription = deactionText3;
      productPice = 99.98;
    } else if (widget.productid == 3) {
      productName = "100 QUANY";
      productDescription = deactionText3;
      productPice = 9.98;
    }

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  void addAllListData() {}

  Future<bool> getData() async {
    return true;
  }

  void showSuccessDialogBox() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        // title: Text('Order has beeb completed'),

        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            titleNameWorkSansOrder(
              'Your purchase has been completed successfully!',
            ),
            SizedBox(height: 20),
            infoMesssageSmall(
              'It can take up to 24-48 hours to deliver your order.',
            ),
            SizedBox(height: 20),
            RaisedButton.icon(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                )
              },
              label: Text(
                "OK",
                style: TextStyle(color: AppTheme.primaryRed),
              ),
              icon: Icon(
                FontAwesomeIcons.check,
                color: AppTheme.primaryRed,
                size: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showErrorDialogBox() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        // title: Text('Order has beeb completed'),

        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            titleNameWorkSansOrder(
              'Payment Error',
            ),
            SizedBox(height: 20),
            infoMesssageSmall(
              'Please use valid payment method.',
            ),
            SizedBox(height: 20),
            RaisedButton.icon(
              onPressed: () => {
                Navigator.pop(context)
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HomePage()),
                // )
              },
              label: Text(
                "OK",
                style: TextStyle(color: AppTheme.primaryRed),
              ),
              icon: Icon(
                FontAwesomeIcons.check,
                color: AppTheme.primaryRed,
                size: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future payment(BraintreeDropInResult result) async {
    setState(() {
      busy = true;
    });

    await prepareApiSession(
      (ClientChannel channel, Map<String, String> options) async {
        final client = TonMobileClient(channel);

        final request = PaymentRequest()
          ..amount = productPice.toString()
          ..nonce = result.paymentMethodNonce.nonce
          ..clientData = result.deviceData;

        final r = await client.payment(request, options: apiOptions(options));

        setState(() {
          busy = false;
        });

        if (r.success) {
          showSuccessDialogBox();
        } else {
          showErrorDialogBox();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    listViews = new List<Widget>();

    listViews.add(SizedBox(height: 10));
    listViews.add(appTitleGoodTimes("Review your Order"));
    listViews.add(SizedBox(height: 30));
    listViews.add(titleNameWorkSansPrimary(productName));
    listViews.add(SizedBox(height: 25));
    listViews.add(infoMesssage(productDescription));
    listViews.add(SizedBox(height: 30));
    listViews.add(totalPriceNameWorkSansPrimary(
        productPice.toString() + " " + productCurrency));
    listViews.add(SizedBox(height: 20));

    listViews.add(
      RaisedButton.icon(
        label: Text("Place Your Order"),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        onPressed: () async {
          var request = BraintreeDropInRequest(
            tokenizationKey: tokenizationKey,
            collectDeviceData: true,
            googlePaymentRequest: BraintreeGooglePaymentRequest(
              totalPrice: productPice.toString(),
              currencyCode: productCurrency,
              billingAddressRequired: false,
            ),
            paypalRequest: BraintreePayPalRequest(
                amount: productPice.toString(), currencyCode: productCurrency
                // displayName: 'Example company',
                ),
            cardEnabled: true,
          );
          BraintreeDropInResult result = await BraintreeDropIn.start(request);
          if (result != null) {
            payment(result);
          }
        },
        icon: Icon(
          FontAwesomeIcons.shoppingCart,
          // color: AppTheme.primaryRed,
          size: 12,
        ),
      ),
    );

    // listViews.add(
    //   RaisedButton.icon(
    //     label: Text("Place Your Order"),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: new BorderRadius.circular(18.0),
    //     ),
    //     onPressed: () async {
    //       showErrorDialogBox();
    //     },
    //     icon: Icon(
    //       FontAwesomeIcons.shoppingCart,
    //       // color: AppTheme.primaryRed,
    //       size: 12,
    //     ),
    //   ),
    // );
    listViews.add(SizedBox(height: 20));

    listViews.add(infoMesssageSuperSmall(
        "For an item ordered from TON BRAINS: When you click the 'Place Your Order' button, we will send you an e-mail acknowledging receipt of your order. Your contract to purchase an item will not be complete until we send you an e-mail notifying you that the item has been delivered to you. By placing your order, you agree to TON BRAINS privacy notice."));

    listViews = toAnimatedWidgets(listViews, animationController);

    return busy
        ? getLoadingWidget()
        : getMainContainer(context, () {
            return getData();
          }, animationController, scrollController, listViews);
  }
}
