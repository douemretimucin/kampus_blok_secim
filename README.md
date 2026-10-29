# KampüsNav – Blok ve Alan Seçimi

İstanbul Gedik Üniversitesi **Kartal Kampüsü** için hazırlanan kampüs navigasyon
uygulamasının (Proje 3) **blok, kat ve alan seçimi** ekranı. Flutter ile yazıldı.

## Ekip

| Kişi | Görev |
|---|---|
| Arda | Hoş geldin / giriş ana sayfası |
| Doğu | Blok, kat ve alan seçimi (bu proje) |
| Emre | Canlı navigasyon / detay sayfası (`lib/detaylar_ekrani.dart`) |

## Uygulama akışı

1. **Ana sayfa:** Logo, adım çubuğu, başlangıç noktası (Ana Giriş Nizamiyesi),
   kampüs haritası (OpenStreetMap) ve blok/alan kartları.
2. Kullanıcı bir **blok kartına** (A, B, C) dokunur ve **Kat Seçimi Yap**'a basar.
3. Bloğun **katları** listelenir; bir kata basınca o katın tabela fotoğrafı açılır
   (yakınlaştırılabilir).
4. **Seçimi Onayla** butonu kullanıcıyı ana sayfaya döndürür; üstte
   *"B Blok 3. Katı seçtiniz"* gibi bir bilgi çıkar.
5. **Kış Bahçesi** kartına dokunmak onu doğrudan seçer (katı yoktur).
6. En alttaki yeşil **Canlı Navigasyona Aktar** butonu Emre'nin sayfasını açar ve
   seçilen blok + katı ona gönderir.

## Bloklar

| Blok | Fakülte | Katlar |
|---|---|---|
| A Blok | Rektörlük & Hukuk Fakültesi | -1, 1–9 |
| B Blok | Mimarlık & Güzel Sanatlar Fakültesi | -1, 1–8 |
| C Blok | Mühendislik Fakültesi | -1, 1–6 |
| Kış Bahçesi | Sosyal alan | – |

## Dosyalar

```
lib/
  main.dart             -> Doğu'nun ekranları (ana sayfa, kat listesi, kat planı)
  modeller.dart         -> Ortak veri kalıpları: Ozellik, Kat, Alan
  detaylar_ekrani.dart  -> Emre'nin sayfası (DetaylarEkrani)
assets/images/
  a_blok.png, b_blok.png, c_blok.png, kis_bahcesi.png  -> bina fotoğrafları
  A1.png ... C6.png, B-1.jpeg, C-1.jpeg, Z-1.png        -> kat tabelaları
```

> Not: A Blok'un -1. katının dosya adı `Z-1.png`'dir (A Blok'a özel isimlendirme).

## Emre için

- Dosyan: **`lib/detaylar_ekrani.dart`**. En üstteki açıklama sayfaya gelen
  bilgileri anlatıyor.
- `DetaylarEkrani({required this.alan, required this.kat})` imzasını değiştirme;
  ana sayfadaki buton bu isimle çağırıyor.
- Kış Bahçesi seçildiğinde `alan.katlar.isEmpty == true` ve `kat.ad == "Sosyal Alan"`.

## Çalıştırma

```bash
flutter pub get
flutter run -d chrome
```

Test: `flutter test`

Harita verisi: © OpenStreetMap katkıcıları.
