//
//  PanelView.swift
//  Garbegor
//
//  Created by Ignas Davulis on 2024-01-12.
//

import SwiftUI

struct PanelView: View {
    @State private var viewModel = ViewModel()
    var body: some View {
        DateSelector(hourSelection: $viewModel.hourSelection)
    }
//                VStack {
//                    DateSelector(hourSelection: $hourSelection)
//                    Button("Exectute") {
//                        fileDeleter.handleTimerForDeleting(time: hourSelection)
//                    }
//                    .disabled(fileType.isEmpty)
//                    Button("Search the Desktop files") {
//                        initFileViewer()
//                    }
//                    Spacer()
//                }
//                .padding([.leading], 5)
//                .frame(width: metrics.size.width * 0.25)
//    }
//        .onAppear(perform: initFileViewer)
//        FileTypeSelector(selectedFileType: $fileType, fileTypes: fileTypes)
//            .onChange(of: fileType) { newValue in
//                if newValue.isEmpty {
//                    filteredFileNames = files
//                } else {
//                    filteredFileNames = files.filter({ file in
//                        file.contains(newValue)
//                    })
//                    fileDeleter.fileTypeToDelete = newValue
//                }
//            }
//    }
}

#Preview {
    PanelView()
}
