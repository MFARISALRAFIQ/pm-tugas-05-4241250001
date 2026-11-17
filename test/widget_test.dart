import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:menu_umkm/main.dart';

void main() {
  testWidgets('Menekan tombol favorit mengubah ikon dan menampilkan SnackBar',
      (tester) async {
    await tester.pumpWidget(const UmkmApp());

    final tombol = find.byIcon(Icons.favorite_border).first;
    await tester.ensureVisible(tombol); // tombol bisa di luar layar uji
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.favorite), findsNothing);

    await tester.tap(tombol);
    await tester.pump();

    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.textContaining('ditambahkan ke favorit'), findsOneWidget);
  });
}