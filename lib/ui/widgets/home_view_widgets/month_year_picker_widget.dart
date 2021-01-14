import 'package:flutter/material.dart';
import 'package:moneymanager/core/viewmodels/home_model.dart';
import 'package:overlay_container/overlay_container.dart';

class PickMonthOverlay extends StatelessWidget {
  final HomeModel model;
  final BuildContext context;
  final bool showOrHide;

  const PickMonthOverlay({Key key, this.model, this.context, this.showOrHide})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlayContainer(
        show: showOrHide,
        position: OverlayContainerPosition(
          0,
          0,
        ),
        child: Container(
          height: 200,
          padding: EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey[300],
                blurRadius: 3,
                spreadRadius: 10,
              )
            ],
          ),
          child: buildGridView(model),
        ));
  }

  Widget buildGridView(HomeModel model) {
    return GridView.count(
      crossAxisCount: 6,
      children: model.months.map((month) {
        return InkWell(
          onTap: () {
            model.monthClicked(month);
          },
          child: Center(
            child: Text(
              month,
              style: TextStyle(
                color: model.getColor(month),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
