//
//  ViewController.swift
//  Menue
//
//  Created by Hazem Mohammed on 9/26/18.
//  Copyright © 2018 Hazem Mohammed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        callApi()
    }
}

private extension ViewController {
    
    private func callApi() {
        let jsonUrl = "http://yachtv2.asfarbooking.com/api/v1/menu-on-board"
        guard let baseUrl = URL(string: jsonUrl) else { return }
        
        URLSession.shared.dataTask(with: baseUrl) { (data, response, erroe) in
            
            guard let myData = data else { return }
            
            do {
                
                let listOfFood = try JSONDecoder().decode(Menue.self, from: myData)
                
                print("JSON IS: \(listOfFood)")
                print("////////////////")
                let count = listOfFood.result.foodCategory
                for element in count {
                    print("MAIN IS : \(element.name)")
                    
                    let myDate = element.created_at
                    print("DATE IS : \(myDate)")
                    
                    let dateFormater = DateFormatter()
                    dateFormater.timeZone = TimeZone(abbreviation: "UTC")
                    dateFormater.dateFormat = "yyyy-MM-dd HH:mm:ss"
                    let newDate = dateFormater.date(from: myDate)
                    
                    let currentDate = Date()
                    
                    print("Date Object Is: \(String(describing: newDate))")
                    
                    guard let testDate = newDate else { return }
                    print("TEST DATE IS : \(testDate)")
                    
                    if testDate < currentDate {
                        print("WRONG")
                    } else {
                        print("OK DONE")
                    }
                    
                    let elements = element.foods
                    
                    for foods in elements{
                        print("SUB IS : \(foods.name)")
                    }
                }
                
            } catch {
                
                print("ERROR \(error)")
            }
            
            }.resume()
    }
}

