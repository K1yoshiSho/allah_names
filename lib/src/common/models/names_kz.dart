class AllahName {
  final int id;
  final List<Ayat> ayats;
  final String? name;
  final String? meaning;
  final String? shortMeaning;
  final String? nameArabic;
  final int zikrCount;
  final String zikrText;
  final String zikr;

  AllahName({
    required this.id,
    required this.ayats,
    required this.name,
    required this.meaning,
    required this.shortMeaning,
    required this.nameArabic,
    required this.zikrCount,
    required this.zikrText,
    required this.zikr,
  });

  factory AllahName.fromJson(Map<String, dynamic> json) {
    List<Ayat> ayats = [];
    if (json['ayats'] != null) {
      ayats = Ayat.fromList(json['ayats'] as List?);
    }

    return AllahName(
      id: json['id'] as int,
      ayats: ayats,
      name: json['name'] as String?,
      meaning: json['meaning'] as String?,
      shortMeaning: json['shortMeaning'] as String?,
      nameArabic: json['nameArabic'] as String?,
      zikrCount: json['zikrCount'] as int,
      zikrText: json['zikrText'] as String,
      zikr: json['zikr'] as String,
    );
  }

  static List<AllahName> fromList(List? list) {
    if (list == null) return [];
    return list.map((e) => AllahName.fromJson(e)).toList();
  }
}

class Ayat {
  final String? ayatArabic;
  final String? ayatKZ;
  final String? order;

  Ayat({
    required this.ayatArabic,
    required this.ayatKZ,
    required this.order,
  });

  factory Ayat.fromJson(Map<String, dynamic> json) {
    return Ayat(
      ayatArabic: json['ayat'] as String?,
      ayatKZ: json['ayatKz'] as String?,
      order: json['order'] as String?,
    );
  }

  static List<Ayat> fromList(List? list) {
    if (list == null) return [];
    return list.map((e) => Ayat.fromJson(e)).toList();
  }
}
