import 'package:flutter/material.dart';
import 'package:myshoplist/constants/marketplace_constants.dart';

class MarketplaceTileComponent extends StatelessWidget {
  final String name;
  final String? address;

  const MarketplaceTileComponent({
    Key? key,
    required this.name,
    this.address,
  }) : super(key: key);

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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage(MARKETPLACE_ASSET_ICON),
                width: 64,
                height: 64,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    this.name,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    this.address ?? "",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
