//
//  BasketViewController.swift
//  BeerBar
//
//  Created by Никита Суровцев on 4.07.23.
//

import UIKit

class BasketViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Корзина"
        
        // Создание и настройка метки
        let label = UILabel()
        label.text = "Привет, мир!"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 17)
        
        // Размещение метки внутри представления
        view.addSubview(label)
        
        // Установка констрейнтов для метки
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}
