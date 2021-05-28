//
//  RecipePreview.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 22/05/2021.
//

import SwiftUI

struct RecipeRow: View {
    let name: String
    let picture: Image?
    
    init(_ name: String, _ pictureFileName: String) {
        self.name = name
        self.picture = Image(pictureFileName)
    }
    
    var body: some View {
        
        if picture != nil {
            HStack {
                picture!
                    .resizable()
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Spacer().frame(width: 20, height: 1, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                formatText(Text(self.name))
                Spacer()
            }
            
        } else {
            formatText(Text(self.name))
        }
    }
    
    func formatText(_ text: Text) -> some View {
        return text
            .font(Font.system(size: 22, design: .rounded))
    }
}

struct RecipePreview_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRow("Chicken curry and chips", "Home")
    }
}
