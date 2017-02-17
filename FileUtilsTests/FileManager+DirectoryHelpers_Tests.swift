//
//  FileManager+PathUtilities_Tests.swift
//  PersistenceDemo
//
//  Created by Sayeed Munawar Hussain on 07/02/17.
//  Copyright © 2017 Zensoft. All rights reserved.
//

import XCTest

class FileManager_DirectoryHelpers_Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDocumentSubDir_InvalidComponentEmptyString() {
        
        if let _ = try? FileManager.default.fu_documentSubDir(withComponent: "") {
            XCTAssert(false)
        }
    }
    
    func testDocumentSubDir_Valid() {
        
        //setup
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let path: String! = (paths.first as NSString?)?.appendingPathComponent("Data")
        try? FileManager.default.removeItem(atPath: path)//clean-slate
        
        //test
        if let _ = try? FileManager.default.fu_documentSubDir(withComponent: "Data") {
            XCTAssert(FileManager.default.fileExists(atPath: path))//didn't delete the dir itself
            try? FileManager.default.removeItem(atPath: path)//clean-slate
            return
        }
        
        try? FileManager.default.removeItem(atPath: path)//clean-slate
        XCTAssert(false)
    }
    
    func testLibrarySubDir_InvalidComponentEmptyString() {
        
        if let _ = try? FileManager.default.fu_librarySubDir(withComponent: "") {
            XCTAssert(false)
        }
    }
    
    func testLibrarySubDir_Valid() {
        
        //setup
        let paths = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)
        let path: String! = (paths.first as NSString?)?.appendingPathComponent("Data")
        try? FileManager.default.removeItem(atPath: path)//clean-slate
        
        //test
        if let _ = try? FileManager.default.fu_librarySubDir(withComponent: "Data") {
            XCTAssert(FileManager.default.fileExists(atPath: path))//didn't delete the dir itself
            try? FileManager.default.removeItem(atPath: path)//clean-slate
            return
        }
        
        try? FileManager.default.removeItem(atPath: path)//clean-slate
        XCTAssert(false)
    }

    func testCachesSubDir_InvalidComponentEmptyString() {
        
        if let _ = try? FileManager.default.fu_cachesSubDir(withComponent: "") {
            XCTAssert(false)
        }
    }
    
    func testCachesSubDir_Valid() {
        
        //setup
        let paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        let path: String! = (paths.first as NSString?)?.appendingPathComponent("Data")
        try? FileManager.default.removeItem(atPath: path)//clean-slate
        
        //test
        if let _ = try? FileManager.default.fu_cachesSubDir(withComponent: "Data") {
            XCTAssert(FileManager.default.fileExists(atPath: path))//didn't delete the dir itself
            try? FileManager.default.removeItem(atPath: path)//clean-slate
            return
        }
        
        try? FileManager.default.removeItem(atPath: path)//clean-slate
        XCTAssert(false)
    }

    func testApplicationSupportDir() {
        
        let paths = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)
        let path = paths.first!
        try? FileManager.default.removeItem(atPath: path)//clean-slate

        if let _ = try? FileManager.default.fu_applicationSupportDir() {
            XCTAssert(FileManager.default.fileExists(atPath: path))//didn't delete the dir itself
            try? FileManager.default.removeItem(atPath: path)//clean-slate
            return
        }
        
        XCTAssert(false)
    }
    
    func testApplicationSupportSubDir_InvalidComponentEmptyString() {
        
        if let _ = try? FileManager.default.fu_applicationSupportSubDir(withComponent: "") {
            XCTAssert(false)
        }
    }
    
    func testApplicationSupportSubDir_Valid() {
        
        //setup
        let paths = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)
        let path: String! = (paths.first as NSString?)?.appendingPathComponent("Data")
        try? FileManager.default.removeItem(atPath: path)//clean-slate
        
        //test
        if let _ = try? FileManager.default.fu_applicationSupportSubDir(withComponent: "Data") {
            XCTAssert(FileManager.default.fileExists(atPath: path))//didn't delete the dir itself
            try? FileManager.default.removeItem(atPath: path)//clean-slate
            return
        }
        
        try? FileManager.default.removeItem(atPath: path)//clean-slate
        XCTAssert(false)
    }
    
    func testTmpSubDir_InvalidComponentEmptyString() {
        
        if let _ = try? FileManager.default.fu_tmpSubDir(withComponent: "") {
            XCTAssert(false)
        }
    }
    
    func testTmpSubDir_Valid() {
        
        //setup
        let paths = [NSTemporaryDirectory()]
        let path: String! = (paths.first as NSString?)?.appendingPathComponent("Data")
        try? FileManager.default.removeItem(atPath: path)//clean-slate
        
        //test
        if let _ = try? FileManager.default.fu_tmpSubDir(withComponent: "Data") {
            XCTAssert(FileManager.default.fileExists(atPath: path))//didn't delete the dir itself
            try? FileManager.default.removeItem(atPath: path)//clean-slate
            return
        }
        
        try? FileManager.default.removeItem(atPath: path)//clean-slate
        XCTAssert(false)
    }
}
