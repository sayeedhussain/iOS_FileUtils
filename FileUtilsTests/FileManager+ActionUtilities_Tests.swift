//
//  FileManager+ActionUtilities_Tests.swift
//  PersistenceDemo
//
//  Created by Sayeed Munawar Hussain on 02/02/17.
//  Copyright © 2017 Zensoft. All rights reserved.
//

import XCTest

class FileManager_ActionUtilities_Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        print("\(NSHomeDirectory())")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExcludeBackOfItem_InvalidPathEmpty() {
        
        let path = ""
        
        if let _ = try? FileManager.default.fu_setbackUpPolicyForItem(atPath: path, backUp: false) {
            XCTAssert(false)
        }
    }

    func testAddSkipBackupAttributeToItem_InvalidPathNonExistent() {
        
        let path = "peekaboo"
        
        if let _ = try? FileManager.default.fu_setbackUpPolicyForItem(atPath: path, backUp: false) {
            XCTAssert(false)
        }
    }

    func testAddSkipBackupAttributeToItem_ValidPath() {
        
        //setup
        let paths = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)
        let path: String! = (paths.first as NSString?)?.appendingPathComponent("Data")
        try? FileManager.default.removeItem(atPath: path)//clean-slate
        let _ = try! FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        
        //test
        if let _ = try? FileManager.default.fu_setbackUpPolicyForItem(atPath: path, backUp: false) {
            
            var value: AnyObject? = nil
            let url = NSURL(fileURLWithPath: path)
            
            if let _ = try? url.getResourceValue(&value, forKey: URLResourceKey.isExcludedFromBackupKey) {
                
                if let value = value as? Bool, value {
                    try! FileManager.default.removeItem(atPath: path)//cleanup
                    return
                }
                
                try! FileManager.default.removeItem(atPath: path)//cleanup
                XCTAssert(false)
                return
            }
            
            try! FileManager.default.removeItem(atPath: path)//cleanup
            XCTAssert(false)
            return
        }
        
        try! FileManager.default.removeItem(atPath: path)//cleanup
        XCTAssert(false)
    }
    
    func testDeleteDirContents_InvalidDir() {
        
        let paths = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)
        let path: String! = (paths.first as NSString?)?.appendingPathComponent("Test")
        try? FileManager.default.removeItem(atPath: path)//clean-slate

        //test
        if let _ = try? FileManager.default.fu_DeleteDirContents(atPath: path) {
            XCTAssert(false)
        }
    }
    
    func testDeleteDirContents_InvalidDirIsFile() {
        
        //setup
        let paths = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)
        let path: String! = (paths.first as NSString?)?.appendingPathComponent("Test")
        try? FileManager.default.removeItem(atPath: path)//clean-slate

        let _ = try! FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        let filePath = (path as NSString).appendingPathComponent("readMe")
        let _ = try! "aa".write(toFile: filePath, atomically: true, encoding: .utf8)
        
        //test
        if let _ = try? FileManager.default.fu_DeleteDirContents(atPath: filePath) {//test
            try! FileManager.default.removeItem(atPath: path)//cleanup
            XCTAssert(false)
        }
        
        try! FileManager.default.removeItem(atPath: path)//cleanup
    }
    
    func testDeleteDirContents_ValidDirEmpty() {
        
        //setup
        let paths = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)
        let path: String! = (paths.first as NSString?)?.appendingPathComponent("Test")
        try? FileManager.default.removeItem(atPath: path)//clean-slate
        let _ = try! FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        
        //test
        if let _ = try? FileManager.default.fu_DeleteDirContents(atPath: path) {
            XCTAssert(FileManager.default.fileExists(atPath: path))//didn't delete the dir itself
            let files = try! FileManager.default.contentsOfDirectory(atPath: path)
            XCTAssert(files.count == 0)//did indeed delete the contained files.
            try! FileManager.default.removeItem(atPath: path)//cleanup
            return
        }
        
        try! FileManager.default.removeItem(atPath: path)//cleanup
        XCTAssert(false)
    }
    
    func testDeleteDirContents_ValidDirWithFile() {
        
        //setup
        let paths = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)
        let path: String! = (paths.first as NSString?)?.appendingPathComponent("Test")
        try? FileManager.default.removeItem(atPath: path)//clean-slate
        
        let _ = try! FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        let _ = try! "aa".write(toFile: (path as NSString).appendingPathComponent("readMe"), atomically: true, encoding: .utf8)
        
        //test
        if let _ = try? FileManager.default.fu_DeleteDirContents(atPath: path) {
            XCTAssert(FileManager.default.fileExists(atPath: path))//didn't delete the dir itself
            let files = try! FileManager.default.contentsOfDirectory(atPath: path)
            XCTAssert(files.count == 0)//did indeed delete the contained files.
            return
        }
        
        try! FileManager.default.removeItem(atPath: path)//cleanup
        XCTAssert(false)
    }
    
    func testDeleteDirContents_ValidDirWithNestedDirsAndFiles() {
        
        //setup
        let paths = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)
        let path: String! = (paths.first as NSString?)?.appendingPathComponent("Test")
        
        try? FileManager.default.removeItem(atPath: path)//clean-slate
        
        let _ = try! FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        let _ = try! "aa".write(toFile: (path as NSString).appendingPathComponent("readMe"), atomically: true, encoding: .utf8)
        
        let path1: String = (path as NSString).appendingPathComponent("Blob")
        let _ = try! FileManager.default.createDirectory(atPath: path1, withIntermediateDirectories: true, attributes: nil)
        let _ = try! "aa".write(toFile: (path1 as NSString).appendingPathComponent("readMe"), atomically: true, encoding: .utf8)
        
        //test
        if let _ = try? FileManager.default.fu_DeleteDirContents(atPath: path) {
            XCTAssert(FileManager.default.fileExists(atPath: path))//didn't delete the dir itself
            let files = try! FileManager.default.contentsOfDirectory(atPath: path)
            XCTAssert(files.count == 0)//did indeed delete the contained files.
            return
        }
        
        try! FileManager.default.removeItem(atPath: path)//cleanup
        XCTAssert(false)
    }
}
