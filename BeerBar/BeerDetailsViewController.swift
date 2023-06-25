//
//  BeerDetailsViewController.swift
//  BeerBar
//
//  Created by Никита Суровцев on 25.06.23.
//

import UIKit

class BeerDetailsViewController: UIViewController {

    @IBOutlet weak var beerTypeLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    
    @IBOutlet weak var beerImage: UIImageView!
    
    @IBOutlet weak var volumeSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var beerPrice: UILabel!
    
    var parentController: MenuViewController!
    
    @IBOutlet weak var buyButton: UIButton!
    
    var beer = Beer(name: "Ошибка", country: "", type: .light, prices: (0,0,0), volume: 0, image: UIImage(named: "lidskoe")!)
    
    var beerIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        feelDefaultValues()
    }
    
    private func feelDefaultValues(){
        title = "\(beer.country) \(beer.name)"
        beerImage.image = beer.image
        switch beer.type {
        case .dark:
            beerTypeLabel.text = "Тёмное"
        case .light:
            beerTypeLabel.text = "Светлое"
        }
        
        beerPrice.text = "Стоимость:\(beer.prices.0) BYN"
        checkVolume()
    }
    
    private func updateVolume() {
        volumeLabel.text = "Остаток:\(beer.volume) л."
    }
    
    private func checkVolume(){
        buyButton.isEnabled = getCurrentVolume() <= beer.volume
        updateVolume()
    }
    
    private func getCurrentVolume() -> Decimal{
        switch volumeSegmentControl.selectedSegmentIndex {
        case 0:
            return 0.33
        case 1:
            return 0.5
        case 2:
            return 1
        default:
            return 0
        }
        
    }
    
    @IBAction func changeVolume(_ sender: Any) {
        switch volumeSegmentControl.selectedSegmentIndex {
        case 0:
            beerPrice.text = "Стоимость:\(beer.prices.0) BYN"
        case 1:
            beerPrice.text = "Стоимость:\(beer.prices.1) BYN"
        case 2:
            beerPrice.text = "Стоимость:\(beer.prices.2) BYN"
        default:
            return
        }
        checkVolume()
    }
    
    @IBAction func buyBeer(_ sender: Any) {
        beer.volume -= getCurrentVolume()
        parentController.beers[beerIndex].volume = beer.volume
        parentController.addBeers()
        checkVolume()
    }
    
}
