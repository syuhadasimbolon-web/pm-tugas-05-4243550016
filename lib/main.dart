import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const DapurMedanApp());
}

class DapurMedanApp extends StatelessWidget {
  const DapurMedanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dapur Medan Kita',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB45309)),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB45309),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const HalamanMenu(),
    );
  }
}

class HalamanMenu extends StatelessWidget {
  const HalamanMenu({super.key});

  void _pesan(BuildContext context, String pesan) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(pesan)));
  }

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dapur Medan Kita'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Informasi',
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              _pesan(context, 'UMKM Kuliner Medan');
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // BAGIAN HEADER
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=1200',
                  height: 190,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return SizedBox(
                      height: 190,
                      child: Center(
                        child: Icon(
                          Icons.restaurant,
                          size: 90,
                          color: warna.primary,
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        'DAPUR MEDAN KITA',
                        style: teks.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Cita rasa khas Medan, nikmat di setiap suapan.',
                        style: teks.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      FilledButton.icon(
                        onPressed: () {
                          _pesan(
                            context,
                            'Selamat datang di Dapur Medan Kita!',
                          );
                        },
                        icon: const Icon(Icons.restaurant_menu),
                        label: const Text('Lihat Menu Favorit'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // BAGIAN KONTAK
          Text('Informasi Usaha', style: teks.titleLarge),
          const SizedBox(height: 8),

          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.location_on_outlined),
                  title: const Text('Medan, Sumatera Utara'),
                  subtitle: const Text('Alamat usaha'),
                  onTap: () {
                    _pesan(context, 'Lokasi usaha: Medan');
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.phone_outlined),
                  title: const Text('0812-0000-0000'),
                  subtitle: const Text('Nomor kontak contoh'),
                  onTap: () {
                    _pesan(context, 'Kontak usaha dipilih');
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.access_time),
                  title: const Text('09.00 - 21.00 WIB'),
                  subtitle: const Text('Jam operasional'),
                  onTap: () {
                    _pesan(context, 'Buka setiap hari');
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // BAGIAN DAFTAR MENU
          Text('Daftar Menu', style: teks.titleLarge),
          const SizedBox(height: 8),

          const KartuMenu(
            nama: 'Nasi Goreng Medan',
            harga: 'Rp25.000',
            kategori: 'Makanan',
            ikon: Icons.rice_bowl,
          ),
          const KartuMenu(
            nama: 'Mie Gomak',
            harga: 'Rp20.000',
            kategori: 'Makanan',
            ikon: Icons.ramen_dining,
          ),
          const KartuMenu(
            nama: 'Soto Medan',
            harga: 'Rp28.000',
            kategori: 'Makanan',
            ikon: Icons.soup_kitchen,
          ),
          const KartuMenu(
            nama: 'Es Teh Manis',
            harga: 'Rp8.000',
            kategori: 'Minuman',
            ikon: Icons.local_drink,
          ),

          const SizedBox(height: 16),

          OutlinedButton.icon(
            onPressed: () {
              _pesan(context, 'Terima kasih sudah melihat menu kami!');
            },
            icon: const Icon(Icons.thumb_up_outlined),
            label: const Text('Suka Menu Kami?'),
          ),

          const SizedBox(height: 8),

          TextButton(
            onPressed: () {
              _pesan(context, 'Dibuat oleh Syuhada Simbolon - 4243550016');
            },
            child: const Text('Tentang Pengembang'),
          ),
        ],
      ),
    );
  }
}

// WIDGET STATELESS UNTUK KARTU MENU
class KartuMenu extends StatelessWidget {
  final String nama;
  final String harga;
  final String kategori;
  final IconData ikon;

  const KartuMenu({
    super.key,
    required this.nama,
    required this.harga,
    required this.kategori,
    required this.ikon,
  });

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: warna.primaryContainer,
              child: Icon(ikon, color: warna.onPrimaryContainer),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(nama, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(harga),
                  const SizedBox(height: 6),
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

// WIDGET STATEFUL KHUSUS TOMBOL FAVORIT
class TombolFavorit extends StatefulWidget {
  final String namaMenu;

  const TombolFavorit({super.key, required this.namaMenu});

  @override
  State<TombolFavorit> createState() => _TombolFavoritState();
}

class _TombolFavoritState extends State<TombolFavorit> {
  bool _favorit = false;

  void _ubahFavorit() {
    setState(() {
      _favorit = !_favorit;
    });

    ScaffoldMessenger.of(context).showSnackBar(
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
    return IconButton(
      tooltip: _favorit ? 'Hapus favorit' : 'Tambah favorit',
      onPressed: _ubahFavorit,
      icon: Icon(_favorit ? Icons.favorite : Icons.favorite_border),
      color: _favorit
          ? Theme.of(context).colorScheme.error
          : Theme.of(context).colorScheme.onSurfaceVariant,
    );
  }
}
