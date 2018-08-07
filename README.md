# MagnifierView
## MagnifierView is a custom control that has the effect of magnifying the mirror


![放大镜效果](https://github.com/dongxiexidu/MagnifierView_demo/blob/master/demo.png)

其实很简单，就是把UIWindow的图层给渲染到MagnifierView上。

由于这个放大镜要处于屏幕最上层，最好是UIWindow的子类，这样可以设置它的视图层级。

## Usage

### 1.初始化后设置用来渲染的视图renderView。

```
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        magnifierView = MagnifierView.init()
        magnifierView!.scale = 2
        magnifierView!.renderView = view.window
    }
```

### 2.在触摸屏幕的时候设置magnifierView的frame和渲染点renderPoint。

```
override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)

        // 获取触摸点
        let touch = touches.first!
        let point = touch.location(in: view)
        
        magnifierView!.isHidden = false
        
        magnifierView!.frame = CGRect.init(x: 0, y: 0, width: magnifieViewWH, height: magnifieViewWH)
        magnifierView!.center = point
        
        // 设置渲染的中心点
        magnifierView!.renderPoint = point
        }
        
```

### 3.用完后销毁

```
override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        magnifierView = nil
        magnifierView?.removeFromSuperview()
    }
```

[Objective-C version] (https://github.com/Derek547145012/DSMagnifierView)
