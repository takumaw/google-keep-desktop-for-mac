/*
 * Copyright (c) 2018 Takuma Watanabe.
 */

import Cocoa
import WebKit

/**
 The main view controller.
 */
class MainViewController: NSViewController, WKUIDelegate, WKNavigationDelegate {
    
    // MARK:-
    // MARK: Instance Variables
    
    let defaultWindowOrigin: CGPoint = CGPoint(x: 0, y: 0)
    let defaultWindowSize: CGSize = CGSize(width: 640, height: 480)
    
    var webView: WKWebView!
    
    // MARK:-
    // MARK: Creating A View Controller
    
    override func loadView() {
        super.loadView()
        
        let userContentController = WKUserContentController()
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.userContentController = userContentController
        
        let frame: CGRect = CGRect(origin: self.defaultWindowOrigin, size: self.defaultWindowSize)
        self.webView = WKWebView(frame: frame, configuration: webConfiguration)
        
        self.webView.uiDelegate = self
        self.view = webView
    }
    
    // MARK:-
    // MARK: Represented Object
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    // MARK:-
    // MARK: Responding to View Events

    override func viewDidLoad() {
        super.viewDidLoad()

        let urlRequest: URLRequest = URLRequest(url: ApplicationURLs.googleKeep.url)
        self.webView.load(urlRequest)
    }

}
