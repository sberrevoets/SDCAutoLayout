//
//  UIView+SDCAutoLayout.h
//  AutoLayout
//
//  Created by Scott Berrevoets on 10/18/13.
//  Copyright (c) 2013 Scotty Doesn't Code. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SDCAutoLayout)

- (UIView *)sdc_commonAncestorWithView:(UIView *)view;

- (void)sdc_alignEdgesWithSuperview:(UIRectEdge)edges;
- (void)sdc_alignEdges:(UIRectEdge)edges withView:(UIView *)view;

@end
