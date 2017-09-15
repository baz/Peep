//
//  WindowContentView.swift
//  Peep
//
//  Created by Basil Shkara on 15/9/17.
//  Copyright © 2017 Neat.io. All rights reserved.
//

import Cocoa

class WindowContentView: NSView {

	@IBOutlet weak var controller : WebViewController?

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

		NSColor.white.set()
		dirtyRect.fill()
    }

	override func mouseUp(with event: NSEvent) {
		self.controller?.scrollToTop()
	}
    
}
