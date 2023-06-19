//
//  HomeView.swift
//  Luggage
//
//  Created by chameseddine yahia on 14/6/2023.
//

import SwiftUI

struct HomeView: View {
    @State private var isSheetPresented = false
      
      let touristDestinations = [
          Destination(title: "Paris", description: "The City of Love", imageURL: URL(string: "https://lh5.googleusercontent.com/p/AF1QipOnJHzIOu1VUvkTX0GKjmqK-NdgXWJEUa8m2YPd=w548-h318-n-k-no")!),
          Destination(title: "Rome", description: "Eternal City", imageURL: URL(string: "https://www.thetrainline.com/cms/media/1473/italy-rome-sunset.jpg?mode=crop&width=860&height=574&quality=70")!),
          Destination(title: "New York", description: "The Big Apple", imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8hoxR4Q-tV6AfRfB2tUzabi8frcSj7NHkYw&usqp=CAU")!),
          Destination(title: "Tokyo", description: "The Capital of Japan", imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgtypP2qHI-Y-mlIXX6g_EfkCghk_OS4-5VA&usqp=CAU")!),
          Destination(title: "Barcelona", description: "City of Gaudi", imageURL: URL(string: "https://www.meteocity.com/images/cache/seo/images/download/blocks/barcelone-shutterstock-226789087-62628179815ec940412927.jpg")!)
      ]
      
      var body: some View {
          NavigationView {
              List(touristDestinations) { destination in
                  NavigationLink(destination: DetailView(destination: destination)) {
                      TravelCard(destination: destination)
                  }
              }
              .navigationBarTitle("Home")
              .navigationBarItems(trailing:
                  Button(action: {
                      isSheetPresented = true
                  }) {
                      Text("Ajouter un voyage")
                  }
              )
              .sheet(isPresented: $isSheetPresented) {
                  TravelFormView(isPresent: $isSheetPresented)
              }
          }
      }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct Destination: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let imageURL: URL
}

struct TravelCard: View {
    let destination: Destination
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: destination.imageURL) { image in
                image
                    .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                    .scaledToFill()
                    .frame(height: 200)
                    .cornerRadius(10)
            } placeholder: {
                Color.gray
                    .frame(height: 200)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(destination.title)
                    .font(.headline)
                Text(destination.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }.padding()
        }
        .padding(.vertical,8)
    }
}

struct AddTripView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Text("Add Trip View")
                .font(.title)
                .padding()
            
            // Add additional controls or content for adding a trip
            
            Spacer()
            
            Button(action: {
                isPresented = false // Close the sheet
            }) {
                Text("Close")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10.0)
            }
            .padding()
        }
    }
}

struct DetailView: View {
    let destination: Destination
    
    var body: some View {
        VStack {
            AsyncImage(url: destination.imageURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .cornerRadius(10)
            } placeholder: {
                Color.gray
                    .frame(height: 200)
                    .cornerRadius(10)
            }
            .padding()
            
            Text(destination.title)
                .font(.title)
                .padding()
            
            Text(destination.description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding()
            
            Spacer()
        }.padding(50)
        .navigationBarTitle(destination.title)
    }
}
