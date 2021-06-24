//
//  RecipePreview.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 22/05/2021.
//

import SwiftUI

struct RecipeRow: View {
    let recipe: Recipe
    
    init(_ recipe: Recipe) {
        self.recipe = recipe
    }
    
    var body: some View {
        HStack {
            //Image(recipe.image)
            Image("Home")
                .resizable()
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
            Spacer().frame(width: 20, height: 1, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            formatText(Text(self.recipe.name ?? "Unnamed Recipe"))
            Spacer()
        }
    }
    
    func formatText(_ text: Text) -> some View {
        return text
            .font(Font.system(size: 22, design: .rounded))
    }
}

struct RecipePreview_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRow(AllRecipes.recipes[0])
    }
}
