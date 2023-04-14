import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/model/dto/time_seat_dto.dart';

import '../type/types.dart';

class MainViewModel extends ChangeNotifier {
  Direction direction = Direction.toDaegu;
  DateTime reservationDate = DateTime.now();
  String station = "sName1";
  List<StationDTO> stations = [
    StationDTO(sId: 1, sName: "sName1", sLat: 35.8714354, sLng: 128.601445),
    StationDTO(sId: 2, sName: "sName2", sLat: 35.8714, sLng: 128.601),
  ];
  late Set<Marker> setOfMarkers;

  void initMarkers() =>
      setOfMarkers = stations.map((e) => e.toMarker()).toSet();

  void onDirectionChange(dynamic value) {
    direction = value;
    notifyListeners();
  }

  void onReservationDateChanged(DateTime? value) {
    reservationDate = value ?? reservationDate;
    notifyListeners();
  }

  void navigateToReservationPage(BuildContext context) {
    Navigator.pushNamed(
      context,
      "/reservation",
      arguments: {
        'searchResponseDTO' : SearchResponseDTO(
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
        ),
        'station' : station,
        'reservationDate' : reservationDate,
      },
    );
  }
}
