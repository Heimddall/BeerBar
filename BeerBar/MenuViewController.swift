//
//  ViewController.swift
//  BeerBar
//
//  Created by Никита Суровцев on 14.06.23.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet weak var barName: UILabel!
    
    @IBOutlet weak var alivariya: UILabel!
    @IBOutlet weak var baltika: UILabel!
    @IBOutlet weak var korona: UILabel!
    @IBOutlet weak var bud: UILabel!
    @IBOutlet weak var tuborg: UILabel!
    

    
    @IBOutlet var beerVolume: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        barName.text = "Dreenkeria"
        
        alivariya.text = "Аливария"
        alivariya.font = UIFont.boldSystemFont(ofSize: 20)
        baltika.text = "Балтика"
        baltika.font = UIFont.boldSystemFont(ofSize: 20)
        korona.text = "Корона"
        korona.font = UIFont.boldSystemFont(ofSize: 20)
        bud.text = "Bud"
        bud.font = UIFont.boldSystemFont(ofSize: 20)
        tuborg.text = "Tuborg"
        tuborg.font = UIFont.boldSystemFont(ofSize: 20)

//        for index in 0..<beerVolume.count {
//            [index].titleLabel?.text = "\(index)"
//        }
        
    }

     
    @IBAction func buyBeer(_ sender: UIButton) {
        let tag = sender.tag
        let row = tag / 10
        let column = tag % 10
        
        var buttonName = ""
        var beerNameforCollection = ""
        
        switch row  {
        case 0: beerNameforCollection = alivariya.text!
        case 1:
            beerNameforCollection = baltika.text!
        case 2:
            beerNameforCollection = korona.text!
        case 3:
            beerNameforCollection = bud.text!
        case 4:
            beerNameforCollection = tuborg.text!
        default:
            break
        }
        
        switch column  {
        case 0:
            buttonName = "0.33"
        case 1:
             buttonName = "0.5"
        case 2:
            buttonName = "1.0"
        default:
            break
        }
        
        print("Было куплено пиво  \(beerNameforCollection) объёмом \(buttonName)л")
    }
    
}

