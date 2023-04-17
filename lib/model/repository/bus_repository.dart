import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/type/types.dart';
import 'package:kumoh_school_bus/util/date_format.dart';

class BusRepository {
  BusRepository._privateConstructor();

  static final BusRepository _instance = BusRepository._privateConstructor();

  factory BusRepository() {
    return _instance;
  }

  Future<List<StationDTO>> requestStationList() async {
    return [
      StationDTO(sId: 1, sName: "sName1", sLat: 35.8714354, sLng: 128.601445),
      StationDTO(sId: 2, sName: "sName2", sLat: 35.8714, sLng: 128.601),
    ];
  }

  Future<SearchResponseDTO> requestSearchBus(
      SearchRequestDTO requestDTO) async {
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
        sId: 1,
        sName: "sName",
        sLat: 0.0,
        sLng: 0.0,
      ),
      reservationDate: onlyDateFormat.parse(requestDTO.date),
    );
  }
}
