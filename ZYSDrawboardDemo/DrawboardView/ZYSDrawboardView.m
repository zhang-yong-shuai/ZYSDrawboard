//
//  DrawboardView.m
//  TestDrawboard
//
//  Created by zys on 2017/2/24.
//  Copyright © 2017年 XiYiChangXiang. All rights reserved.
//

#import "DrawboardView.h"

@interface DrawboardView ()

@property (nonatomic, strong) CAShapeLayer *currentDrawLayer;
@property (nonatomic, strong) UIBezierPath *currentDrawPath;
@property (nonatomic, strong) NSMutableArray *drawLayerArray;

@end

@implementation DrawboardView

#pragma mark - life cycle
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _isEraserEnabled = false;
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
    CAShapeLayer *drawLayer = nil;
    
    if (!isEraserEnable) {
        drawLayer = [CAShapeLayer layer];
        drawLayer.frame = self.bounds;
        drawLayer.lineWidth = 2.f;
        drawLayer.strokeColor = [UIColor blackColor].CGColor;
    } else {
        drawLayer = [CAShapeLayer layer];
        drawLayer.frame = self.bounds;
        drawLayer.lineWidth = 10.f;
        drawLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    }
    
    drawLayer.fillColor = [UIColor clearColor].CGColor;
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
