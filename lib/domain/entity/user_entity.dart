class UserEntity {
  final int? id;
  final String? name;

  const UserEntity({
    this.id,
    this.name,
  });

  UserEntity copyWith({
    int? id,
    String? name,
  }) =>
      UserEntity(
        id: id ?? this.id,
        name: name ?? this.name,
      );
}
