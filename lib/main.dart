import 'package:material_ui/material_ui.dart';

import 'data.dart';
import 'widgets/kartu_menu.dart';

void main() => runApp(const UmkmApp());

// Satu-satunya warna yang ditulis langsung: seed color.
const _benih = Color(0xFFB23A00);

// Ganti dengan foto usaha Anda (Image.asset) atau URL gambar lain.
const _urlGambar = 'https://picsum.photos/id/292/800/450';

class UmkmApp extends StatelessWidget {
  const UmkmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warung Soto Kesawan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: _benih)),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: _benih,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system, // ikuti pengaturan ponsel
      home: const HalamanMenu(),
    );
  }
}

class HalamanMenu extends StatelessWidget {
  const HalamanMenu({super.key});

  void _pesan(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pesanan dikirim (simulasi)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final teks = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Warung Soto Kesawan')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _KepalaUsaha(),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: () => _pesan(context),
                        icon: const Icon(Icons.shopping_bag_outlined),
                        label: const Text('Pesan'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.map_outlined),
                        label: const Text('Lokasi'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const _KartuKontak(),
                const SizedBox(height: 24),
                Text('Daftar Menu', style: teks.titleLarge),
                const SizedBox(height: 8),
                for (final m in daftarMenu)
                  KartuMenu(nama: m.nama, harga: m.harga, kategori: m.kategori),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _pesan(context),
        icon: const Icon(Icons.phone),
        label: const Text('Hubungi'),
      ),
    );
  }
}

class _KepalaUsaha extends StatelessWidget {
  const _KepalaUsaha();

  @override
  Widget build(BuildContext context) {
    final teks = Theme.of(context).textTheme;
    final skema = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              _urlGambar,
              fit: BoxFit.cover,
              // Bila gambar gagal dimuat (offline), tampilkan ikon pengganti
              errorBuilder: (context, error, stack) => ColoredBox(
                color: skema.primaryContainer,
                child: Icon(
                  Icons.restaurant,
                  size: 64,
                  color: skema.onPrimaryContainer,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text('Warung Soto Kesawan', style: teks.headlineSmall),
        const SizedBox(height: 4),
        Text(
          'Kuliner khas Medan sejak 2005: soto, mie gomak, dan jajanan '
          'tradisional dengan cita rasa rumahan.',
          style: teks.bodyMedium?.copyWith(color: skema.onSurfaceVariant),
        ),
      ],
    );
  }
}

class _KartuKontak extends StatelessWidget {
  const _KartuKontak();

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.location_on_outlined),
            title: Text('Jl. Contoh No. 1, Kesawan, Medan'),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.phone_outlined),
            title: Text('+62 812-0000-0000'),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text('Buka setiap hari, 07.00–21.00 WIB'),
          ),
        ],
      ),
    );
  }
}