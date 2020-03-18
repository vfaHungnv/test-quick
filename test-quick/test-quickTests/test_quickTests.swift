//
//  test_quickTests.swift
//  test-quickTests
//
//  Created by HungNV on 3/18/20.
//  Copyright © 2020 HungNV. All rights reserved.
//

import Quick
import Nimble
@testable import test_quick

class test_quickTests: QuickSpec {
    override func spec() {
        var home: HomeViewController!
        ///https://blog.pusher.com/quick-nimble-testing-ios/
        describe("HomeViewController") {
            beforeEach {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                home = storyboard.instantiateViewController(withIdentifier: "HomeVC") as? HomeViewController
                _ = home.view
            }
            
            context("when view is loaded") {
                it("should have 8 movies loaded") {
                    expect(home.tableView.numberOfRows(inSection: 0)).to(equal(8))
                }
            }
            
            context("table view") {
                var cell: UITableViewCell!
                beforeEach {
                    cell = home.tableView(home.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
                }
                
                it("should show movie title and genre") {
                    expect(cell.textLabel?.text).to(equal("The Emoji Movie"))
                    expect(cell.detailTextLabel?.text).to(equal("Animation"))
                }
            }
        }
    }
}
