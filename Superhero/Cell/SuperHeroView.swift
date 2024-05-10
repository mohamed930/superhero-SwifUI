//
//  ContentView.swift
//  Superhero
//
//  Created by Mohamed Ali on 10/05/2024.
//

import SwiftUI

struct SuperHeroView: View {
    
//    private var colors = [Color("ColorHulk01"),Color("ColorHulk02")]
    
    var model: SuperHeroModel
    
    @State var isAlertPresented = false
    
    var body: some View {
        ZStack {
            Image(model.superHeroImageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            
            VStack {
                
                Text(model.superHeroName)
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                
                Button {
                    // TODO: - must add action.
                    isAlertPresented.toggle()
                    
                } label: {
                    
                    HStack {
                        Text("Start")
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.medium)
                        
                        Image(systemName: "arrow.right.circle")
                            .foregroundColor(.white)
                    }
                    .padding()
                    
                } // MARK: - Button Label
                .background(LinearGradient(colors: model.colors, startPoint: .bottomTrailing, endPoint: .topLeading))
                .clipShape(Capsule())
                .shadow(radius: 10)
                .alert(isPresented: $isAlertPresented) {
                    Alert(title: Text(model.superHeroTitleInfo), message: Text(model.superHeroDescribtion), dismissButton: .default(Text("Ok")))
                }

                
                
            } // MARK: - VStack
            .offset(x: 0, y: 150)
            
        } // MARK: - ZStack
        .frame(width: 350, height: 545, alignment: .center)
        .background(LinearGradient(colors: model.colors, startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(8.0)
        .shadow(radius: 2,x: 2,y: 2)
    }
}

struct SuperHeroView_Previews: PreviewProvider {
    static var previews: some View {

        let superhero = SuperHeroModel(superHeroName: "Hulk",
                                       superHeroImageName: "hulk",
                                       superHeroTitleInfo: "About hulk",
                                       superHeroDescribtion: "Hulk is very green",
                                       colors: [Color("ColorHulk01"),Color("ColorHulk02")])
        
        SuperHeroView(model: superhero)
    }
}
