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
                .frame(height:150)
                PresentMapButton(isPresented: $isPresented, historyItem: historyItem).ignoresSafeArea()
                    .cornerRadius(20)
                    .padding(10)
            Text(historyItem.history)
                .frame(width: 390, height: 370, alignment: .top)
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


