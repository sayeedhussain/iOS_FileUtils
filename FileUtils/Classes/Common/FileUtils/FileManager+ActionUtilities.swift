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
     Sets the backup policy of item at given path. You can use this method to include/exclude items based on whether they
     need backup. Backup happens on iTunes, iCloud.
     */
    func fu_setbackUpPolicyForItem(atPath path: String, backUp: Bool) throws {
        
        if path.isEmpty {
            throw error(withMessage: "path is empty.")
        }
        
        let url = URL(fileURLWithPath: path)
        try (url as NSURL).setResourceValue(!backUp, forKey: URLResourceKey.isExcludedFromBackupKey)
    }

    /**
     Deletes dir contents leaving behind an empty dir.
     */
    func fu_DeleteDirContents(atPath path: String) throws {
        
        let _fileExists = fileExists(atPath: path)
        
        if !_fileExists {
            print("No dir at path.")
            throw error(withMessage: "No dir at path.")
        }
        
        let _isDir = fu_IsDir(atPath: path)
        
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
    
    private func fu_IsDir(atPath path: String) -> Bool {
        var isDir = ObjCBool(true)
        self.fileExists(atPath: path, isDirectory: &isDir)
        return isDir.boolValue
    }

    private func error(withMessage message: String) -> Error {
        return NSError(domain: FileManager.FileManagerErrorDomain, code: 0, userInfo: [NSLocalizedDescriptionKey: message])
    }
}
