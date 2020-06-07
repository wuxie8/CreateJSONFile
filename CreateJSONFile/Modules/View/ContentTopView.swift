//
//  ContentTopView.swift
//  CreateJSONFile
//
//  Created by Lj on 2020/1/11.
//  Copyright © 2020 Less. All rights reserved.
//

import Cocoa

class ContentTopView: NSView {

    fileprivate lazy var tabView: NSTabView = {
        let tabView = NSTabView(frame: NSRect(x: 0, y: 50, width: self.width, height: self.height))
        tabView.autoresizingMask = [.height, .width]
        tabView.focusRingType = .none
        tabView.tabViewType = .noTabsNoBorder
        return tabView
    }()
    
    fileprivate lazy var segmentedControl: NSSegmentedControl = {
        let segmentedControl = NSSegmentedControl(labels: ["Params","Headers","Body","JSON"], trackingMode: NSSegmentedControl.SwitchTracking.selectOne, target: self, action: #selector(segmentedControlClick(_ :)))
        segmentedControl.frame = NSRect(x: 0, y: 0, width: 300, height: 50)
        segmentedControl.focusRingType = .none
        segmentedControl.segmentStyle = .automatic
        return segmentedControl
    }()
    
    fileprivate var paramsVC: RequestParamsViewController = RequestParamsViewController()
    fileprivate var headersVC: RequestHeadersViewController = RequestHeadersViewController()
    fileprivate var bodyVC: RequestBodyViewController = RequestBodyViewController()
    fileprivate var jsonVC: RequestJSONViewController = RequestJSONViewController()

    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        initView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isFlipped: Bool {
        return true
    }
    
    fileprivate func initView() {
        addSubview(segmentedControl)
        let paramsItem = NSTabViewItem(viewController: paramsVC)
        paramsItem.view = paramsVC.view
        tabView.addTabViewItem(paramsItem)
        let headersItem = NSTabViewItem(viewController: headersVC)
        headersItem.view = headersVC.view
        tabView.addTabViewItem(headersItem)
        let bodyItem = NSTabViewItem(viewController: bodyVC)
        bodyItem.view = bodyVC.view
        tabView.addTabViewItem(bodyItem)
        let jsonItem = NSTabViewItem(viewController: jsonVC)
        jsonItem.view = jsonVC.view
        tabView.addTabViewItem(jsonItem)
        
        addSubview(tabView)
        segmentedControl.setSelected(true, forSegment: 0)
    }
    
    
    @objc fileprivate func segmentedControlClick(_ segmented: NSSegmentedControl) {
        
        if segmented.selectedSegment < tabView.tabViewItems.count {
            tabView.selectTabViewItem(at: segmented.selectedSegment)
        }
        
        
    }
}
