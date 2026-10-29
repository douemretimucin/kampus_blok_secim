import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'modeller.dart'; // Ozellik, Kat, Alan kalıpları
import 'detaylar_ekrani.dart'; // Emre'nin sayfası

// ==================== RENKLER ====================
const Color anaYesil = Color(0xFF1E5B4F);
const Color acikYesil = Color(0xFFD4F1E6);
const Color koyuLacivert = Color(0xFF14213D);
const Color griYazi = Color(0xFF6B7280);
const Color sayfaArkaPlan = Color(0xFFF3F5F8);
const Color acikMavi = Color(0xFFE8F0FA);
const Color acikGri = Color(0xFFEFF2F5);
const Color acikMaviButon = Color(0xFFE3ECF7);

// ==================== KAMPÜS KONUMU ====================
final LatLng kampusMerkezi = LatLng(40.90192634490771, 29.219619147136903);

// ==================== KAMPÜSTEKİ ALANLAR ====================
const List<Alan> alanlar = [
  Alan(
    kisaAd: 'A Blok',
    katlar: [
      Kat('-1. Kat', 'assets/images/Z-1.png'),
      Kat('1. Kat', 'assets/images/A1.png'),
      Kat('2. Kat', 'assets/images/A2.png'),
      Kat('3. Kat', 'assets/images/A3.png'),
      Kat('4. Kat', 'assets/images/A4.png'),
      Kat('5. Kat', 'assets/images/A5.png'),
      Kat('6. Kat', 'assets/images/A6.png'),
      Kat('7. Kat', 'assets/images/A7.png'),
      Kat('8. Kat', 'assets/images/A8.png'),
      Kat('9. Kat', 'assets/images/A9.jpeg'),
    ],
    baslik: 'A BLOK - Rektörlük & Hukuk Fakültesi',
    altBilgi: '9 Katlı + (-1) Kat • Öğrenci İşleri • Mali İşler',
    kategori: 'Rektörlük & Hukuk',
    gorsel: 'assets/images/a_blok.png',
    gorselIkon: Icons.gavel,
    gorselRenk: Color(0xFF7B5EA7),
    ozellikler: [
      Ozellik(Icons.elevator, '2 Asansör'),
      Ozellik(Icons.wifi, 'Wi-Fi'),
      Ozellik(Icons.badge, 'Öğrenci İşleri'),
      Ozellik(Icons.account_balance_wallet, 'Mali İşler'),
      Ozellik(Icons.local_library, 'Kütüphane'),
    ],
    altSatir: '9 Kat + (-1) • Rektörlük & Hukuk',
    butonYazisi: 'Kat Seçimi Yap',
  ),
  Alan(
    kisaAd: 'B Blok',
    katlar: [
      Kat('-1. Kat', 'assets/images/B-1.jpeg'),
      Kat('1. Kat', 'assets/images/B1.png'),
      Kat('2. Kat', 'assets/images/B2.jpeg'),
      Kat('3. Kat', 'assets/images/B3.png'),
      Kat('4. Kat', 'assets/images/B4.jpeg'),
      Kat('5. Kat', 'assets/images/B5.jpeg'),
      Kat('6. Kat', 'assets/images/B6.jpeg'),
      Kat('7. Kat', 'assets/images/B7.jpeg'),
      Kat('8. Kat', 'assets/images/B8.jpeg'),
    ],
    baslik: 'B BLOK - Mimarlık & Güzel Sanatlar Fakültesi',
    altBilgi: '8 Katlı + (-1) Kat • Konferans Salonu • İnovasyon Merkezi',
    kategori: 'Mimarlık & G. Sanatlar',
    gorsel: 'assets/images/b_blok.png',
    gorselIkon: Icons.architecture,
    gorselRenk: Color(0xFFB08D57),
    ozellikler: [
      Ozellik(Icons.elevator, '2 Asansör'),
      Ozellik(Icons.wifi, 'Wi-Fi'),
      Ozellik(Icons.local_library, 'Kütüphane'),
      Ozellik(Icons.lightbulb, 'İnovasyon Merkezi'),
      Ozellik(Icons.mic, 'Konferans Salonu'),
      Ozellik(Icons.restaurant, 'Yemekhane'),
      Ozellik(Icons.edit, 'Kırtasiye'),
    ],
    altSatir: '8 Kat + (-1) • Mimarlık & Güzel Sanatlar',
    butonYazisi: 'Kat Seçimi Yap',
  ),
  Alan(
    kisaAd: 'C Blok',
    katlar: [
      Kat('-1. Kat', 'assets/images/C-1.jpeg'),
      Kat('1. Kat', 'assets/images/C1.png'),
      Kat('2. Kat', 'assets/images/C2.png'),
      Kat('3. Kat', 'assets/images/C3.png'),
      Kat('4. Kat', 'assets/images/C4.jpeg'),
      Kat('5. Kat', 'assets/images/C5.png'),
      Kat('6. Kat', 'assets/images/C6.png'),
    ],
    baslik: 'C BLOK - Mühendislik Fakültesi',
    altBilgi: '6 Katlı + (-1) Kat • Çalışma Alanı',
    kategori: 'Mühendislik',
    gorsel: 'assets/images/c_blok.png',
    gorselIkon: Icons.engineering,
    gorselRenk: Color(0xFF5B8DB8),
    ozellikler: [
      Ozellik(Icons.elevator, 'Tek Asansör'),
      Ozellik(Icons.wifi, 'Wi-Fi'),
      Ozellik(Icons.menu_book, 'Çalışma Alanı'),
      Ozellik(Icons.atm, 'Bankamatik (kapı önü)'),
    ],
    altSatir: '6 Kat + (-1) • Mühendislik',
    butonYazisi: 'Kat Seçimi Yap',
  ),
  Alan(
    kisaAd: 'Kış Bahçesi',
    katlar: [], // kat yok, buton çıkmayacak
    baslik: 'KIŞ BAHÇESİ',
    altBilgi: 'Sosyal Alan',
    kategori: 'Sosyal Alan',
    gorsel: 'assets/images/kis_bahcesi.png',
    gorselIkon: Icons.local_florist,
    gorselRenk: Color(0xFF6BA368),
    ozellikler: [
      Ozellik(Icons.coffee, 'Kahve İstasyonu'),
      Ozellik(Icons.power, 'Prizli Masalar'),
    ],
    altSatir: 'Sosyal Alan',
    butonYazisi: 'Alana Git',
  ),
];

