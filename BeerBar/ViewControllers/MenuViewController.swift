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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Dreenkeria"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addBeers()
    }
    
    func addBeers(){
        for index in 0..<beerNames.count {
            beerNames[index].text = "\(BarManager.shared.beers[index].country) \(BarManager.shared.beers[index].name)"
            
            beerVolumes[index].text = "Остаток:\(BarManager.shared.beers[index].volume) л."
        }
    }
    
    
    @IBAction func goToBeerDetails(_ sender: UIButton) {
        guard let destinationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BeerDetailsViewController") as? BeerDetailsViewController else {return}
        let beerIndex = sender.tag
        destinationController.beerIndex = beerIndex
        
        navigationController?.pushViewController(destinationController, animated: true)
        
    }
    
}
