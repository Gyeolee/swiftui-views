//
//  GetViewSizeView.swift
//  SwiftUI-Views
//
//  Created by Hangyeol on 11/8/23.
//

import SwiftUI

struct GetViewSizeView: View {
    @State private var rectangleHeight: CGFloat = 0
    @State private var rectangleSize: CGSize = .zero
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: rectangleHeight)
                .background(.red)
                .size($rectangleSize)
                .padding()
            
            Button("increase") {
                rectangleHeight += 20
            }
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .onChange(of: rectangleSize) {
            print(rectangleSize)
        }
    }
}

#Preview {
    GetViewSizeView()
}
