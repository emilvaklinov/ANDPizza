//
//  HistoryView.swift
//  HuliPizza
//
//  Created by Emil Vaklinov on 07/07/2021.
//

import SwiftUI

struct HistoryView: View {
    @State var imageID:Int = 0
    var body: some View {
        VStack {
            //ContentHeaderView()
            PageTitleView(title:"Pizza History")
            SelectedImageView(image:"\(imageID)_250w")
                .padding(10)
            HistoryListView(imageID:$imageID)
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HistoryView()
            HistoryView()
                .colorScheme(.dark)
                .background(Color.black)
        }
    }
}
