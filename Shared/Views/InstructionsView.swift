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
        InstructionsView(["eat", "cut", "drink"])
    }
}

struct InstructionView: View {
    var instruction: String
    var count: Int
    static var nextCount = 1
    var numSize = CGFloat(17)
    
    init(instruction: String) {
        self.count = InstructionView.nextCount
        self.instruction = instruction
        InstructionView.nextCount += 1
    }
    
    var body: some View {
        HStack {
            Spacer().frame(width: 10)
            Text("  " + String(count) + ".")
                .font(.system(size: numSize, weight: Font.Weight.bold))
            Text(instruction)
            Spacer()
        }
    }
}
