import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:sanal_lira/core/sme_config.dart';
import 'package:sanal_lira/screens/sheet.dart';
import 'package:sanal_lira/widgets/confirm_dialog_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double screenWidth;
  @override
  void initState() {
    // fetchBaks();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          leading: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                child: Container(
                  width: 36.0,
                  height: 36.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 9.0,
                top: 9.0,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: _onWillPop,
                ),
              ),
            ],
          ),
          elevation: 0,
          backgroundColor: const Color(0x00f3f4f6).withOpacity(1.0),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Stack(
                children: [
                  Container(
                    width: 36.0,
                    height: 36.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                  ),
                  const Positioned(
                    left: 9.0,
                    top: 9.0,
                    child: SizedBox(
                      width: 17.0,
                      height: 17.0,
                      child: Image(
                        image: AssetImage('assets/images/bell.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 9.0),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, right: 15.0),
              child: Stack(
                children: [
                  Container(
                    width: 36.0,
                    height: 36.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                  ),
                  const Positioned(
                    left: 9.0,
                    top: 9.0,
                    child: SizedBox(
                      width: 17.0,
                      height: 17.0,
                      child: Image(
                        image: AssetImage('assets/images/settings.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Card(
          child: FutureBuilder<List<dynamic>>(
            future: fetchBaks(),
            builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
              final dynamic data = snapshot.data;
              if (snapshot.data == null) {
                return const Center(
                  child: Text('Loading...'),
                );
              } else {
                return Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: const Color(0x00f3f4f6).withOpacity(1.0),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: screenWidth,
                          height: 56.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 10.0),
                              const SizedBox(
                                width: 29.0,
                                height: 29.0,
                                child: Image(
                                  image: AssetImage('assets/images/turkey.png'),
                                ),
                              ),
                              const SizedBox(width: 5.0),
                              SizedBox(
                                width: 250.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Türk Lirası',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: const Color(0x00141C2D).withOpacity(1.0),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'TL',
                                      style: TextStyle(fontSize: 12.0, color: const Color(0x00cfd4de).withOpacity(1.0)),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '234 ₺',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: const Color(0x00141C2D).withOpacity(1.0),
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 17.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 13.0),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: const Color(0x00f3f4f6).withOpacity(1.0),
                      child: Row(
                        children: [
                          const SizedBox(width: 15.0),
                          Text(
                            'Türk lirası yatırmak için banka seçiniz.',
                            style: TextStyle(color: const Color(0x00cfd4de).withOpacity(1.0), fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 13.0),
                    Container(
                      height: 545.0,
                      color: const Color(0x00f3f4f6).withOpacity(1.0),
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int i) {
                          return GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white,
                                ),
                                child: ListTile(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return SheetWidget(
                                          bankAccountName: snapshot.data![i]['bankAccountName'],
                                          ibanNo: snapshot.data![i]['bankIban'],
                                          descriptionNo: snapshot.data![i]['descriptionNo'],
                                        );
                                      },
                                    );
                                  },
                                  contentPadding: const EdgeInsets.only(left: 7.0),
                                  title: Text(
                                    snapshot.data![i]['bankName'],
                                    style: TextStyle(
                                      color: const Color(0x00141c2d).withOpacity(1.0),
                                      fontSize: 15,
                                    ),
                                  ),
                                  subtitle: Text(
                                    snapshot.data![i]['bankIban'],
                                    style: TextStyle(
                                      color: const Color(0x00cfd4de).withOpacity(1.0),
                                      fontSize: 10,
                                      fontFamily: DefaultTextStyle.of(context).style.fontFamily,
                                    ),
                                  ),
                                  leading: Stack(
                                    children: const [
                                      SizedBox(
                                        width: 78.0,
                                        height: 60.0,
                                        child: Image(
                                          image: AssetImage('assets/images/rectangle.png'),
                                        ),
                                      ),
                                      Positioned(
                                        top: 23,
                                        left: 6,
                                        child: SizedBox(
                                          width: 67.0,
                                          height: 14.0,
                                          child: Image(
                                            image: AssetImage('assets/images/ziraat.png'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
            },
          ),
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

  Future<List<dynamic>> fetchBaks() async {
    const String url = SmeConfig.siteUrl;
    final http.Response response = await http.get(Uri.parse(url));
    final Map<String, dynamic> jsonData = jsonDecode(response.body);
    final Map<String, dynamic> bankResponce = jsonData['response'];
    final List<dynamic> bankData = jsonData['data'];
    if (bankResponce['code'] == 200) {
      return bankData;
    } else {
      return [];
    }
  }
}
