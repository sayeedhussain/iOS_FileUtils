# FileUtils
FileManager additions to simplify access to iOS app sandbox.

### Accessing sandbox default directory locations
      let cachesDir = FileManager.default.fu_cachesDir()
      let libraryDir = FileManager.default.fu_libraryDir()

### Creating subdirs in sandbox default directories
      if let path = try? FileManager.default.fu_documentSubDir(withComponent: "MyFiles") {
          print("\(path)")
      }

### Getting persistent path for storing Application data

      do {        
            let path = try FileManager.default.fu_persistentAppDataPath()
            print("\(path)")
        
      } catch {
            print("\(error)")
      }

