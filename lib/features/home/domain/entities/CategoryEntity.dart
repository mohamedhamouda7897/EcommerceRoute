class CategoryOrBrandEntity {
  CategoryOrBrandEntity({
    this.results,
    this.metadata,
    this.data,
  });

  num? results;
  MetadataEntity? metadata;
  List<DataEntity>? data;
}

class DataEntity {
  DataEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  String? id;
  String? name;
  String? slug;
  String? image;
}

class MetadataEntity {
  MetadataEntity({
    this.limit,
  });

  num? limit;
}
