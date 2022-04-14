class Car {
  final String name;
  final String price;
  final String asset;
  final bool isFavorite;
  final int color;

  Car(this.name, this.price, this.asset, this.isFavorite, this.color);

  Car copyWith({
    String? name,
    String? price,
    String? asset,
    bool? isFavorite,
    int? color
  }) {
    return Car(
      name ?? this.name,
      price ?? this.price,
      asset ?? this.asset,
      isFavorite ?? this.isFavorite,
      color ?? this.color,
    );
  }

  @override
  String toString() {
    return '{ name: ${this.name}, price: ${this.price}, asset: ${this.asset}, isFavorite: ${this.isFavorite}, color: ${this.color} }';
  }
}
