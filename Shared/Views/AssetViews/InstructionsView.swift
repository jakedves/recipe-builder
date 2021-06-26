//
//  InstructionsView.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 28/05/2021.
//

import SwiftUI

struct InstructionsView: View {
    let instructions: [String]?
    let capitalise: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Instructions: ")
                .font(.headline)
                
            Spacer().frame(height: 5)
            
            ForEach(instructions ?? [], id: \.self) { instruction in
                HStack {
                    Spacer().frame(width: 8)
                    Text(instruction)
                        .font(.body)
                }
                
            }
            
        }
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView(instructions: AllRecipes.recipes()[0].instructions)
    }
}
