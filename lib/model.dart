// models/models.dart
class NGO {
  final int? id; // Add the id field as nullable
  final String name;
  final String description;

  NGO(this.name, this.description, {this.id}); // Make id optional in constructor

  Map<String, dynamic> toMap() {
    return {
      'id': id, // Include id in the map
      'name': name,
      'description': description,
    };
  }

  factory NGO.fromMap(Map<String, dynamic> map) {
    return NGO(
      map['name'],
      map['description'],
      id: map['id'], // Map the id field
    );
  }
}
