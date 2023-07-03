//
//  BarManager.swift
//  BeerBar
//
//  Created by Никита Суровцев on 3.07.23.
//

import Foundation
import UIKit

class BarManager {
    public static var shared = BarManager()
    private init(){}
    
    private let initialBeers: [Beer] = [
        Beer(name: "Лидскае классическое",
             country: "🇧🇾",
             type: .light,
             prices: (Decimal(5.5), Decimal(7.8), Decimal(9)),
             volume: 1000, image: UIImage(named: "lidskoe")!),
        Beer(name: "Алiварыя",
             country: "🇧🇾",
             type: .dark,
             prices: (Decimal(6.4), Decimal(7.5), Decimal(9.5)),
             volume: 200, image: UIImage(named: "alivaria")!),
        Beer(name: "Крынiца",
             country: "🇧🇾",
             type: .light,
             prices: (Decimal(4.5), Decimal(6.5), Decimal(7.5)),
             volume: 100, image: UIImage(named: "krynica")!),
        Beer(name: "Бобров",
             country: "🇧🇾",
             type: .light,
             prices: (Decimal(4), Decimal(6), Decimal(8)),
             volume: 120, image: UIImage(named: "bobrov")!),
        Beer(name: "Оболонь",
             country: "🇧🇾",
             type: .light,
             prices: (Decimal(3.8), Decimal(5.5), Decimal(2.5)),
             volume: 80, image: UIImage(named: "obolon")!),
        Beer(name: "Балтика 3",
             country: "🇧🇾",
             type: .light,
             prices: (Decimal(4.3), Decimal(5.5), Decimal(6.7)),
             volume: 300, image: UIImage(named: "baltika3")!),
        Beer(name: "Жигулевское",
             country: "🇧🇾",
             type: .light,
             prices: (Decimal(5), Decimal(6.3), Decimal(7.7)),
             volume: 200, image: UIImage(named: "zhigul")!),
        Beer(name: "Лидскае Бархатнае",
             country: "🇧🇾",
             type: .dark,
             prices: (Decimal(7.2), Decimal(8.9), Decimal(9.9)),
             volume: 2000, image: UIImage(named: "lidskoe_barhat")!),
        Beer(name: "Речицкое",
             country: "🇧🇾",
             type: .light,
             prices: (Decimal(4.1), Decimal(5.30), Decimal(7.5)),
             volume: 250, image: UIImage(named: "rechitskae")!),
        Beer(name: "Pliny the Elder",
             country: "🇺🇸",
             type: .dark,
             prices: (Decimal(5.3), Decimal(6.8), Decimal(8.4)),
             volume: 230, image: UIImage(named: "pliny")!),
        Beer(name: "Warsteiner",
             country: "🇧🇾",
             type: .light,
             prices: (Decimal(5.4), Decimal(8.5), Decimal(9.5)),
             volume: 160, image: UIImage(named: "warsteiner")!),
        Beer(name: "Каленцыя Майстра",
             country: "🇧🇾",
             type: .light,
             prices: (Decimal(6.4), Decimal(8.5), Decimal(9.5)),
             volume: 220, image: UIImage(named: "kalekcyya")!),
        Beer(name: "BOHÉMSKÝ LEV",
             country: "🇧🇾",
             type: .light,
             prices: (Decimal(8), Decimal(9.2), Decimal(9.9)),
             volume: 190, image: UIImage(named: "lev")!),
        Beer(name: "Celebrator",
             country: "🇩🇪",
             type: .dark,
             prices: (Decimal(14.2), Decimal(17.5), Decimal(19.8)),
             volume: 70, image: UIImage(named: "celebrator")!),
        Beer(name: "St. Bernardus Abt 12",
             country: "🇧🇪",
             type: .dark,
             prices: (Decimal(16.4), Decimal(19.7), Decimal(23.4)),
             volume: 90, image: UIImage(named: "Bernardus")!)]
    
    var beers: [Beer] = []
    
    var totalSalary: Decimal = 0.0
    var todaySalary: Decimal = 0.0
    
    func pricesForBeer(with index: Int) -> (Decimal, Decimal, Decimal) {beers[index].prices}
    
    func buyBeer(with index: Int, volume: Decimal) {
        
        beers[index].volume -= volume
        
        switch volume {
        case 0.33:
            todaySalary += beers[index].prices.0
        case 0.5:
            todaySalary += beers[index].prices.1
        case 1.0:
            todaySalary += beers[index].prices.2
        default:
            return
        }
    }
    func newDay() {
        totalSalary += todaySalary
        todaySalary = 0
    }
    
    func resetAll(){
        totalSalary = 0
        todaySalary = 0
        beers = initialBeers
    }
}
