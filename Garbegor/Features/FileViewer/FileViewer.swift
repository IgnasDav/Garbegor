//
//  SwiftUIView.swift
//  Garbegor
//
//  Created by Ignas Davulis on 2024-01-05.
//

import SwiftUI

struct FileViewer: View {
    @State private var imageFiles: [String] = []
    private let path: String = "/Users/ignasdavulis/Desktop/"
    private let fileManager: FileManager = FileManager.default
    
    var body: some View {
        HStack {
            Button("Search the Desktop files") {
                readImageFiles()
            }
            List {
                ForEach(imageFiles, id: \.self) {
                    Text($0)
                }
                .onDelete { indexSet in
                    deleteFile(at: indexSet)
                }
            }
        }
    }
    
    private func readImageFiles() {
        do {
            let content: [String] = try fileManager.contentsOfDirectory(atPath: path)
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
    
    private func deleteFile(at: IndexSet) {
        var pngPath: String
        for index in at {
            pngPath = path + imageFiles[index]
            do {
                try fileManager.removeItem(atPath: pngPath)
                print("Success")
            } catch let err {
                print("There was an error", err)
            }
        }
        imageFiles.remove(atOffsets: at)
    }
}

#Preview {
    FileViewer()
}
