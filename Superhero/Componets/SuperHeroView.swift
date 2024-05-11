//
//  ContentView.swift
//  Superhero
//
//  Created by Mohamed Ali on 10/05/2024.
//

import SwiftUI

struct SuperHeroView: View {
    
    var model: SuperHeroModel
    
    @State var isAlertPresented = false
    
    @State var isImageScale = false
    @State var isNameOffest = false
    
    @State var haptic = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        ZStack {
            Image(model.superHeroImageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .scaleEffect(isImageScale ? 1 : 0.7)
                .animation(.easeOut(duration: 0.8), value: isImageScale)
            
            
            VStack {
                
                Text(model.superHeroName)
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                
                Button {
                    // TODO: - must add action.
                    haptic.impactOccurred()
                    isAlertPresented.toggle()
                    
                    PlaySound.shared.setData(fileName: "chimeup", fileType: "mp3")
                    PlaySound.shared.playSound()
                    
                    
                }
                label: {
                    
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
            .offset(y: isNameOffest ? 150 : 300)
            .animation(.easeOut(duration: 1.5), value: isNameOffest)
            
        } // MARK: - ZStack
        .frame(width: 350, height: 545, alignment: .center)
        .background(LinearGradient(colors: model.colors, startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(8.0)
        .shadow(radius: 2,x: 2,y: 2)
        .onAppear {
            isImageScale = true
            isNameOffest = true
        }
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