// ==================== UYGULAMA ====================
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KampüsNav',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: anaYesil),
        scaffoldBackgroundColor: sayfaArkaPlan,
      ),
      home: const BlokSecimEkrani(),
    );
  }
}

// ==================== EKRAN ====================
// StatefulWidget: "hangi kart seçili" bilgisini hatırlayan ekran.
class BlokSecimEkrani extends StatefulWidget {
  const BlokSecimEkrani({super.key});

  @override
  State<BlokSecimEkrani> createState() => _BlokSecimEkraniState();
}

class _BlokSecimEkraniState extends State<BlokSecimEkrani> {
  int seciliIndex = 0; // başta A Blok (0) seçili

  // Kullanıcı "Detaylar"a basınca seçtiği blok ve kat burada saklanır.
  // İkisi de boşsa (null) henüz seçim yapılmamış demektir.
  Alan? hedefAlan;
  Kat? hedefKat;

  // Sayfayı en üste kaydırabilmek için
  final ScrollController kaydirma = ScrollController();

  @override
  void dispose() {
    kaydirma.dispose();
    super.dispose();
  }

  // Kat seçimi sayfasına geç. "await": o sayfalardan geri dönülmesini bekler.
  Future<void> katSayfasinaGit(Alan alan) async {
    final secilenKat = await Navigator.push<Kat>(
      context,
      MaterialPageRoute(builder: (context) => KatSecimEkrani(alan: alan)),
    );
    // Kullanıcı "Detaylar"a basarak döndüyse bir kat gelir.
    // Geri okuyla döndüyse hiçbir şey (null) gelir.
    if (secilenKat != null && mounted) {
      setState(() {
        hedefAlan = alan;
        hedefKat = secilenKat;
      });
      // Bilgi kutusu görünsün diye sayfanın en üstüne kaydır
      kaydirma.animateTo(
        0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    }
  }

  // Bir karta dokunulunca
  void karttaSec(int i) {
    final alan = alanlar[i];
    setState(() {
      seciliIndex = i;
      // Başka bir karta geçildiyse eski seçim (yazı + buton) silinsin
      if (hedefAlan != alan) {
        hedefAlan = null;
        hedefKat = null;
      }
    });
    // Katı olmayan alan (Kış Bahçesi): kat seçmeye gerek yok,
    // dokunulduğu an hedef olarak seçilsin.
    if (alan.katlar.isEmpty) {
      setState(() {
        hedefAlan = alan;
        // Emre'nin sayfası her zaman bir "kat" beklediği için
        // alanın kendisini tek katmış gibi gönderiyoruz.
        hedefKat = Kat('Sosyal Alan', alan.gorsel);
      });
      kaydirma.animateTo(
        0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    }
  }

  // Yeşil "Canlı Navigasyona Aktar" butonu: Emre'nin sayfasını açar
  void yonlendir() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetaylarEkrani(alan: hedefAlan!, kat: hedefKat!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Seçim yapıldıysa en altta ortada yeşil "Yönlendir" butonu çıksın
      bottomNavigationBar: (hedefAlan != null && hedefKat != null)
          ? YonlendirCubugu(onYonlendir: yonlendir)
          : null,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: ListView(
              controller: kaydirma,
              padding: const EdgeInsets.all(16),
              children: [
                const UstBaslik(),
                const SizedBox(height: 12),
                // Seçim yapıldıysa "B Blok 3. Katı seçtiniz" bilgisi
                if (hedefAlan != null && hedefKat != null) ...[
                  SecimBilgisi(alan: hedefAlan!, kat: hedefKat!),
                  const SizedBox(height: 12),
                ],
                const AdimCubugu(),
                const SizedBox(height: 16),
                const BaslangicKarti(),
                const SizedBox(height: 16),
                const KampusHaritasi(),
                const SizedBox(height: 24),
                BolumBasligi(konumSayisi: alanlar.length),
                const SizedBox(height: 12),
                for (int i = 0; i < alanlar.length; i++)
                  AlanKarti(
                    alan: alanlar[i],
                    secili: i == seciliIndex,
                    // Karta dokununca o kart seçili olsun
                    onSec: () => karttaSec(i),
                    // Butona basınca hem seç hem kat sayfasına git
                    onKatSecimi: () {
                      karttaSec(i);
                      katSayfasinaGit(alanlar[i]);
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ==================== 1) LOGO VE BAŞLIK ====================
class UstBaslik extends StatelessWidget {
  const UstBaslik({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: koyuLacivert,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.navigation, color: Colors.white, size: 22),
        ),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'KampüsNav',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: koyuLacivert,
              ),
            ),
            Text(
              'Blok ve Alan Seçimi',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: anaYesil,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ==================== 2) ADIM ÇUBUĞU ====================
class AdimCubugu extends StatelessWidget {
  const AdimCubugu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: anaYesil,
              shape: BoxShape.circle,
            ),
            child: const Text(
              '1',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Adım 1 / 3: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: 'Hedef Blok veya Alan'),
                ],
              ),
              style: TextStyle(fontSize: 13, color: koyuLacivert),
            ),
          ),
          _cizgi(24, anaYesil),
          const SizedBox(width: 4),
          _cizgi(10, Colors.grey.shade300),
          const SizedBox(width: 4),
          _cizgi(10, Colors.grey.shade300),
        ],
      ),
    );
  }

  Widget _cizgi(double genislik, Color renk) {
    return Container(
      width: genislik,
      height: 5,
      decoration: BoxDecoration(
        color: renk,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

// ==================== 3) BAŞLANGIÇ NOKTASI ====================
class BaslangicKarti extends StatelessWidget {
  const BaslangicKarti({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: acikMavi,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: acikYesil,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.my_location, color: anaYesil, size: 22),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BAŞLANGIÇ NOKTASI •',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: anaYesil,
                    letterSpacing: 0.8,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Kampüs Ana Giriş Nizamiyesi',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: koyuLacivert,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Tüm yönlendirmeler bu konumdan başlar.',
                  style: TextStyle(fontSize: 12, color: griYazi),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== 4) HARİTA ====================
class KampusHaritasi extends StatelessWidget {
  const KampusHaritasi({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 180,
        child: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                initialCenter: kampusMerkezi,
                initialZoom: 16,
                interactionOptions: const InteractionOptions(
                  flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
                ),
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.kampus_blok_secim',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: kampusMerkezi,
                      width: 40,
                      height: 40,
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              left: 10,
              right: 10,
              bottom: 18,
              child: Row(
                children: [
                  Expanded(child: _blokKutusu('A Blok')),
                  const SizedBox(width: 6),
                  Expanded(child: _blokKutusu('B Blok')),
                  const SizedBox(width: 6),
                  Expanded(child: _blokKutusu('C Blok')),
                ],
              ),
            ),
            const Positioned(
              right: 6,
              bottom: 2,
              child: Text(
                '© OpenStreetMap',
                style: TextStyle(fontSize: 9, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _blokKutusu(String blok) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
      ),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: anaYesil,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              blok,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: koyuLacivert,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== 5) BÖLÜM BAŞLIĞI ====================
class BolumBasligi extends StatelessWidget {
  final int konumSayisi;

  const BolumBasligi({super.key, required this.konumSayisi});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'Mevcut Bloklar & Alanlar',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: koyuLacivert,
            ),
          ),
        ),
        Text(
          '$konumSayisi Konum',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: griYazi,
          ),
        ),
      ],
    );
  }
}

