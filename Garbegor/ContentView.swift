//
//  ContentView.swift
//  Garbegor
//
//  Created by Ignas Davulis on 2023-11-26.
//

import Foundation
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack {
                Text("Image Cleaner")
                FileViewer()
            }
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            .border(.primary)
            .clipShape(
                .rect(cornerRadius: 5)
            )
        }
        .padding(30)
        .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
