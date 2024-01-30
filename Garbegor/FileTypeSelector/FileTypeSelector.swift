//
//  FileTypeSelector.swift
//  Garbegor
//
//  Created by Ignas Davulis on 2024-01-09.
//

import SwiftUI

struct FileTypeSelector: View {
    @Binding var selectedFileType: String
    var fileTypes: [String]
    
    var body: some View {
        Picker("File Type", selection: $selectedFileType) {
            ForEach(fileTypes, id: \.self) {
               Text($0)
            }
        }
    }
}

#Preview {
    @State var selectedFileType: String = "hello"
    return FileTypeSelector(selectedFileType: $selectedFileType, fileTypes: ["Png", "Svg", "Txt"])
}
