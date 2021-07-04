//
//  IngredientsView.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 28/05/2021.
//

import SwiftUI

struct IngredientsView: View {
    let ingredients: [String]
    
    init(_ ingredients: [String]) {
        self.ingredients = ingredients
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Ingredients:")
                .font(.headline)
            Spacer().frame(height: IV.headerGap)
            ForEach(ingredients, id: \.self) { ingredient in
                HStack {
                    Spacer().frame(width: IV.indent)
                    Text(IV.bullet + ingredient)
                        .font(.body)
                        .lineLimit(nil)
                }
            }
        }
        .padding()
        .background(Color.green)
        .cornerRadius(25)
    }
    
    private struct IV {
        static let headerGap: CGFloat = 5
        static let indent: CGFloat = 12
        static let bullet: String = "• "
    }
}

struct IngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsView(
            ["Garlic",
             "Cheese",
            "Tomato and cucumber salad"])
    }
}
