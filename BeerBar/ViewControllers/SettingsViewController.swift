//
//  SettingsViewController.swift
//  BeerBar
//
//  Created by Никита Суровцев on 20.06.23.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var todaySalaryLabel: UILabel!
    
    @IBOutlet weak var totalSalaryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateSalaries()
    }

    func updateSalaries() {
        todaySalaryLabel.text =
"""
Выручка сегодня:
\(BarManager.shared.todaySalary)руб.
"""
        totalSalaryLabel.text =
"""
Выручка всего:
\(BarManager.shared.totalSalary)руб.
"""
    }
    
    @IBAction func newStuff(_ sender: Any) {
        print("Новая смена")
        BarManager.shared.newDay()
        updateSalaries()
    }

    @IBAction func becomeZero(_ sender: Any) {
        print("Обнулили")
        BarManager.shared.resetAll()
        updateSalaries()
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
