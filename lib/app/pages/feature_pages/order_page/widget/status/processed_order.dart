import 'package:flutter/material.dart';

import '../order_card.dart';
import '../order_filter.dart';

class ProcessedOrder extends StatelessWidget {
  const ProcessedOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 34,
            margin: EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width,
            child: OrderFilter(),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10
                // MediaQuery.of(context).size.width * 0.02,
                ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                // return OrderCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
