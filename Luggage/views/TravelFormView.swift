//
//  TravelFormView.swift
//  Luggage
//
//  Created by chameseddine yahia on 14/6/2023.
//
import SwiftUI

struct TravelFormView: View {
    @Binding var isPresent: Bool
    var weatherManager: WeatherManager = WeatherManager()
    @State private var destination : String = ""
    @State private var selectedPurpose = "touristique"
       @State private var selectedTransport = "avion"
    @State private var luggageItems: [LugguageModal] = []
       let purposeOptions = ["touristique", "affaire", "famille"]
       let transportOptions = ["avion", "bateau", "voiture"]
    @State private var showError = false
    @State private var shouldNavigate = false
    
    
    var body: some View {
        NavigationView {
        Form {
            Section(header: Text("Destination")) {
                TextField("Destination", text: $destination)
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
            
            VStack{
                AsyncButton(action: {
                    if destination.isEmpty || selectedPurpose.isEmpty || selectedTransport.isEmpty {
                        // Show error
                        showError = true
                    } else {
                        do {
                            luggageItems = try await weatherManager.getTemperatureForTravel(transport: selectedTransport, purpose: selectedPurpose, city: destination)
                            // Proceed with the action using the luggageItems array
                            print("Luggage Items: \(luggageItems)")
                           
                         
                            shouldNavigate = true
                        } catch {
                            print("Error getting luggage items: \(error)")
                            // Show error
                            showError = true
                        }
                    }
                }) {
                    HStack {
                        Spacer()
                        Text("Ajouter")
                        Spacer()
                    }                 }
                
                
                   }
            
           
            
            Button(action : {
                isPresent = false
            }){
                HStack {
                    Spacer()
                    Text("Annuler")
                    Spacer()
                }                 }
            NavigationLink(
                destination: LuggageList(clothingItems: luggageItems),
                isActive: $shouldNavigate,
                label: { EmptyView() }
            )
            .hidden()
        }.alert(isPresented: $showError) {
            Alert(title: Text("Error"), message: Text("Please fill in all the fields."), dismissButton: .default(Text("OK")))
        }
        }
    }
}


struct Previews_TravelFormView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
