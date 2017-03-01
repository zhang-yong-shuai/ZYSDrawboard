//
//  ViewController.m
//  ZYSDrawboardDemo
//
//  Created by zys on 2017/2/28.
//  Copyright © 2017年 XiYiChangXiang. All rights reserved.
//

#import "ViewController.h"
#import "ZYSDrawboardView.h"

@interface ViewController ()

@property (nonatomic, strong) ZYSDrawboardView *drawboard;

@end

@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.drawboard];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - event response
- (IBAction)thinPanLineBtnClicked:(id)sender {
    self.drawboard.isEraserEnabled = NO;
    self.drawboard.panLineWidth = 2;
    NSLog(@"Now pan line width is 2");
}

- (IBAction)midPanLineBtnClicked:(id)sender {
    self.drawboard.isEraserEnabled = NO;
    self.drawboard.panLineWidth = 8;
    NSLog(@"Now pan line width is 8");
}

- (IBAction)fatPanLineBtnClicked:(id)sender {
    self.drawboard.isEraserEnabled = NO;
    self.drawboard.panLineWidth = 16;
    NSLog(@"Now pan line width is 16");
}

- (IBAction)blackBtnClicked:(id)sender {
    self.drawboard.isEraserEnabled = NO;
    self.drawboard.panColor = [UIColor blackColor];
    NSLog(@"Now pan color is black");
}

- (IBAction)BrownBtnClicked:(id)sender {
    self.drawboard.isEraserEnabled = NO;
    self.drawboard.panColor = [UIColor brownColor];
    NSLog(@"Now pan color is brown");
}

- (IBAction)purpleBtnClicked:(id)sender {
    self.drawboard.isEraserEnabled = NO;
    self.drawboard.panColor = [UIColor purpleColor];
    NSLog(@"Now pan color is purple");
}

- (IBAction)thinEraserBtnClicked:(id)sender {
    self.drawboard.eraserLineWidth = 10;
    NSLog(@"Now eraser line width is 10");
    
    self.drawboard.isEraserEnabled = YES;
    NSLog(@"Now eraser enabled");
}

- (IBAction)midEraserLineBtnClicked:(id)sender {
    self.drawboard.eraserLineWidth = 20;
    NSLog(@"Now eraser line width is 20");
    
    self.drawboard.isEraserEnabled = YES;
    NSLog(@"Now eraser enabled");
}

- (IBAction)fatEraserBtnClicked:(id)sender {
    self.drawboard.eraserLineWidth = 30;
    NSLog(@"Now eraser line width is 30");
    
    self.drawboard.isEraserEnabled = YES;
    NSLog(@"Now eraser enabled");
}

#pragma mark - Getters
- (ZYSDrawboardView *)drawboard {
    if (!_drawboard) {
        CGRect rect = self.view.bounds;
        _drawboard = [[ZYSDrawboardView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height - 160)];
    }
    
    return _drawboard;
}

@end
