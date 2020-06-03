//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Evgenii Goncharov on 03/07/2020.
//  Copyright © 2020 Evgenii Goncharov. All rights reserved.
//

import UIKit


struct Place {
    
    var name: String
    var location: String?
    var type: String?
    var image: UIImage?
    var restarentImage: String?
    
    static let restaurantNames = [
        "Burger Heroes", "Kitchen", "Bonsai", "Дастархан",
        "Индокитай", "X.O", "Балкан Гриль", "Sherlock Holmes",
        "Speak Easy", "Morris Pub", "Вкусные истории",
        "Классик", "Love&Life", "Шок", "Бочка"
    ]
    
    static func getPlaces() -> [Place] {
        
        var places = [Place]()
        
        for place in restaurantNames {
            places.append(Place(name: place, location: "Иркутск", type: "Ресторан", image: nil, restarentImage: place))
        }
        
        return places
    }
}
