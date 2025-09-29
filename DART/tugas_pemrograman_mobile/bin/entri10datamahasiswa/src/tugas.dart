import 'dart:io';

class Mahasiswa {
  String nama;
  String npm;
  String jurusan;

  Mahasiswa(this.nama, this.npm, this.jurusan);
}

void main() {
  List<Mahasiswa> daftarMahasiswa = [];

  print("=== Entry Data Mahasiswa ===");
  for (int i = 1; i <= 10; i++) {
    print("\nMahasiswa ke-$i");
    stdout.write("Nama    : ");
    String nama = stdin.readLineSync()!;
    stdout.write("NPM     : ");
    String npm = stdin.readLineSync()!;
    stdout.write("Jurusan : ");
    String jurusan = stdin.readLineSync()!;

    daftarMahasiswa.add(Mahasiswa(nama, npm, jurusan));
  }

  print("\n=== Pencarian Data Mahasiswa ===");
  stdout.write("Masukkan NPM yang ingin dicari: ");
  String cariNpm = stdin.readLineSync()!;

  bool ditemukan = false;
  for (var mhs in daftarMahasiswa) {
    if (mhs.npm == cariNpm) {
      print("\nData ditemukan!");
      print("Nama    : ${mhs.nama}");
      print("NPM     : ${mhs.npm}");
      print("Jurusan : ${mhs.jurusan}");
      ditemukan = true;
      break;
    }
  }

  if (!ditemukan) {
    print("\nData tidak ditemukan.");
  }
}
