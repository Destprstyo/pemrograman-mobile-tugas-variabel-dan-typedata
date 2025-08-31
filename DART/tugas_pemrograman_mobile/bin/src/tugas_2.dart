import 'dart:io';

void main(List<String> arguments) {
  // Input nama karyawan
  stdout.write("Masukkan nama karyawan: ");
  String nama = stdin.readLineSync() ?? "";

  // Input jumlah jam kerja
  stdout.write("Masukkan jumlah jam kerja per minggu: ");
  int jamKerja = int.parse(stdin.readLineSync() ?? "0");

  // Input upah per jam
  stdout.write("Masukkan upah per jam: ");
  double upahPerJam = double.parse(stdin.readLineSync() ?? "0");

  // Input status karyawan
  stdout.write("Status karyawan tetap? (y/n): ");
  String statusInput = stdin.readLineSync() ?? "n";
  bool statusTetap = statusInput.toLowerCase() == "y";

  // Hitung gaji kotor
  double gajiKotor = jamKerja * upahPerJam;

  // Hitung pajak
  double pajak = statusTetap ? gajiKotor * 0.10 : gajiKotor * 0.05;

  // Hitung gaji bersih
  double gajiBersih = gajiKotor - pajak;

  // Tampilkan hasil
  print("\n=== Hasil Perhitungan Gaji ===");
  print("Nama Karyawan : $nama");
  print("Gaji Kotor    : Rp${gajiKotor.toStringAsFixed(2)}");
  print("Pajak         : Rp${pajak.toStringAsFixed(2)}");
  print("Gaji Bersih   : Rp${gajiBersih.toStringAsFixed(2)}");
}
