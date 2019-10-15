//
//  iTermApp.swift
//  cd2swiftTest
//
//  Created by Jianing Wang on 2019/4/11.
//  Copyright © 2019 Jianing Wang. All rights reserved.
//

import Foundation

final class iTermApp: Terminal {
    
    func open(_ path: String, _ newOption: NewOptionType, _ clear: ClearOptionType) throws {
        
        let source = """
        do shell script "open -a iTerm \(path.editorEscaped)"
        """
        
//        tell application "iTerm"
//            open "\(url.path)"
//        end tell
        let script = NSAppleScript(source: source)!
        
        var error: NSDictionary?
        
        script.executeAndReturnError(&error)
        
        if error != nil {
            throw OITError.cannotAccessApp(TerminalType.iTerm.rawValue)
        }
    }
    
}
