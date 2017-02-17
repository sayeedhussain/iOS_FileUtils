//
//  FileManager+DirectoryLocations_Tests.swift
//  PersistenceDemo
//
//  Created by Sayeed Munawar Hussain on 07/02/17.
//  Copyright © 2017 Zensoft. All rights reserved.
//

import XCTest

class FileManager_DirectoryLocations_Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHomeDir() {
        
        let path = FileManager.default.fu_homeDir()
        
        XCTAssert(!path.isEmpty)
    }
    
    func testTmpDir() {
        
        let path = FileManager.default.fu_tmpDir()
        
        XCTAssert(!path.isEmpty)
    }

    func testDocumensDir() {
        
        if let _ = try? FileManager.default.fu_documentDir() {
            return
        }
        
        XCTAssert(false)
    }
    
    func testLibraryDir() {
        
        if let _ = try? FileManager.default.fu_libraryDir() {
            return
        }
        
        XCTAssert(false)
    }
    
    func testCachesDir() {
        
        if let _ = try? FileManager.default.fu_cachesDir() {
            return
        }
        
        XCTAssert(false)
    }
    
    func testApplicationSupportDir() {
        
        if let _ = try? FileManager.default.fu_applicationSupportDirPath() {
            return
        }
        
        XCTAssert(false)
    }
    
}
