// ==================== ORTAK VERİ KALIPLARI ====================
// Bu dosya hem Doğu'nun ekranı (main.dart) hem Emre'nin ekranı
// (detaylar_ekrani.dart) tarafından kullanılır.
import 'package:flutter/material.dart';

class Ozellik {
  final IconData ikon;
  final String yazi;

  const Ozellik(this.ikon, this.yazi);
}

// Bir katın adı ve o katın tabela/plan fotoğrafı
class Kat {
  final String ad; // "1. Kat", "Zemin Kat", "-1. Kat"
  final String gorsel; // "assets/images/A1.png"

  const Kat(this.ad, this.gorsel);
}

class Alan {
  final String kisaAd; // "A Blok" (kat sayfasının başlığında)
  final List<Kat> katlar; // boşsa "Kat Seçimi Yap" butonu çıkmaz
  final String baslik;
  final String altBilgi;
  final String kategori;
  final String gorsel;
  final IconData gorselIkon;
  final Color gorselRenk;
  final List<Ozellik> ozellikler;
  final String altSatir;
  final String butonYazisi;

  const Alan({
    required this.kisaAd,
    required this.katlar,
    required this.baslik,
    required this.altBilgi,
    required this.kategori,
    required this.gorsel,
    required this.gorselIkon,
    required this.gorselRenk,
    required this.ozellikler,
    required this.altSatir,
    required this.butonYazisi,
  });
}
