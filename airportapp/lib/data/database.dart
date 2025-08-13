class Database {
  static const Map<String, String> airlineCodes = {
    "AFL": "Aeroflot",
    "KZR": "Air Astana",
    "ABL": "Air Busan",
    "KHV": "Air Cambodia",
    "ACA": "Air Canada",
    "CCA": "Air China",
    "AFR": "Air France",
    "AIC": "Air India",
    "MAU": "Air Mauritius",
    "ANZ": "Air New Zealand",
    "ANG": "Air Niugini",
    "APZ": "Air Premia",
    "ASV": "Air Seoul",
    "AXM": "AirAsia",
    "XAX": "AirAsia X",
    "ANA": "All Nipon Airways",
    "AAR": "Asiana Airlines",
    "BKP": "Bangkok Airways",
    "MXD": "Batik Air Malaysia",
    "BAW": "British Airways",
    "KME": "Cambodia Airways",
    "CPA": "Cathay Pacific",
    "CEB": "Cebu Pacific Air",
    "CAL": "China Airlines",
    "CES": "China Eastern Airlines",
    "CSN": "China Southern Airlines",
    "MSR": "Egyptair",
    "UAE": "Emirates",
    "ETH": "Ethiopian Airlines",
    "ETD": "Etihad Airways",
    "EVA": "EVA Air",
    "EZA": "Eznis Airways",
    "FJI": "Fiji Airways",
    "FIN": "Finnair",
    "GIA": "Garuda Indonesia",
    "HGB": "Greater Bay Airlines",
    "CHH": "Hainan Airlines",
    "HBH": "Hebei Airlines",
    "HKE": "HK Express",
    "CRK": "Hong Kong Airlines",
    "IGO": "IndiGo",
    "JAL": "Japan Airlines",
    "JJA": "Jeju Air",
    "CJX": "Jiangxi Air",
    "JNA": "Jin Air",
    "DKH": "Juneyao Airlines",
    "KLM": "KLM Royal Dutch Airlines",
    "KAL": "Korean Air",
    "MKR": "Lanmei Airlines",
    "CDC": "Loongair",
    "LKE": "Lucky Air",
    "DLH": "Lufthansa",
    "MAS": "Malaysia Airlines",
    "MDA": "Mandarin Airlines",
    "MGL": "MIAT Mongolian Airlines",
    "RNA": "Nepal Airlines",
    "APJ": "Peach Aviation",
    "PAL": "Philippine Airlines",
    "APG": "Philippines AirAsiA",
    "AWQ": "PT Indonesia AirAsia",
    "QFA": "Qantas Airways",
    "QTR": "Qatar Airways",
    "QDA": "Qingdao Airlines",
    "RYL": "Royal Air Philippines",
    "RBA": "Royal Brunei Airlines",
    "RJA": "Royal Jordanian",
    "RLH": "Ruili Airlines",
    "SBI": "S7 Airlines",
    "SCO": "SCOOT",
    "CDG": "Shandong Airlines",
    "CSH": "Shanghai Airlines",
    "CSZ": "Shenzhen Airlines",
    "CSC": "Sichuan Airlines",
    "SIA": "Singapore Airlines",
    "SEJ": "SpiceJet",
    "CQH": "Spring Airlines",
    "SJX": "Starlux Airlines",
    "SWR": "Swiss Airlines",
    "TWB": "T`way Air",
    "AIQ": "Thai AirAsia",
    "THA": "Thai Airways",
    "TLM": "Thai Lion Air",
    "TBA": "Tibet Airlines",
    "THY": "Turkish Airlines",
    "UAL": "United Airlines",
    "CUH": "Urumqi Air",
    "VJC": "VietJet Air",
    "HVN": "Vietnam Airlines",
    "CHB": "West Air",
    "CXA": "Xiamen Airlines",
  };

  static const Map<String, String> airlineLogos = {
    "AFL": "lib/images/afl.png",
    "KZR": "lib/images/kzr.png",
    "ABL": "lib/images/abl.png",
    "KHV": "lib/images/khv.png",
    "ACA": "lib/images/wmoaca.png",
    "CCA": "lib/images/wmocca.png",
    "AFR": "lib/images/wmoafr.png",
    "AIC": "lib/images/wmoaic.png",
    "MAU": "lib/images/wmomau.png",
    "ANZ": "lib/images/wmoanz.png",
    "ANG": "lib/images/wmoang.png",
    "APZ": "lib/images/wmoapz.png",
    "ASV": "lib/images/wmoasv.png",
    "AXM": "lib/images/wmoaxm.png",
    "XAX": "lib/images/wmoxax.png",
    "ANA": "lib/images/wmoana.png",
    "AAR": "lib/images/wmoaar.png",
    "BKP": "lib/images/wmobkp.png",
    "MXD": "lib/images/wmomxd.png",
    "BAW": "lib/images/wmobaw.png",
    "KME": "lib/images/wmokme.png",
    "CPA": "lib/images/cathay_logo.png",
    "CEB": "lib/images/wmoceb.png",
    "CAL": "lib/images/wmocal.png",
    "CES": "lib/images/wmoces.png",
    "CSN": "lib/images/wmocsn1.png",
    "MSR": "lib/images/wmomsr.png",
    "UAE": "lib/images/wmouae.png",
    "ETH": "lib/images/wmoeth.png",
    "ETD": "lib/images/wmoetd.png",
    "EVA": "lib/images/wmoeva.png",
    "EZA": "lib/images/wmoeza.png",
    "FJI": "lib/images/wmofji.png",
    "FIN": "lib/images/wmofin.png",
    "GIA": "lib/images/wmogia.png",
    "HGB": "lib/images/wmohgb.png",
    "CHH": "lib/images/wmochh.png",
    "HBH": "lib/images/wmohbh.png",
    "HKE": "lib/images/wmohke.png",
    "CRK": "lib/images/wmocrk.png",
    "IGO": "lib/images/wmoigo.png",
    "JAL": "lib/images/wmojal.png",
    "JJA": "lib/images/wmojja.png",
    "CJX": "lib/images/wmocjx.png",
    "JNA": "lib/images/wmojna.png",
    "DKH": "lib/images/wmodkh.png",
    "KLM": "lib/images/wmoklm.png",
    "KAL": "lib/images/wmokal.png",
    "MKR": "lib/images/wmomkr.png",
    "CDC": "lib/images/wmocdc.png",
    "LKE": "lib/images/wmolke.png",
    "DLH": "lib/images/wmodlh.png",
    "MAS": "lib/images/wmomas.png",
    "MDA": "lib/images/wmomda.png",
    "MGL": "lib/images/wmomgl.png",
    "RNA": "lib/images/wmorna.png",
    "APJ": "lib/images/wmoapj.png",
    "PAL": "lib/images/wmopal.png",
    "APG": "lib/images/wmoapg.png",
    "AWQ": "lib/images/wmoawq.png",
    "QFA": "lib/images/wmoqfa.png",
    "QTR": "lib/images/wmoqtr.png",
    "QDA": "lib/images/wmoqda.png",
    "RYL": "lib/images/wmoryl.png",
    "RBA": "lib/images/wmorba.png",
    "RJA": "lib/images/wmorja.png",
    "RLH": "lib/images/wmorlh.png",
    "SBI": "lib/images/wmoglp.png",
    "SCO": "lib/images/wmotgw.png",
    "CDG": "lib/images/wmocdg.png",
    "CSH": "lib/images/wmocsh.png",
    "CSZ": "lib/images/wmocsz.png",
    "CSC": "lib/images/wmocsc.png",
    "SIA": "lib/images/wmosia.png",
    "SEJ": "lib/images/wmosej.png",
    "CQH": "lib/images/wmocqh.png",
    "SJX": "lib/images/wmosjx.png",
    "SWR": "lib/images/wmoswr.png",
    "TWB": "lib/images/wmotwb.png",
    "AIQ": "lib/images/wmoaiq.png",
    "THA": "lib/images/wmotha.png",
    "TLM": "lib/images/wmotlm.png",
    "TBA": "lib/images/wmotba.png",
    "THY": "lib/images/wmothy.png",
    "UAL": "lib/images/wmoual.png",
    "CUH": "lib/images/wmocuh.png",
    "VJC": "lib/images/wmovjc.png",
    "HVN": "lib/images/wmohvn.png",
    "CHB": "lib/images/wmochb.png",
    "CXA": "lib/images/wmocxa.png",
  };

  static const Map<String, String> airportCodes = {
    "AFL": "Aeroflot",
    "KZR": "Air Astana",
    "ABL": "Air Busan",
    "KHV": "Air Cambodia",
    "ACA": "Air Canada",
    "CCA": "Air China",
    "AFR": "Air France",
    "AIC": "Air India",
    "MAU": "Air Mauritius",
    "ANZ": "Air New Zealand",
    "ANG": "Air Niugini",
    "APZ": "Air Premia",
    "ASV": "Air Seoul",
    "AXM": "AirAsia",
    "XAX": "AirAsia X",
    "ANA": "All Nipon Airways",
    "AAR": "Asiana Airlines",
    "BKP": "Bangkok Airways",
    "MXD": "Batik Air Malaysia",
    "BAW": "British Airways",
    "KME": "Cambodia Airways",
    "CPA": "Cathay Pacific",
    "CEB": "Cebu Pacific Air",
    "CAL": "China Airlines",
    "CES": "China Eastern Airlines",
    "CSN": "China Southern Airlines",
    "MSR": "Egyptair",
    "UAE": "Emirates",
    "ETH": "Ethiopian Airlines",
    "ETD": "Etihad Airways",
    "EVA": "EVA Air",
    "EZA": "Eznis Airways",
    "FJI": "Fiji Airways",
    "FIN": "Finnair",
    "GIA": "Garuda Indonesia",
    "HGB": "Greater Bay Airlines",
    "CHH": "Hainan Airlines",
    "HBH": "Hebei Airlines",
    "HKE": "HK Express",
    "CRK": "Hong Kong Airlines",
    "IGO": "IndiGo",
    "JAL": "Japan Airlines",
    "JJA": "Jeju Air",
    "CJX": "Jiangxi Air",
    "JNA": "Jin Air",
    "DKH": "Juneyao Airlines",
    "KLM": "KLM Royal Dutch Airlines",
    "KAL": "Korean Air",
    "MKR": "Lanmei Airlines",
    "CDC": "Loongair",
    "LKE": "Lucky Air",
    "DLH": "Lufthansa",
    "MAS": "Malaysia Airlines",
    "MDA": "Mandarin Airlines",
    "MGL": "MIAT Mongolian Airlines",
    "RNA": "Nepal Airlines",
    "APJ": "Peach Aviation",
    "PAL": "Philippine Airlines",
    "APG": "Philippines AirAsiA",
    "AWQ": "PT Indonesia AirAsia",
    "QFA": "Qantas Airways",
    "QTR": "Qatar Airways",
    "QDA": "Qingdao Airlines",
    "RYL": "Royal Air Philippines",
    "RBA": "Royal Brunei Airlines",
    "RJA": "Royal Jordanian",
    "RLH": "Ruili Airlines",
    "SBI": "S7 Airlines",
    "SCO": "SCOOT",
    "CDG": "Shandong Airlines",
    "CSH": "Shanghai Airlines",
    "CSZ": "Shenzhen Airlines",
    "CSC": "Sichuan Airlines",
    "SIA": "Singapore Airlines",
    "SEJ": "SpiceJet",
    "CQH": "Spring Airlines",
    "SJX": "Starlux Airlines",
    "SWR": "Swiss Airlines",
    "TWB": "T`way Air",
    "AIQ": "Thai AirAsia",
    "THA": "Thai Airways",
    "TLM": "Thai Lion Air",
    "TBA": "Tibet Airlines",
    "THY": "Turkish Airlines",
    "UAL": "United Airlines",
    "CUH": "Urumqi Air",
    "VJC": "VietJet Air",
    "HVN": "Vietnam Airlines",
    "CHB": "West Air",
    "CXA": "Xiamen Airlines",
  };
}

