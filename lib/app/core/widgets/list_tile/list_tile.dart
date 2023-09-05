import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numpedriversapp/app/core/models/driver.dart';
import 'package:numpedriversapp/app/core/theme/metrics/metrics.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({super.key, required this.driver, required this.itemId, this.isHistoryTile = false});
  final Driver driver;
  final int itemId;
  final bool isHistoryTile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppMetrics.paddingXsm),
      child: ListTile(
        onTap: () => Get.toNamed("/rate", arguments: {"driver": driver, "itemId": itemId, "edit": isHistoryTile}),
        tileColor: Colors.white24,
        leading: driver.image != ""
            ? ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(AppMetrics.driversPicture)),
                child: Image.network(driver.image!))
            : const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(AppMetrics.driversPicture)),
                child: SizedBox(
                    height: AppMetrics.driversPicture * 2,
                    width: AppMetrics.driversPicture * 2,
                    child: Icon(Icons.person))),
        title: Text(driver.name!, overflow: TextOverflow.ellipsis),
        subtitle: isHistoryTile ? Text(driver.comment!, overflow: TextOverflow.ellipsis) : null,
        trailing: SizedBox(
          width: AppMetrics.trailingSize,
          child: Row(
            children: [
              Text(isHistoryTile ? driver.rate.toString() : driver.avgRate.toString()),
              isHistoryTile
                  ? Icon(
                      Icons.star,
                      color: driver.rate! <= 2
                          ? Colors.red
                          : driver.rate! <= 3.8
                              ? Colors.orange
                              : Colors.green,
                    )
                  : Icon(
                      Icons.star,
                      color: driver.avgRate! <= 2
                          ? Colors.red
                          : driver.avgRate! <= 3.8
                              ? Colors.orange
                              : Colors.green,
                    )
            ],
          ),
        ),
        contentPadding: const EdgeInsets.all(AppMetrics.paddingXsm),
      ),
    );
  }
}
