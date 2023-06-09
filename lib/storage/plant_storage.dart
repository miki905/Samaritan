class PlantInfo {
  final String scientificName;
  final List<String> localNames;
  final String description;
  final String uses;
  final String imagePath;

  PlantInfo({
    required this.scientificName,
    required this.localNames,
    required this.description,
    required this.uses,
    required this.imagePath,
  });
}

class Storage {
  static final Map<String, PlantInfo> plantInfo = {
    'ocimum_lamiifolium': PlantInfo(
      scientificName: 'Ocimum lamiifolium',
      localNames: [
        'Tenadam',
        'Tenaadam',
        'Adun',
        'Andun',
        'Tena\'adam',
      ],
      description:
      'Ocimum lamiifolium, commonly known as Tenadam, is a perennial herb native to Ethiopia. It is characterized by its aromatic leaves and strong fragrance. This plant is widely used in traditional medicine for its various therapeutic properties. The leaves of Ocimum lamiifolium are brewed into teas or used as a culinary herb in Ethiopian cuisine. Additionally, it holds cultural significance and is used in religious ceremonies. The plant requires well-drained soil and thrives in sunny locations. Its vibrant green leaves and pleasant aroma make it a popular choice for gardens and landscapes. It is a valuable plant with diverse applications.',
      uses:
      'Ocimum lamiifolium has a long history of use in Ethiopian traditional medicine. The leaves, roots, and seeds are utilized to treat a range of ailments such as digestive issues, respiratory conditions, and skin infections. The plant\'s essential oil is extracted and used for aromatherapy to promote relaxation and relieve stress. In addition to its medicinal uses, Ocimum lamiifolium is employed as a culinary herb to enhance the flavor of various dishes. It adds a distinct taste and fragrance to soups, stews, and sauces. The plant is also valued for its ornamental qualities and is grown in home gardens and herbal gardens across Ethiopia.',
      imagePath: 'assets/images/ocimum_lamiifolium.jpg',
    ),
    'ginger_plant': PlantInfo(
      scientificName: 'Ginger Plant',
      localNames: [
        'Name 1',
        'Name 2',
        'Name 3',
        'Name 4',
        'Name 5',
      ],
      description:
      'Ginger Plant, scientifically known as Zingiber officinale, is a flowering plant that belongs to the Zingiberaceae family. It is a herbaceous perennial native to Southeast Asia, particularly India and China. The plant is characterized by its thick, knotted underground rhizomes, which are commonly used as a spice and for their medicinal properties. Ginger has a pungent and spicy flavor with a hint of sweetness. It is widely used in various cuisines and has a long history of traditional use in Ayurvedic and Chinese medicine. Ginger has anti-inflammatory, antioxidant, and digestive properties. It is a versatile plant with multiple uses.',
      uses:
      'Ginger has a wide range of uses in traditional medicine due to its beneficial properties. It is known for its anti-inflammatory effects, which can help alleviate symptoms of arthritis and reduce muscle soreness. Ginger is also commonly used to relieve nausea and promote digestion. It can be consumed as a tea, added to various dishes, or used in the preparation of herbal remedies. Additionally, ginger is used in skincare products for its antioxidant properties, which can help protect the skin against aging and damage caused by free radicals. Ginger is a versatile plant with a rich cultural and culinary heritage.',
      imagePath: 'assets/images/ginger_plant.jpg',
    ),
    'garlic': PlantInfo(
      scientificName: 'Garlic',
      localNames: [
        'Name 1',
        'Name 2',
        'Name 3',
        'Name 4',
        'Name 5',
      ],
      description:
      'Garlic, scientifically known as Allium sativum, is a bulbous plant in the Allium genus. It is closely related to onions, shallots, and leeks. Garlic has been cultivated for thousands of years and is widely used as a flavoring agent in various cuisines around the world. It is known for its pungent aroma and distinct taste. Garlic is also recognized for its potential health benefits. It contains sulfur compounds that are believed to have antioxidant and antimicrobial properties. Garlic is used in traditional medicine for its potential to boost the immune system, lower blood pressure, and improve cardiovascular health.',
      uses:
      'Garlic has a long history of use in traditional medicine for its potential health benefits. It is believed to have antimicrobial properties and may help fight against bacterial, viral, and fungal infections. Garlic is also used to support heart health by lowering cholesterol levels and reducing blood pressure. Some studies suggest that garlic may have anticancer effects and could help in the prevention and treatment of certain types of cancer. In addition to its medicinal uses, garlic is a versatile culinary ingredient used in various dishes, such as soups, sauces, and stir-fries. It adds a distinct flavor and aroma to food preparations.',
      imagePath: 'assets/images/garlic.jpg',
    ),
    'aloe_vera': PlantInfo(
      scientificName: 'Aloe Vera',
      localNames: [
        'Name 1',
        'Name 2',
        'Name 3',
        'Name 4',
        'Name 5',
      ],
      description:
      'Aloe vera is a succulent plant species that belongs to the genus Aloe. It is native to the Arabian Peninsula but is now cultivated worldwide for its various uses. Aloe vera is characterized by its thick, fleshy leaves that contain a gel-like substance. This gel is known for its soothing and healing properties, making aloe vera a popular ingredient in skincare and medicinal products. The plant is also easy to grow and is often kept as a houseplant. Aloe vera gel can be directly extracted from the leaves and applied topically to soothe sunburns, skin irritations, and minor cuts.',
      uses:
      'Aloe vera gel is widely used in skincare products due to its moisturizing and healing properties. It can help hydrate the skin, reduce inflammation, and promote wound healing. Aloe vera gel is used to soothe sunburns, alleviate itching and redness, and treat minor skin irritations. In addition to its topical uses, aloe vera gel can be consumed orally as a health supplement. It is believed to support digestion, boost the immune system, and promote overall well-being. Aloe vera plants are low-maintenance and can thrive in a variety of climates, making them a popular choice for both indoor and outdoor gardens.',
      imagePath: 'assets/images/Aloe_Vera.jpg',
    ),
    'echinops_kebericho': PlantInfo(
      scientificName: 'Echinops kebericho',
      localNames: [
        'Name 1',
        'Name 2',
        'Name 3',
        'Name 4',
        'Name 5',
      ],
      description:
      'Echinops kebericho is a plant species native to Ethiopia. It is commonly known as Kebericho and belongs to the Asteraceae family. This perennial herb is characterized by its thistle-like appearance and blue or purple flower heads. Kebericho has a long history of use in Ethiopian traditional medicine for its medicinal properties. The roots, leaves, and seeds of the plant are utilized to treat various ailments, including digestive disorders, respiratory conditions, and skin infections. Kebericho is also used in cultural and religious ceremonies. It is a hardy plant that thrives in sunny locations and well-drained soil.',
      uses:
      'Echinops kebericho has several traditional uses in Ethiopian folk medicine. The roots of the plant are often used to treat stomachaches, indigestion, and intestinal worms. The leaves are brewed into teas and used as a remedy for respiratory issues such as coughs, asthma, and bronchitis. The seeds are sometimes crushed and applied topically to treat skin infections and wounds. Kebericho is also believed to have antimicrobial and anti-inflammatory properties. In addition to its medicinal uses, the plant is used in spiritual and religious ceremonies. Its unique appearance and vibrant flowers make it a desirable choice for landscaping and ornamental purposes.',
      imagePath: 'assets/images/echinops_kebericho.jpg',
    ),
  };
}
