//
//  HistoryDetailView.swift
//  HuliPizza
//
//  Created by Emil Vaklinov on 08/07/2021.
//

import SwiftUI

struct HistoryDetailView: View {
    @State var isPresented: Bool = false
    var historyItem:HistoryItem
    @Binding var imageID:Int
    
    var body: some View {
        DispatchQueue.main.async {
            imageID = historyItem.id
        }
        return ScrollView {
            VStack {
                PageTitleView(title: historyItem.name).ignoresSafeArea()
            MapView(latitude: historyItem.latitude, longitude: historyItem.longitude, regionRadius: 10000000)
                .frame(width: 340, height:120, alignment: .center)
                .border(Color.white, width: 1)
//                .clipShape(Capsule())
                .shadow(color: Color.black.opacity(0.8),
                            radius: 5, x: 5, y: 5)
                PresentMapButton(isPresented: $isPresented, historyItem: historyItem).ignoresSafeArea()
                    .cornerRadius(20)
                    .padding(10)
            Text(historyItem.history)
                .frame(width: 350, height: 370, alignment: .topLeading)
                
            Spacer()
            }
        }
    }
}

struct HistoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryDetailView(historyItem:HistoryModel().historyItems[0], imageID: .constant(0))
    }
}


