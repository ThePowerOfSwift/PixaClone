//
//  PageViewModelTests.swift
//  PixabayTests
//
//  Created by Nour on 31/05/2018.
//  Copyright © 2018 Nour Saffaf. All rights reserved.
//

import XCTest
@testable import Pixabay

class PageViewModelTests: XCTestCase {
    var viewModel: PageCoordinator!
    override func setUp() {
        super.setUp()
        viewModel = PageCoordinator()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPageId() {
        var identifier = viewModel.viewControllerNextTo(identifier: "search"){ (current, next) -> Int in
            return current + next
        }
        
        XCTAssertEqual(identifier, Pages.Category)
        
        identifier = viewModel.viewControllerNextTo(identifier: "category") { (current, next) -> Int in
            return current + next
        }
        
        XCTAssertNil(identifier)
        
        
        identifier = viewModel.viewControllerNextTo(identifier: "search") { (current, next) -> Int in
            return current - next
        }
        
        XCTAssertEqual(identifier, Pages.Editor)
        
        identifier = viewModel.viewControllerNextTo(identifier: "editor") { (current, next) -> Int in
            return current - next
        }
        
        XCTAssertNil(identifier)
        
        identifier = viewModel.viewControllerNextTo(identifier: "search") { (current, next) -> Int in
            return current - next
        }
        
        XCTAssertEqual(identifier, Pages.Editor)
        
    }
    
    func testIndexOfVisibleViewController() {
        var index = viewModel.indexOfViewControllerWith("search")
        XCTAssertEqual(index, 1)
        
        index = viewModel.indexOfViewControllerWith("editor")
        XCTAssertEqual(index, 0)
        
        index = viewModel.indexOfViewControllerWith("category")
        XCTAssertEqual(index, 2)
    }
   
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
