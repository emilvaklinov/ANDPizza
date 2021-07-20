//
//  ListHeaderView.swift
//  HuliPizza
//
//  Created by Emil Vaklinov on 07/07/2021.
//

import SwiftUI

struct ListHeaderView: View {
    @ObservedObject var orderModel: OrderModel
    var text:String
    var body: some View {
        HStack {
            Text(text)
                .padding(.leading, 5)
                .foregroundColor(Color("G1"))
            Spacer()
            Text(orderModel.formattedTotal)
                .fontWeight(.heavy)
                .padding()
        }
        .font(.headline)
        .background(Color("G4"))
    }
}

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeaderView(orderModel: OrderModel(), text: "Menu")
    }
}
