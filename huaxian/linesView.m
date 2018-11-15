//
//  linesView.m
//  huaxian
//
//  Created by zhanghongfu on 17/2/22.
//  Copyright © 2017年 zhanghongfu. All rights reserved.
//

#import "linesView.h"

@implementation linesView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
     
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
 */
- (void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();//获得当前view的图形上下文(context)
    if(_isKLine){
    
        [self drawKLineWithContext:context];
    }else{
    
        [self drawLineWithContext:context];
    }

}
- (void)drawKLineWithContext:(CGContextRef)context{
    
    for (NSArray *item in self.DataArray) {
        // 转换坐标
        CGPoint heightPoint,lowPoint,openPoint,closePoint;
        heightPoint = CGPointFromString([item objectAtIndex:0]);//高
        lowPoint = CGPointFromString([item objectAtIndex:1]);//低
        openPoint = CGPointFromString([item objectAtIndex:2]);//开
        closePoint = CGPointFromString([item objectAtIndex:3]);//关
        [self drawKWithContext:context height:heightPoint Low:lowPoint open:openPoint close:closePoint width:5];
    }
}

#pragma mark 画一根K线
-(void)drawKWithContext:(CGContextRef)context height:(CGPoint)heightPoint Low:(CGPoint)lowPoint open:(CGPoint)openPoint close:(CGPoint)closePoint width:(CGFloat)width{
    CGContextSetShouldAntialias(context, NO);
    // 首先判断是绿的还是红的，根据开盘价和收盘价的坐标来计算
    BOOL isKong = NO;
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);//也是创建颜色,一句话即可
    // 如果开盘价坐标在收盘价坐标上方 则为绿色 即空
    if (openPoint.y<closePoint.y) {
        isKong = YES;
        CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);//也是创建颜色,一句话即可
 // 设置为绿色
    }
    // 设置颜色
    // 首先画一个垂直的线包含上影线和下影线
    // 定义两个点 画两点连线
        CGContextSetLineWidth(context, 1); // 上下阴影线的宽度
        if (width<=2) {
            CGContextSetLineWidth(context, 0.5); // 上下阴影线的宽度
        }
        const CGPoint points[] = {heightPoint,lowPoint};
        CGContextStrokeLineSegments(context, points, 2);  // 绘制线段（默认不绘制端点）
    //    // 再画中间的实体
        CGContextSetLineWidth(context, width); // 改变线的宽度
    //    CGFloat halfWidth = 0;//width/2;
    //    // 纠正实体的中心点为当前坐标
        openPoint = CGPointMake(openPoint.x- 0, openPoint.y);
        closePoint = CGPointMake(closePoint.x-0, closePoint.y);
    //    // 开始画实体
    const CGPoint point[] = {openPoint,closePoint};
    CGContextStrokeLineSegments(context, point, 2);  // 绘制线段（默认不绘制端点）
    //    CGContextSetLineCap(context, kCGLineCapSquare) ;// 设置线段的端点形状，方形
}

- (void)drawLineWithContext:(CGContextRef)context{
    //画线
    CGContextSetLineWidth(context, 0.5);//制定了线的宽度
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);//也是创建颜色,一句话即可
    CGContextSetShouldAntialias(context, YES);//抗锯齿
    
    CGFloat currX = 0;
    CGFloat currY = 0;
    //创建一条线段
    for (int i = 0; i< self.DataArray.count; i ++) {
        id dict = self.DataArray[i];
        CGPoint currentPoint = CGPointFromString(dict);

        if (i == 0) {
            currX = currentPoint.x;
            currY = currentPoint.y;
            continue;
        }else{
            
            CGContextMoveToPoint(context, currX, currY);//设置线段起始
            CGContextAddLineToPoint(context, currentPoint.x, currentPoint.y);//设置线段终点
            CGContextStrokePath(context);//绘制
            currX = currentPoint.x;
            currY = currentPoint.y;
        }
    }
    
    
    
}

@end
