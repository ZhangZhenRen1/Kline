//
//  boxView.m
//  huaxian
//
//  Created by zhanghongfu on 17/2/23.
//  Copyright © 2017年 zhanghongfu. All rights reserved.
//

#import "boxView.h"
#import "linesView.h"

@implementation boxView


- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect{

    CGContextRef context = UIGraphicsGetCurrentContext();//获得当前view的图形上下文(context)
    CGFloat tuWhit = [UIScreen mainScreen].bounds.size.width/60;
    NSMutableArray  * tempA = [[NSMutableArray alloc] init];
    for (int i = 0 ; i< 60 ; i++) {
        NSMutableDictionary * dict = [[NSMutableDictionary alloc] init];
        
        [dict setValue:[NSString stringWithFormat:@"%f",tuWhit*i] forKey:@"x"];
        [dict setValue:[NSString stringWithFormat:@"%u",arc4random() % 100] forKey:@"y"];
        [dict setValue:[NSString stringWithFormat:@"%f",tuWhit-1] forKey:@"w"];
        [dict setValue:[NSString stringWithFormat:@"%u",arc4random() % 100] forKey:@"h"];
        [tempA addObject:dict];
    }
    //实体宽5   间隔0.5
    NSArray * lineArray =@[@"{0, 92.592310101520411}",@"{5.5, 101.2499743980119}",@"{11, 109.30365579321784}",@"{16.5, 114.73988593460908}",@"{22, 118.26335954407976}",@"{27.5, 117.70968454937085}",@"{33, 113.93447939210637}",@"{38.5, 109.20294397260926}",@"{44, 108.19630580379999}",@"{49.5, 105.47814272937671}",@"{55, 104.37079273995887}",@"{60.5, 104.67283219432932}",@"{66, 106.93784007974163}",@"{71.5, 102.45803620803832}",@"{77, 99.186198138906121}",@"{82.5, 95.008337714117943}",@"{88, 90.578841748991266}",@"{93.5, 83.63251034320318}",@"{99, 82.575468260361973}",@"{104.5, 81.5687340840974}",@"{110, 81.166078816573702}",@"{115.5, 83.229855075679467}",@"{121, 86.149249776409292}",@"{126.5, 84.639244519467752}",@"{132, 80.411076188102925}",@"{137.5, 76.132503942706165}",@"{143, 68.129130454076858}",@"{148.5, 61.031875328558868}"];
    
    //gao  di  kai  guan
    NSArray * KlineArray = @[@[@"{2.5, 101.04864676425004}",@"{2.5, 124.70632386173557}",@"{2.5, 103.56538619745616}",@"{2.5, 114.89090566179429}"],@[@"{8, 117.15600955466192}",@"{8, 124.70632386173557}",@"{8, 117.4076450950004}",@"{8, 123.69958968547101}"],@[@"{13.5, 110.10906233572054}",@"{13.5, 131.24999999999994}",@"{13.5, 128.73316455933855}",@"{13.5, 123.44795414513251}"],@[@"{19, 108.3473255309852}",@"{19, 129.9915342759416}",@"{19, 129.9915342759416}",@"{19, 113.38080439739744}"],@[@"{24.5, 111.36743205232361}",@"{24.5, 123.44795414513251}",@"{24.5, 113.38080439739744}",@"{24.5, 115.89763983805886}"],@[@"{30, 111.36743205232361}",@"{30, 123.19631860479403}",@"{30, 115.89763983805886}",@"{30, 112.12243468079438}"],@[@"{35.5, 104.06875328558846}",@"{35.5, 115.89763983805886}",@"{35.5, 115.89763983805886}",@"{35.5, 104.82375591405922}"],@[@"{41, 96.770074518853292}",@"{41, 106.08222163811757}",@"{41, 98.531811323588627}",@"{41, 99.790277047646995}"],@[@"{46.5, 101.04864676425004}",@"{46.5, 118.16274373092648}",@"{46.5, 102.30701648085311}",@"{46.5, 108.3473255309852}"],@[@"{52, 99.790277047646995}",@"{52, 125.71305803800014}",@"{52, 114.63927012145579}",@"{52, 102.30701648085311}"],@[@"{57.5, 97.77680869511785}",@"{57.5, 108.59896107132371}",@"{57.5, 99.035178411720921}",@"{57.5, 106.58549271879457}"],@[@"{63, 103.81711774524996}",@"{63, 121.43448579260338}",@"{63, 106.58549271879457}",@"{63, 106.33385717845609}"],@[@"{68.5, 106.58549271879457}",@"{68.5, 114.63927012145579}",@"{68.5, 110.86406496419133}",@"{68.5, 111.11570050452981}"]];
    
    
    //绘制表格
    [self drawFormWithContext:context];
    //K线
    [self drawKLineWithdata:KlineArray];
    //链接线
    [self drawLineWithdata:lineArray];
    
}
- (void)drawKLineWithdata:(NSArray *)dataArray{
 
    linesView * Kline = [[linesView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    Kline.isKLine  = YES;
    Kline.DataArray = dataArray;
    Kline.backgroundColor = [UIColor clearColor];
    [self addSubview:Kline];
}

- (void)drawLineWithdata:(NSArray *)dataArray{
    
    linesView * Kline = [[linesView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    Kline.DataArray = dataArray;
    Kline.isKLine  = NO;
    Kline.backgroundColor = [UIColor clearColor];
    [self addSubview:Kline];
    
}

- (void)drawFormWithContext:(CGContextRef)context{

    CGFloat spacingValue = 0;
    
    CGFloat YShaftSpacing = (self.frame.size.height-40)/5;
    
    CGFloat XShaftSpacing = (self.frame.size.width-spacingValue)/3;
    
    CGFloat Xpoint = 0+spacingValue;
    CGFloat Ypoint = 0+spacingValue;
    
    CGFloat lineWith = self.frame.size.width-spacingValue;
    
    CGContextSetLineWidth(context, 0.5);//制定了线的宽度
    CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);//也是创建颜色,一句话即可
    CGContextSetShouldAntialias(context, YES);//抗锯齿
    CGFloat MAXPointY=0;
    
    
    
    //横向
    for (int i = 0; i < 5; i++) {
        
        CGContextMoveToPoint(context, Xpoint, Ypoint+i*YShaftSpacing);//设置线段起始
        CGContextAddLineToPoint(context, Xpoint+lineWith, Ypoint+i*YShaftSpacing);//设置线段终点
        CGContextStrokePath(context);//绘制
        if (i == 4) {
            MAXPointY =Ypoint+i*YShaftSpacing;
        }
    }
    //纵向
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);//也是创建颜色,一句话即可
    for (int i = 0 ; i < 4; i++) {
        
        CGContextMoveToPoint(context, Xpoint+i*XShaftSpacing-0.5, Ypoint);//设置线段起始
        CGContextAddLineToPoint(context, Xpoint+i*XShaftSpacing-0.5, MAXPointY);//设置线段终点
        CGContextStrokePath(context);//绘制
    }
    
}


@end
