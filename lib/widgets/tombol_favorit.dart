import 'package:material_ui/material_ui.dart';

/// STATEFUL: hanya widget kecil ini yang menyimpan data yang berubah
/// (status favorit). Bagian lain halaman tetap Stateless.
class TombolFavorit extends StatefulWidget {
  const TombolFavorit({super.key, required this.namaMenu});

  final String namaMenu;

  @override
  State<TombolFavorit> createState() => _TombolFavoritState();
}

class _TombolFavoritState extends State<TombolFavorit> {
  bool _favorit = false; // state: hidup di objek State

  void _alih() {
    setState(() => _favorit = !_favorit);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            _favorit
                ? '${widget.namaMenu} ditambahkan ke favorit'
                : '${widget.namaMenu} dihapus dari favorit',
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;
    return IconButton(
      tooltip: _favorit ? 'Hapus dari favorit' : 'Tambah ke favorit',
      onPressed: _alih,
      icon: Icon(
        _favorit ? Icons.favorite : Icons.favorite_border,
        color: _favorit ? skema.error : null, // warna dari tema
      ),
    );
  }
}