import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:prefs/prefs.dart';

String kelas = Prefs.getString("kelasNotif");

bool notifEnabled = Prefs.getBool("notifStatus", false);

void notifScheduler() {
  if (notifEnabled == true) {
    if (kelas == '9L') {
      notifBuatMapel('PKY', '0 ${jam9L["PKY"]} ? * MON', 10);
      notifBuatMapel('BA', '0 ${jam9L["BA"]} ? * MON', 20);
      notifBuatMapel('FQH', '0 ${jam9L["FQH"]} ? * MON', 30);
      notifBuatMapel('PPKN', '0 ${jam9L["PPKN"]} ? * MON', 40);
      notifBuatMapel('AA', '0 ${jam9L["AA"]} ? * TUE', 50);
      notifBuatMapel('Pembinaan', '0 ${jam9L["Pembinaan"]} ? * TUE', 60);
      notifBuatMapel('SKI', '0 ${jam9L["SKI"]} ? * TUE', 70);
      notifBuatMapel('IPA', '0 ${jam9L["IPA"]} ? * TUE', 80);
      notifBuatMapel('MTK', '0 ${jam9L["MTK"]} ? * WED', 90);
      notifBuatMapel('SBY', '0 ${jam9L["SBY"]} ? * WED', 100);
      notifBuatMapel('BK', '0 ${jam9L["BK"]} ? * WED', 110);
      notifBuatMapel('TTL', '0 ${jam9L["TTL"]} ? * THU', 120);
      notifBuatMapel('BIN', '0 ${jam9L["BIN"]} ? * THU', 130);
      notifBuatMapel('PJS', '0 ${jam9L["PJS"]} ? * THU', 140);
      notifBuatMapel('IPS', '0 ${jam9L["IPS"]} ? * THU', 150);
      notifBuatMapel('QH', '0 ${jam9L["QH"]} ? * FRI', 160);
      notifBuatMapel('BIG', '0 ${jam9L["BIG"]} ? * FRI', 170);
      notifBuatMapel('KIR', '0 ${jam9L["KIR"]} ? * FRI', 180);
      notifBuatMapel('Ngaji Pagi', '0 50 23 ? * *', 190);
      notifBuatMapel('Senam Pagi', '0 50 23 ? * FRI', 200);
      //notifBuatMapel('Tes', '0/10 * * * * ? *', 200);
    } else if (kelas == '9D') {
      notifBuatMapel('IPA', '0 ${jam9D["IPA"]} ? * MON', 10);
      notifBuatMapel('TTL', '0 ${jam9D["TTL"]} ? * MON', 20);
      notifBuatMapel('SBY', '0 ${jam9D["SBY"]} ? * MON', 30);
      notifBuatMapel('KIR', '0 ${jam9D["KIR"]} ? * TUE', 40);
      notifBuatMapel('PJS', '0 ${jam9D["PJS"]} ? * TUE', 50);
      notifBuatMapel('BIG', '0 ${jam9D["BIG"]} ? * TUE', 60);
      notifBuatMapel('BK', '0 ${jam9D["BK"]} ? * TUE', 70);
      notifBuatMapel('SKI', '0 ${jam9D["SKI"]} ? * TUE', 80);
      notifBuatMapel('QH', '0 ${jam9D["QH"]} ? * WED', 90);
      notifBuatMapel('PKY', '0 ${jam9D["PKY"]} ? * WED', 100);
      notifBuatMapel('IPS', '0 ${jam9D["IPS"]} ? * WED', 110);
      notifBuatMapel('PPKN', '0 ${jam9D["PPKN"]} ? * WED', 120);
      notifBuatMapel('AA', '0 ${jam9D["AA"]} ? * THU', 130);
      notifBuatMapel('MTK', '0 ${jam9D["MTK"]} ? * THU', 140);
      notifBuatMapel('BA', '0 ${jam9D["BA"]} ? * THU', 150);
      notifBuatMapel('FQH', '0 ${jam9D["FQH"]} ? * FRI', 160);
      notifBuatMapel('BIN', '0 ${jam9D["BIN"]} ? * FRI', 170);
      notifBuatMapel('Senam Pagi', '0 50 23 ? * FRI', 180);
    } else if (kelas == '9J') {
      notifBuatMapel('SBY', '0 ${jam9J["SBY"]} ? * MON', 10);
      notifBuatMapel('PPKN', '0 ${jam9J["PPKN"]} ? * MON', 20);
      notifBuatMapel('KIR', '0 ${jam9J["KIR"]} ? * MON', 30);
      notifBuatMapel('AA', '0 ${jam9J["AA"]} ? * MON', 40);
      notifBuatMapel('BIN', '0 ${jam9J["BIN"]} ? * TUE', 50);
      notifBuatMapel('PJS', '0 ${jam9J["PJS"]} ? * TUE', 60);
      notifBuatMapel('IPS', '0 ${jam9J["IPS"]} ? * TUE', 70);
      notifBuatMapel('BIG', '0 ${jam9J["BIG"]} ? * WED', 80);
      notifBuatMapel('TTL', '0 ${jam9J["TTL"]} ? * WED', 90);
      notifBuatMapel('IPA', '0 ${jam9J["IPA"]} ? * WED', 100);
      notifBuatMapel('SKI', '0 ${jam9J["SKI"]} ? * THU', 110);
      notifBuatMapel('QH', '0 ${jam9J["QH"]} ? * THU', 120);
      notifBuatMapel('FQH', '0 ${jam9J["FQH"]} ? * THU', 130);
      notifBuatMapel('MTK', '0 ${jam9J["MTK"]} ? * THU', 140);
      notifBuatMapel('PKY', '0 ${jam9J["PKY"]} ? * FRI', 150);
      notifBuatMapel('BK', '0 ${jam9J["BK"]} ? * FRI', 160);
      notifBuatMapel('BA', '0 ${jam9J["BA"]} ? * FRI', 170);
      notifBuatMapel('Senam Pagi', '0 50 23 ? * FRI', 180);
    } else if (kelas == '9F') {
      notifBuatMapel('BK', '0 ${jam9F["BK"]} ? * MON', 10);
      notifBuatMapel('MTK', '0 ${jam9F["MTK"]} ? * MON', 20);
      notifBuatMapel('BIG', '0 ${jam9F["BIG"]} ? * MON', 30);
      notifBuatMapel('IPA', '0 ${jam9F["IPA"]} ? * TUE', 40);
      notifBuatMapel('IPS', '0 ${jam9F["IPS"]} ? * TUE', 50);
      notifBuatMapel('PJS', '0 ${jam9F["PJS"]} ? * TUE', 60);
      notifBuatMapel('AA', '0 ${jam9F["AA"]} ? * WED', 70);
      notifBuatMapel('BIN', '0 ${jam9F["BIN"]} ? * WED', 190);
      notifBuatMapel('BA', '0 ${jam9F["BA"]} ? * WED', 80);
      notifBuatMapel('FQH', '0 ${jam9F["FQH"]} ? * THU', 90);
      notifBuatMapel('PKY', '0 ${jam9F["PKY"]} ? * THU', 100);
      notifBuatMapel('SBY', '0 ${jam9F["SBY"]} ? * THU', 110);
      notifBuatMapel('TTL', '0 ${jam9F["TTL"]} ? * THU', 120);
      notifBuatMapel('QH', '0 ${jam9F["QH"]} ? * THU', 130);
      notifBuatMapel('PPKN', '0 ${jam9F["PPKN"]} ? * FRI', 140);
      notifBuatMapel('SKI', '0 ${jam9F["SKI"]} ? * FRI', 150);
      notifBuatMapel('KIR', '0 ${jam9F["KIR"]} ? * FRI', 160);
      notifBuatMapel('Senam Pagi', '0 50 23 ? * FRI', 170);
    } else if (kelas == '8L') {
      notifBuatMapel('MTK', '0 ${jam8L["MTK"]} ? * MON', 10);
      notifBuatMapel('SBY', '0 ${jam8L["SBY"]} ? * MON', 20);
      notifBuatMapel('BK', '0 ${jam8L["BK"]} ? * MON', 30);
      notifBuatMapel('QH', '0 ${jam8L["QH"]} ? * MON', 40);
      notifBuatMapel('FQH', '0 ${jam8L["FQH"]} ? * TUE', 50);
      notifBuatMapel('INF', '0 ${jam8L["INF"]} ? * TUE', 60);
      notifBuatMapel('PPKN', '0 ${jam8L["PPKN"]} ? * TUE', 70);
      notifBuatMapel('BA', '0 ${jam8L["BA"]} ? * TUE', 80);
      notifBuatMapel('IPA', '0 ${jam8L["IPA"]} ? * WED', 90);
      notifBuatMapel('SKI', '0 ${jam8L["SKI"]} ? * WED', 100);
      notifBuatMapel('IPS', '0 ${jam8L["IPS"]} ? * WED', 110);
      notifBuatMapel('BIG', '0 ${jam8L["BIG"]} ? * THU', 120);
      notifBuatMapel('TTL', '0 ${jam8L["TTL"]} ? * THU', 130);
      notifBuatMapel('BIN 1', '0 ${jam8L["BIN1"]} ? * THU', 140);
      notifBuatMapel('BIN 2', '0 ${jam8L["BIN2"]} ? * THU', 150);
      notifBuatMapel('AA', '0 ${jam8L["AA"]} ? * FRI', 160);
      notifBuatMapel('KIR', '0 ${jam8L["KIR"]} ? * FRI', 170);
      notifBuatMapel('PJS', '0 ${jam8L["PJS"]} ? * FRI', 180);
      notifBuatMapel('Pembinaan', '0 ${jam8L["Pembinaan"]} ? * FRI', 190);
      notifBuatMapel('Senam Pagi', '0 50 23 ? * FRI', 200);
    }
  }
}

