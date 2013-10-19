//
//  AutoLayoutTests.m
//  AutoLayoutTests
//
//  Created by Scott Berrevoets on 10/18/13.
//  Copyright (c) 2013 Scotty Doesn't Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "UIView+SDCAutoLayout.h"

@interface AutoLayoutTests : XCTestCase

@end

@implementation AutoLayoutTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)testCommonAncestorWithView {
	UIView *parent = [[UIView alloc] init];
	UIView *subchild1 = [[UIView alloc] init];
	UIView *subchild2 = [[UIView alloc] init];
	UIView *subchild1child1 = [[UIView alloc] init];
	UIView *subchild1child2 = [[UIView alloc] init];
	UIView *subchild2child = [[UIView alloc] init];
	
	UIView *dummyView;
	
	[parent addSubview:subchild1];
	[parent addSubview:subchild2];
	
	[subchild1 addSubview:subchild1child1];
	[subchild1 addSubview:subchild1child2];
	[subchild2 addSubview:subchild2child];
	
	XCTAssertEqualObjects(parent, [subchild2child sdc_commonAncestorWithView:subchild1child1], @"Common ancestor should be parent");
	XCTAssertEqualObjects(parent, [subchild2 sdc_commonAncestorWithView:subchild1], @"Common ancestor should be parent");
	XCTAssertEqualObjects(parent, [subchild1 sdc_commonAncestorWithView:parent], @"Common ancestor should be parent");
	XCTAssertEqualObjects(parent, [parent sdc_commonAncestorWithView:subchild1], @"Common ancestor should be parent");
	XCTAssertEqualObjects(subchild1, [subchild1child1 sdc_commonAncestorWithView:subchild1child2], @"Common ancestor should be subchild1");
	XCTAssertNil([dummyView sdc_commonAncestorWithView:subchild1], @"dummyView and subchild1 do not have a common ancestor");
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
