//
//  WebViewController.swift
//  Peep
//
//  Created by Basil Shkara on 15/9/17.
//  Copyright © 2017 Neat.io. All rights reserved.
//

import Cocoa
import WebKit

class WebViewController: NSViewController, WKNavigationDelegate, WKUIDelegate {

	@IBOutlet weak var webView: WKWebView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
		let twitterURL = URL(string: "https://mobile.twitter.com/home")
		let request = URLRequest(url: twitterURL!)
		self.webView?.load(request)
        self.webView?.uiDelegate = self
    }

	public func scrollToTop() {
		self.webView?.scrollToBeginningOfDocument(nil)
	}

	func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
		if navigationAction.navigationType == .linkActivated, let url = navigationAction.request.url {
			NSWorkspace.shared.open(url)
			decisionHandler(.cancel)

			webView.window?.makeKeyAndOrderFront(nil)
			NSApp.activate(ignoringOtherApps: true)
		} else {
			decisionHandler(.allow)
		}
	}
    
    func webView(_ webView: WKWebView, runOpenPanelWith parameters: WKOpenPanelParameters, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping ([URL]?) -> Void) {
        let openPanel = NSOpenPanel()
        openPanel.canChooseFiles = true
        openPanel.begin { (result) in
            if result.rawValue == NSFileHandlingPanelOKButton {
                if let url = openPanel.url {
                    completionHandler([url])
                }
            }
        }
    }
}
