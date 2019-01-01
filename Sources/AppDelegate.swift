/*
 * Copyright (c) 2018 Takuma Watanabe.
 */

import Cocoa

/**
 The main applicationn delegate.
 */
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    // MARK:-
    // MARK: Launching Applications
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }
    
    // MARK:-
    // MARK: Terminating Applications

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    // MARK:-
    // MARK: Managing Windows

    /**
     Show the Main Window.
     
     Intended to be called when the Dock icon is clocked.
     */
    func applicationShouldHandleReopen(_ sender: NSApplication,
                                       hasVisibleWindows flag: Bool) -> Bool {
        guard let mainWindowController: MainWindowController = self.findMainWindowController() else {
            return true
        }
        
        mainWindowController.showWindow()
        mainWindowController.window?.makeKeyAndOrderFront(sender)
        return false
    }
    
    // MARK:-
    // MARK: Application IBActions
    
    /**
     Hide the Main Window.
     */
    @IBAction func close(_ sender: AnyObject?) {
        guard let mainWindowController: MainWindowController = self.findMainWindowController() else {
            return
        }
        
        mainWindowController.hideWindow()
    }
    
    /**
     Opens Google Keep in the default browser.
     */
    @IBAction func showInTheBrowser(_ sender: AnyObject?) {
        NSWorkspace.shared.open(ApplicationURLs.googleKeep.url)
    }
    
    /**
     Opens Google Keep Help page in the default browser.
     */
    @IBAction func showHelpInTheBrowser(_ sender: AnyObject?) {
        NSWorkspace.shared.open(ApplicationURLs.googleKeepHelp.url)
    }
    
    // MARK:-
    // MARK: Instance Methods
    
    /**
     Find the Main Window Controller.
     
     - returns:
     The Main Window Controller.
     */
    func findMainWindowController() -> MainWindowController? {
        for window: NSWindow in NSApplication.shared.windows {
            guard let windowController: MainWindowController = window.windowController as? MainWindowController else {
                continue
            }
            return windowController
        }
        
        return nil
    }
    
    /**
     Find the Main View Controller.
 
     - returns:
     The Main View Controller.
     */
    func findMainViewController() -> MainViewController? {
        return findMainWindowController()?.contentViewController as? MainViewController
    }

}
