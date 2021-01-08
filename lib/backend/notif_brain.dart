import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:prefs/prefs.dart';

String kelas = Prefs.getString("kelasNotif");

bool notifEnabled = Prefs.getBool("notifStatus", false);

void notifScheduler() {
  if (notifEnabled == true) {
    if (kelas == '9L') {
      notifBuatMapel('IPA', '0 ${jam9L["IPA"]} ? * MON', 10);
      notifBuatMapel('Pembinaan', '0 ${jam9L["Pembinaan"]} ? * MON', 20);
      notifBuatMapel('SKI', '0 ${jam9L["SKI"]} ? * MON', 30);
      notifBuatMapel('KIR', '0 ${jam9L["KIR"]} ? * MON', 40);
      notifBuatMapel('SBY', '0 ${jam9L["SBY"]} ? * TUE', 50);
      notifBuatMapel('BIN', '0 ${jam9L["BIN"]} ? * TUE', 60);
      notifBuatMapel('FQH', '0 ${jam9L["FQH"]} ? * TUE', 70);
      notifBuatMapel('TTL', '0 ${jam9L["TTL"]} ? * TUE', 80);
      notifBuatMapel('MTK', '0 ${jam9L["MTK"]} ? * WED', 90);
      notifBuatMapel('PKY', '0 ${jam9L["PKY"]} ? * WED', 100);
      notifBuatMapel('IPS', '0 ${jam9L["IPS"]} ? * WED', 110);
      notifBuatMapel('QH', '0 ${jam9L["QH"]} ? * THU', 120);
      notifBuatMapel('AA', '0 ${jam9L["AA"]} ? * THU', 130);
      notifBuatMapel('BIG', '0 ${jam9L["BIG"]} ? * THU', 140);
      notifBuatMapel('BA', '0 ${jam9L["BA"]} ? * THU', 150);
      notifBuatMapel('PPKN', '0 ${jam9L["PPKN"]} ? * FRI', 160);
      notifBuatMapel('BK', '0 ${jam9L["BK"]} ? * FRI', 170);
      notifBuatMapel('PJS', '0 ${jam9L["PJS"]} ? * FRI', 180);
      notifBuatMapel('Ngaji Pagi', '0 50 23 ? * SUN,TUE,THU', 190);
      notifBuatMapel('Senam Pagi', '0 50 23 ? * FRI', 200);
      //notifBuatMapel('Tes', '0/10 * * * * ? *', 200);
    } else if (kelas == '9D') {
      notifBuatMapel('IPA', '0 ${jam9D["IPA"]} ? * MON', 10);
      notifBuatMapel('BK', '0 ${jam9D["BK"]} ? * MON', 20);
      notifBuatMapel('TTL', '0 ${jam9D["TTL"]} ? * MON', 30);
      notifBuatMapel('KIR', '0 ${jam9D["KIR"]} ? * MON', 40);
      notifBuatMapel('PJS', '0 ${jam9D["PJS"]} ? * TUE', 50);
      notifBuatMapel('MTK', '0 ${jam9D["MTK"]} ? * TUE', 60);
      notifBuatMapel('SBY', '0 ${jam9D["SBY"]} ? * TUE', 70);
      notifBuatMapel('BIN', '0 ${jam9D["BIN"]} ? * WED', 80);
      notifBuatMapel('FQH', '0 ${jam9D["FQH"]} ? * WED', 90);
      notifBuatMapel('IPS', '0 ${jam9D["IPS"]} ? * WED', 100);
      notifBuatMapel('SKI', '0 ${jam9D["SKI"]} ? * THU', 110);
      notifBuatMapel('PKY', '0 ${jam9D["PKY"]} ? * THU', 120);
      notifBuatMapel('BA', '0 ${jam9D["BA"]} ? * THU', 130);
      notifBuatMapel('AA', '0 ${jam9D["AA"]} ? * THU', 140);
      notifBuatMapel('QH', '0 ${jam9D["QH"]} ? * THU', 150);
      notifBuatMapel('BIG', '0 ${jam9D["BIG"]} ? * FRI', 160);
      notifBuatMapel('PPKN', '0 ${jam9D["PPKN"]} ? * FRI', 170);
      notifBuatMapel('Senam Pagi', '0 50 23 ? * FRI', 180);
    } else if (kelas == '9J') {
      notifBuatMapel('BIN', '0 ${jam9J["BIN"]} ? * MON', 10);
      notifBuatMapel('TTL', '0 ${jam9J["TTL"]} ? * MON', 20);
      notifBuatMapel('AA', '0 ${jam9J["AA"]} ? * MON', 30);
      notifBuatMapel('FQH', '0 ${jam9J["FQH"]} ? * MON', 40);
      notifBuatMapel('BA', '0 ${jam9J["BA"]} ? * TUE', 50);
      notifBuatMapel('PPKN', '0 ${jam9J["PPKN"]} ? * TUE', 60);
      notifBuatMapel('BK', '0 ${jam9J["BK"]} ? * TUE', 70);
      notifBuatMapel('PJS', '0 ${jam9J["PJS"]} ? * TUE', 80);
      notifBuatMapel('KIR', '0 ${jam9J["KIR"]} ? * WED', 90);
      notifBuatMapel('IPA', '0 ${jam9J["IPA"]} ? * WED', 100);
      notifBuatMapel('SBY', '0 ${jam9J["SBY"]} ? * WED', 110);
      notifBuatMapel('MTK', '0 ${jam9J["MTK"]} ? * THU', 120);
      notifBuatMapel('SKI', '0 ${jam9J["SKI"]} ? * THU', 130);
      notifBuatMapel('BIG', '0 ${jam9J["BIG"]} ? * THU', 140);
      notifBuatMapel('QH', '0 ${jam9J["QH"]} ? * FRI', 150);
      notifBuatMapel('PKY', '0 ${jam9J["PKY"]} ? * FRI', 160);
      notifBuatMapel('IPS', '0 ${jam9J["IPS"]} ? * FRI', 170);
      notifBuatMapel('Senam Pagi', '0 50 23 ? * FRI', 180);
    } else if (kelas == '9F') {
      notifBuatMapel('BIN', '0 ${jam9F["BIN"]} ? * MON', 10);
      notifBuatMapel('PKY', '0 ${jam9F["PKY"]} ? * MON', 20);
      notifBuatMapel('QH', '0 ${jam9F["QH"]} ? * MON', 30);
      notifBuatMapel('SKI', '0 ${jam9F["SKI"]} ? * MON', 40);
      notifBuatMapel('PPKN', '0 ${jam9F["PPKN"]} ? * TUE', 50);
      notifBuatMapel('FQH', '0 ${jam9F["FQH"]} ? * TUE', 60);
      notifBuatMapel('IPA 1', '0 ${jam9F["IPA1"]} ? * TUE', 70);
      notifBuatMapel('IPA 2', '0 ${jam9F["IPA2"]} ? * TUE', 190);
      notifBuatMapel('BIG', '0 ${jam9F["BIG"]} ? * WED', 80);
      notifBuatMapel('PJS', '0 ${jam9F["PJS"]} ? * WED', 90);
      notifBuatMapel('TTL', '0 ${jam9F["TTL"]} ? * WED', 100);
      notifBuatMapel('AA', '0 ${jam9F["AA"]} ? * WED', 110);
      notifBuatMapel('BK', '0 ${jam9F["BK"]} ? * WED', 120);
      notifBuatMapel('IPS', '0 ${jam9F["IPS"]} ? * THU', 130);
      notifBuatMapel('BA', '0 ${jam9F["BA"]} ? * THU', 140);
      notifBuatMapel('SBY', '0 ${jam9F["SBY"]} ? * THU', 150);
      notifBuatMapel('MTK', '0 ${jam9F["MTK"]} ? * FRI', 160);
      notifBuatMapel('KIR', '0 ${jam9F["KIR"]} ? * FRI', 170);
      notifBuatMapel('Senam Pagi', '0 50 23 ? * FRI', 180);
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
  "BK": itung(8, 50),
  "TTL": itung(10, 20),
  "KIR": itung(10, 50),
  "PJS": itung(7, 20),
  "MTK": itung(7, 50),
  "SBY": itung(10, 20),
  "BIN": itung(7, 20),
  "FQH": itung(8, 50),
  "IPS": itung(10, 20),
  "SKI": itung(7, 20),
  "PKY": itung(7, 50),
  "BA": itung(8, 20),
  "AA": itung(10, 20),
  "QH": itung(10, 50),
  "BIG": itung(7, 20),
  "PPKN": itung(8, 20)
};

final jam9J = {
  "BIN": itung(7, 20),
  "TTL": itung(8, 50),
  "AA": itung(10, 20),
  "FQH": itung(10, 50),
  "BA": itung(7, 20),
  "PPKN": itung(8, 20),
  "BK": itung(10, 20),
  "PJS": itung(10, 50),
  "KIR": itung(7, 20),
  "IPA": itung(7, 50),
  "SBY": itung(10, 20),
  "MTK": itung(7, 20),
  "SKI": itung(8, 50),
  "BIG": itung(10, 20),
  "QH": itung(7, 20),
  "PKY": itung(7, 50),
  "IPS": itung(8, 20),
};

final jam9L = {
  "IPA": itung(7, 20),
  "Pembinaan": itung(8, 50),
  "SKI": itung(10, 20),
  "KIR": itung(10, 50),
  "SBY": itung(7, 20),
  "BIN": itung(7, 50),
  "FQH": itung(10, 20),
  "TTL": itung(10, 50),
  "MTK": itung(7, 20),
  "PKY": itung(8, 50),
  "IPS": itung(10, 20),
  "QH": itung(7, 20),
  "AA": itung(7, 50),
  "BIG": itung(8, 20),
  "BA": itung(10, 20),
  "PPKN": itung(7, 20),
  "BK": itung(8, 20),
  "PJS": itung(8, 50),
};
