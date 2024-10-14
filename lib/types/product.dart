class Product {
  final String id;
  final ProductMetadata metadata;
  final ProductMedia media;
  final ProductListing listing;
  final ProductDetails details;
  final List<String> variants;
  final ProductReviews reviews;
  final double price;

  Product({
    required this.id,
    required this.metadata,
    required this.media,
    required this.listing,
    required this.details,
    required this.variants,
    required this.reviews,
    required this.price,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['_id'],
      price: 139999.0,
      metadata: ProductMetadata.fromMap(map['metadata']),
      media: ProductMedia.fromMap(map['media']),
      listing: ProductListing.fromMap(map['listing']),
      details: ProductDetails.fromMap(map['details']),
      variants: List<String>.from(map['variants']),
      reviews: ProductReviews.fromMap(map['reviews']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'metadata': metadata.toMap(),
      'media': media.toMap(),
      'listing': listing.toMap(),
      'details': details.toMap(),
      'variants': variants,
      'reviews': reviews.toMap(),
      'price': price,
    };
  }
}

class ProductMetadata {
  final int createdAt;
  final int updatedAt;
  final int publishedAt;
  final int unpublishedAt;
  final int reviewedAt;
  final int releasedAt;
  final int expirationDate;

  ProductMetadata({
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.unpublishedAt,
    required this.reviewedAt,
    required this.releasedAt,
    required this.expirationDate,
  });

  factory ProductMetadata.fromMap(Map<String, dynamic> map) {
    return ProductMetadata(
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      publishedAt: map['published_at'],
      unpublishedAt: map['unpublished_at'],
      reviewedAt: map['reviewed_at'],
      releasedAt: map['released_at'],
      expirationDate: map['expiration_date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'created_at': createdAt,
      'updated_at': updatedAt,
      'published_at': publishedAt,
      'unpublished_at': unpublishedAt,
      'reviewed_at': reviewedAt,
      'released_at': releasedAt,
      'expiration_date': expirationDate,
    };
  }
}

class ProductMedia {
  final List<ProductMediaImage> images;
  final List<ProductMediaVideo> videos;

  ProductMedia({
    required this.images,
    required this.videos,
  });

  factory ProductMedia.fromMap(Map<String, dynamic> map) {
    return ProductMedia(
      images: List<ProductMediaImage>.from(
          map['images'].map((x) => ProductMediaImage.fromMap(x))),
      videos: List<ProductMediaVideo>.from(
          map['videos'].map((x) => ProductMediaVideo.fromMap(x))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'images': images.map((x) => x.toMap()).toList(),
      'videos': videos.map((x) => x.toMap()).toList(),
    };
  }
}

class ProductMediaImage {
  final String url;
  final String altText;

  ProductMediaImage({
    required this.url,
    required this.altText,
  });

  factory ProductMediaImage.fromMap(Map<String, dynamic> map) {
    return ProductMediaImage(
      url: map['url'],
      altText: map['alt_text'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'alt_text': altText,
    };
  }
}

class ProductMediaVideo {
  final String url;
  final String description;

  ProductMediaVideo({
    required this.url,
    required this.description,
  });

  factory ProductMediaVideo.fromMap(Map<String, dynamic> map) {
    return ProductMediaVideo(
      url: map['url'],
      description: map['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'description': description,
    };
  }
}

class ProductListing {
  final String sku;
  final ProductListingSEO seo;
  final String title;
  final ProductListingDescription description;
  final ProductListingCategories categories;
  final List<String> tags;
  final ProductListingStatus status;

  ProductListing({
    required this.sku,
    required this.seo,
    required this.title,
    required this.description,
    required this.categories,
    required this.tags,
    required this.status,
  });

  factory ProductListing.fromMap(Map<String, dynamic> map) {
    return ProductListing(
      sku: map['sku'],
      seo: ProductListingSEO.fromMap(map['seo']),
      title: map['title'],
      description: ProductListingDescription.fromMap(map['description']),
      categories: ProductListingCategories.fromMap(map['categories']),
      tags: List<String>.from(map['tags']),
      status: ProductListingStatus.fromMap(map['status']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sku': sku,
      'seo': seo.toMap(),
      'title': title,
      'description': description.toMap(),
      'categories': categories.toMap(),
      'tags': tags,
      'status': status.toMap(),
    };
  }
}

class ProductListingSEO {
  final String metaTitle;
  final String metaDescription;
  final String metaKeywords;
  final String canonicalUrl;

  ProductListingSEO({
    required this.metaTitle,
    required this.metaDescription,
    required this.metaKeywords,
    required this.canonicalUrl,
  });

  factory ProductListingSEO.fromMap(Map<String, dynamic> map) {
    return ProductListingSEO(
      metaTitle: map['meta_title'],
      metaDescription: map['meta_description'],
      metaKeywords: map['meta_keywords'],
      canonicalUrl: map['canonical_url'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'meta_title': metaTitle,
      'meta_description': metaDescription,
      'meta_keywords': metaKeywords,
      'canonical_url': canonicalUrl,
    };
  }
}

class ProductListingDescription {
  final String short;
  final String long;

  ProductListingDescription({
    required this.short,
    required this.long,
  });

  factory ProductListingDescription.fromMap(Map<String, dynamic> map) {
    return ProductListingDescription(
      short: map['short'],
      long: map['long'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'short': short,
      'long': long,
    };
  }
}

class ProductListingCategories {
  final String primary;
  final String secondary;
  final String subcategory;

  ProductListingCategories({
    required this.primary,
    required this.secondary,
    required this.subcategory,
  });

  factory ProductListingCategories.fromMap(Map<String, dynamic> map) {
    return ProductListingCategories(
      primary: map['primary'],
      secondary: map['secondary'],
      subcategory: map['subcategory'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'primary': primary,
      'secondary': secondary,
      'subcategory': subcategory,
    };
  }
}

class ProductListingStatus {
  final String availability;
  final String lifecycle;
  final bool featured;
  final bool onSale;

  ProductListingStatus({
    required this.availability,
    required this.lifecycle,
    required this.featured,
    required this.onSale,
  });

  factory ProductListingStatus.fromMap(Map<String, dynamic> map) {
    return ProductListingStatus(
      availability: map['availability'],
      lifecycle: map['lifecycle'],
      featured: map['featured'],
      onSale: map['on_sale'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'availability': availability,
      'lifecycle': lifecycle,
      'featured': featured,
      'on_sale': onSale,
    };
  }
}

class ProductDetails {
  final String brand;
  final String model;
  final String condition;
  final bool clearance;
  final ProductDetailsLegal legal;
  final List<ProductDetailsAttribute> attributes;

  ProductDetails({
    required this.brand,
    required this.model,
    required this.condition,
    required this.clearance,
    required this.legal,
    required this.attributes,
  });

  factory ProductDetails.fromMap(Map<String, dynamic> map) {
    return ProductDetails(
      brand: map['brand'],
      model: map['model'],
      condition: map['condition'],
      clearance: map['clearance'],
      legal: ProductDetailsLegal.fromMap(map['legal']),
      attributes: List<ProductDetailsAttribute>.from(
          map['attributes'].map((x) => ProductDetailsAttribute.fromMap(x))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'brand': brand,
      'model': model,
      'condition': condition,
      'clearance': clearance,
      'legal': legal.toMap(),
      'attributes': attributes.map((x) => x.toMap()).toList(),
    };
  }
}

class ProductDetailsLegal {
  final String warrantyInfo;
  final String returnPolicy;

  ProductDetailsLegal({
    required this.warrantyInfo,
    required this.returnPolicy,
  });

  factory ProductDetailsLegal.fromMap(Map<String, dynamic> map) {
    return ProductDetailsLegal(
      warrantyInfo: map['warranty_info'],
      returnPolicy: map['return_policy'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'warranty_info': warrantyInfo,
      'return_policy': returnPolicy,
    };
  }
}

class ProductDetailsAttribute {
  final String name;
  final String value;

  ProductDetailsAttribute({
    required this.name,
    required this.value,
  });

  factory ProductDetailsAttribute.fromMap(Map<String, dynamic> map) {
    return ProductDetailsAttribute(
      name: map['name'],
      value: map['value'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'value': value,
    };
  }
}

class ProductReviews {
  final double averageRating;
  final int totalCount;
  final Map<int, int> starDistribution;

  ProductReviews({
    required this.averageRating,
    required this.totalCount,
    required this.starDistribution,
  });

  factory ProductReviews.fromMap(Map<String, dynamic> map) {
    return ProductReviews(
      averageRating: map['average_rating'],
      totalCount: map['total_count'],
      starDistribution: Map<int, int>.from(map['star_distribution']
          .map((key, value) => MapEntry(int.parse(key), value))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'average_rating': averageRating,
      'total_count': totalCount,
      'star_distribution': starDistribution,
    };
  }
}
