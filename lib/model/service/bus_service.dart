import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/model/repository/bus_repository.dart';

class BusService {
  BusService._privateConstructor();

  static final BusService _instance = BusService._privateConstructor();

  factory BusService() {
    return _instance;
  }

  final BusRepository _repository = BusRepository();

  List<StationDTO>? _stationDTOList;

  List<StationDTO>? get stationDTOList => _stationDTOList;

  Future requestStationList() async {
    _stationDTOList ??= await _repository.requestStationList();
  }

  SearchResponseDTO? _searchResponseDTO;

  SearchResponseDTO? get searchResponseDTO => _searchResponseDTO;

  Future requestSearchBus(SearchRequestDTO requestDTO) async {
    _searchResponseDTO = await _repository.requestSearchBus();
  }

  void clearSearchResponseDTO() {
    _searchResponseDTO = null;
  }
}