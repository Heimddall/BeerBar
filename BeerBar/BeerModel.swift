//
//  BeerModel.swift
//  BeerBar
//
//  Created by Никита Суровцев on 24.06.23.
//

import Foundation

struct Beer {
    let name: String
    let country: String
    let type: BeerType
    let prices: (Decimal, Decimal, Decimal)
    var volume: Decimal
}

enum BeerType {
    case light, dark
}
