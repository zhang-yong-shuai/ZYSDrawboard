# ZYSDrawboard
ZYSDrawboard is a drawboard.It doesn't overrinde UIView's drawRect method.Instead, it uses CAShapeLayer and UIBezierPath to make a draw board.

####How to use ZYSDrawboard?
You can use ZYSDrawboard like this：
```
ZYSDrawboard *drawboard = [[ZYSDrawboardView alloc] initWithFrame:self.view.bound];
drawboard.isEraserEnabled = NO;// is enable eraser
drawboard.panLineWidth = 2.f;
drawboard.panColor = [UIColor brownColor];
[self.view addSubview:drawboard];

```
