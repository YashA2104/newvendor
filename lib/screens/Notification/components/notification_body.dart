import 'package:flutter/material.dart';
import 'package:vendor/screens/Notification/components/order_details.dart';
import 'package:vendor/screens/Notification/components/top_bar.dart';
import 'package:vendor/size_config.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          TopBar(),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          OrderDetails(
            title: 'Order Arrived',
            description:
                'Order number 1111222233334444455 has been completed and arrived at your door step',
            icon: Icons.done_all_rounded,
            date: 'July 20,2020',
          ),
          OrderDetails(
            title: 'Order Shipped',
            description:
                'Order number 111122223333666655 has been packed and shipped to our inventory',
            icon: Icons.star_half_rounded,
            date: 'July 22,2020',
          ),
          OrderDetails(
            title: 'Order Cancelled',
            description:
                'Order number 1111222233334444477 has been successfully cancelled',
            icon: Icons.cancel_presentation_rounded,
            date: 'July 25,2020',
          ),
          OrderDetails(
            title: 'Order Arrived',
            description:
                'Order number 1111222233334444450 has been completed and arrived at your door step',
            icon: Icons.done_all_rounded,
            date: 'July 28,2020',
          )
        ],
      ),
    );
  }
}
