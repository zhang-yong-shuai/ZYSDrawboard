//
//  ZYSDrawboardView.m
//  ZYSDrawboardDemo
//
//  Created by zys on 2017/2/24.
//  Copyright © 2017年 XiYiChangXiang. All rights reserved.
//

#import "ZYSDrawboardView.h"

@interface ZYSDrawboardView ()

/// current layer
@property (nonatomic, strong) CAShapeLayer *currentDrawLayer;

/// current path(start from touchBegin)
@property (nonatomic, strong) UIBezierPath *currentDrawPath;

/// save all layers
@property (nonatomic, strong) NSMutableArray *drawLayerArray;

@end

@implementation ZYSDrawboardView

#pragma mark - life cycle
- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        self.isEraserEnabled = false;
        self.panColor = [UIColor blackColor];
        self.panLineWidth = 2.f;
        self.eraserLineWidth = 10.f;
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.isEraserEnabled = false;
        self.panColor = [UIColor blackColor];
        self.panLineWidth = 2.f;
        self.eraserLineWidth = 10.f;
    }
    
    return self;
}

- (void)dealloc {
    [self releaseAllLayers];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint startPoint = [touch locationInView:self];
    
    self.currentDrawLayer = [self makeDrawLayer:self.isEraserEnabled];
    self.currentDrawPath = [self makeDrawPath];
    [self.currentDrawPath moveToPoint:startPoint];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint currentPoint = [touch locationInView:self];
    
    [self.currentDrawPath addLineToPoint:currentPoint];
    self.currentDrawLayer.path = self.currentDrawPath.CGPath;
}

#pragma mark - Getters / Setters
- (NSMutableArray *)drawLayerArray {
    if (!_drawLayerArray) {
        _drawLayerArray = [NSMutableArray arrayWithCapacity:10];
    }
    
    return _drawLayerArray;
}

#pragma mark - custom methods
- (CAShapeLayer *)makeDrawLayer:(BOOL)isEraserEnable {
    CAShapeLayer *drawLayer = [CAShapeLayer layer];
    drawLayer.frame = self.bounds;
    drawLayer.fillColor = [UIColor clearColor].CGColor;
    
    if (!isEraserEnable) {
        drawLayer.lineWidth = self.panLineWidth;
        drawLayer.strokeColor = self.panColor.CGColor;
    } else {
        drawLayer.lineWidth = self.eraserLineWidth;
        drawLayer.strokeColor = self.backgroundColor.CGColor;
    }
    
    [self.layer insertSublayer:drawLayer atIndex:(unsigned)self.drawLayerArray.count];
    [self.drawLayerArray addObject:drawLayer];
    
    return drawLayer;
}

- (UIBezierPath *)makeDrawPath {
    UIBezierPath *drawPath = [UIBezierPath bezierPath];
    drawPath.lineCapStyle = kCGLineCapRound;
    drawPath.lineJoinStyle = kCGLineJoinRound;
    
    return drawPath;
}

- (void)releaseAllLayers {
    [self.drawLayerArray makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
    [self.drawLayerArray removeAllObjects];
}


@end
