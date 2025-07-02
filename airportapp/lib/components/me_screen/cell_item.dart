class CellItem {
  CellItem({
    required this.name,
    required this.image,
    this.link
  });

  final String name;
  final String image;
  final String? link;

  static List<CellItem> getCellList() {
    return [
      CellItem(name: 'World of Ice Cream', image: 'lib/images/world_of_icecream.jpg', link: 'https://hkairportshop.com/eshop_en/icecream25'),
      CellItem(name: 'HKairportShop.com', image: 'lib/images/early_summer_delights.jpg', link: 'https://hkairportshop.com/eshop_en/summerdelights25'),
      CellItem(name: 'Luxury Concierge', image: 'lib/images/luxury_concierge.jpg', link: 'https://hkairportshop.com/concierge')
    ];
  }
}