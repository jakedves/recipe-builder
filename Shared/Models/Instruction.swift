//
//  Instruction.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 31/05/2021.
//

import Foundation

struct Instruction: Hashable {
    var index: Int
    var content: String
    
    init(_ instruction: String, index: Int) {
        self.index = index
        self.content = instruction
    }
    
    // func asView() -> InstructionView {
    
}
