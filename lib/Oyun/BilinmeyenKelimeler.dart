import 'package:flutter/material.dart';

class BilinmeyenKelimeler extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text("Bilinmeyen Kelimeler"),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Darilfünun: \n"
                "Darülfünun Arapça dar ve fünun sözcüklerinden türetilmiş, \"üniversite\" anlamında kullanılan bir sözcüktür. Aynı zamanda 1900 yılında Avrupa üniversiteleri tarzında kurulan Darülfünun-ı Şahane veya İstanbul Darülfünununu ifade eder. Bu kurum 1933 reformuyla İstanbul Üniversitesi'ne dönüştürülmüştür.\n\n"
              "Darülbedai:\n"
                "Dârülbedâyi ya da asıl adıyla Dârü’l-bedâyi-i Osmânî, 27 Ekim 1914 tarihinde İstanbul Belediyesi bünyesinde konservatuvar olarak açıldıktan sonra okul hüviyetinden çıkıp bir tiyatro topluluğuna dönüşen; hâlen İstanbul Şehir Tiyatroları adıyla varlığını sürdüren sanat kurumu.\n\n"
                "Darüleytam:\n"
                "Darüleytam, yetimler yurdu anlamına gelen bir tamlamadır. Dar'üleytam şeklinde de yazılabilir.\n\n"
                "Takograf:\n"
                "Takograf, sürat veya katedilen mesafe gibi bilgileri kaydetmek üzere başta otobüsler ve kamyonlar olmak üzere bazı taşıtlara monte edilen cihaz.\n\n"
                "Tomograf:\n"
                "Vücudun özel bir bölgesinde bulunan bir doku kesitine ait röntgen filmi.\n\n"
                "Trapman:\n"
                "Trapman, buhar kapanı (kondenstop) kaçaklarını ölçmek ve sonuçları analiz edebilmek için kullanılan bir sistemdir.\n\n"
              , style: TextStyle(color:Colors.red ,fontSize: 15 ),),
          ),
        ),
      );
  }
}
