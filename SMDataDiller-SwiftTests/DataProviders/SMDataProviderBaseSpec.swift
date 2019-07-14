//
//  DataProvider.swift
//  SMDataDiller-SwiftTests
//
//  Created by Max Kuznetsov on 7/14/19.
//  Copyright © 2019 molfar.io. All rights reserved.
//

import Quick
import Nimble
@testable import SMDataDiller_Swift

class SMDataProviderBaseSpec: QuickSpec {

    override func spec() {
        let dataProvider = SMDataProvider<String>()

        beforeEach {
            dataProvider.items = ["1", "2", "3"]
        }

        describe("Data provider") {
            it("check items") {
                expect(dataProvider.items.count) == 3
                expect(dataProvider[0]) == "1"
                expect(dataProvider.indexPath(of: "1")).notTo(beNil())
                expect(dataProvider.indexPath(of: "nil")).to(beNil())
            }
        }
    }
}
