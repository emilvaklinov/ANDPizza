//
//  OrderListView.swift
//  HuliPizza
//
//  Created by Emil Vaklinov on 07/07/2021.
//

import SwiftUI

struct OrderListView: View {
    var orderModel: OrderModel
    var body: some View {
        VStack {
            List {
                Section(
                    header: ListHeaderView(orderModel: self.orderModel, text: "Your Order")
                ){
                    ForEach(orderModel.orders){item in
                        OrderRowView(orderItem:item)
                    }
                    .onDelete(perform:deleteOrder)
                }
            }
        }
    }
    
    private func deleteOrder(at offsets:IndexSet) {
        orderModel.orders.remove(atOffsets: offsets)
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orderModel:OrderModel())
    }
}

