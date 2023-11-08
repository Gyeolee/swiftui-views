//
//  ObserveOffsetScrollView.swift
//  SwiftUI-Views
//
//  Created by Hangyeol on 11/8/23.
//

import SwiftUI

struct ObserveOffsetScrollView<Content>: View where Content: View {
    var axes: Axis.Set = .vertical
    var showsIndicators: Bool = true
    @Binding var offset: CGPoint
    @ViewBuilder var content: () -> Content
    
    @Namespace private var coordinateSpaceName
    
    var body: some View {
        ScrollView(axes, showsIndicators: showsIndicators) {
            lazyStack(content: content)
                .background(
                    GeometryReader { proxy in
                        Color.clear
                            .preference(key: OffsetPreferenceKey.self, value: proxy.frame(in: .named(coordinateSpaceName)).origin)
                    }
                )
                .onPreferenceChange(OffsetPreferenceKey.self) { offset in
                    self.offset = CGPoint(x: -offset.x, y: -offset.y)
                }
        }
        .coordinateSpace(.named(coordinateSpaceName))
    }
    
    @ViewBuilder
    func lazyStack(content: () -> Content) -> some View {
        switch axes {
        case .horizontal:
            LazyHStack(content: content)
            
        case .vertical:
            LazyVStack(content: content)
            
        default:
            LazyVStack(content: content)
        }
    }
}

private struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {}
}

#Preview {
    ObserveOffsetScrollView(offset: .constant(.zero)) {
        Text("Preview")
    }
}
