//
//  ZYSDrawboardView.h
//  ZYSDrawboardDemo
//
//  Created by zys on 2017/2/24.
//  Copyright © 2017年 XiYiChangXiang. All rights reserved.
//

/**
 *  Drawboard, can erase line
 */

#import <UIKit/UIKit.h>

@interface ZYSDrawboardView : UIView

/// is use eraser
@property (nonatomic, assign) BOOL isEraserEnabled;

/// pan color set
@property (nonatomic, strong) UIColor *panColor;

/// pan line width
@property (nonatomic, assign) CGFloat panLineWidth;

/// eraser line path
@property (nonatomic, assign) CGFloat eraserLineWidth;

@end
