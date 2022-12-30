import 'package:flutter/cupertino.dart';

class AppInfo extends ChangeNotifier {
  int countTotalTrips = 0;
  List<String> historyTripsKeysList = [];

  updateOverAllTripsCounter(int overAllTripsCounter) {
    countTotalTrips = overAllTripsCounter;
    notifyListeners();
  }

  updateOverAllTripsKeys(List<String> tripsKeysList) {
    historyTripsKeysList = tripsKeysList;

    notifyListeners();
  }
}
