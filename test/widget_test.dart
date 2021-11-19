import 'package:collection/collection.dart';
import 'package:stats/stats.dart';

void main() {
  List<int> listData = [3, 18, 45, 16, 2, 5, 7, 9, 10, 1, 16, 11, 4, 8, 11, 16, 32, 56];

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
  // output & logic sudah sesuai dan benar
  // for (int i = 0; i < data.length; i++) {
  //   for (int j = 0; j < data.length - 1; j++) {
  //     if (data[j] > data[j + 1]) {
  //       int num = data[j];
  //       data[j] = data[j + 1];
  //       data[j + 1] = num;
  //     }
  //   }
  // }
  // return data;

  // alternatif
  // bisa manfaatin fungsi sort yaa
  data.sort();
  return data;
}

mengurutkanDariBesarKeKecil(List<int> data) {
  // output & logic sudah sesuai dan benar
  // for (int i = 0; i < data.length; i++) {
  //   for (int j = 0; j < data.length - 1; j++) {
  //     if (data[j] < data[j + 1]) {
  //       int num = data[j];
  //       data[j] = data[j + 1];
  //       data[j + 1] = num;
  //     }
  //   }
  // }
  // return data;

  // alternatif
  // bisa manfaatin fungsi sort juga & reversed yaa
  data.sort();
  return data.reversed.toList();
}

mean(List<int> data) {
  // output & logic sudah sesuai dan benar
  // int total = 0;
  // double hasil = 0;

  // for (int i = 0; i < data.length; i++) {
  //   total += data[i];
  // }

  // hasil = total / data.length;
  // return hasil;

  // alternatif 1
  // kalau for loop dan tidak membutuhkan index bisa pakai in pada for loop
  // var sum = 0;
  // for (int i in data) {
  //   sum += i;
  // }
  // return sum / data.length;

  // alternatif 2
  // bisa menggunakan package stats
  return Stats.fromData(data).average;
}

median(List<int> data) {
  // output & logic sudah sesuai dan benar, membedakan jumlah data genap / ganjil sudah bagus
  // List<int> hasilSort = mengurutkanDariKecilKeBesar(data);
  // int lengthData = data.length;

  // if (lengthData % 2 == 0) {
  //   return (hasilSort[(lengthData / 2).toInt()] + hasilSort[(lengthData / 2 - 1).toInt()]) / 2;
  // } else {
  //   return hasilSort[(lengthData / 2).toInt()];
  // }

  // alternatif 1
  // bisa memanfaatkan ~ untuk mengubah ke .floor() & bentuk int, karena ada kemungkinan nilainya adalah desimal
  // data.sort();
  // if (data.length % 2 == 0) {
  //   // total data genap
  //   return (data[(data.length ~/ 2) - 1] + data[(data.length ~/ 2)]) / 2;
  // } else {
  //   // total data ganjil
  //   return data[(data.length ~/ 2) - 1];
  // }

  // alternatif 2
  // bisa menggunakan package stats
  return Stats.fromData(data).median;
}

modus(List<int> data) {
  // output & logic sudah sesuai dan benar, tapi ada yg kurang pada definisi modus itu sendiri
  // modus adalah nilai yg PALING banyak muncul -> ini artinya cuma 1 data
  // maka jika data array memiliki 2 nilai yang sama banyak, bisa di bilang tidak memiliki modus
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

  // tambahkan ini
  if (hasil.length == 1) {
    return hasil;
  } else {
    return "TIDAK ADA MODUS";
  }

  // alternatif lain
  // jangan lupa di buka comment fungsi modus()
  // return modus(data);
}


/*
modus(List<int> data) {
  data.sort();

  List<Map<int, int>> dataMap = [];
  List<Map<int, int>> fixDataMap = [];

  for (int i = 0; i < data.length; i++) {
    int total = 0;
    for (int j = 0; j < data.length; j++) {
      if (data[i] == data[j]) {
        total++;
      }
    }
    dataMap.add({data[i]: total});
  }

  for (int i = 0; i < dataMap.length; i++) {
    if (i > 0) {
      if (const DeepCollectionEquality().equals(dataMap[i], dataMap[i - 1])) {
        continue;
      } else {
        fixDataMap.add(dataMap[i]);
      }
    } else {
      fixDataMap.add(dataMap[i]);
    }
  }

  print("Data Map dengan banyaknya data");
  print(fixDataMap);

  List<int> keyData = [];
  List<int> valueData = [];

  for (int i = 0; i < fixDataMap.length; i++) {
    keyData.add(fixDataMap[i].keys.first);
    valueData.add(fixDataMap[i].values.first);
  }

  print("\nExtract Data Map");
  print("Nilai : $keyData");
  print("Banyak : $valueData");
  print("\n--------------------------\nKESIMPULAN\n");

  int maksimalData = valueData[0];

  for (var i = 0; i < valueData.length; i++) {
    if (valueData[i] > maksimalData) {
      maksimalData = valueData[i];
    }
  }

  // print(maksimalData);

  int totalMaksimalData = 0;
  for (var item in valueData) {
    if (item == maksimalData) {
      totalMaksimalData++;
    }
  }

  maksimalData = valueData[0];
  int indexMaksimalData = 0;

  if (totalMaksimalData != 1) {
    return "TIDAK ADA MODUS";
  } else {
    for (var i = 0; i < valueData.length; i++) {
      if (valueData[i] > maksimalData) {
        maksimalData = valueData[i];
        indexMaksimalData = i;
      }
    }

    return "Nilai yang sering muncul : ${keyData[indexMaksimalData]}\nSebanyak : ${valueData[indexMaksimalData]} x";
  }
}
*/