//
//  ViewSizeModifier.swift
//  SwiftUI-Views
//
//  Created by Hangyeol on 11/8/23.
//

import SwiftUI

extension View {
    func size(_ size: Binding<CGSize>) -> some View {
        modifier(ViewSizeModifier(size: size))
    }
}

private struct ViewSizeModifier: ViewModifier {
    @Binding var size: CGSize
    
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: SizePreferenceKey.self, value: proxy.size)
                }
            )
            .onPreferenceChange(SizePreferenceKey.self) { size in
                self.size = size
            }
    }
}

private struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero

    static func reduce(value _: inout CGSize, nextValue: () -> CGSize) {}
}
