import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sanal_lira/core/constant.dart';
import 'package:sanal_lira/widgets/confirm_dialog_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text("Oyunlar"),
          // ignore: prefer_const_literals_to_create_immutables
          // actions: <Widget>[
          //   Container(
          //     color: Colors.red,
          //     width: 100,
          //     height: 100,
          //   ),
          // ],
        ),
        body: Container(
          color: Colors.red,
          width: 100,
          height: 100,
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return ConfirmDialogView(
              description: 'Gerçekten çıkmak istiyor musun?',
              leftButtonText: 'Vazgeç',
              rightButtonText: 'Tamam',
              onAgreeTap: () {
                Navigator.pop(context);
                SystemNavigator.pop();
              },
              onCancelTap: () {
                Navigator.of(context).pop();
              },
            );
          },
        ) ??
        false;
  }
}
