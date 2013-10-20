//
//  UIView+SDCAutoLayout.m
//  AutoLayout
//
//  Created by Scott Berrevoets on 10/18/13.
//  Copyright (c) 2013 Scotty Doesn't Code. All rights reserved.
//

#import "UIView+SDCAutoLayout.h"

@implementation UIView (SDCAutoLayout)

- (UIView *)sdc_commonAncestorWithView:(UIView *)view {
	if ([view isDescendantOfView:self])
		return self;
	
	if ([self isDescendantOfView:view])
		return view;
	
	UIView *commonAncestor;
	
	UIView *superview = self.superview;
	while (![view isDescendantOfView:superview]) {
		superview = superview.superview;
		
		if (!superview)
			break;
	}
		
	commonAncestor = superview;
	
	return commonAncestor;
}

#pragma mark - Edge Alignment

- (void)sdc_alignEdgesWithSuperview:(UIRectEdge)edges {
	[self sdc_alignEdgesWithSuperview:edges insets:UIEdgeInsetsZero];
}

- (void)sdc_alignEdgesWithSuperview:(UIRectEdge)edges insets:(UIEdgeInsets)insets {
	[self sdc_alignEdges:edges withView:self.superview insets:insets];
}

- (void)sdc_alignEdges:(UIRectEdge)edges withView:(UIView *)view {
	[self sdc_alignEdges:edges withView:view insets:UIEdgeInsetsZero];
}

- (void)sdc_alignEdges:(UIRectEdge)edges withView:(UIView *)view insets:(UIEdgeInsets)insets {
	if (edges & UIRectEdgeTop)		[self sdc_alignEdge:UIRectEdgeTop withView:view inset:insets.top];
	if (edges & UIRectEdgeRight)	[self sdc_alignEdge:UIRectEdgeRight withView:view inset:insets.right];
	if (edges & UIRectEdgeBottom)	[self sdc_alignEdge:UIRectEdgeBottom withView:view inset:insets.bottom];
	if (edges & UIRectEdgeLeft)		[self sdc_alignEdge:UIRectEdgeLeft withView:view inset:insets.left];
}

- (void)sdc_alignEdge:(UIRectEdge)edge withView:(UIView *)view inset:(CGFloat)inset {
	UIView *commonAncestor = [self sdc_commonAncestorWithView:view];
	
	NSLayoutAttribute attribute = NSLayoutAttributeNotAnAttribute;
	switch (edge) {
		case UIRectEdgeTop:		attribute = NSLayoutAttributeTop;		break;
		case UIRectEdgeRight:	attribute = NSLayoutAttributeRight;		break;
		case UIRectEdgeBottom:	attribute = NSLayoutAttributeBottom;	break;
		case UIRectEdgeLeft: 	attribute = NSLayoutAttributeLeft;		break;
		default: break;
	}
	
	if (attribute != NSLayoutAttributeNotAnAttribute)
		[commonAncestor addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:NSLayoutRelationEqual toItem:view attribute:attribute multiplier:1 constant:inset]];
}

#pragma mark - Center Alignment

- (void)sdc_alignCentersWithView:(UIView *)view {
	[self sdc_alignCentersWithView:view];
}

- (void)sdc_alignCentersWithView:(UIView *)view offset:(UIOffset)offset {
	[self sdc_alignHorizontalCenterWithView:view offset:offset.horizontal];
	[self sdc_alignVerticalCenterWithView:view offset:offset.vertical];
}

- (void)sdc_alignHorizontalCenterWithView:(UIView *)view {
	[self sdc_alignHorizontalCenterWithView:view offset:UIOffsetZero.horizontal];
}

- (void)sdc_alignHorizontalCenterWithView:(UIView *)view offset:(CGFloat)offset {
	UIView *commonAncestor = [self sdc_commonAncestorWithView:view];
	[commonAncestor addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterX multiplier:1 constant:offset]];
}

- (void)sdc_alignVerticalCenterWithView:(UIView *)view {
	[self sdc_alignVerticalCenterWithView:view offset:UIOffsetZero.vertical];
}

- (void)sdc_alignVerticalCenterWithView:(UIView *)view offset:(CGFloat)offset {
	UIView *commonAncestor = [self sdc_commonAncestorWithView:view];
	[commonAncestor addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterY multiplier:1 constant:offset]];
}

#pragma mark - Baseline Alignment

- (void)sdc_alignBaselineWithView:(UIView *)view {
	[self sdc_alignBaselineWithView:view offset:0];
}
- (void)sdc_alignBaselineWithView:(UIView *)view offset:(CGFloat)offset {
	UIView *commonAncestor = [self sdc_commonAncestorWithView:view];
	[commonAncestor addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBaseline relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBaseline multiplier:1 constant:offset]];
}

#pragma mark - Pinning

- (void)sdc_pinWidth:(CGFloat)width {
	[self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:width]];
}

- (void)sdc_pinHeight:(CGFloat)height {
	[self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:height]];
}

- (void)sdc_pinSize:(CGSize)size {
	[self sdc_pinWidth:size.width];
	[self sdc_pinHeight:size.height];
}

- (void)sdc_centerInSuperview {
	[self sdc_horizontallyCenterInSuperview];
	[self sdc_verticallyCenterInSuperview];
}

- (void)sdc_horizontallyCenterInSuperview {
	[self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
}

- (void)sdc_verticallyCenterInSuperview {
	[self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
}

@end
