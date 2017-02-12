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
    
    func documentSubDir(domainMask mask: FileManager.SearchPathDomainMask = .userDomainMask, component: String) throws -> String {
        
        do {
            let path = try self.documentDirPath()
            let fullPath = try checkAndCreateDir(atPath: path, component: component)
            return fullPath
            
        } catch {
            throw(error)
        }
    }

    func librarySubDir(domainMask mask: FileManager.SearchPathDomainMask = .userDomainMask, component: String) throws -> String {
        
        do {
            let path = try self.libraryDirPath()
            let fullPath = try checkAndCreateDir(atPath: path, component: component)
            return fullPath
            
        } catch {
            throw(error)
        }
    }

    func cachesSubDir(domainMask mask: FileManager.SearchPathDomainMask = .userDomainMask, component: String) throws -> String {
        
        do {
            let path = try self.cachesDirPath()
            let fullPath = try checkAndCreateDir(atPath: path, component: component)
            return fullPath
            
        } catch {
            throw(error)
        }
    }

    func applicationSupportSubDir(domainMask mask: FileManager.SearchPathDomainMask = .userDomainMask, component: String) throws -> String {
        
        do {
            let path = try self.applicationSupportDirPath()
            let fullPath = try checkAndCreateDir(atPath: path, component: component)
            return fullPath
            
        } catch {
            throw(error)
        }
    }

    func tmpSubDir(component: String) throws -> String {

        let path = self.tmpDirPath()
        let fullPath = try checkAndCreateDir(atPath: path, component: component)
        return fullPath
    }
    
    func applicationSupportDir(domainMask mask: FileManager.SearchPathDomainMask = .userDomainMask) throws -> String {
        
        do {
            let path = try self.applicationSupportDirPath(domainMask: mask)
            try createDirIfNotExists(atPath: path)
            return path
            
        } catch {
            throw(error)
        }
    }
    
    //MARK: - Private
    
    private func checkAndCreateDir(atPath path: String, component: String) throws -> String {

        if component.isEmpty {
            throw error(withMessage: "SubDir path component is empty.")
        }
        
        do {
            let fullPath = (path as NSString).appendingPathComponent(component)
            try createDirIfNotExists(atPath: fullPath)
            return fullPath
            
        } catch {
            throw(error)
        }
    }
    
    private func createDirIfNotExists(atPath path: String) throws {
        
        if self.fileExists(atPath: path) {
            return
        }
        
        try self.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
    }
    
    private func error(withMessage message: String) -> Error {
        return NSError(domain: FileManager.FileManagerErrorDomain, code: 0, userInfo: [NSLocalizedDescriptionKey: message])
    }
}
