class Products {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Products(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'] == null ? 0.0 : json['price'].toDouble();

    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    return data;
  }
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'] == null ? 0.0 : json['rate'].toDouble();
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['rate'] = rate;
    data['count'] = count;
    return data;
  }
}







// class Products {
//   Products({
//     this.id,
//     this.title,
//     this.price,
//     this.description,
//     this.category,
//     this.rating,
//     this.image,
//     //
//   });
//   int? id;
//   String? title;
//   double? price;
//   String? description;
//   String? category;
//   String? image;
//   num? rating;
//   //






//   factory Products.fromJson(Map<String, dynamic>? json) {
//     if (json == null) return Products();
//     return Products(
//       title: json["title"],
//       id: json['id'],
//       price: json['price'],
//       category: json['category'],
//       image: json['image'],
//       description: json['description'],
//       rating: json['rating'],
//       //
//       // name: json["name"],
//       // status: json["status"],
//       // species: json["species"],
//       // type: json["type"],
//       // gender: json["gender"],
//       // origin: json["origin"] == null ? null : Location.fromJson(json["origin"]),
//       // location:
//       //     json["location"] == null ? null : Location.fromJson(json["location"]),

//       // episode: (json["episode"] as List).map((e) => e as String).toList(),
//       // url: json["url"],
//       // created: json["created"] == null ? null : DateTime.parse(json["created"]),
//     );
//   }
// }
