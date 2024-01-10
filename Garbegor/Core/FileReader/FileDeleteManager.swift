//
//  FileDeleteManager.swift
//  Garbegor
//
//  Created by Ignas Davulis on 2024-01-07.
//
import Foundation

protocol FileDeleteManager {
    var fileManager: FileManager { get }
    var dirPath: String { get }
    var fileNames: [String] { get set }
    
    func handleTimerForDeleting(time: Date) -> Void
    func deleteAllFiles() -> Void
    func deleteFile(at: IndexSet) -> Void
}

class FileDeleter: FileDeleteManager {
    internal let fileManager: FileManager = FileManager.default
    internal var fileNames: [String] = []
    var dirPath: String = ""
    var isFinished: Bool = false
    
    func handleTimerForDeleting(time: Date) {
        let timer = Timer(fireAt: time, interval: 0, target: self, selector: #selector(deleteAllFiles), userInfo: nil, repeats: false)
        RunLoop.main.add(timer, forMode: .common)
    }
    
    @objc func deleteAllFiles() {
        do {
            for name in fileNames {
                if fileManager.fileExists(atPath: dirPath + name) {
                    try fileManager.removeItem(atPath: dirPath + name)
                }
            }
            let notifService: NotificationService = NotificationService()
            notifService.sendNotifiction()
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    func deleteFile(at: IndexSet) {
        var pngPath: String
        for index in at {
            pngPath = dirPath + fileNames[index]
            do {
                try fileManager.removeItem(atPath: pngPath)
                print("Success")
            } catch let err {
                print("There was an error", err)
            }
        }
        fileNames.remove(atOffsets: at)
    }
}
