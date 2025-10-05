import 'dart:io';

class Dosen {
  String nama;
  String nip;
  String jurusan;

  Dosen(this.nama, this.nip, this.jurusan);
}

class Mahasiswa {
  String nama;
  String nim;
  String jurusan;
  String kelas;
  int angkatan;
  Dosen pa; // Pembimbing Akademik

  Mahasiswa(
    this.nama,
    this.nim,
    this.jurusan,
    this.kelas,
    this.angkatan,
    this.pa,
  );
}

void main() {
  List<Dosen> daftarDosen = [];
  List<Mahasiswa> daftarMahasiswa = [];

  while (true) {
    print("\n=== SISTEM DATA MAHASISWA & DOSEN ===");
    print("1. Entry Data Dosen");
    print("2. Entry Data Mahasiswa");
    print("3. Lihat Semua Mahasiswa");
    print("4. Cari Mahasiswa");
    print("5. Keluar");
    stdout.write("Pilih menu (1-5): ");
    String? pilih = stdin.readLineSync();

    switch (pilih) {
      case '1':
        entryDataDosen(daftarDosen);
        break;
      case '2':
        if (daftarDosen.isEmpty) {
          print("⚠️ Belum ada data dosen. Silakan input dulu di menu 1.");
        } else {
          entryDataMahasiswa(daftarMahasiswa, daftarDosen);
        }
        break;
      case '3':
        tampilkanSemuaMahasiswa(daftarMahasiswa);
        break;
      case '4':
        cariMahasiswa(daftarMahasiswa);
        break;
      case '5':
        print("Terima kasih! Program selesai.");
        return;
      default:
        print("Pilihan tidak valid. Coba lagi.");
    }
  }
}

void entryDataDosen(List<Dosen> daftarDosen) {
  print("\n=== ENTRY DATA DOSEN ===");
  stdout.write("Nama Dosen : ");
  String nama = stdin.readLineSync()!;
  stdout.write("NIP         : ");
  String nip = stdin.readLineSync()!;
  stdout.write("Jurusan     : ");
  String jurusan = stdin.readLineSync()!;

  daftarDosen.add(Dosen(nama, nip, jurusan));
  print("✅ Dosen berhasil ditambahkan!");
}

void entryDataMahasiswa(
  List<Mahasiswa> daftarMahasiswa,
  List<Dosen> daftarDosen,
) {
  print("\n=== ENTRY DATA MAHASISWA ===");
  stdout.write("Nama Mahasiswa : ");
  String nama = stdin.readLineSync()!;
  stdout.write("NIM            : ");
  String nim = stdin.readLineSync()!;
  stdout.write("Jurusan        : ");
  String jurusan = stdin.readLineSync()!;
  stdout.write("Kelas          : ");
  String kelas = stdin.readLineSync()!;
  stdout.write("Angkatan       : ");
  int angkatan = int.parse(stdin.readLineSync()!);

  print("\n--- Pilih Dosen PA ---");
  for (int i = 0; i < daftarDosen.length; i++) {
    print("${i + 1}. ${daftarDosen[i].nama} (${daftarDosen[i].jurusan})");
  }
  stdout.write("Pilih nomor PA: ");
  int index = int.parse(stdin.readLineSync()!) - 1;
  Dosen pa = daftarDosen[index];

  daftarMahasiswa.add(Mahasiswa(nama, nim, jurusan, kelas, angkatan, pa));
  print("✅ Mahasiswa berhasil ditambahkan!");
}

void tampilkanSemuaMahasiswa(List<Mahasiswa> daftarMahasiswa) {
  if (daftarMahasiswa.isEmpty) {
    print("Belum ada data mahasiswa.");
    return;
  }

  print("\n=== DAFTAR MAHASISWA ===");
  for (var m in daftarMahasiswa) {
    print("""
Nama     : ${m.nama}
NIM      : ${m.nim}
Jurusan  : ${m.jurusan}
Kelas    : ${m.kelas}
Angkatan : ${m.angkatan}
PA       : ${m.pa.nama}
===============================""");
  }
}

void cariMahasiswa(List<Mahasiswa> daftarMahasiswa) {
  if (daftarMahasiswa.isEmpty) {
    print("Belum ada data mahasiswa.");
    return;
  }

  stdout.write("\nMasukkan nama / NIM / jurusan: ");
  String keyword = stdin.readLineSync()!.toLowerCase();

  var hasil = daftarMahasiswa.where(
    (m) =>
        m.nama.toLowerCase().contains(keyword) ||
        m.nim.toLowerCase().contains(keyword) ||
        m.jurusan.toLowerCase().contains(keyword),
  );

  if (hasil.isEmpty) {
    print(" Tidak ditemukan data mahasiswa.");
  } else {
    print("\n=== HASIL PENCARIAN ===");
    for (var m in hasil) {
      print("""
Nama     : ${m.nama}
NIM      : ${m.nim}
Jurusan  : ${m.jurusan}
Kelas    : ${m.kelas}
Angkatan : ${m.angkatan}
PA       : ${m.pa.nama}
===============================""");
    }
  }
}
