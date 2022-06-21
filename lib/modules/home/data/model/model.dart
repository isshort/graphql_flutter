class Product {
  Product({
    required this.id,
    this.name,
    this.description,
    this.seoTitle,
    this.pricing,
    this.media,
  });

  final String id;
  final String? name;
  final String? description;
  final String? seoTitle;
  final Pricing? pricing;
  final List<Media>? media;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        seoTitle: json['seoTitle'] as String,
        pricing: Pricing.fromJson(json['pricing'] as Map<String, String>),
        media: List<Media>.from(
          json['media'].map(Media.fromJson) as Iterable<dynamic>,
        ),
      );
}

class Media {
  Media({
    required this.id,
    required this.url,
  });

  final String id;
  final String url;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json['id'] as String,
        url: json['url'] as String,
      );
}

class Pricing {
  Pricing({
    required this.onSale,
    required this.discount,
  });

  final bool onSale;
  final dynamic discount;

  factory Pricing.fromJson(Map<String, dynamic> json) => Pricing(
        onSale: json['onSale'] as bool,
        discount: json['discount'],
      );
}
