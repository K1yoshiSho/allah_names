class AllahNameKZ {
  final int id;
  final List<AyatKZ> ayats;
  final String? name;
  final String? meaning;
  final String? shortMeaning;
  final String? nameArabic;
  final int zikrCount;
  final String zikrText;
  final String zikr;

  AllahNameKZ({
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

  factory AllahNameKZ.fromJson(Map<String, dynamic> json) {
    List<AyatKZ> ayats = [];
    if (json['ayats'] != null) {
      ayats = AyatKZ.fromList(json['ayats'] as List?);
    }

    return AllahNameKZ(
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

  static List<AllahNameKZ> fromList(List? list) {
    if (list == null) return [];
    return list.map((e) => AllahNameKZ.fromJson(e)).toList();
  }
}

class AyatKZ {
  final String? ayatArabic;
  final String? ayatKZ;
  final String? order;

  AyatKZ({
    required this.ayatArabic,
    required this.ayatKZ,
    required this.order,
  });

  factory AyatKZ.fromJson(Map<String, dynamic> json) {
    return AyatKZ(
      ayatArabic: json['ayat'] as String?,
      ayatKZ: json['ayatKz'] as String?,
      order: json['order'] as String?,
    );
  }

  static List<AyatKZ> fromList(List? list) {
    if (list == null) return [];
    return list.map((e) => AyatKZ.fromJson(e)).toList();
  }
}
