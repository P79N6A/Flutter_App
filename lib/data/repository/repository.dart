import 'package:myApp/common/common.dart';
import 'package:myApp/data/api/apis.dart';
import 'package:myApp/data/net/dio_util.dart';
import 'package:myApp/data/protocol/models.dart';

class Repository {
  Future<List<BannerModel>> getBanner() async {
    BaseResp<List> baseResp = await DioUtil()
        .request<List>(Method.get, Api.getPath(path: Api.BANNER));
    List<BannerModel> bannerList;
    if (baseResp.code != Constant.status_success) {
      return new Future.error(baseResp.msg);
    }
    if (baseResp.data != null) {
      bannerList = baseResp.data.map((value) {
        return BannerModel.fromJson(value);
      }).toList();
    }
    return bannerList;
  }
}
