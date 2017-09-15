//
//  WebViewController.swift
//  Peep
//
//  Created by Basil Shkara on 15/9/17.
//  Copyright © 2017 Neat.io. All rights reserved.
//

import Cocoa
import WebKit

class WebViewController: NSViewController, WKNavigationDelegate {

	@IBOutlet weak var webView: WKWebView?

    override func viewDidLoad() {
        super.viewDidLoad()

		let twitterURL = URL(string: "https://mobile.twitter.com/home")
		let request = URLRequest(url: twitterURL!)
		self.webView?.load(request)
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
    
}
