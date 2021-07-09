//
//  FormHeader.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 24/06/2021.
//

import SwiftUI

struct FormHeader: View {
    let text: String
    let list: Binding<[String]>
    let content: Binding<String>
    
    var body: some View {
        HStack {
            Text(text)
            Spacer()
            // When button pressed, add content to list and clear content
            Button("+") {
                list.wrappedValue.append(content.wrappedValue)
                content.wrappedValue = ""
            }
        }
    }
}
