//
//  FileManager.swift
//  Garbegor
//
//  Created by Ignas Davulis on 2024-01-06.
//

import Foundation

extension FileManager {
    func readImageFiles(path: String) throws -> [String] {
        do {
            let content: [String] = try contentsOfDirectory(atPath: path)
            return content.filter { (file: String) -> Bool in
                file.hasSuffix(".png")
            }
        } catch let err {
            throw err
        }
    }
}
