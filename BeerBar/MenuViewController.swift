//
//  ViewController.swift
//  BeerBar
//
//  Created by Никита Суровцев on 14.06.23.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet var BeerButtons: [UIButton]!
    
    @IBOutlet var beerNames: [UILabel]!
    
    @IBOutlet var beerVolumes: [UILabel]!
    
    var beers = [
        Beer(name: "Лидскае классическое",
             country: "🇧🇾",
             type: .light,
             prices: (Decimal(5.5), Decimal(7.8), Decimal(9)),
             volume: 1000),
        Beer(name: "Алiварыя",
             country: "🇧🇾",
             type: .dark,
             prices: (Decimal(6.4), Decimal(7.5), Decimal(9.5)),
             volume: 200),
        Beer(name: "Крынiца",
             country: "🇧🇾",
             type: .light,
             prices: (Decimal(4.5), Decimal(6.5), Decimal(7.5)),
             volume: 100),
        Beer(name: "Бобров",
             country: "🇧🇾",
             type: .light,
             prices: (Decimal(4), Decimal(6), Decimal(8)),
             volume: 120),
        Beer(name: "Оболонь",
             country: "🇧🇾",
             type: .light,
             prices: (Decimal(3.8), Decimal(5.5), Decimal(2.5)),
             volume: 80),
        Beer(name: "Балтика 3",
             country: "🇧🇾",
             type: .light,
             prices: (Decimal(4.3), Decimal(5.5), Decimal(6.7)),
             volume: 300),
        Beer(name: "Жигулевское",
             country: "🇧🇾",
             type: .light,
             prices: (Decimal(5), Decimal(6.3), Decimal(7.7)),
             volume: 200),
        Beer(name: "Лидскае Бархатнае",
             country: "🇧🇾",
             type: .dark,
             prices: (Decimal(7.2), Decimal(8.9), Decimal(9.9)),
             volume: 2000),
        Beer(name: "Речицкое",
             country: "🇧🇾",
             type: .light,
             prices: (Decimal(4.1), Decimal(5.30), Decimal(7.5)),
             volume: 250),
        Beer(name: "KORONET",
             country: "🇧🇾",
             type: .dark,
             prices: (Decimal(5.3), Decimal(6.8), Decimal(8.4)),
             volume: 230),
        Beer(name: "Warsteiner",
             country: "🇧🇾",
             type: .light,
             prices: (Decimal(5.4), Decimal(8.5), Decimal(9.5)),
             volume: 160),
        Beer(name: "Каленцыя Майстра",
             country: "🇧🇾",
             type: .light,
             prices: (Decimal(6.4), Decimal(8.5), Decimal(9.5)),
             volume: 220),
        Beer(name: "BOHÉMSKÝ LEV",
             country: "🇧🇾",
             type: .light,
             prices: (Decimal(8), Decimal(9.2), Decimal(9.9)),
             volume: 190),
        Beer(name: "Celebrator",
             country: "🇩🇪",
             type: .dark,
             prices: (Decimal(14.2), Decimal(17.5), Decimal(19.8)),
             volume: 70),
        Beer(name: "St. Bernardus Abt 12",
             country: "🇧🇪",
             type: .dark,
             prices: (Decimal(16.4), Decimal(19.7), Decimal(23.4)),
             volume: 90)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Dreenkeria"
        
        addBeers()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        guard let sender = sender as? UIButton else {return}
        
        let beerIndex = sender.tag
        guard let destinationController = segue.destination as? BeerDetailsViewController else {return}
        
        destinationController.beerIndex = beerIndex
        destinationController.beer = beers[beerIndex]
        destinationController.parentController = self
    }
    
    func addBeers(){
        for index in 0..<beerNames.count {
            beerNames[index].text = "\(beers[index].country) \(beers[index].name)"
            
            beerVolumes[index].text = "Остаток:\(beers[index].volume) л."
        }
    }
    
}
