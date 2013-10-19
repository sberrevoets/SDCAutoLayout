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

- (void)sdc_alignEdgesWithSuperview:(UIRectEdge)edges {
	[self sdc_alignEdges:edges withView:self.superview];
}

- (void)sdc_alignEdges:(UIRectEdge)edges withView:(UIView *)view {
	if (edges & UIRectEdgeTop)		[self sdc_alignEdge:UIRectEdgeTop withView:view];
	if (edges & UIRectEdgeRight)	[self sdc_alignEdge:UIRectEdgeRight withView:view];
	if (edges & UIRectEdgeBottom)	[self sdc_alignEdge:UIRectEdgeBottom withView:view];
	if (edges & UIRectEdgeLeft)		[self sdc_alignEdge:UIRectEdgeLeft withView:view];
}

- (void)sdc_alignEdge:(UIRectEdge)edge withView:(UIView *)view {
	UIView *commonAncestor = [self sdc_commonAncestorWithView:view];
	
	NSLayoutAttribute attribute = NSLayoutAttributeNotAnAttribute;
	switch (edge) {
		case UIRectEdgeTop:		attribute = NSLayoutAttributeTop;		break;
		case UIRectEdgeRight:	attribute = NSLayoutAttributeRight;		break;
		case UIRectEdgeBottom:	attribute = NSLayoutAttributeBottom;	break;
		case UIRectEdgeLeft: attribute = NSLayoutAttributeLeft;			break;
		default: break;
	}
	
	if (attribute != NSLayoutAttributeNotAnAttribute)
		[commonAncestor addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:NSLayoutRelationEqual toItem:view attribute:attribute multiplier:1 constant:0]];
}

- (void)sdc_centerInSuperview {
	[self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
	[self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
}

@end