void applySchedule(bool state) async {
  if (state == false) {
    AwesomeNotifications().cancelAll();
  } else if (state == true) {
    await AwesomeNotifications().cancelAll();
    notifScheduler();
  }
}

void notifBuatMapel(String mapel, String waktu, int id) {
  AwesomeNotifications().createNotification(
      schedule: NotificationSchedule(
        crontabSchedule: waktu,
        allowWhileIdle: true,
      ),
      content: NotificationContent(
          id: id,
          channelKey: 'progress_channel',
          title: 'Subject Reminder',
          body: 'WARNING : $mapel in 10 minutes'));
}

String itung(jam, menit) {
  jam -= 7;
  return "$menit $jam";
}

final jam8L = {
  "MTK": itung(7, 20),
  "SBY": itung(8, 50),
  "BK": itung(10, 20),
  "QH": itung(10, 50),
  "FQH": itung(7, 20),
  "INF": itung(7, 50),
  "PPKN": itung(8, 20),
  "BA": itung(10, 20),
  "IPA": itung(7, 20),
  "SKI": itung(8, 50),
  "IPS": itung(10, 20),
  "BIG": itung(7, 20),
  "TTL": itung(8, 20),
  "BIN1": itung(8, 50),
  "BIN2": itung(10, 20),
  "AA": itung(7, 20),
  "KIR": itung(7, 50),
  "PJS": itung(8, 20),
  "Pembinaan": itung(8, 50),
};

