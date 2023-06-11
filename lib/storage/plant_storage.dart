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
    'ruta_graveolens':PlantInfo(
      scientificName: 'Ruta graveolens',
      localNames: [
        'Ruta graveolens',
        'Tenadam',
        'Tenaadam',
        'Adun',
        'Andun',
        'Tena\'adam',
      ],
      description:
      'Ruta graveolens is a perennial shrub known for its strong fragrance and distinctive bitter taste. It is widely cultivated for its medicinal properties and ornamental value. The plant has bluish-green leaves and produces small yellow flowers in clusters. In Ethiopian traditional medicine, various parts of Ruta graveolens are used to treat digestive issues, menstrual disorders, and respiratory conditions. It is also used in religious and cultural ceremonies. Additionally, Ruta graveolens has culinary uses and is sometimes used as a natural insect repellent. The plant requires well-drained soil and prefers full sun to partial shade. It is a popular choice in garden landscapes for its aromatic foliage and attractive appearance.',
      uses:
      'Ruta graveolens has various traditional uses in Ethiopia. The leaves, stems, and seeds of the plant are used in herbal remedies to alleviate digestive problems such as indigestion, bloating, and stomach cramps. The plant is also believed to have antimicrobial properties and is used to treat infections and wounds. In addition, Ruta graveolens is used to regulate menstrual cycles and relieve menstrual pain. It is also used to ease respiratory conditions such as cough and bronchitis. Furthermore, the plant has cultural and religious significance and is used in rituals and ceremonies. Its aromatic foliage is used for its pleasant scent, and the plant is sometimes used as a natural insect repellent.',
      imagePath: 'assets/images/ruta_graveolens.jpg',
    ),
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
        'Ingudai',
        'Jemir',
        'Zengibra',
        'Ajeer',
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
        'Nech Shinkurt',
        'Shinkurt',
        'Lefet',
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
        'Amara Tid',
        'Tid Kebed',
        'Kebede Alena',
        'Amara Sere',
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
        'Kebericho',
        'Arada Kebericho',
        'Anjugo',
        'Sanchurcho',
      ],
      description:
      'Echinops kebericho is a plant species native to Ethiopia. It is commonly known as Kebericho and belongs to the Asteraceae family. This perennial herb is characterized by its thistle-like appearance and blue or purple flower heads. Kebericho has a long history of use in Ethiopian traditional medicine for its medicinal properties. The roots, leaves, and seeds of the plant are utilized to treat various ailments, including digestive disorders, respiratory conditions, and skin infections. Kebericho is also used in cultural and religious ceremonies. It is a hardy plant that thrives in sunny locations and well-drained soil.',
      uses:
      'Echinops kebericho has several traditional uses in Ethiopian folk medicine. The roots of the plant are often used to treat stomachaches, indigestion, and intestinal worms. The leaves are brewed into teas and used as a remedy for respiratory issues such as coughs, asthma, and bronchitis. The seeds are sometimes crushed and applied topically to treat skin infections and wounds. Kebericho is also believed to have antimicrobial and anti-inflammatory properties. In addition to its medicinal uses, the plant is used in spiritual and religious ceremonies. Its unique appearance and vibrant flowers make it a desirable choice for landscaping and ornamental purposes.',
      imagePath: 'assets/images/echinops_kebericho.jpg',
    ),
    'african_redwood': PlantInfo(
      scientificName: 'Khaya senegalensis',
      localNames: [
        'Makeda',
        'Dabima',
        'Mellow',
        'Khaya',
      ],
      description:
      'African Redwood is a large deciduous tree native to Ethiopia. It is scientifically known as Name 1 and belongs to the Family 1. The tree is known for its majestic size and beautiful reddish-brown bark. African Redwood is highly valued for its timber, which is used in construction, furniture making, and crafting musical instruments.',
      uses:
      'The wood of African Redwood is renowned for its durability and attractive grain patterns. It is used in the construction of houses, bridges, and boats. The timber is also sought after for its aesthetic qualities and is used to create high-quality furniture and decorative items. In addition to its commercial uses, African Redwood plays a vital role in the ecosystem by providing shade, shelter, and habitat for various species of birds and animals. The tree is also valued for its cultural and spiritual significance, and its leaves and bark are sometimes used in traditional remedies and ceremonies.',
      imagePath: 'assets/images/african_redwood.jpg',
    ),
    'black_cumin': PlantInfo(
      scientificName: 'Nigella sativa',
      localNames: [
        'Nigella',
        'Sinisisa',
        'Habash Zana',
        'Kala Jira',
      ],
      description:
      'Black Cumin is an annual flowering plant native to Ethiopia. It is scientifically known as Name 1 and belongs to the Family 1. Black Cumin is characterized by its delicate flowers and small, black seeds that have a distinct flavor and aroma. The plant has a long history of culinary and medicinal uses.',
      uses:
      'Black Cumin seeds are highly valued for their culinary and medicinal properties. They are used as a spice in Ethiopian cuisine, adding a unique and aromatic flavor to dishes. The seeds are often roasted or ground into a powder before use. Medicinally, Black Cumin is believed to have various health benefits. It is used to improve digestion, boost the immune system, and relieve respiratory issues. The oil extracted from the seeds is also used topically to nourish the skin and hair. In Ethiopian traditional medicine, Black Cumin is used as a natural remedy for digestive disorders, allergies, and inflammatory conditions.',
      imagePath: 'assets/images/black_cumin.jpg',
    ),

  };
}
