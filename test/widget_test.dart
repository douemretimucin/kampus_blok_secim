// Basit testler. Çalıştırmak için: flutter test
// (Harita internetten görüntü indirdiği için tüm ekranı değil,
//  verileri ve "seçtiniz" kutusunu test ediyoruz.)

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:kampus_blok_secim/main.dart';

void main() {
  test('Kampüste 4 alan var ve katlar doğru sayıda', () {
    expect(alanlar.length, 4);
    expect(alanlar[0].katlar.length, 10); // A Blok: -1, 1-9
    expect(alanlar[1].katlar.length, 9); // B Blok: -1, 1-8
    expect(alanlar[2].katlar.length, 7); // C Blok: -1, 1-6
    expect(alanlar[3].katlar.isEmpty, true); // Kış Bahçesi: kat yok
  });

  testWidgets('Seçim kutusu doğru yazıyı gösteriyor', (tester) async {
    final bBlok = alanlar[1];
    final ucuncuKat = bBlok.katlar[3]; // -1, 1, 2, 3 -> "3. Kat"

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: SecimBilgisi(alan: bBlok, kat: ucuncuKat)),
      ),
    );

    expect(find.text('B Blok 3. Katı seçtiniz'), findsOneWidget);
  });
}
