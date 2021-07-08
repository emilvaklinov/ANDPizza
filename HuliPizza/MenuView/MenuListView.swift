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
                List(menuList) { item in
                    NavigationLink(
                        destination: MenuDetailView(orderModel: self.orderModel, menuItem: item)) {
                    MenuRowView(menuItem: item)
                        .listRowInsets(EdgeInsets())
                    }
                }
                .navigationBarTitle("Pizza Order")
            }
        }
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView(orderModel: OrderModel())
    }
}

