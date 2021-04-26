import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myshoplist/ui/components/app/fullscreen_message_component.dart';

class AppNoImplementedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () => Modular.to.pop(),
        ),
        leadingWidth: 24,
        title: Row(
          children: [
            Icon(FontAwesomeIcons.windowClose),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Não implementado'),
            ),
          ],
        ),
      ),
      body: FullscreenMessageComponent(
        message: 'Essa função ainda não foi implementada',
      ),
    );
  }
}
