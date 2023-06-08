class Storage {
  static Map<String, PlantInfo> plantInfo = {
    'plant-ocimum-lamiifolium': PlantInfo(
      localNames: ['Koseret', 'Eregimba', 'Gueza', 'Teret', 'Kasir'],
      scientificName: 'Ocimum lamiifolium',
      description:
      'Koseret, also known as Eregimba, Gueza, Teret, or Kasir, is a herbaceous plant native to Ethiopia. It is widely used in Ethiopian cuisine for its aromatic leaves and unique flavor. Koseret is known for its medicinal properties and is used to relieve digestive issues and promote general well-being. The leaves of Koseret are rich in essential oils, antioxidants, and antimicrobial compounds. In traditional Ethiopian medicine, Koseret is used to treat various ailments such as indigestion, stomachaches, and respiratory problems. Additionally, Koseret has cultural significance and is often included in traditional ceremonies and rituals in Ethiopia.',
      imageUrl: 'assets/images/koseret.jpg',
    ),
    'ginger-plant': PlantInfo(
      localNames: ['Zingibil', 'Jinja', 'Akarkara', 'Aya', 'Shegri'],
      scientificName: 'Zingiber officinale',
      description:
      'Zingibil, commonly known as ginger or Jinja, is a flowering plant valued for its pungent rhizome. It has a long history of culinary and medicinal use in Ethiopia. Ginger adds a warm, spicy flavor to dishes and is a popular ingredient in traditional Ethiopian cuisine. In traditional medicine, ginger is known for its anti-inflammatory, antioxidant, and digestive properties. It is used to alleviate various ailments such as nausea, indigestion, and cold symptoms. Ginger is also consumed as a herbal tea and is known for its warming effect on the body. Additionally, ginger has cultural significance and is used in traditional practices and celebrations.',
      imageUrl: 'assets/images/logo1.png',
    ),
    'garlic': PlantInfo(
      localNames: ['Netch azmud', 'T\'ena', 'Yewol', 'L\'ob', 'Sinet'],
      scientificName: 'Allium sativum',
      description:
      'Netch azmud, commonly known as garlic, is a bulbous plant highly valued for its distinct flavor and aroma. Garlic is a staple ingredient in Ethiopian cuisine, adding depth and richness to various dishes. Besides its culinary uses, garlic is known for its numerous health benefits. It contains beneficial compounds with antimicrobial, anti-inflammatory, and antioxidant properties. Garlic is believed to support immune function, promote cardiovascular health, and lower blood pressure. In traditional Ethiopian medicine, garlic is used to treat respiratory infections, improve digestion, and boost overall well-being. Additionally, garlic has symbolic and cultural significance in Ethiopian traditions and folklore.',
      imageUrl: 'assets/images/garlic.jpg',
    ),
    'aloe-vera': PlantInfo(
      localNames: ['Sabber', 'Kekwara', 'Barbaddu', 'Liliba', 'Kosua'],
      scientificName: 'Aloe vera',
      description:
      'Sabber, also known as aloe vera, is a succulent plant with thick, fleshy leaves containing a gel-like substance. It has been used for centuries for its various health and skincare benefits. Aloe vera is known for its soothing and moisturizing properties. It is used to treat sunburns, skin irritations, and wounds. In traditional Ethiopian medicine, aloe vera is believed to have anti-inflammatory, analgesic, and digestive properties. It is used to alleviate stomachaches, promote digestion, and boost overall well-being. Aloe vera is also used in cosmetic products due to its hydrating and rejuvenating effects on the skin.',
      imageUrl: 'assets/images/aloe_vera.jpg',
    ),
    'echinops-kebericho-mesfin': PlantInfo(
      localNames: ['Kebericho', 'Afdericho', 'Kaisso', 'Belesa', 'Tolli'],
      scientificName: 'Echinops kebericho Mesfin',
      description:
      'Kebericho, also known as Afdericho, Kaisso, Belesa, or Tolli, is a medicinal plant native to Ethiopia. It has long been used in traditional Ethiopian medicine for its potential therapeutic properties and is known for its unique appearance. Kebericho is rich in bioactive compounds and has anti-inflammatory, analgesic, and antimicrobial effects. It is used to alleviate various ailments such as fever, stomachaches, headaches, and respiratory problems. Kebericho is also believed to have antioxidant properties and is used to promote general well-being. In Ethiopian folklore, Kebericho is associated with protective and spiritual properties.',
      imageUrl: 'assets/images/kebericho.jpg',
    ),
    'african-redwood': PlantInfo(
      localNames: ['Wanza', 'Sirba', 'Wasi', 'Yaye', 'Ganessa'],
      scientificName: 'Hagenia abyssinica',
      description:
      'Wanza, also known as African Redwood or Sirba, is a large evergreen tree native to Ethiopia. It is known for its beautiful pinkish-red flowers and its importance in traditional Ethiopian culture. Wanza has various uses in Ethiopian society, including its wood, which is highly valued for construction and furniture making. In traditional medicine, different parts of the tree, such as the bark and leaves, are used for their potential medicinal properties. Wanza is also a sacred tree and is associated with cultural and spiritual significance in Ethiopian folklore and traditions.',
      imageUrl: 'assets/images/african_redwood.jpg',
    ),
    'black-cumin': PlantInfo(
      localNames: ['Nigella', 'Ketfari', 'Leshi', 'Ketema', 'Tikur azmud'],
      scientificName: 'Nigella sativa',
      description:
      'Nigella, commonly known as Black Cumin or Ketfari, is an annual flowering plant native to Ethiopia. It has a long history of culinary and medicinal use in Ethiopian cuisine and traditional medicine. The tiny black seeds of Nigella are highly aromatic and have a distinctive flavor. They are used as a spice in various dishes, especially bread and pastries. In traditional medicine, Nigella is believed to have numerous health benefits. It is used to support digestion, boost the immune system, and alleviate respiratory conditions. Nigella seeds are also valued for their antioxidant and anti-inflammatory properties.',
      imageUrl: 'assets/images/black_cumin.jpg',
    ),
  };
}

class PlantInfo {
  final List<String> localNames;
  final String scientificName;
  final String description;
  final String imageUrl;

  PlantInfo({
    required this.localNames,
    required this.scientificName,
    required this.description,
    required this.imageUrl,
  });
}
