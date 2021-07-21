//
//  RootTabView.swift
//  HuliPizza
//
//  Created by Emil Vaklinov on 08/07/2021.
//

import SwiftUI

struct RootTabView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("R1"))
        }
    var body: some View {
        TabView{
            ContentView(orderModel: OrderModel())
                .tabItem{
                    Image(systemName:"cart")
                    Text("Order")
                }
            HistoryView()
                .tabItem{
                    Image(systemName:"book")
                    Text("History")
                }
        }
            .accentColor(Color("B1"))
    }
}

struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView().environmentObject(UserPreferences())
    }
}
