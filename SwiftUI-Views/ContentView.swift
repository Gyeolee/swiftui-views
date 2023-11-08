//
//  ContentView.swift
//  SwiftUI-Views
//
//  Created by Hangyeol on 11/3/23.
//

import SwiftUI

struct ContentView: View {
    @State private var scrollViewOffset: CGPoint = .zero
    
    var body: some View {
        ObserveOffsetScrollView(offset: $scrollViewOffset) {
            VStack {
                ForEach(Array(0..<10), id: \.self) { _ in
                    Rectangle()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), opacity: 1))
                }
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
