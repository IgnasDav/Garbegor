//
//  SwiftUIView.swift
//  Garbegor
//
//  Created by Ignas Davulis on 2024-01-05.
//

import SwiftUI

struct FileViewer: View {
    private let path: String = "/Users/ignasdavulis/Desktop/"
    @State private var imageFiles: [String] = []
    
    var body: some View {
        Button("Search the Desktop files") {
            thisJustMakesSense()
        }
        VStack {
            List {
                ForEach(imageFiles, id: \.self) {
                    Text($0)
                }
                .onDelete { indexSet in
                    clearFile(removeAt: indexSet, images: imageFiles)
                }
            }
        }
    }
    
    private func thisJustMakesSense() {
        let fm: FileManager = FileManager.default
        
        do {
            let content: [String] = try fm.contentsOfDirectory(atPath: path)
            
            content.forEach({(item: String) -> Void in
                print(item)
            })
            imageFiles = content.filter({(file: String) -> Bool in
                file.hasSuffix(".png")
            })
            
        } catch let err {
            print(err)
        }
    }
    
    mutating func clearFile(removeAt indexSet: IndexSet, images: [String]) -> [String] {
        images.remove(atOffsets: indexSet)
        return images
    }
}

#Preview {
    FileViewer()
}
