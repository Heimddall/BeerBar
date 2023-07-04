//
//  BarManagerDelegate.swift
//  BeerBar
//
//  Created by Никита Суровцев on 5.07.23.
//

import Foundation

protocol BarManagerDelegate: AnyObject {
    func salaryWasUpdated()
    func beersWasUpdated()
}

extension BarManagerDelegate {
    func salaryWasUpdated() {}
    func beersWasUpdated() {}
}
