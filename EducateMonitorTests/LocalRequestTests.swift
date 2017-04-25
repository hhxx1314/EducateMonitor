//
//  LocalRequestTests.swift
//  EducateMonitor
//
//  Created by 刘通超 on 2017/3/15.
//  Copyright © 2017年 北京京师乐学教育科技有限公司. All rights reserved.
//

import XCTest

class LocalRequestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testCheckUpdate() {
        let req = PhoneCodeRequest(para:["appType":"2"])
        LocalNetClient.shared.send(r: req) { (respons) in
            XCTAssertNotNil(respons)
            XCTAssertEqual(respons!.Code, 1)
            XCTAssertEqual(respons!.version_code, "1.21")
            XCTAssertEqual(respons!.version_name, "1.2.1")
            XCTAssertEqual(respons!.version_desc, "优化收藏功能")
            XCTAssertEqual(respons!.version_path, "http://fd.51sprint.com/Common/DownloadAppFile?appType=2")
            XCTAssertEqual(respons!.IsAutoUpdate, true)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
