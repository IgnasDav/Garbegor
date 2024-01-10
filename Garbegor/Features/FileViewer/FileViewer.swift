//
//  FileViewer.swift
//  Garbegor
//
//  Created by Ignas Davulis on 2024-01-05.
//
import SwiftUI

struct FileViewer: View {
    @State private var files: [String] = []
    @State private var hourSelection: Date = .now
    @State private var isFileDeletionFinished = false
    @State private var fileTypes: [String] = []
    @State private var fileType: String = ""
    
    @State private var fileDeleter: FileDeleter = FileDeleter()
    
    private let path: String = "/Users/ignasdavulis/Desktop/"
    private let fileManager: FileManager = .default
    private let notificationService: NotificationService = NotificationService()
   
    var body: some View {
       GeometryReader { metrics in
            HStack {
                VStack {
                    FileTypeSelector(selectedFileType: $fileType, fileTypes: fileTypes)
                        .onChange(of: fileType) { newValue in
                            files = files.filter({ file in
                                file.contains(newValue)
                            })
                        }
                    DateSelector(hourSelection: $hourSelection)
                    Button("Exectute") {
                        fileDeleter.handleTimerForDeleting(time: hourSelection)
                    }
                    Button("Search the Desktop files") {
                        initFileViewer()
                    }
                    Spacer()
                    }
                .padding([.leading], 5)
                .frame(width: metrics.size.width * 0.25)
                List {
                    ForEach(files, id: \.self) {
                        Text($0)
                    }
                    .onDelete { indexSet in
                        fileDeleter.deleteFile(at: indexSet)
                    }
                }
            }
        }
        .onAppear(perform: initFileViewer)
    }
    
    private func initFileViewer() {
        let notificationService: NotificationService = NotificationService()
        notificationService.requestAuth()
        viewDirFiles()
            fileDeleter.dirPath = path
            fileDeleter.fileNames = files
    }
    private func viewDirFiles(fileType: String? = nil){
        do {
            files = try fileManager.contentsOfDirectory(atPath: path)
            fileTypes = files.map({ file in
                return String(file.split(separator: ".").last ?? "")
            })
            var temps: [String] = []
            for type in fileTypes {
                if !temps.contains(type) {
                    temps.append(type)
                }
            }
            print(temps)
            fileTypes = temps
        } catch let err {
            print(err)
        }
    }
}

#Preview {
    FileViewer()
}
