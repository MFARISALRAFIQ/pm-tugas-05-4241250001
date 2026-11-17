import 'package:material_ui/material_ui.dart';

import '../data.dart';
import 'tombol_favorit.dart';

/// STATELESS: tampilan hanya bergantung pada parameter nama, harga, kategori.
class KartuMenu extends StatelessWidget {
  const KartuMenu({
    super.key,
    required this.nama,
    required this.harga,
    required this.kategori,
  });

  final String nama;
  final int harga;
  final String kategori;

  @override
  Widget build(BuildContext context) {
    final teks = Theme.of(context).textTheme;
    final skema = Theme.of(context).colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(nama, style: teks.titleMedium),
                  const SizedBox(height: 4),
                  Text(
                    harga.rupiah,
                    style: teks.bodyLarge?.copyWith(color: skema.primary),
                  ),
                  const SizedBox(height: 8),
                  Chip(label: Text(kategori)),
                ],
              ),
            ),
            TombolFavorit(namaMenu: nama),
          ],
        ),
      ),
    );
  }
}