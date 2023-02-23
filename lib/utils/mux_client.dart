import 'dart:developer';

import 'package:live_stream/helper/dio_helper.dart';
import 'package:live_stream/helper/end_points.dart';
import 'package:live_stream/models/mux_live_data.dart';
import 'package:live_stream/models/mux_stream.dart';

class MuxClientRepo {
  Future<MuxLiveData> createLiveStream() async {
    final response = await DioHelper.postData(url: startStreamEndPoint);
    final muxLiveData =
        MuxLiveData.fromJson(response.data as Map<String, dynamic>);
    log(response.data.toString());
    return muxLiveData;
  }
  Future<List<MuxStream>> getLiveStreams() async {
    final response = await DioHelper.getData(url: getStreamsEndPoint);
    List<MuxStream> streamList = List<MuxStream>.from(
      (response.data as List).map(
        (model) => MuxStream.fromJson(
          Map<String, dynamic>.from(model),
        ),
      ),
    );
    log(" List<MuxStream> ${streamList.length}");
    return streamList;
  }

  Future<void> deleteLiveStream({required String liveStreamId}) async {
    await DioHelper.postData(
      url: closeStreamEndPoint,
      headers: {
        'liveStreamId': liveStreamId,
      },
    );
  }

// Future<MuxLiveData> getLiveStream({required String liveStreamId}) async {
//   final callable = functions.httpsCallable('retrieveLiveStream');
//   final response = await callable.call({
//     'liveStreamId': liveStreamId,
//   });
//   final muxLiveData = MuxLiveData.fromJson(response.data);
//   return muxLiveData;
// }
}
