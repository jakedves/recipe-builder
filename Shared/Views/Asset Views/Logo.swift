//
//  Logo.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 04/07/2021.
//

import SwiftUI

struct Logo: View {
    let image: Image
    
    init(_ image: Image) {
        self.image = image
    }
    
    var body: some View {
        image
            .resizable()
            .frame(width: WH.length, height: WH.length)
    }
    
    private struct WH {
        static let length: CGFloat = 65
    }
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        Logo(Image("Logo"))
    }
}
