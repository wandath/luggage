//
//  LuggageList.swift
//  Luggage
//
//  Created by Anya SCHOUVEY on 13/06/2023.
//

import SwiftUI

struct LuggageList: View {
    var body: some View {
        VStack {
            Text("My Luggage").bold()
            List {
                ItemCell()
                ItemCell()
                ItemCell()
                ItemCell()
            }
        }
    }
}

struct LuggageList_Previews: PreviewProvider {
    static var previews: some View {
        LuggageList()
    }
}
