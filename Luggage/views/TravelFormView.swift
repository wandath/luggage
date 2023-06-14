//
//  TravelFormView.swift
//  Luggage
//
//  Created by chameseddine yahia on 14/6/2023.
//

import SwiftUI

struct TravelFormView: View {
    @State private var fromDate = Date()
       @State private var toDate = Date()
    @State private var destination : String = ""
    @State private var selectedPurpose = "touristique"
       @State private var selectedTransport = "avion"
       
       let purposeOptions = ["touristique", "affaire", "famille"]
       let transportOptions = ["avion", "bateau", "voiture"]
    
    
    var body: some View {
        Form {
            Section(header: Text("Destination")) {
                TextField("Destination", text: $destination)
            }
            
            Section(header: Text("Date")) {
                        DatePicker("De", selection: $fromDate, displayedComponents: .date)
                        DatePicker("Au", selection: $toDate, displayedComponents: .date)
                    }
                    
                    Section(header: Text("Purpose")) {
                        Picker("Purpose", selection: $selectedPurpose) {
                            ForEach(purposeOptions, id: \.self) { purpose in
                                Text(purpose)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section(header: Text("Transport")) {
                        Picker("Transport", selection: $selectedTransport) {
                            ForEach(transportOptions, id: \.self) { transport in
                                Text(transport)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                   
                    
                    Button(action: {
                        print("From Date: \(fromDate)")
                        print("To Date: \(toDate)")
                        print("Selected Purpose: \(selectedPurpose)")
                        print("Selected Transport: \(selectedTransport)")
                        print("Destination: \(destination)")
                    }) {
                        HStack {
                               Spacer()
                               Text("Ajouter")
                               Spacer()
                           }                 }
                }
    }
}

struct TravelFormView_Previews: PreviewProvider {
    static var previews: some View {
        TravelFormView()
    }
}
