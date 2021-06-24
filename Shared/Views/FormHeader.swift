//
//  FormHeader.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 24/06/2021.
//

import SwiftUI

struct FormHeader: View {
    var text: String
    var list: Binding<[String]>
    var content: Binding<String>
    
    var body: some View {
        HStack {
            Text(text)
            Spacer()
            // When button pressed, add content to list and clear content
            Button("+") {
                let index = list.wrappedValue.count + 1
                list.wrappedValue.append(
                    String(index) + ". " + content.wrappedValue.capitalized)
                content.wrappedValue = ""
            }
        }
    }
}

var array: [String] = []
var string = "this is content"
