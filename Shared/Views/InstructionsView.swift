//
//  InstructionsView.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 28/05/2021.
//

import SwiftUI

struct InstructionsView: View {
    var instructions: [String]
    @State var count = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Instructions: ")
            ForEach(instructions, id: \.self) { instruction in
                makeInstruction(string: instruction, count: &count)
                Spacer().frame(width: 1, height: 5)
            }
        }
    }
    
    func makeInstruction(string: String, count: inout Int) -> Instruction {
        
        count += 1
        return Instruction(instruction: string, count: count)
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView(instructions: ["chop",
                                        "cut",
                                        "drink"])
    }
}

struct Instruction: View {
    var instruction: String
    var count: Int
    var numSize = CGFloat(15)
    
    var body: some View {
        HStack {
            Spacer().frame(width: 10)
            Text(String(count) + ".").font(.system(
                                        size: numSize, weight:
                                            Font.Weight.bold))
            Text(instruction)
            Spacer()
        }
    }
}
