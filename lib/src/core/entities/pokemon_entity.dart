import 'package:objectbox/objectbox.dart';

@Entity()
class PokemonEntity {
  int id = 0;

  String? name = '';
  String? color = '';

  PokemonEntity({
    this.name,
    this.color,
  });

  @override
  String toString() {
    return 'PokemonEntity(id: $id, name: $name,  color: $color)';
  }
}
