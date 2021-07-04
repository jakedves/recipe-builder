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
            //Image(recipe.image) ?? Row.defaultImage
            Row.defaultImage
                .resizable()
                .frame(width: Row.imageLength, height: Row.imageLength)
                .cornerRadius(Row.curvature)
            formatText(Text(self.recipe.name ?? Row.defaultName))
            Spacer()
        }
    }
    
    func formatText(_ text: Text) -> some View {
        return text
            .font(Font.system(size: 22, design: .rounded))
    }
    
    private struct Row {
        static let defaultImage: Image = Image("Logo")
        static let defaultName: String = "Unnamed Recipe"
        static let imageLength: CGFloat = 50
        static let curvature: CGFloat = 10
    }
}

struct RecipePreview_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRow(PreviewData.recipes()[0])
    }
}
