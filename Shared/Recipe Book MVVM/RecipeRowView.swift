//
//  RecipePreview.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 22/05/2021.
//

import SwiftUI

struct RecipeRowView: View {
    @ObservedObject private var recipe: Recipe
    
    init(_ recipe: Recipe) {
        self.recipe = recipe
    }
    
    var body: some View {
        HStack {
            if (recipe.image != nil) {
                Image(uiImage: UIImage(data: recipe.image!)!)
                    .rowImage()
            } else {
                Row.defaultImage
                    .rowImage()
            }
            Text(recipe.name ?? Row.defaultName)
                .font(.title2)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
        }
    }
    
    private struct Row {
        static let defaultImage: Image = Image("Logo")
        static let defaultName: String = "Unnamed Recipe"
    }
}



struct RecipeRowViewPreview_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRowView(PreviewData.recipes()[0])
    }
}
