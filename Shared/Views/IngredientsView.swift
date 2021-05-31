//
//  IngredientsView.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 28/05/2021.
//

import SwiftUI

struct IngredientsView: View {
    var ingredients: [String]
    var headerSize = CGFloat(20)
    
    var body: some View {
        HStack {
            Spacer().frame(width: 10, height: 0)
            VStack(alignment: .leading) {
                Text("Instructions: ")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: headerSize))
                ForEach(ingredients, id: \.self) { ingredient in
                    Text(Bulleted(ingredient).content.capitalized)
                        .font(.body)
                }
            }
            Spacer()
        }
    }
}

struct IngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsView(ingredients: ["garlic",
                                      "cheese"])
    }
}

struct Bulleted {
    var content: String
    
    init(_ content: String) {
        self.content = "    • " + content
    }
}
