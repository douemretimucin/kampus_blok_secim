// =====================================================================
//  DETAYLAR EKRANI  —  BU DOSYA EMRE'NİN
// =====================================================================
//  Doğu'nun ekranında kullanıcı:
//    1) Bir blok kartı seçer
//    2) "Kat Seçimi Yap" butonuna basar
//    3) Bir kata basar (örnek: "4. Kat") ve kat planını görür
//    4) Kat planı sayfasındaki "Seçimi Onayla" butonuna basar -> ana sayfaya döner,
//       üstte "B Blok 4. Katı seçtiniz" yazar
//    5) Ana sayfanın en altındaki yeşil "Canlı Navigasyona Aktar" butonuna basar
//  KIŞ BAHÇESİ: Katı olmadığı için kullanıcı karta dokununca direkt seçilir
//  ve "Canlı Navigasyona Aktar" butonu çıkar. Bu durumda:
//    alan.katlar.isEmpty  -> true   (Kış Bahçesi olduğunu böyle anlarsın)
//    kat.ad               -> "Sosyal Alan"
//    kat.gorsel           -> Kış Bahçesi fotoğrafı
//  ...ve bu sayfa açılır.
//
//  Bu sayfaya seçilen blok "alan", seçilen kat "kat" olarak gelir.
//    kat.ad           -> "4. Kat"
//    kat.gorsel       -> o katın tabela fotoğrafı (Image.asset(kat.gorsel))
//  Kullanabileceğin bilgiler (modeller.dart içindeki Alan sınıfı):
//    alan.kisaAd      -> "A Blok"
//    alan.baslik      -> "A BLOK - Rektörlük & Hukuk Fakültesi"
//    alan.altBilgi    -> "9 Katlı + (-1) Kat • Öğrenci İşleri • ..."
//    alan.kategori    -> "Rektörlük & Hukuk"
//    alan.gorsel      -> bina fotoğrafı (Image.asset(alan.gorsel))
//    alan.ozellikler  -> özellik listesi (ikon + yazı)
//    alan.katlar      -> kat listesi (kat.ad + kat.gorsel)
//
//  Emre: sınıfın adını (DetaylarEkrani), "required this.alan" ve
//  "required this.kat" kısımlarını
//  DEĞİŞTİRME; Doğu'nun butonu bu isimle çağırıyor. build() içini
//  istediğin gibi silip kendi tasarımını yazabilirsin.
// =====================================================================
import 'package:flutter/material.dart';

import 'modeller.dart';

class DetaylarEkrani extends StatelessWidget {
  final Alan alan; // kullanıcının seçtiği blok
  final Kat kat; // kullanıcının seçtiği kat

  const DetaylarEkrani({super.key, required this.alan, required this.kat});

  @override
  Widget build(BuildContext context) {
    // ---- GEÇİCİ İÇERİK: Emre burayı kendi tasarımıyla değiştirecek ----
    return Scaffold(
      appBar: AppBar(title: Text('${alan.kisaAd} • ${kat.ad} • Detaylar')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.construction, size: 48, color: Colors.grey),
              const SizedBox(height: 12),
              Text(
                '${alan.baslik}\n${kat.ad}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Bu sayfa hazırlanıyor (Emre).',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
