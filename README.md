# ZGWaterView

#### 前言
这里写了一个水波纹效果。

#### 示例
![wave.gif](https://ooo.0o0.ooo/2017/02/06/589849d6e016b.gif)

#### 使用
其中主要是ZGWaterView。使用的时候直接初始化，然后设置大小即可。
```objective-c
- (ZGWaterView *)waterView {
    if (!_waterView) {
        _waterView = [[ZGWaterView alloc] initWithFrame:CGRectZero];
        _waterView.backgroundColor = [UIColor colorWithRed:220/255.0f green:20/255.0f blue:60/255.0f alpha:1];
        [self.view addSubview:_waterView];
    }
    return _waterView;
}
```
