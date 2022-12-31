import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class SheetWidget extends StatelessWidget {
  const SheetWidget({
    super.key,
    required this.bankAccountName,
    required this.ibanNo,
    required this.descriptionNo,
  });

  final String bankAccountName;
  final String ibanNo;
  final String descriptionNo;
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 400.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 12.0),
          const SizedBox(width: 50.0, child: Divider(thickness: 3.0, color: Colors.black)),
          const SizedBox(height: 20.0),
          SheetTile(
            tileText: 'Hesap Adı',
            bankAccountName: bankAccountName,
          ),
          const SizedBox(height: 10.0),
          SheetTile(
            tileText: 'IBAN',
            bankAccountName: ibanNo,
          ),
          const SizedBox(height: 10.0),
          SheetTile(
            tileText: 'Açıklama',
            bankAccountName: descriptionNo,
          ),
          const SizedBox(height: 15.0),
          Container(
            alignment: Alignment.center,
            height: 44.0,
            width: sizeWidth - 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: const Color(0x00f3f4f6).withOpacity(1.0)),
            child: SizedBox(
              width: 240.0,
              child: Center(
                child: Text(
                  'Lütfen havale yaparken açıklama alanına yukarıdaki kodu yazmayı unutmayın.',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10.0, color: const Color(0x00bcc2ce).withOpacity(1.0)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            alignment: Alignment.center,
            height: 44,
            width: sizeWidth - 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: const Color(0x00FFF6F6).withOpacity(1.0)),
            child: SizedBox(
              width: 240.0,
              child: Text(
                'Eksik bilgi girilmesi sebebiyle tutarın askıda kalması durumunda, ücret kesintisi yapılacaktır.',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(fontSize: 10.0, color: const Color(0x00F64949).withOpacity(1.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SheetTile extends StatelessWidget {
  const SheetTile({
    super.key,
    required this.tileText,
    required this.bankAccountName,
  });

  final String tileText;
  final String bankAccountName;

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(width: 15.0),
            Text(
              tileText,
              style: TextStyle(fontSize: 10.0, color: const Color(0x00cfd4de).withOpacity(1.0)),
            ),
          ],
        ),
        const SizedBox(height: 5.0),
        Row(
          children: [
            const SizedBox(width: 15.0),
            Container(
              alignment: Alignment.centerLeft,
              height: 40,
              width: sizeWidth - 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), color: const Color(0x00f3f4f6).withOpacity(1.0)),
              child: ListTile(
                visualDensity: const VisualDensity(vertical: -4),
                trailing: Icon(
                  Icons.copy,
                  size: 12.0,
                  color: const Color(0x0066cc78).withOpacity(1.0),
                ),
                title: Text(
                  bankAccountName,
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(fontSize: 12.0, color: Colors.black),
                  ),
                ),
                onTap: () {
                  Fluttertoast.showToast(msg: 'Kopyalandı');
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(width: 15.0),
          ],
        ),
      ],
    );
  }
}
