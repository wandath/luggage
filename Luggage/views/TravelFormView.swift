//
//  TravelFormView.swift
//  Luggage
//
//  Created by chameseddine yahia on 14/6/2023.
//

import SwiftUI

struct TravelFormView: View {
    @Binding var isPresented: Bool
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
                        DatePicker("Du", selection: $fromDate, displayedComponents: .date)
                        DatePicker("Au", selection: $toDate, displayedComponents: .date)
                    }
                    
                    Section(header: Text("Type de voyage")) {
                        Picker("Type de voyage", selection: $selectedPurpose) {
                            ForEach(purposeOptions, id: \.self) { purpose in
                                Text(purpose)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section(header: Text("Type de transport")) {
                        Picker("Type de transport", selection: $selectedTransport) {
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
                        isPresented = false // Close the sheet
                    }) {
                        HStack {
                               Spacer()
                               Text("Ajouter")
                               Spacer()
                           }                 }
                }
    }
}

