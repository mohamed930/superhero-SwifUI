//
//  ContentView.swift
//  Superhero
//
//  Created by Mohamed Ali on 10/05/2024.
//

import SwiftUI

struct SuperHeroView: View {
    
    private var colors = [Color("ColorHulk01"),Color("ColorHulk02")]
    
    var body: some View {
        ZStack {
            Image("hulk")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            
            VStack {
                
                Text("Hulk")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                
                Button {
                    // TODO: - must add action.
                    
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
                .background(LinearGradient(colors: colors, startPoint: .bottomTrailing, endPoint: .topLeading))
                .clipShape(Capsule())
                .shadow(radius: 10)

                
                
            } // MARK: - VStack
            .offset(x: 0, y: 150)
            
        } // MARK: - ZStack
        .background(LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(8.0)
        .shadow(radius: 2,x: 2,y: 2)
    }
}

struct SuperHeroView_Previews: PreviewProvider {
    static var previews: some View {
        SuperHeroView()
    }
}
