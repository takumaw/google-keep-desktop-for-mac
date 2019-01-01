/*
 * Copyright (c) 2018 Takuma Watanabe.
 */

import Cocoa

/**
 The main window controller.
 */
class MainWindowController: NSWindowController, NSWindowDelegate {
    
    // MARK:-
    // MARK: Cocoa Binding Variables
    
    @objc dynamic var visible: Bool = true
    
    // MARK:-
    // MARK: Initializing Window Controllers
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK:-
    // MARK: Loading and Displaying the Window
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        // Configure Window Appearance
        //window!.titlebarAppearsTransparent = true
        window!.isMovableByWindowBackground  = true
        window!.backgroundColor = NSColor.white
    }
    
    // MARK:-
    // MARK: Closing Windows
    
    func windowShouldClose(_ sender: NSWindow) -> Bool {
        self.hideWindow()
        return false
    }
    
    func showWindow() {
        self.visible = true
    }
    
    func hideWindow() {
        self.visible = false
    }
    
    // MARK:-
    // MARK: Zooming Window
    
    func windowShouldZoom(_ window: NSWindow, toFrame newFrame: NSRect) -> Bool {
        return true
    }
}
