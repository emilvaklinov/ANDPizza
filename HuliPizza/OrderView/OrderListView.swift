//
//  OrderListView.swift
//  HuliPizza
//
//  Created by Emil Vaklinov on 07/07/2021.
//

import SwiftUI

struct OrderListView: View {
    func makePayment(){
    }

    var orderModel: OrderModel
    var body: some View {
        ZStack {
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
                    Button(action: makePayment) {
                        Text("Make payment")
                            .fontWeight(.bold)
                            .padding()
                            .background(Color("G4"))
                            .foregroundColor(Color("IP"))
                            .cornerRadius(14)
                            .multilineTextAlignment(.center)
                    }.frame(width: 310, height: 50, alignment: .trailing)
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

