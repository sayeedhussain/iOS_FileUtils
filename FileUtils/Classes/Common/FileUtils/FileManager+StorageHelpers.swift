//
//  FileManager+StorageHelpers.swift
//  FileUtils
//
//  Created by Sayeed Munawar Hussain on 17/02/17.
//  Copyright © 2017 Zensoft. All rights reserved.
//

import Foundation

extension FileManager {
    
    func fu_persistentAppDataPath(backUp: Bool = false) throws -> String {

        let path = try self.fu_applicationSupportSubDir(withComponent: "AppData")
        try self.fu_setbackUpPolicyForItem(atPath: path, backUp: backUp)
        return path
    }
}
