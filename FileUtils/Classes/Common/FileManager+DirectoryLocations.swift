//
//  SandboxDefaultDirectories.swift
//  PersistenceDemo
//
//  Created by Sayeed Munawar Hussain on 07/02/17.
//  Copyright © 2017 Zensoft. All rights reserved.
//

import Foundation

extension FileManager {
    
    private static let FileManagerErrorDomain = "FileManagerErrorDomain"

    func fu_homeDir() -> String {
        return NSHomeDirectory()
    }

    func fu_documentDir() throws -> String {

        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        
        if let path = paths.first {
            return path
        }
        
        throw fu_error(withMessage: "Failed to get Document directory.")
    }

    func fu_tmpDir() -> String {
        return NSTemporaryDirectory()
    }

    func fu_libraryDir() throws -> String {
        
        let paths = NSSearchPathForDirectoriesInDomains(.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        
        if let path = paths.first {
            return path
        }
        
        throw fu_error(withMessage: "Failed to get Library directory.")
    }

    func fu_cachesDir() throws -> String {
        
        let paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        
        if let path = paths.first {            
            return path
        }
        
        throw fu_error(withMessage: "Failed to get Library/Caches directory.")
    }
    
    func fu_applicationSupportDirPath() throws -> String {
        
        let paths = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        
        if let path = paths.first {
            return path
        }
        
        throw fu_error(withMessage: "Failed to get Library/ApplicationSupport directory.")
    }

    private func fu_error(withMessage message: String) -> Error {
        return NSError(domain: FileManager.FileManagerErrorDomain, code: 0, userInfo: [NSLocalizedDescriptionKey: message])
    }
    
}
