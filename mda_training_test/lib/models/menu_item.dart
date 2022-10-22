import 'package:uuid/uuid.dart';

class MenuItemData {
  String id;
  String title;
  String description;
  String mainImage;
  String secondaryImage;
  int price;

  MenuItemData({
    this.id,
    this.title,
    this.description,
    this.mainImage,
    this.secondaryImage,
    this.price,
  });
}

class MenuItemCart {
  MenuItemData menuItem;
  int quantity;

  String get id => menuItem.id;

  int get totalPrice => quantity * menuItem.price;

  MenuItemCart({this.menuItem, this.quantity});
}

final menus = <MenuItemData>[
  sushi,
  steakFrites,
  brochettesDeBoeuf,
];

final cart = <String, MenuItemCart>{};

final sushi = MenuItemData(
  price: 6500,
  id: Uuid().v4(),
  title: 'Sushi',
  mainImage: 'pexels-photo-628776.jpeg',
  secondaryImage: 'pexels-photo-853006.jpeg',
  description:
      'Le sushi est un plat traditionnel japonais, composé d\'un riz vinaigré appelé shari combiné avec un autre ingrédient appelé neta qui est habituellement du poisson cru ou des fruits de mer.',
);

final steakFrites = MenuItemData(
  price: 5000,
  id: Uuid().v4(),
  title: 'Steak frites',
  mainImage: 'pexels-photo-3535383.jpeg',
  secondaryImage: 'pexels-photo-1583884.jpeg',
  description:
      'Le steak frites est un plat fréquemment servi en brasserie et dans les restaurants. Étant le plat principal, il peut être précédé d\'une entrée, et suivi de fromages et/ou desserts.',
);

final brochettesDeBoeuf = MenuItemData(
  price: 4500,
  id: Uuid().v4(),
  title: 'Brochettes de bœuf',
  mainImage: 'pexels-photo-3026805.jpeg',
  secondaryImage: 'pexels-photo-3756523.jpeg',
  description:
      '''Dans un grand bol, mélanger l’huile, la sauce soya, le vinaigre, la cassonade, le poivre et l’ail. Ajouter la viande et bien l’enrober. Couvrir et réfrigérer 1 heure pour du filet mignon ou 24 heures pour de la bavette (voir note).
  Égoutter la viande et jeter la marinade. Enfiler les cubes de viande sur les brochettes. Laisser tempérer la viande 15 minutes.
Régler le barbecue à puissance élevée. Huiler la grille.
Griller les brochettes 4 minutes de chaque côté ou jusqu’à cuisson saignante ou rosée. Saler légèrement (car la marinade est déjà salée).''',
);
