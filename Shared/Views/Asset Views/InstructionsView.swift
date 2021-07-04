//
//  InstructionsView.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 28/05/2021.
//

import SwiftUI

struct InstructionsView: View {
    let instructions: [String]
    
    init(_ instructions: [String]) {
        self.instructions = instructions
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Instructions: ")
                .font(.headline)
                
            Spacer().frame(height: IV.headerGap)
            
            ForEach(instructions, id: \.self) { instruction in
                HStack {
                    Spacer().frame(width: IV.indent)
                    Text(instruction)
                        .font(.body)
                        .lineLimit(nil)
                }
            }
        }
    }
    
    private struct IV {
        static let indent: CGFloat = 8
        static let headerGap: CGFloat = 5
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView(PreviewData.recipes()[0].instructions ?? [])
    }
}
