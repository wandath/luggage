//
//  LuggageList.swift
//  Luggage
//
//  Created by Anya SCHOUVEY on 13/06/2023.
//

import SwiftUI

struct LuggageList: View {
    let clothingItems: [LugguageModal]
        
        var body: some View {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(clothingItems, id: \.titre) { item in
                        CardView(item: item)
                    }
                }
                .padding()
            }
        }
        
        struct CardView: View {
            let item: LugguageModal
            
            var body: some View {
                VStack(alignment: .leading, spacing: 8) {
                    Image(item.photo)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .cornerRadius(12)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(item.titre)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text(item.description)
                            .font(.body)
                            .foregroundColor(.gray)
                            .lineLimit(2)
                        
                        HStack {
                            Text("Temperature: \(item.température)°C")
                            Spacer()
                            Text("Travel Type: \(item.typeVoyage)")
                        }
                        .font(.caption)
                        .foregroundColor(.gray)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: .gray, radius: 4, x: 0, y: 2)
            }
        }
    
    struct LuggageList_Previews: PreviewProvider {
        static var previews: some View {
               let sampleItems: [LugguageModal] = [
                LugguageModal(titre: "Sample Item 1", description: "Sample description 1", photo: "sample_photo_1", température: 25, typeVoyage: "Type 1" , outilVoyage : "Avion"),
                LugguageModal(titre: "Sample Item 2", description: "Sample description 2", photo: "sample_photo_2", température: 30, typeVoyage: "Type 2", outilVoyage : "Avion")
               ]
               
               return LuggageList(clothingItems: sampleItems)
           }
    }
}
