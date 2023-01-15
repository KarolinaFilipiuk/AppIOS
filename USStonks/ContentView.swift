//
//  ContentView.swift
//  USStonks
//
//  Created by Guest User on 06/01/2023.
//

import SwiftUI
import CoreData
import Alamofire
import UIKit

struct ContentView: View {

    @Environment(\.managedObjectContext) private var viewContext

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    
    @State var isModal: Bool = false
    
    @State var  items = [StockCandle]()
    @State private var date = Date()
    @State var isPlaying : Bool = false
    @State var count = 0

    func makeRequest(){
        let exchangeType = "US"
        let mic = "XNY"
        let token = "cetcqsaad3i5jsal2vc0cetcqsaad3i5jsal2vcg"
         
        
        let url = "https://finnhub.io/api/v1/stock/symbol"
       
        let parameters: Parameters = [
            "exchange": exchangeType,
            "token":token
            ]
        
        var headers: HTTPHeaders = [
                   "Content-Type": "application/json"
               ]
        
        AF.request(url,method: .get,parameters: parameters,
                encoding: URLEncoding.queryString,
                headers: headers)
            .responseJSON { (response) in
                switch (response.result){
                case .success:
                    
                    var tempList = [StockCandle]()
                    
                    if let values = response.value{
                    if let stockCandles = values as? [[String:Any]]{
                        for stockCandle in stockCandles{
                              
                            let currency = stockCandle["currency"] as? String
                            let description = stockCandle["description"] as? String
                            let displaySymbol = stockCandle["displaySymbol"] as? String
                            let figi = stockCandle["figi"] as? String
                            let isin = stockCandle["isin"] as? String
                            let mic = stockCandle["mic"] as? String
                            let shareClassFIGI = stockCandle["shareClassFIGI"] as? String
                            let symbol = stockCandle["symbol"] as? String
                            let symbol2 = stockCandle["symbol2"] as? String
                            let type = stockCandle["type"] as? String
                            
                            let item = StockCandle(currency: currency, description: description, displaySymbol: displaySymbol, figi: figi, isin: isin, mic: mic, shareClassFIGI: shareClassFIGI, symbol: symbol, symbol2: symbol2, type: type)
                            
                            tempList.append(item)
                        
                    }
                        items.self = tempList
                    }
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    
    var body: some View {
        
        var context =  appDelegate.persistentContainer.viewContext

        
        NavigationView {
           
            List {
                ForEach(Array(items.enumerated()), id: \.1.symbol) { (index, stockCandle) in
                  
                    let currency = stockCandle.currency ?? ""
                    let symbol = stockCandle.symbol
                    let descrition = stockCandle.description
                    let value = "\(index + 1). \(currency) \n \(symbol) = \(descrition)"
                    
                    HStack {
                        Text(value)
                               Spacer()
                               Button(action: {
                                
                                   self.isPlaying.toggle()
                                                                      
                                   let itemStock = ItemStock(context: context)
                                   itemStock.currency = stockCandle.currency
                                   itemStock.displaySymbol = stockCandle.displaySymbol
                                   itemStock.figi = stockCandle.figi
                                   itemStock.isin = stockCandle.isin
                                   itemStock.mic = stockCandle.mic
                                   itemStock.shareClassFIGI = stockCandle.shareClassFIGI
                                   itemStock.symbol = stockCandle.symbol
                                   itemStock.symbol2 = stockCandle.symbol2
                                   itemStock.type = stockCandle.type
                                   itemStock.isFavorite = true
                                   
                                   do {
                                       try self.viewContext.save()
                                   } catch {
                                       
                                   }
                                   
                                   print("\(stockCandle) 1")}) {
                                   Image("love")
                                   .renderingMode(.original)
                               }
                             }
                }.onDelete { indexSet in
                    
                 
                    
                    items.remove(atOffsets: indexSet)
                }
            }.onAppear{
                makeRequest()
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                        Text("USStonks")
                            .font(.largeTitle.bold())
                            .accessibilityAddTraits(.isHeader)
                    }
                ToolbarItem {
                    Button(action: {}) {
                        Label("Add Item", systemImage: "plus")
                    }.sheet(isPresented: $isModal, content: {
                        FavoriteStock()
                    })
                }
            
            }
           
        }
    }
}



    
private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
