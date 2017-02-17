//
//  FileManager+PathUtilities.swift
//  PersistenceDemo
//
//  Created by Sayeed Munawar Hussain on 07/02/17.
//  Copyright © 2017 Zensoft. All rights reserved.
//

import Foundation

extension FileManager {
    
    private static let FileManagerErrorDomain = "FileManagerErrorDomain"
    
    func fu_documentSubDir(withComponent component: String, backUp: Bool = false) throws -> String {
        
        let path = try self.fu_documentDir()
        let fullPath = try fu_checkAndCreateDir(atPath: path, component: component)
        return fullPath
    }

    func fu_librarySubDir(withComponent component: String) throws -> String {
        
        let path = try self.fu_libraryDir()
        let fullPath = try fu_checkAndCreateDir(atPath: path, component: component)
        return fullPath
    }

    func fu_cachesSubDir(withComponent component: String) throws -> String {
        
        let path = try self.fu_cachesDir()
        let fullPath = try fu_checkAndCreateDir(atPath: path, component: component)
        return fullPath
    }

    func fu_tmpSubDir(withComponent component: String) throws -> String {

        let path = self.fu_tmpDir()
        let fullPath = try fu_checkAndCreateDir(atPath: path, component: component)
        return fullPath
    }
    
    func fu_applicationSupportSubDir(withComponent component: String) throws -> String {
        
        let path = try self.fu_applicationSupportDir()
        let fullPath = try fu_checkAndCreateDir(atPath: path, component: component)
        return fullPath
    }
    
    func fu_applicationSupportDir() throws -> String {
        
        let path = try self.fu_applicationSupportDirPath()
        try fu_createDirIfNotExists(atPath: path)
        return path
    }
    
    //MARK: - Private
    
    private func fu_checkAndCreateDir(atPath path: String, component: String) throws -> String {
        
        if component.isEmpty {
            throw fu_error(withMessage: "SubDir path component is empty.")
        }
        
        let fullPath = (path as NSString).appendingPathComponent(component)
        try fu_createDirIfNotExists(atPath: fullPath)
        return fullPath
    }
    
    private func fu_createDirIfNotExists(atPath path: String) throws {
        
        if self.fileExists(atPath: path) {
            return
        }
        
        try self.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
    }
    
    private func fu_error(withMessage message: String) -> Error {
        return NSError(domain: FileManager.FileManagerErrorDomain, code: 0, userInfo: [NSLocalizedDescriptionKey: message])
    }
}
