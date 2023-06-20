//
//  SettingsViewController.swift
//  BeerBar
//
//  Created by Никита Суровцев on 20.06.23.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func newStuff(_ sender: Any) {
        print("Новая смена")
    }

    @IBAction func becomeZero(_ sender: Any) {
        print("Обнулили")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
