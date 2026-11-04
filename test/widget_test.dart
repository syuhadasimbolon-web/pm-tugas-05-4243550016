import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:pm_tugas_05_4243550016/main.dart';

void main() {
  testWidgets('Tombol favorit berubah setelah ditekan', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: KartuMenu(
            nama: 'Nasi Goreng Medan',
            harga: 'Rp25.000',
            kategori: 'Makanan',
            ikon: Icons.rice_bowl,
          ),
        ),
      ),
    );

    // Sebelum ditekan, ikon hati masih kosong.
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);

    // Tekan tombol favorit.
    await tester.tap(find.byTooltip('Tambah favorit'));
    await tester.pump();

    // Setelah ditekan, ikon hati menjadi penuh.
    expect(find.byIcon(Icons.favorite), findsOneWidget);

    // Pesan konfirmasi muncul.
    expect(
      find.text('Nasi Goreng Medan ditambahkan ke favorit'),
      findsOneWidget,
    );

    // Tekan lagi untuk membatalkan favorit.
    await tester.tap(find.byTooltip('Hapus favorit'));
    await tester.pump();

    // Ikon kembali menjadi hati kosong.
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
  });
}
