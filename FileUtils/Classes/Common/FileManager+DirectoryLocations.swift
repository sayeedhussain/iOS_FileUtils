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

    func homeDirPath() -> String {        
        return NSHomeDirectory()
    }

    func documentDirPath(domainMask mask: FileManager.SearchPathDomainMask = .userDomainMask) throws -> String {

        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, mask, true)
        
        if let path = paths.first {
            return path
        }
        
        throw error(withMessage: "Failed to get Document directory.")
    }

    func tmpDirPath() -> String {
        return NSTemporaryDirectory()
    }

    func libraryDirPath(domainMask mask: FileManager.SearchPathDomainMask = .userDomainMask) throws -> String {
        
        let paths = NSSearchPathForDirectoriesInDomains(.libraryDirectory, mask, true)
        
        if let path = paths.first {
            return path
        }
        
        throw error(withMessage: "Failed to get Library directory.")
    }

    func cachesDirPath(domainMask mask: FileManager.SearchPathDomainMask = .userDomainMask) throws -> String {
        
        let paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, mask, true)
        
        if let path = paths.first {            
            return path
        }
        
        throw error(withMessage: "Failed to get Library/Caches directory.")
    }
    
    func applicationSupportDirPath(domainMask mask: FileManager.SearchPathDomainMask = .userDomainMask) throws -> String {
        
        let paths = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, mask, true)
        
        if let path = paths.first {
            return path
        }
        
        throw error(withMessage: "Failed to get Library/ApplicationSupport directory.")
    }

    private func error(withMessage message: String) -> Error {
        return NSError(domain: FileManager.FileManagerErrorDomain, code: 0, userInfo: [NSLocalizedDescriptionKey: message])
    }
    
}
