//
//  InstructionsView.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 28/05/2021.
//

import SwiftUI

struct InstructionsView: View {
    
    var instructions: [String]
    var headerSize: CGFloat
    
    init(_ instructions: [String], headerSize: CGFloat = CGFloat(20)) {
        self.instructions = instructions
        self.headerSize = headerSize
    }
    
    var body: some View {
        
        HStack {
            Spacer()
            
            VStack(alignment: .leading) {
                
                HStack {
                    Spacer().frame(width: 5)
                    Text("Instructions: ")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: headerSize))
                    Spacer()
                }
                
                Spacer().frame(height: 5)
                
                ForEach(instructions, id: \.self) { instruction in
                    InstructionView(instruction: instruction)
                    Spacer().frame(width: 1, height: 5)
                }
                
            }
            Spacer()
        }
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView(["Boil for 10 minutes",
                         "Stir well and add seasoning",
                         "Serve"])
    }
}

struct InstructionView: View {
    var instruction: String
    var numSize = CGFloat(17)
    
    init(instruction: String) {
        self.instruction = instruction
    }
    
    var body: some View {
        HStack {
            Spacer().frame(width: 10)
            Text("  • " + instruction)
            Spacer()
        }
    }
}
