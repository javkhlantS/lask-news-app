import 'package:get/get.dart';
import 'package:lask_news_app/core/models/category.dart';
import 'package:lask_news_app/core/network/dio_client.dart';

class CategoryRepository {
  final _dioClient = Get.find<DioClient>();

  Future<List<Category>> getCategories({String? sort}) async {
    final response = await _dioClient.dio.get(
      '/categories',
      queryParameters: {'sort': ?sort},
    );

    final List data = response.data['data'];
    return data.map((json) => Category.fromJson(json)).toList();
  }
}
