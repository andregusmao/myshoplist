import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myshoplist/constants/shoplist_constants.dart';

class ShoplistTileComponent extends StatelessWidget {
  final String name;
  final int items;
  final DateTime createDate;
  final DateTime? updateDate;

  const ShoplistTileComponent(
      {Key? key,
      required this.name,
      required this.items,
      required this.createDate,
      this.updateDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue[100],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                SHOPLIST_ICON,
                size: 64,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    this.name,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 4, top: 0, right: 4, bottom: 0),
                  child: Text(
                    '${this.items} ite${this.items > 1 ? 'ns' : 'm'}',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 4, top: 0, right: 4, bottom: 4),
                  child: Text(
                    'atualizada em ${DateFormat('dd/MM/yyyy HH:mm:ss').format(this.updateDate ?? this.createDate)}',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
