import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/type/types.dart';
import 'package:kumoh_school_bus/util/date_format.dart';

import 'base_repository.dart';

class BusRepository implements BaseRepository {
  @override
  String path = "/bus";

  BusRepository._privateConstructor();

  static final BusRepository _instance = BusRepository._privateConstructor();

  factory BusRepository() {
    return _instance;
  }

  Future<SearchResponseDTO> requestSearchBus(
      SearchRequestDTO requestDTO) async {
    Map<String, dynamic>? json = await BaseRepository.post("$path/", requestDTO.toJson());
    if (json == null) {
      return SearchResponseDTO(
        busList: [
          BusDTO(
            busNum: "하교-1호",
            busTimeSeatList: [
              BusTimeSeatDTO(
                busTimeDTO: BusTimeDTO(
                  startTime: "18시 15분",
                  endTime: "19시 25분",
                ),
                timeSeatList: [
                  TimeSeatDTO(isReserved: false, seatNum: 1),
                  TimeSeatDTO(isReserved: false, seatNum: 2),
                  TimeSeatDTO(isReserved: false, seatNum: 3),
                ],
              ),
              BusTimeSeatDTO(
                busTimeDTO: BusTimeDTO(
                  startTime: "20시 00분",
                  endTime: "21시 10분",
                ),
                timeSeatList: [
                  TimeSeatDTO(isReserved: false, seatNum: 1),
                  TimeSeatDTO(isReserved: false, seatNum: 2),
                  TimeSeatDTO(isReserved: false, seatNum: 3),
                ],
              ),
            ],
          ),
          BusDTO(
            busNum: "하교-2호",
            busTimeSeatList: [
              BusTimeSeatDTO(
                busTimeDTO: BusTimeDTO(
                  startTime: "18시 15분",
                  endTime: "19시 05분",
                ),
                timeSeatList: [
                  TimeSeatDTO(isReserved: false, seatNum: 1),
                  TimeSeatDTO(isReserved: false, seatNum: 2),
                  TimeSeatDTO(isReserved: false, seatNum: 3),
                ],
              ),
              BusTimeSeatDTO(
                busTimeDTO: BusTimeDTO(
                  startTime: "20시 00분",
                  endTime: "20시 55분",
                ),
                timeSeatList: [
                  TimeSeatDTO(isReserved: false, seatNum: 1),
                  TimeSeatDTO(isReserved: false, seatNum: 2),
                  TimeSeatDTO(isReserved: false, seatNum: 3),
                ],
              ),
            ],
          ),
        ],
        direction: Direction.fromString(requestDTO.type),
        station: StationDTO(
          sId: "1",
          sName: "sName",
          sLat: 0.0,
          sLng: 0.0,
        ),
        reservationDate: onlyDateFormat.parse(requestDTO.date),
      );
    } else {
      return SearchResponseDTO.fromJson(json);
    }
  }
}
