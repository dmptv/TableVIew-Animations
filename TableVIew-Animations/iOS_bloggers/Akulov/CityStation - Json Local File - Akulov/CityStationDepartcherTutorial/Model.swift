//
//  Model.swift
//  CityStationDepartcherTutorial
//
//  Created by Dima Tixon on 18/11/2016.
//  Copyright © 2016 ak. All rights reserved.
//

import UIKit


   // наподобие typedef и миникласс
public struct LocationPoint {
    public var longitude: CGFloat?
    public var latitude: CGFloat?
    // конструктор
    init(dict: NSDictionary) {
        longitude = dict.object(forKey: "longitude") as! CGFloat?
        latitude = dict.object(forKey: "latitude") as! CGFloat?
    }
}


class City {
    var countryTitle: String?
    var point: LocationPoint?
    var districtTitle: String?
    var cityId: Int?
    var cityTitle: String?
    var regionTitle: String?
    var stations: [Station]?

    init(dict: NSDictionary) {
        countryTitle = dict.object(forKey: "countryTitle") as! String?
        point = LocationPoint(dict: dict.object(forKey: "point") as! NSDictionary)
        districtTitle = dict.object(forKey: "districtTitle") as! String?
        cityId = dict.object(forKey: "cityId") as! Int?
        cityTitle = dict.object(forKey: "cityTitle") as! String?
        regionTitle = dict.object(forKey: "regionTitle") as! String?
        
        stations = []
        let tempArray3 = dict.object(forKey: "stations") as! [NSDictionary]
        for dictStation in tempArray3 {
            let station = Station(dict: dictStation)
            stations?.append(station)
        }
 
    }
    
}


class Station {
    var countryTitle: String?
    var point: LocationPoint?
    var districtTitle: String?
    var cityId: Int?
    var cityTitle: String?
    var regionTitle: String?
    var stationId: Int?
    var stationTitle: String?
    
    init(dict: NSDictionary) {
        countryTitle = dict.object(forKey: "countryTitle") as! String?
        point = LocationPoint(dict: dict.object(forKey: "point") as! NSDictionary)
        districtTitle = dict.object(forKey: "districtTitle") as! String?
        cityId = dict.object(forKey: "cityId") as! Int?
        cityTitle = dict.object(forKey: "cityTitle") as! String?
        regionTitle = dict.object(forKey: "regionTitle") as! String?
        stationId = dict.object(forKey: "stationId") as! Int?
        stationTitle = dict.object(forKey: "stationTitle") as! String?
    }
}

  // в этом классе распасим JSON ,
class Model: NSObject {
    var CitiesFrom: [City]?
    var CitiesTo: [City]?
    
       // наша функция
    func LoadData()  {
          // преобразуем JSON в Data
        let pathToJSON  = Bundle.main.path(forResource: "allStations.json", ofType: "") // запросили path файла у Bundle
        let jsonData = NSData(contentsOfFile: pathToJSON!)
    
        do {
               // вынули JSON как dictionary
            let dict = try JSONSerialization.jsonObject(with: jsonData! as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
            
              // в каждый из этих 2 классов распихаем словарь
            
            CitiesFrom = [] // init array
              // взяли массив из дикт по ключю
            let tempArray = dict.object(forKey: "citiesFrom") as! [NSDictionary]
            
              // проходим по циклу в массиве из дикт JSON
            for dictCity in tempArray {
                let newCityFrom =  City(dict: dictCity) // создаем новый объект класса City
                CitiesFrom?.append(newCityFrom) // добавляем город в массив
            }
            
            CitiesTo = [] // init array
              // взяли массив из дикт по ключю
            let tempArray2 = dict.object(forKey: "citiesTo") as! [NSDictionary]
            
              // проходим по циклу в массиве из дикт JSON
            for dictCity in tempArray2 {
                let newCityTo =  City(dict: dictCity) // создаем новый объект класса City
                CitiesTo?.append(newCityTo) // добавляем город в массив
            }
            print(CitiesFrom?[0].stations?[1].stationTitle as Any)
            print(CitiesTo?.count as Any)
            
        } catch  {
            print("Ошибка при парсе JSON: \(error)")
        }
        
        
        
    }

}






































