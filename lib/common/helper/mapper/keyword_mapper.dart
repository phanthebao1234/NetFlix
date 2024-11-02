import 'package:netflix/core/entity/keyword_entity.dart';
import 'package:netflix/core/models/keyword_model.dart';

class KeywordMapper {
  static KeywordEntity toEntity(KeywordModel keywordModel) {
    return KeywordEntity(name: keywordModel.name, id: keywordModel.id);
  }
}
