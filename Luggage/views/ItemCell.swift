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
            ZStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(CustomColor.lightRed)
                                .frame(width: 95, height: 80)
                Image(systemName: "figure.walk")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(Padding.Regular.size())
            
            }
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
