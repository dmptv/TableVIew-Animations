
/*
 This is where you will be getting your data from a different source.
 */

import UIKit

class Data {
    
    static func getData(completion: @escaping ([Model]) -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            var data = [Model]()
            data.append(Model(title: "Title", subTitle: "Subtitle", image: nil, data1: "Data1", data2: "Data2"))
            
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
    
    static func getDayWeather(completion: @escaping (DayWeather?) -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            let dayWeather = DayWeather.init(dayName: "Monday", longDate: "February 17, 2018", temperature: "30º", city: "Paris", weatherIcon: Icons.weatherIcon)
            
            DispatchQueue.main.async {
                completion(dayWeather)
            }
        }
    }
}
