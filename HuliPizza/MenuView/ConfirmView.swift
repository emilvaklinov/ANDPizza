//
//  ConfirmView.swift
//  HuliPizza
//
//  Created by Emil Vaklinov on 08/07/2021.
//

import SwiftUI

struct ConfirmView: View {
    var menuID:Int
    @Binding var isPresented:Bool
    @ObservedObject var orderModel:OrderModel
    @Binding var quantity:Int
    @Binding var size:Size
    @State var comments:String = ""
    ///extracts the menu item name based on `menuID`
    var name:String{
        orderModel.menu(menuID)?.name ?? ""
    }
    
    func addItem(){
        orderModel.add(menuID: menuID, size: size, quantity:quantity, comments: comments)
        isPresented = false
    }
    
    var body: some View {
        VStack{
            Text("Confirm Order")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.leading)
            Divider()
            SelectedImageView(image: "\(menuID)_250w")
                .padding(10)
                .onTapGesture(count: 2){
                self.isPresented = false
                }
            Divider()
            Text("Confirm your \(quantity) \(size.formatted())\(name)")
                .font(.body)
            TextField("Add your comments here", text: $comments)
                .frame(height: 40)
                .padding([.horizontal], 4)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color("G2"))
                .cornerRadius(10)
                .padding([.horizontal], 20)
            
            SizePickerView(size: $size)
            QuantityStepperView(quantity: $quantity)
            Spacer()
            HStack {
                Button(action: addItem){
                    Text("Add")
                        .font(.title)
                    .padding()
                    .background(Color("R1"))
                    .cornerRadius(14)
                }.padding([.bottom])
                Spacer()
                Button(action: {isPresented = false}){
                    Text("Cancel")
                        .font(.title)
                    .padding()
                    .background(Color("G4"))
                    .cornerRadius(14)
                }.padding([.bottom])
            }.padding()
        }
        .background(Color("G3"))
        .foregroundColor(Color("IP"))
        .cornerRadius(14)
    }
}

struct ConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmView(menuID: 0, isPresented: .constant(true), orderModel: OrderModel(), quantity:.constant(1), size: .constant(.small))
    }
}
