//
//  macOS.swift
//  Recipe-Builder (macOS)
//
//  Created by Jake Davies on 15/07/2021.
//

import SwiftUI

// UIImage not supported on macOS, but NSImage works and behaves similarly
typealias UIImage = NSImage

extension Image {
    init(uiImage: NSImage) {
        self.init(nsImage: uiImage)
    }
}

// NavigationBar not supported on macOS
extension View {
    func navigationBarItems<L, T>(leading: L, trailing: T) -> some View where L : View, T : View {
        self
    }
    
    func navigationBarItems<T>(trailing: T) -> some View where T: View {
        self
    }
    
    // Popovers look better on macOS with padding
    func macPopoverPadding() -> some View {
        self.padding()
    }
    
    // The navigation view modifier only works on iOS for these views
    func iOSNavigationView() -> some View {
        self
    }
    
    // Action sheets not supported in macOS
    func actionSheet(isPresented: Binding<Bool>, content: () -> ActionSheet) -> some View {
        self
    }
}
struct ActionSheet {}

// Camera and ImageSelector not supported on macOS
struct Camera: View {
    static let available = false
    let processImage: (NSImage?) -> Void
    
    var body: some View {
        EmptyView()
    }
}

struct ImageSelector: View {
    static let available = false
    let processImage: (NSImage?) -> Void
    
    var body: some View {
        EmptyView()
    }
}

extension UIImage {
    var imageData: Data? {
        self.tiffRepresentation
    }
}

