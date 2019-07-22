//
//  SMDataProviderSectionsSpec.swift
//  SMDataDiller-SwiftTests
//
//  Created by Max Kuznetsov on 7/14/19.
//  Copyright © 2019 molfar.io. All rights reserved.
//

import Quick
import Nimble
@testable import SMDataDiller_Swift

class SMDataProviderSectionsSpec: QuickSpec {

    override func spec() {
        let dataProvider = SMDataProvider<[String]>()

        beforeEach {
            dataProvider.items = [["1"], ["2_1", "2_2"], ["3_1", "3_2", "3_3"]]
        }

        describe("Data provider") {
            it("get item at IndexPath") {
                expect(dataProvider.numberOfSections) == 3
                expect(dataProvider.item(at: IndexPath(row: 1, section: 1))) == "2_2"
                expect(dataProvider.item(at: IndexPath(row: 2, section: 2))) == "3_3"
            }

            it("get IndexPath of item") {
                let indexPath3_3 = dataProvider.indexPath(of: "3_3")
                expect(indexPath3_3).notTo(beNil())
                expect(indexPath3_3?.row) == 2
                expect(indexPath3_3?.section) == 2

                let indexPath2_1 = dataProvider.indexPath(of: "2_1")
                expect(indexPath2_1).notTo(beNil())
                expect(indexPath2_1?.row) == 0
                expect(indexPath2_1?.section) == 1
            }
        }
    }
}
