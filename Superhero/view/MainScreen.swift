//
//  MainScreen.swift
//  Superhero
//
//  Created by Mohamed Ali on 10/05/2024.
//

import SwiftUI

struct MainScreen: View {
    
    @State var superHerosArr = Array<SuperHeroModel>()
    
    var body: some View {
        
        /*ScrollView(.horizontal) {
            
            HStack {
                ForEach(superHerosArr.indices, id: \.self) { index in
                        SuperHeroView(model: superHerosArr[index])
                    }
            } // MARK: - HStack
            
        } // MARK: - ScrollView
        .padding(20)
        .onAppear {
            fetchSuperHeroData()
        }*/
        
        TabView {
            ForEach(superHerosArr.indices, id: \.self) { index in
                    SuperHeroView(model: superHerosArr[index])
                }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(
            PageIndexViewStyle(backgroundDisplayMode: .never))
        .padding(10)
        .onAppear {
            fetchSuperHeroData()
        }
        
        
    }
    
    
    func fetchSuperHeroData() {
        let superhero = SuperHeroModel(superHeroName: "Hulk",
                                       superHeroImageName: "hulk",
                                       superHeroTitleInfo: "About hulk",
                                       superHeroDescribtion: "Hulk is very green",
                                       colors: [Color("ColorHulk01"),Color("ColorHulk02")])
        
        let superhero2 = SuperHeroModel(superHeroName: "Ironman",
                                       superHeroImageName: "ironman",
                                       superHeroTitleInfo: "About ironman",
                                       superHeroDescribtion: "iron man can fly",
                                       colors: [Color("ColorIronman01"),Color("ColorIronman02")])
        
        let superhero3 = SuperHeroModel(superHeroName: "Spiderman",
                                       superHeroImageName: "spiderman",
                                       superHeroTitleInfo: "About spiderman",
                                       superHeroDescribtion: "Spiderman can climb the walls",
                                       colors: [Color("ColorSpiderman01"),Color("ColorSpiderman02")])
        
        let superhero4 = SuperHeroModel(superHeroName: "Superman",
                                       superHeroImageName: "superman",
                                       superHeroTitleInfo: "About superman",
                                       superHeroDescribtion: "superman have super power",
                                       colors: [Color("ColorSuperman01"),Color("ColorSuperman02")])
        
        let superhero5 = SuperHeroModel(superHeroName: "Wolverine",
                                       superHeroImageName: "wolverine",
                                       superHeroTitleInfo: "About wolverine",
                                       superHeroDescribtion: "wolverine loves the death character",
                                       colors: [Color("ColorWolverine01"),Color("ColorWolverine02")])
        
        superHerosArr = [superhero,superhero2,superhero3,superhero4,superhero5]
        
        
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        let mockData = SuperHeroModel(superHeroName: "Mock Hero", superHeroImageName: "mock", superHeroTitleInfo: "About mock", superHeroDescribtion: "This is a mock hero", colors: [.red, .blue])
        
           MainScreen(superHerosArr: [mockData])
    }
}
