import 'package:flutter/cupertino.dart';

class AppInfo extends ChangeNotifier {
  String bankAccountName = '';
  String descriptionNo = '';
  String ibanNo = '';

  updateBankAccountName(String bankAccountName) {
    bankAccountName = bankAccountName;
    print(bankAccountName);
    notifyListeners();
  }

  updateIbanNo(String ibanNo) {
    ibanNo = ibanNo;
    print(ibanNo);
    notifyListeners();
  }

  updateDescriptionNo(String descriptionNo) {
    descriptionNo = descriptionNo;
    print(descriptionNo);
    notifyListeners();
  }
}
