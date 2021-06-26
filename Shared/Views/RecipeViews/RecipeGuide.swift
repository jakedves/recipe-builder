//
//  RecipeGuide.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 28/05/2021.
//

import SwiftUI
import UIKit

struct RecipeGuide: View {
    var recipe: Recipe
    var titleSize = CGFloat(40)
    let screenSize: CGRect
    
    init(recipe: Recipe) {
        self.recipe = recipe
        self.screenSize = UIScreen.main.bounds
    }
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading) {
                Spacer().frame(width: 1, height: 40)
                HStack {
                    Spacer().frame(width: 20, height: 1)
                    Text(recipe.name ?? "Unnamed recipe")
                        .fontWeight(.bold)
                        .font(.system(size: titleSize))
                    Spacer()
                }
                //RecipePhoto(Image(recipe.image) ?? Image("Home"))
                    //.frame(width: screenSize.width)
                RecipePhoto("Home")
                    .frame(width: screenSize.width)
                Spacer().frame(height: 25)
                IngredientsView(recipe.ingredients ?? [])
                Spacer().frame(height: 35)
                InstructionsView(recipe.instructions ?? [])
                Spacer()
            }
            Spacer()
        }
        
    }
}

struct RecipeGuide_Previews: PreviewProvider {
    
    static var previews: some View {
        
        RecipeGuide(recipe: Recipe())
        
    }
}