final jam9F = {
  "BIN": itung(7, 20),
  "PKY": itung(8, 50),
  "QH": itung(10, 20),
  "SKI": itung(10, 50),
  "PPKN": itung(7, 20),
  "FQH": itung(8, 20),
  "IPA1": itung(8, 50),
  "IPA2": itung(10, 20),
  "BIG": itung(7, 20),
  "PJS": itung(8, 20),
  "TTL": itung(8, 50),
  "AA": itung(10, 20),
  "BK": itung(10, 50),
  "IPS": itung(7, 50),
  "BA": itung(8, 20),
  "SBY": itung(10, 20),
  "MTK": itung(7, 20),
  "KIR": itung(8, 50),
};

final jam9D = {
  "IPA": itung(7, 20),
  "BK": itung(10, 20),
  "TTL": itung(8, 50),
  "KIR": itung(7, 20),
  "PJS": itung(7, 50),
  "MTK": itung(7, 50),
  "SBY": itung(10, 20),
  "BIN": itung(7, 50),
  "FQH": itung(7, 20),
  "IPS": itung(8, 20),
  "SKI": itung(10, 50),
  "PKY": itung(7, 50),
  "BA": itung(10, 20),
  "AA": itung(7, 20),
  "QH": itung(7, 20),
  "BIG": itung(8, 20),
  "PPKN": itung(10, 20)
};

final jam9J = {
  "BIN": itung(7, 50),
  "TTL": itung(10, 20),
  "AA": itung(7, 20),
  "FQH": itung(7, 20),
  "BA": itung(10, 20),
  "PPKN": itung(7, 20),
  "BK": itung(7, 20),
  "PJS": itung(10, 50),
  "KIR": itung(8, 50),
  "IPA": itung(7, 20),
  "SBY": itung(8, 20),
  "MTK": itung(7, 50),
  "SKI": itung(8, 20),
  "BIG": itung(10, 20),
  "QH": itung(10, 50),
  "PKY": itung(7, 50),
  "IPS": itung(8, 50),
};

final jam9L = {
  "IPA": itung(8, 50),
  "Pembinaan": itung(7, 50),
  "SKI": itung(8, 20),
  "KIR": itung(8, 50),
  "SBY": itung(8, 50),
  "BIN": itung(7, 20),
  "FQH": itung(8, 50),
  "TTL": itung(10, 50),
  "MTK": itung(7, 20),
  "PKY": itung(7, 20),
  "IPS": itung(10, 20),
  "QH": itung(7, 20),
  "AA": itung(7, 50),
  "BIG": itung(7, 50),
  "BA": itung(7, 50),
  "PPKN": itung(10, 20),
  "BK": itung(10, 20),
  "PJS": itung(8, 50),
};
