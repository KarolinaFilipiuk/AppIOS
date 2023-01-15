//
//  StockCandle.swift
//  USStonks
//
//  Created by Guest User on 08/01/2023.
//

import Foundation

struct StockCandle: Codable {
    var currency:String
    var description:String
    var displaySymbol:String? = ""
    var figi:String? = ""
    var isin:String? = ""
    var mic:String? = ""
    var shareClassFIGI:String? = ""
    var symbol:String
    var symbol2:String? = ""
    var type:String? = ""
}
