/// Model satu menu. Immutable, jadi bisa dibuat const.
class Menu {
  const Menu({required this.nama, required this.harga, required this.kategori});

  final String nama;
  final int harga;
  final String kategori;
}

const daftarMenu = <Menu>[
  Menu(nama: 'Soto Medan', harga: 28000, kategori: 'Makanan'),
  Menu(nama: 'Mie Gomak', harga: 30000, kategori: 'Makanan'),
  Menu(nama: 'Lontong Medan', harga: 25000, kategori: 'Makanan'),
  Menu(nama: 'Bika Ambon', harga: 15000, kategori: 'Kue'),
  Menu(nama: 'Teh Tarik Medan', harga: 12000, kategori: 'Minuman'),
];

extension Rupiah on int {
  /// 28000 -> Rp28.000
  String get rupiah {
    final pola = RegExp(r'\B(?=(\d{3})+(?!\d))');
    return 'Rp${toString().replaceAllMapped(pola, (m) => '.')}';
  }
}