// ==================== 6) ALAN KARTI ====================
class AlanKarti extends StatelessWidget {
  final Alan alan;
  final bool secili;
  final VoidCallback onSec; // karta dokunulunca
  final VoidCallback onKatSecimi; // "Kat Seçimi Yap" butonuna basılınca

  const AlanKarti({
    super.key,
    required this.alan,
    required this.secili,
    required this.onSec,
    required this.onKatSecimi,
  });

  @override
  Widget build(BuildContext context) {
    // GestureDetector: kartın her yerini dokunulabilir yapar
    return GestureDetector(
      onTap: onSec,
      child: Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: secili ? anaYesil : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    _rozet(
                      yazi: alan.kategori,
                      arkaPlan: acikGri,
                      yaziRengi: koyuLacivert,
                    ),
                  ],
                ),
              ),
              _secimDairesi(),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  alan.gorsel,
                  width: 76,
                  height: 76,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 76,
                    height: 76,
                    color: alan.gorselRenk,
                    child: Icon(alan.gorselIkon, color: Colors.white, size: 34),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      alan.baslik,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: koyuLacivert,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      alan.altBilgi,
                      style: const TextStyle(fontSize: 12, color: griYazi),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final ozellik in alan.ozellikler) _ozellikEtiketi(ozellik),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Text(
                  alan.altSatir,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: koyuLacivert,
                  ),
                ),
              ),
              // Katı olmayan alanda (Kış Bahçesi) buton gösterme
              if (alan.katlar.isNotEmpty)
              FilledButton(
                onPressed: onKatSecimi,
                style: FilledButton.styleFrom(
                  backgroundColor: secili ? anaYesil : acikMaviButon,
                  foregroundColor: secili ? Colors.white : koyuLacivert,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(alan.butonYazisi),
                    const SizedBox(width: 4),
                    const Icon(Icons.arrow_forward, size: 16),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }

  Widget _rozet({
    IconData? ikon,
    required String yazi,
    required Color arkaPlan,
    required Color yaziRengi,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: arkaPlan,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (ikon != null) ...[
            Icon(ikon, size: 12, color: yaziRengi),
            const SizedBox(width: 4),
          ],
          Text(
            yazi,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: yaziRengi,
            ),
          ),
        ],
      ),
    );
  }

  Widget _secimDairesi() {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: secili ? anaYesil : acikMaviButon,
        shape: BoxShape.circle,
      ),
      child: secili
          ? const Icon(Icons.check, size: 16, color: Colors.white)
          : null,
    );
  }

  Widget _ozellikEtiketi(Ozellik ozellik) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE2E8F0)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(ozellik.ikon, size: 13, color: griYazi),
          const SizedBox(width: 4),
          Text(
            ozellik.yazi,
            style: const TextStyle(fontSize: 11, color: koyuLacivert),
          ),
        ],
      ),
    );
  }
}
// ==================== 7) KAT SEÇİM EKRANI ====================
// "Kat Seçimi Yap" butonuna basınca açılan sayfa: bloğun katları alt alta buton olarak.
class KatSecimEkrani extends StatelessWidget {
  final Alan alan;

