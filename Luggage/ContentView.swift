//
//  ContentView.swift
//  Luggage
//
//  Created by Anya SCHOUVEY on 13/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12, content: {
            Text("Element 1 Spacing")
            Text("Element 2 Spacing")
            Text("Element 3 Spacing")
        })
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
