
/*
 This is where you will be getting your data from a different source.
 */

import UIKit

class Data {
    
    static func getData(completion: @escaping ([Model]) -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            var data = [Model]()
            data.append(Model(title: "Finish Home Work", subTitle: "Web App", images: [], data1: "8", data2: "AM"))
            data.append(Model(title: "Linch Break", subTitle: "", images: [], data1: "11", data2: "AM"))
            data.append(Model(title: "Design Standup", subTitle: "Hangouts", images: getImages(), data1: "2", data2: "PM"))
            
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
    
    static func getImages() -> [UIImage] {
        var images = [UIImage]()
        images.append(Icons.profileIcon1)
        images.append(Icons.profileIcon2)
        images.append(Icons.profileIcon3)
        return images
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
