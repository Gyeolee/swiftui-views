//
//  ContentView.swift
//  SwiftUI-Views
//
//  Created by Hangyeol on 11/3/23.
//

import SwiftUI

struct ContentView: View {
    private let scrollViewAxes: Axis = .horizontal
    @State private var scrollViewOffset: CGPoint = .zero
    
    var body: some View {
        ObserveOffsetScrollView(axes: .horizontal, offset: $scrollViewOffset) {
            ForEach(Array(0..<1000), id: \.self) { _ in
                Rectangle()
                    .frame(
                        maxWidth: scrollViewAxes == .horizontal ? nil : .infinity,
                        maxHeight: scrollViewAxes == .horizontal ? .infinity : nil
                    )
                    .frame(
                        width: scrollViewAxes == .horizontal ? 100 : nil,
                        height: scrollViewAxes == .vertical ? nil : 100
                    )
                    .background(Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), opacity: 1))
            }
        }
        .onChange(of: scrollViewOffset) {
            print(scrollViewOffset)
        }
    }
}

#Preview {
    ContentView()
}
