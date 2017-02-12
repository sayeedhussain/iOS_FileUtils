//
//  FileManager+ActionUtilities.swift
//  PersistenceDemo
//
//  Created by Sayeed Munawar Hussain on 02/02/17.
//  Copyright © 2017 Zensoft. All rights reserved.
//

import Foundation

extension FileManager {
    
    private static let FileManagerErrorDomain = "FileManagerErrorDomain"
    
    /**
     Excludes the resource from all backups of app data. You can use this method to exclude cache and other app support 
     files which are not needed in a backup. Backup happens on iTunes, iCloud.
     */
    func au_excludeBackUpOfItem(atPath path: String) throws {
        
        if path.isEmpty {
            throw error(withMessage: "path is empty.")
        }
        
        let url = URL(fileURLWithPath: path)
        try (url as NSURL).setResourceValue(true, forKey: URLResourceKey.isExcludedFromBackupKey)
    }

    /**
     Deletes dir contents leaving behind an empty dir.
     */
    func au_DeleteDirContents(atPath path: String) throws {
        
        let _fileExists = fileExists(atPath: path)
        
        if !_fileExists {
            print("No dir at path.")
            throw error(withMessage: "No dir at path.")
        }
        
        let _isDir = au_IsDir(atPath: path)
        
        if !_isDir {
            print("File at path instead of dir.")
            throw error(withMessage: "File at path instead of dir.")
        }
        
        let files = try self.contentsOfDirectory(atPath: path)
        
        for file in files {
            let path = (path as NSString).appendingPathComponent(file)
            try self.removeItem(atPath: path)
        }
    }
    
    private func au_IsDir(atPath path: String) -> Bool {
        var isDir = ObjCBool(true)
        self.fileExists(atPath: path, isDirectory: &isDir)
        return isDir.boolValue
    }

    private func error(withMessage message: String) -> Error {
        return NSError(domain: FileManager.FileManagerErrorDomain, code: 0, userInfo: [NSLocalizedDescriptionKey: message])
    }
}
