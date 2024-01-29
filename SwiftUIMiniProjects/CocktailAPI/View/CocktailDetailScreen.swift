//
//  CocktailDetailScreen.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 1/24/24.
//

import SwiftUI

struct CocktailDetailScreen: View {
    
    @State var drinkItem = Drinks()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text(drinkItem.strDrink ?? "")
                Text(drinkItem.strInstructions ?? "")
                Text(drinkItem.strInstructionsDE ?? "")
                Text(drinkItem.strInstructionsIT ?? "")
                Text(drinkItem.strInstructions ?? "")
                Text(drinkItem.strInstructionsDE ?? "")
                Text(drinkItem.strInstructionsIT ?? "")
            }.padding()
        }
    }
}

struct CocktailDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        CocktailDetailScreen()
    }
}
