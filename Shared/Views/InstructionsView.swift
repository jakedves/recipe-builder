//
//  InstructionsView.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 28/05/2021.
//

import SwiftUI

struct InstructionsView: View {
    
    var instructions: [Instruction]
    var headerSize: CGFloat
    
    init(_ instructions: [Instruction], headerSize: CGFloat = CGFloat(20)) {
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
        InstructionsView([Instruction("Boil for 10 minutes", index: 1),
                         Instruction("Stir well and add seasoning", index: 2),
                         Instruction("Serve", index: 3)])
    }
}

struct InstructionView: View {
    var instruction: Instruction
    var numSize = CGFloat(17)
    
    init(instruction: Instruction) {
        self.instruction = instruction
    }
    
    var body: some View {
        HStack {
            Spacer().frame(width: 10)
            Text("  " + String(instruction.index) + ".")
                .font(.system(size: numSize, weight: Font.Weight.bold))
            Text(instruction.content)
            Spacer()
        }
    }
}
