//
//  FileManager+StorageHelpers_Tests.swift
//  FileUtils
//
//  Created by Sayeed Munawar Hussain on 17/02/17.
//  Copyright © 2017 Zensoft. All rights reserved.
//

import XCTest

class FileManager_StorageHelpers_Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPersistentAppDataPath() {
                
        if let path = try? FileManager.default.fu_persistentAppDataPath() {
            
            defer {
                try! FileManager.default.removeItem(atPath: path)//cleanup
            }
            
            var value: AnyObject? = nil
            let url = NSURL(fileURLWithPath: path)
            
            if let _ = try? url.getResourceValue(&value, forKey: URLResourceKey.isExcludedFromBackupKey) {
                
                if let value = value as? Bool, value {
                    return
                }
                
                XCTAssert(false)
                return
            }

            XCTAssert(false)
            return
        }
        
        XCTAssert(false)
    }
    
}
