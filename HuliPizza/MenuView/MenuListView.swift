//
//  MenuListView.swift
//  HuliPizza
//
//  Created by Emil Vaklinov on 07/07/2021.
//

import SwiftUI

struct MenuListView: View {
    @ObservedObject var orderModel: OrderModel
    var menuList = MenuModel().menu
    var body: some View {
        VStack {
            ListHeaderView(orderModel: OrderModel(), text: "Menu")
            NavigationView{
                GridNavigationView(orderModel: orderModel)
                .navigationBarTitle("Get your order")
                    .padding()
            }
        }
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView(orderModel: OrderModel())
    }
}

