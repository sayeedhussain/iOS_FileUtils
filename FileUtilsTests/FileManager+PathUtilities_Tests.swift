//
//  FileManager+PathUtilities_Tests.swift
//  PersistenceDemo
//
//  Created by Sayeed Munawar Hussain on 07/02/17.
//  Copyright © 2017 Zensoft. All rights reserved.
//

import XCTest

class FileManager_PathUtilities_Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDocumentSubDir_InvalidComponentEmptyString() {
        
        if let _ = try? FileManager.default.documentSubDir(component: "") {
            XCTAssert(false)
        }
    }
    
    func testDocumentSubDir_Valid() {
        
        //setup
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let path: String! = (paths.first as NSString?)?.appendingPathComponent("Data")
        try? FileManager.default.removeItem(atPath: path)//clean-slate
        
        //test
        if let _ = try? FileManager.default.documentSubDir(component: "Data") {
            XCTAssert(FileManager.default.fileExists(atPath: path))//didn't delete the dir itself
            try? FileManager.default.removeItem(atPath: path)//clean-slate
            return
        }
        
        try? FileManager.default.removeItem(atPath: path)//clean-slate
        XCTAssert(false)
    }
    
    func testLibrarySubDir_InvalidComponentEmptyString() {
        
        if let _ = try? FileManager.default.librarySubDir(component: "") {
            XCTAssert(false)
        }
    }
    
    func testLibrarySubDir_Valid() {
        
        //setup
        let paths = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)
        let path: String! = (paths.first as NSString?)?.appendingPathComponent("Data")
        try? FileManager.default.removeItem(atPath: path)//clean-slate
        
        //test
        if let _ = try? FileManager.default.librarySubDir(component: "Data") {
            XCTAssert(FileManager.default.fileExists(atPath: path))//didn't delete the dir itself
            try? FileManager.default.removeItem(atPath: path)//clean-slate
            return
        }
        
        try? FileManager.default.removeItem(atPath: path)//clean-slate
        XCTAssert(false)
    }

    func testCachesSubDir_InvalidComponentEmptyString() {
        
        if let _ = try? FileManager.default.cachesSubDir(component: "") {
            XCTAssert(false)
        }
    }
    
    func testCachesSubDir_Valid() {
        
        //setup
        let paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        let path: String! = (paths.first as NSString?)?.appendingPathComponent("Data")
        try? FileManager.default.removeItem(atPath: path)//clean-slate
        
        //test
        if let _ = try? FileManager.default.cachesSubDir(component: "Data") {
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

        if let _ = try? FileManager.default.applicationSupportDir() {
            XCTAssert(FileManager.default.fileExists(atPath: path))//didn't delete the dir itself
            try? FileManager.default.removeItem(atPath: path)//clean-slate
            return
        }
        
        XCTAssert(false)
    }
    
    func testApplicationSupportSubDir_InvalidComponentEmptyString() {
        
        if let _ = try? FileManager.default.applicationSupportSubDir(component: "") {
            XCTAssert(false)
        }
    }
    
    func testApplicationSupportSubDir_Valid() {
        
        //setup
        let paths = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)
        let path: String! = (paths.first as NSString?)?.appendingPathComponent("Data")
        try? FileManager.default.removeItem(atPath: path)//clean-slate
        
        //test
        if let _ = try? FileManager.default.applicationSupportSubDir(component: "Data") {
            XCTAssert(FileManager.default.fileExists(atPath: path))//didn't delete the dir itself
            try? FileManager.default.removeItem(atPath: path)//clean-slate
            return
        }
        
        try? FileManager.default.removeItem(atPath: path)//clean-slate
        XCTAssert(false)
    }
    
    func testTmpSubDir_InvalidComponentEmptyString() {
        
        if let _ = try? FileManager.default.tmpSubDir(component: "") {
            XCTAssert(false)
        }
    }
    
    func testTmpSubDir_Valid() {
        
        //setup
        let paths = [NSTemporaryDirectory()]
        let path: String! = (paths.first as NSString?)?.appendingPathComponent("Data")
        try? FileManager.default.removeItem(atPath: path)//clean-slate
        
        //test
        if let _ = try? FileManager.default.tmpSubDir(component: "Data") {
            XCTAssert(FileManager.default.fileExists(atPath: path))//didn't delete the dir itself
            try? FileManager.default.removeItem(atPath: path)//clean-slate
            return
        }
        
        try? FileManager.default.removeItem(atPath: path)//clean-slate
        XCTAssert(false)
    }
}