/* class MainCategory{
  List<DayLight> allData;

  MainCategory({required this.allData});
  
  factory MainCategory.fromJson(List<Map<String, Object>> json){
    return MainCategory(allData: json.map((e) => DayLight.fromJson(e)).toList());
  }
}

class DayLight{
  String? date;
  List<Flight>? list;

  DayLight({this.date, this.list});

  DayLight.fromJson(Map<String, Object> json){
    date = json['date'] as String;
    if(json['list'] != null){
      list = <Flight>[];
      (json['list'] as List).forEach((e) {
        list!.add(Flight.fromJson(e));
      });
    }
  }
}

class Flight{
  String? time;
  String? status;
  String? statusCode;
  String? terminal;
  String? aisle;
  String? gate;
  List<String>? dest;
  List<FlightData>? flight;

  Flight({this.time, this.status, this.statusCode, this.terminal, this.aisle, this.gate, this.dest, this.flight});

  Flight.fromJson(Map<String, dynamic> json){
    time = json['time'];
    status = json['status'];
    statusCode = json['statusCode'];
    terminal = json['terminal'];
    aisle = json['aisle'];
    gate = json['gate'];
    if(json['flight'] != null){
      flight = <FlightData>[];
      (json['flight'] as List).forEach((e) {
        flight!.add(FlightData.fromJson(e));
      });
    }
    if (json['destination'] != null) {
      dest = List<String>.from(json['destination']);
    }
  }
}

class FlightData{
  String? flightNumber;
  String? airlineCode;

  FlightData({this.flightNumber, this.airlineCode});
  FlightData.fromJson(Map<String, dynamic> json){
    flightNumber = json['no'];
    airlineCode = json['airline'];
  }
} */