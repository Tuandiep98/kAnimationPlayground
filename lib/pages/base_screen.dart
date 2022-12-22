import 'package:flutter/material.dart';

import '../global/router_config.dart';
import '../utils/header.dart';
import '../utils/web_platform.dart';

class BaseScreen extends StatefulWidget {
  final Widget? header;
  final Widget body;
  BaseScreen({Key? key, required this.body, this.header}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      body: WebPlatform(
        header:
            widget.header != null ? widget.header! : const SizedBox.shrink(),
        //Header(),
        body: widget.body,
      ),
    );
  }
}
