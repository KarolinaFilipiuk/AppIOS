//
//  FavoriteStock.swift
//  USStonks
//
//  Created by Guest User on 15/01/2023.
//

import SwiftUI

struct FavoriteStockView: View {
    
    
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @State var  items = [ItemStock]()
    

    var body: some View {
        
        
        let context =  appDelegate.persistentContainer.viewContext
        

        NavigationView {
            
            List {
                ForEach(Array(items.enumerated()), id: \.1.symbol) { (index, stockCandle) in
                    let currency = stockCandle.currency ?? ""
                    let description = stockCandle.descriptionStock ?? ""
                    let symbol = stockCandle.symbol ?? ""
                    
                    let value = "\(index+1). \(currency) \n\(symbol) - \(description)"
                    
                    HStack {
                        Text(value)
                    }
                }
            }.onAppear{
                do{
                    self.items = try context.fetch(ItemStock.fetchRequest())
                }
                catch {
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Favorite Stock")
                        .font(.largeTitle.bold())
                        .accessibilityAddTraits(.isHeader)
                }
            }
            
        }
    }
}


struct FavoriteStock_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteStockView()
    }
}
