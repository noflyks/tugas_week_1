void main() {
  List<int> listData = [
    3,
    18,
    45,
    16,
    2,
    5,
    7,
    9,
    10,
    1,
    16,
    11,
    4,
    8,
    11,
    16,
    32,
    56
  ];

  print("Tugas Week 1\n\nData Sebelum Di Urutkan\n$listData\n");

  print("Mengurutkan dari nilai terkecil ke terbesar");
  print(mengurutkanDariKecilKeBesar(listData));

  print("\nMengurutkan dari nilai terbesar ke terkecil");
  print(mengurutkanDariBesarKeKecil(listData));

  print("\nNilai rata-rata dari data");
  print(mean(listData));

  print("\nMencari nilai tengah");
  print(median(listData));

  print("\nMencari nilai yang sering muncul");
  print(modus(listData));
}

mengurutkanDariKecilKeBesar(List<int> data) {
  for (int i = 0; i < data.length; i++) {
    for (int j = 0; j < data.length - 1; j++) {
      if (data[j] > data[j + 1]) {
        int num = data[j];
        data[j] = data[j + 1];
        data[j + 1] = num;
      }
    }
  }
  return data;
}

mengurutkanDariBesarKeKecil(List<int> data) {
  for (int i = 0; i < data.length; i++) {
    for (int j = 0; j < data.length - 1; j++) {
      if (data[j] < data[j + 1]) {
        int num = data[j];
        data[j] = data[j + 1];
        data[j + 1] = num;
      }
    }
  }
  return data;
}

mean(List<int> data) {
  int total = 0;
  double hasil = 0;

  for (int i = 0; i < data.length; i++) {
    total += data[i];
  }

  hasil = total / data.length;
  return hasil;
}

median(List<int> data) {
  List<int> hasilSort = mengurutkanDariKecilKeBesar(data);
  int lengthData = data.length;

  if (lengthData % 2 == 0) {
    return (hasilSort[(lengthData / 2).toInt()] +
            hasilSort[(lengthData / 2 - 1).toInt()]) /
        2;
  } else {
    return hasilSort[(lengthData / 2).toInt()];
  }
}

modus(List<int> data) {
  List<int> hasilSort = mengurutkanDariKecilKeBesar(data);
  int lengthData = data.length;
  List<int> total = [];
  List<int> mod = [];
  int k = 1;
  int x = 0;

  // Menghitung berapa kali muncul tiap angka
  for (int i = 0; i < lengthData; i++) {
    total.insert(i, 0);
    for (int j = 0; j < lengthData; j++) {
      if (hasilSort[i] == hasilSort[j]) {
        total[i]++;
      }
    }
  }

  // Menentukan nilai yang paling sering muncul
  for (int i = 0; i < lengthData; i++) {
    if (total[i] > k) {
      k = total[i];
    }
  }

  // Menentukan lokasi nilai yang sering muncul

  for (int i = 0; i < lengthData; i++) {
    if (total[i] == k) {
      mod.insert(x, hasilSort[i]);
    }
  }

  mod.insert(mod.length, 999);

  List<int> hasil = [];
  int z = 0;

  for (int i = 0; i < mod.length - 1; i++) {
    if (mod[i] != mod[i + 1]) {
      hasil.insert(z, mod[i]);
      z++;
    }
  }

  hasil.sort();

  return hasil;
}
