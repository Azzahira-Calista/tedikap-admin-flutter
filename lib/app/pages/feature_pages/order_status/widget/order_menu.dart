import 'package:flutter/material.dart';
import '../../../../data/model/order/order_item_model.dart';
import '../../../../data/model/order/order_reward_item.dart';
import '../../../../../common/themes.dart';

class OrderMenu extends StatelessWidget {
  final List<OrderItems>? orderItems;
  final List<OrderRewardItems>? orderRewardItems;

  OrderMenu({this.orderItems, this.orderRewardItems});

  @override
  Widget build(BuildContext context) {
    int orderItemsLength = orderItems?.length ?? 0;
    int orderRewardItemsLength = orderRewardItems?.length ?? 0;
    int totalItemsLength = orderItemsLength + orderRewardItemsLength;

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: totalItemsLength,
      itemBuilder: (BuildContext context, int index) {
        if (index < orderItemsLength) {
          final orderItem = orderItems![index];
          return OrderItemWidget(orderItem: orderItem);
        } else {
          final rewardItem = orderRewardItems![index - orderItemsLength];
          return RewardItemWidget(rewardItem: rewardItem);
        }
      },
    );
  }
}

class OrderItemWidget extends StatelessWidget {
  final OrderItems orderItem;

  OrderItemWidget({required this.orderItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                orderItem.quantity.toString(),
                style: subTitle,
              ),
              SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.04,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderItem.productName!,
                    style: subTitle,
                  ),
                  if (orderItem.temperatur != null)
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        (orderItem.temperatur == 'ice'
                                ? 'temperature: ' + orderItem.temperatur! + ', '
                                : '') +
                            (orderItem.temperatur == 'hot'
                                ? 'temperature: ' + orderItem.temperatur! + ', '
                                : 'ice: ' +
                                    (orderItem.ice ?? 'normal') +
                                    ', ') +
                            'size: ' +
                            (orderItem.size ?? 'normal') +
                            ', ' +
                            'sugar: ' +
                            (orderItem.sugar ?? 'normal'),
                        style: cardTitle.copyWith(color: offColor),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Text(
                      'Note: ' + (orderItem.note ?? ''),
                      style: cardTitle.copyWith(color: offColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Rp ",
                style: cardTitle,
              ),
              Text(
                orderItem.price.toString(),
                style: cardTitle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RewardItemWidget extends StatelessWidget {
  final OrderRewardItems rewardItem;

  RewardItemWidget({required this.rewardItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                rewardItem.quantity.toString(),
                style: subTitle,
              ),
              SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.04,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rewardItem.productName!,
                    style: subTitle,
                  ),
                  if (rewardItem.temperatur != null)
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        (rewardItem.temperatur == 'ice'
                                ? 'temperature: ' +
                                    rewardItem.temperatur! +
                                    ', '
                                : '') +
                            (rewardItem.temperatur == 'hot'
                                ? 'temperature: ' +
                                    rewardItem.temperatur! +
                                    ', '
                                : 'ice: ' +
                                    (rewardItem.ice ?? 'normal') +
                                    ', ') +
                            'size: ' +
                            (rewardItem.size ?? 'normal') +
                            ', ' +
                            'sugar: ' +
                            (rewardItem.sugar ?? 'normal'),
                        style: cardTitle.copyWith(color: offColor),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Text(
                      'Note: ' + (rewardItem.note ?? ''),
                      style: cardTitle.copyWith(color: offColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                rewardItem.points.toString(),
                style: cardTitle,
              ),
              Text(
                " Pts",
                style: cardTitle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
