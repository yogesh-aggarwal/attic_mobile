class ProductMetadata {
  final String createdBy;
  final int createdAt;
  final int editedAt;
  final String editedBy;
  final bool isEdited;
  final bool isActive;
  final bool isDeleted;

  ProductMetadata({
    required this.createdBy,
    required this.createdAt,
    required this.editedAt,
    required this.editedBy,
    required this.isEdited,
    required this.isActive,
    required this.isDeleted,
  });

  factory ProductMetadata.fromMap(Map<String, dynamic> map) {
    return ProductMetadata(
      createdBy: map['createdBy'],
      createdAt: map['createdAt'],
      editedAt: map['editedAt'],
      editedBy: map['editedBy'],
      isEdited: map['isEdited'],
      isActive: map['isActive'],
      isDeleted: map['isDeleted'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'createdBy': createdBy,
      'createdAt': createdAt,
      'editedAt': editedAt,
      'editedBy': editedBy,
      'isEdited': isEdited,
      'isActive': isActive,
      'isDeleted': isDeleted,
    };
  }
}

class ProductDescriptionItem {
  final String type;
  final dynamic content;

  ProductDescriptionItem({
    required this.type,
    required this.content,
  });

  factory ProductDescriptionItem.fromMap(Map<String, dynamic> map) {
    return ProductDescriptionItem(
      type: map['type'],
      content: map['content'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'content': content,
    };
  }
}

class ProductDetails {
  final int stock;
  final List<String> tags;
  final List<String> categories;
  final List<ProductDescriptionItem> description;
  final List<ProductDescriptionItem> deliveryInfo;
  final List<ProductDescriptionItem> careInstructions;

  ProductDetails({
    required this.stock,
    required this.tags,
    required this.categories,
    required this.description,
    required this.deliveryInfo,
    required this.careInstructions,
  });

  factory ProductDetails.fromMap(Map<String, dynamic> map) {
    return ProductDetails(
      stock: map['stock'],
      tags: List<String>.from(map['tags']),
      categories: List<String>.from(map['categories']),
      description: List<ProductDescriptionItem>.from(map['description']
          .map((item) => ProductDescriptionItem.fromMap(item))),
      deliveryInfo: List<ProductDescriptionItem>.from(map['deliveryInfo']
          .map((item) => ProductDescriptionItem.fromMap(item))),
      careInstructions: List<ProductDescriptionItem>.from(
          map['careInstructions']
              .map((item) => ProductDescriptionItem.fromMap(item))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'stock': stock,
      'tags': tags,
      'categories': categories,
      'description': description.map((item) => item.toMap()).toList(),
      'deliveryInfo': deliveryInfo.map((item) => item.toMap()).toList(),
      'careInstructions': careInstructions.map((item) => item.toMap()).toList(),
    };
  }
}

class ProductStats {
  final int views;
  final double rating;
  final int reviewsCount;

  ProductStats({
    required this.views,
    required this.rating,
    required this.reviewsCount,
  });

  factory ProductStats.fromMap(Map<String, dynamic> map) {
    return ProductStats(
      views: map['views'],
      rating: map['rating'],
      reviewsCount: map['reviewsCount'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'views': views,
      'rating': rating,
      'reviewsCount': reviewsCount,
    };
  }
}

class ProductCosting {
  final double originalPrice;
  final double sellingPrice;
  final double discountInPercent;
  final double baseDeliveryCharges;

  ProductCosting({
    required this.originalPrice,
    required this.sellingPrice,
    required this.discountInPercent,
    required this.baseDeliveryCharges,
  });

  factory ProductCosting.fromMap(Map<String, dynamic> map) {
    return ProductCosting(
      originalPrice: map['originalPrice'],
      sellingPrice: map['sellingPrice'],
      discountInPercent: map['discountInPercent'],
      baseDeliveryCharges: map['baseDeliveryCharges'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'originalPrice': originalPrice,
      'sellingPrice': sellingPrice,
      'discountInPercent': discountInPercent,
      'baseDeliveryCharges': baseDeliveryCharges,
    };
  }
}

class Product {
  final String id;
  final ProductMetadata metadata;
  final String title;
  final double price;
  final List<String> images;
  final ProductStats stats;
  final ProductDetails details;
  final ProductCosting costing;

  Product({
    required this.id,
    required this.metadata,
    required this.title,
    required this.price,
    required this.images,
    required this.stats,
    required this.details,
    required this.costing,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['_id'],
      metadata: ProductMetadata.fromMap(map['metadata']),
      title: map['title'],
      price: map['price'],
      images: List<String>.from(map['images']),
      stats: ProductStats.fromMap(map['stats']),
      details: ProductDetails.fromMap(map['details']),
      costing: ProductCosting.fromMap(map['costing']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'metadata': metadata.toMap(),
      'title': title,
      'price': price,
      'images': images,
      'stats': stats.toMap(),
      'details': details.toMap(),
      'costing': costing.toMap(),
    };
  }
}
