//
//  FileViewer.swift
//  Garbegor
//
//  Created by Ignas Davulis on 2024-01-05.
//
import SwiftUI

struct FileViewer: View {
    @State private var files: [String] = []
    @State private var filteredFileNames: [String] = []
    @State private var hourSelection: Date = .now
    @State private var isFileDeletionFinished = false
    @State private var fileTypes: [String] = []
    @State private var fileType: String = ""
    
    @State private var fileDeleter: FileDeleter = FileDeleter()
    
    private let path: String = "/Users/ignasdavulis/Desktop/"
    private let fileManager: FileManager = .default
    private let notificationService: NotificationService = NotificationService()
    
    var body: some View {
            HStack {
                List {
                    ForEach(filteredFileNames, id: \.self) {
                        Text($0)
                    }
                    .onDelete { indexSet in
                        fileDeleter.deleteFile(at: indexSet)
                    }
                }
            }
    }
    
    private func initFileViewer() {
        fileType = ""
        let notificationService: NotificationService = NotificationService()
        notificationService.requestAuth()
        viewDirFiles()
        fileDeleter.dirPath = path
        fileDeleter.fileNames = files
        filteredFileNames = files
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
            fileTypes = temps
        } catch let err {
            print(err)
        }
    }
}

#Preview {
    FileViewer()
}
