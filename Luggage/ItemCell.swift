//
//  ItemCell.swift
//  Luggage
//
//  Created by Anya SCHOUVEY on 13/06/2023.
//

import SwiftUI

struct ItemCell: View {
    var body: some View {
        HStack {
            Image(systemName: "figure.walk")
                .resizable()
                .frame(width: 50, height: 50)
            Text("Super")
        }
        .padding(Padding.Regular.size())
        .shadow(radius: 12)
    }
}

struct ItemCell_Previews: PreviewProvider {
    static var previews: some View {
        ItemCell()
    }
}