  const KatSecimEkrani({super.key, required this.alan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: sayfaArkaPlan,
        foregroundColor: koyuLacivert,
        title: Text(
          '${alan.kisaAd} • Kat Seçimi',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                alan.baslik,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: koyuLacivert,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${alan.katlar.length} kat • Görmek istediğin kata dokun',
                style: const TextStyle(fontSize: 12, color: griYazi),
              ),
              const SizedBox(height: 16),
              // Bloğun her katı için bir buton oluştur
              for (final kat in alan.katlar)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: FilledButton(
                    onPressed: () async {
                      final secilen = await Navigator.push<Kat>(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              KatPlaniEkrani(alan: alan, kat: kat),
                        ),
                      );
                      // "Detaylar"a basıldıysa bu sayfayı da kapatıp
                      // seçilen katı ana sayfaya gönder
                      if (secilen != null && context.mounted) {
                        Navigator.pop(context, secilen);
                      }
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: koyuLacivert,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.layers, color: anaYesil),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            kat.ad,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Icon(Icons.arrow_forward, size: 18),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== 8) KAT PLANI EKRANI ====================
// Bir kata basınca o katın fotoğrafını gösterir. Parmakla / fareyle yakınlaştırılabilir.
class KatPlaniEkrani extends StatelessWidget {
  final Alan alan;
  final Kat kat;

  const KatPlaniEkrani({super.key, required this.alan, required this.kat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Sayfanın en altında sabit duran "Seçilen Hedef + Detaylar" çubuğu
      bottomNavigationBar: DetaylarCubugu(alan: alan, kat: kat),
      appBar: AppBar(
        backgroundColor: sayfaArkaPlan,
        foregroundColor: koyuLacivert,
        title: Text(
          '${alan.kisaAd} • ${kat.ad}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        // InteractiveViewer: yakınlaştırma ve kaydırma sağlar
        child: InteractiveViewer(
          maxScale: 5,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset(
              kat.gorsel,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Text(
                'Fotoğraf bulunamadı:\n${kat.gorsel}',
                textAlign: TextAlign.center,
                style: const TextStyle(color: griYazi),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ==================== 9) ALTTAKİ "DETAYLAR" ÇUBUĞU ====================
// Kat planı sayfasının en altında durur. Yeşil "Seçimi Onayla" butonu
// kullanıcıyı ana sayfaya geri götürür ve seçilen katı oraya iletir.
class DetaylarCubugu extends StatelessWidget {
  final Alan alan;
  final Kat kat;

  const DetaylarCubugu({super.key, required this.alan, required this.kat});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 12)],
      ),
      child: SafeArea(
        top: false,
        child: Center(
          heightFactor: 1,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // "● SEÇİLEN HEDEF"
                  Row(
                    children: [
                      Container(
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(
                          color: anaYesil,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Expanded(
                        child: Text(
                          'SEÇİLEN HEDEF',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: anaYesil,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${alan.kisaAd} • ${kat.ad}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: koyuLacivert,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Tam genişlikte yeşil "Seçimi Onayla" butonu
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        // Bu sayfayı kapat ve seçilen katı geri gönder.
                        // (Kat listesi de kapanır ve ana sayfaya dönülür.)
                        Navigator.pop(context, kat);
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: anaYesil,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check_circle_outline, size: 20),
                          SizedBox(width: 8),
                          Text(
                            'Seçimi Onayla',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(Icons.arrow_forward, size: 18),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ==================== 10) "... SEÇTİNİZ" BİLGİ KUTUSU ====================
// Ana sayfanın üstünde, kullanıcının seçtiği blok ve katı gösterir.
class SecimBilgisi extends StatelessWidget {
  final Alan alan;
  final Kat kat;

  const SecimBilgisi({super.key, required this.alan, required this.kat});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: acikYesil,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: anaYesil, width: 1.2),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: anaYesil, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              // Bloklarda: "B Blok 3. Katı seçtiniz"
              // Katı olmayan alanda: "Kış Bahçesini seçtiniz"
              alan.katlar.isEmpty
                  ? '${alan.kisaAd}ni seçtiniz'
                  : '${alan.kisaAd} ${kat.ad}ı seçtiniz',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: anaYesil,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== 11) ALTTAKİ YEŞİL "YÖNLENDİR" BUTONU ====================
// Ana sayfanın en altında, ortada durur. Emre'nin sayfasını açar.
class YonlendirCubugu extends StatelessWidget {
  final VoidCallback onYonlendir;

  const YonlendirCubugu({super.key, required this.onYonlendir});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 12)],
      ),
      child: SafeArea(
        top: false,
        child: Center(
          heightFactor: 1,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: onYonlendir,
                  style: FilledButton.styleFrom(
                    backgroundColor: anaYesil,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.directions, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Canlı Navigasyona Aktar',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.arrow_forward, size: 18),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
