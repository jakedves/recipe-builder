//
//  RecipeGuide.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 28/05/2021.
//

import SwiftUI

struct RecipeGuide: View {
    let recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack {
                // The photo and recipe name
                VStack {
                    //RecipePhoto(Image(recipe.image) ?? Image("Logo"))
                    RecipePhoto(Image("Logo"))
                    RecipeGuideHeading(recipe.name)
                }
                
                // The ingredients and instructions
                HStack {
                    VStack {
                        IngredientsView(recipe.ingredients ?? [])
                        Spacer()
                    }
                    Spacer()
                    VStack {
                        InstructionsView(recipe.instructions ?? [])
                        Spacer()
                    }
                }
                .padding()
            }
        }
        .navigationBarHidden(true)
    }
}

struct RecipeGuide_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecipeGuide(recipe: PreviewData.recipes()[0])
        }
    }
}
