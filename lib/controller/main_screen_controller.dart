import 'package:dart_rss/dart_rss.dart';
import 'package:get/get.dart';
import 'package:varzesh3_abstract/components/my_strings.dart';
import 'package:varzesh3_abstract/services/dio_service.dart';

class MainScreenController extends GetxController {
  RssFeed? rssFeed;
  RxList rssList = RxList();
  RxBool loading = true.obs;
  RxString appBarTitle = MyStrings.allSports.obs;

  @override
  onInit() {
    super.onInit();
    getNewsAllSports();
  }

  getNewsAllSports() async {
    loading.value = true;
    var response =
        await DioService().getRssMethod("https://www.varzesh3.com/rss/all");
    if (response.statusCode == 200) {
      rssList.clear();
      rssFeed = RssFeed.parse(response.data);
      rssFeed?.items.forEach(
        (element) {
          rssList.add(element);
        },
      );
      loading.value = false;
    }
  }

  getNewsInsideFootball() async {
    loading.value = true;
    var response = await DioService()
        .getRssMethod("https://www.varzesh3.com/rss/domesticfootball");
    if (response.statusCode == 200) {
      rssList.clear();
      rssFeed = RssFeed.parse(response.data);
      rssFeed?.items.forEach(
        (element) {
          rssList.add(element);
        },
      );
      loading.value = false;
    }
  }

  getNewsOutSideFootball() async {
    loading.value = true;
    var response = await DioService()
        .getRssMethod("https://www.varzesh3.com/rss/foreignfootball");
    if (response.statusCode == 200) {
      rssList.clear();
      rssFeed = RssFeed.parse(response.data);
      rssFeed?.items.forEach(
        (element) {
          rssList.add(element);
        },
      );
      loading.value = false;
    }
  }

  getNewsOtherSports() async {
    loading.value = true;
    var response = await DioService()
        .getRssMethod("https://www.varzesh3.com/rss/othersports");
    if (response.statusCode == 200) {
      rssList.clear();
      rssFeed = RssFeed.parse(response.data);
      rssFeed?.items.forEach(
        (element) {
          rssList.add(element);
        },
      );
      loading.value = false;
    }
  }
}
