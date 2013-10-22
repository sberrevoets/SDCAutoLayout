//
//  UIView+SDCAutoLayout.h
//  AutoLayout
//
//  Created by Scott Berrevoets on 10/18/13.
//  Copyright (c) 2013 Scotty Doesn't Code. All rights reserved.
//

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT CGFloat const SDCAutoLayoutStandardSiblingDistance;
FOUNDATION_EXPORT CGFloat const SDCAutoLayoutStandardParentChildDistance;

@interface UIView (SDCAutoLayout)

// Helper method that returns the first common ancestor of self and view
- (UIView *)sdc_commonAncestorWithView:(UIView *)view;

// Aligning a view's edges with its superview
- (void)sdc_alignEdgesWithSuperview:(UIRectEdge)edges;
- (void)sdc_alignEdgesWithSuperview:(UIRectEdge)edges insets:(UIEdgeInsets)insets;

// Aligning a view's edges with another view
- (void)sdc_alignEdges:(UIRectEdge)edges withView:(UIView *)view;
- (void)sdc_alignEdges:(UIRectEdge)edges withView:(UIView *)view insets:(UIEdgeInsets)insets;

// Aligning a view's center with another view
- (void)sdc_alignCentersWithView:(UIView *)view;
- (void)sdc_alignCentersWithView:(UIView *)view offset:(UIOffset)offset;
- (void)sdc_alignHorizontalCenterWithView:(UIView *)view;
- (void)sdc_alignHorizontalCenterWithView:(UIView *)view offset:(CGFloat)offset;
- (void)sdc_alignVerticalCenterWithView:(UIView *)view;
- (void)sdc_alignVerticalCenterWithView:(UIView *)view offset:(CGFloat)offset;

// Centering a view in its superview
- (void)sdc_centerInSuperview;
- (void)sdc_centerInSuperviewWithOffset:(UIOffset)offset;
- (void)sdc_horizontallyCenterInSuperview;
- (void)sdc_horizontallyCenterInSuperviewWithOffset:(CGFloat)offset;
- (void)sdc_verticallyCenterInSuperview;
- (void)sdc_verticallyCenterInSuperviewWithOffset:(CGFloat)offset;

// Align a view's baseline with another view
- (void)sdc_alignBaselineWithView:(UIView *)view;
- (void)sdc_alignBaselineWithView:(UIView *)view offset:(CGFloat)offset;

// Pinning a view's dimensions with constants
- (void)sdc_pinWidth:(CGFloat)width;
- (void)sdc_pinHeight:(CGFloat)height;
- (void)sdc_pinSize:(CGSize)size;

// Pinning a view's dimensions to another view
- (void)sdc_pinWidthToWidthOfView:(UIView *)view;
- (void)sdc_pinWidthToWidthOfView:(UIView *)view offset:(CGFloat)offset;
- (void)sdc_pinHeightToHeightOfView:(UIView *)view;
- (void)sdc_pinHeightToHeightOfView:(UIView *)view offset:(CGFloat)offset;
- (void)sdc_pinSizeToSizeOfView:(UIView *)view;
- (void)sdc_pinSizeToSizeOfView:(UIView *)view offset:(UIOffset)offset;

// Setting the spacing between a view and other view
// A positive spacing (or 0) means self will be placed to the right of view
// A negative spacing means self will be placed to the left of view
- (void)sdc_pinHorizontalSpacing:(CGFloat)spacing toView:(UIView *)view;

// A positive spacing (or 0) means self will be placed below view
// A negative spacing means self will be placed above view
- (void)sdc_pinVerticalSpacing:(CGFloat)spacing toView:(UIView *)view;

- (void)sdc_pinSpacing:(UIOffset)spacing toView:(UIView *)view;

@end
