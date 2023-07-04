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
    
    @IBOutlet weak var buyButton: UIButton!
    
    
    var beerIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        feelDefaultValues()
    }
    
    private func feelDefaultValues(){
        let currentBeer = BarManager.shared.beers[beerIndex]
        title = "\(currentBeer.country) \(currentBeer.name)"
        beerImage.image = currentBeer.image
        switch currentBeer.type {
        case .dark:
            beerTypeLabel.text = "Тёмное"
        case .light:
            beerTypeLabel.text = "Светлое"
        }
        
        changeVolume(volumeSegmentControl)
        checkVolume()
    }
    
    private func updateVolume() {
        volumeLabel.text = "Остаток:\(BarManager.shared.beers[beerIndex].volume) л."
    }
    
    private func checkVolume(){
        buyButton.isEnabled = getCurrentVolume() <= BarManager.shared.beers[beerIndex].volume
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
    
    @IBAction func changeVolume(_ sender: UISegmentedControl) {
        let prices = BarManager.shared.pricesForBeer(with: beerIndex)
        
        switch volumeSegmentControl.selectedSegmentIndex {
        case 0:
            beerPrice.text = "Стоимость:\(prices.0) BYN"
        case 1:
            beerPrice.text = "Стоимость:\(prices.1) BYN"
        case 2:
            beerPrice.text = "Стоимость:\(prices.2) BYN"
        default:
            return
        }
        checkVolume()
    }
    
    @IBAction func buyBeer(_ sender: Any) {
        BarManager.shared.buyBeer(with: beerIndex, volume: getCurrentVolume()) {
            isSuccess in
            print(isSuccess)
            self.checkVolume()
        }
    }
}
