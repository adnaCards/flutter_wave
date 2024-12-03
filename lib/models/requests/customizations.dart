class Customization {
  String? title;
  String? description;
  String? logo;

  Customization({this.title, this.description, this.logo});

  /// Converts instance of Customization to json
  Map<String, dynamic> toJson() {
    return {
      "title": this.title ?? "",
      "description": this.description ?? "",
      "logo": this.logo ?? ""
    };
  }
}