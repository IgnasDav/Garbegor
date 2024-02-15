//
//  FileReader.swift
//  Garbegor
//
//  Created by Ignas Davulis on 08/02/2024.
//

import Foundation

class FileReaderService {
    private var fm = FileManager.default
    
    func readFiles(filePath: String) {
        print(fm.homeDirectoryForCurrentUser)
    }
}
