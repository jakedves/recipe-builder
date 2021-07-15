//
//  iOS.swift
//  Recipe-Builder (macOS)
//
//  Created by Jake Davies on 15/07/2021.
//

import SwiftUI

extension UIImage {
    var imageData: Data? {
        self.jpegData(compressionQuality: 1.0)
    }
}

extension View {
    // Not needed on iOS
    func macPopoverPadding() -> some View {
        self
    }
    
    // To add navigation view only when on iOS
    func iOSNavigationView() -> some View {
        NavigationView {
            self
        }
    }
}

