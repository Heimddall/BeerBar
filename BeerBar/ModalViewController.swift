//
//  NavigationViewController.swift
//  BeerBar
//
//  Created by Никита Суровцев on 20.06.23.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet weak var developerName: UILabel!
    
    @IBOutlet weak var linkToDevAccOnTg: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        developerName.text = "Nikita Surovtsev"

    }
    @IBAction func openDevTg(_ sender: Any) {

        let appURL = URL(string: "telegram://profile/miksunn")!
            let application = UIApplication.shared
            
            if application.canOpenURL(appURL)
            {
                application.open(appURL)
            }
            else
            {
                let webURL = URL(string: "https://t.me/miksunn")!
                application.open(webURL)
            }
        }
    @IBAction func closeController(_ sender: Any) {
        dismiss(animated: true)
    }
}
