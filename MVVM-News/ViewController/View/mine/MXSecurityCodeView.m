//
//  MXSecurityCodeView.m
//  MVVM-News
//
//  Created by 未思语 on 06/12/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXSecurityCodeView.h"
#define kColor ([UIColor colorWithRed:arc4random()%256/256.0 green:arc4random()%256/256.0  blue:arc4random()%256/256.0  alpha:1.0])
#define kFont [UIFont systemFontOfSize:(arc4random()%5+15)];

@interface MXSecurityCodeView()
{
    NSMutableString *_codeStr;
    NSUInteger _chartCount;
    NSUInteger _lineCount;
    NSArray *_localArr;
    
}
@end
@implementation MXSecurityCodeView
-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    self.backgroundColor = kColor;
    [self getCodeStr];
    //对获取的code进行frame设置
    CGSize size = [@"S" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    int widthPadding = rect.size.width/_chartCount-size.width;
    int heightPadding = rect.size.height-size.height;
    CGFloat px,py;
    //将字符串直接画在view 上，获取点位置，直接drawInpoint画
    for (int i = 0; i < _codeStr.length; i ++) {
        py = arc4random()%(heightPadding);
        px = arc4random()%(widthPadding)+size.width*i;
        CGPoint point = CGPointMake(px, py);
        unichar c  = [_codeStr characterAtIndex:i];
        NSString *n = [NSString stringWithFormat:@"%C",c];
        [n drawAtPoint:point withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:(arc4random()%4+15)],NSForegroundColorAttributeName:kColor}];

    }
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.f);
    
    CGFloat x,y;
    for (int i = 0; i <_lineCount ; i++) {
        CGContextSetStrokeColorWithColor(context, kColor.CGColor);
        //起点
        x = arc4random()%((int)rect.size.width);
        y = arc4random()%((int)rect.size.height);
        CGContextMoveToPoint(context, x, y);
        //终点
        x = arc4random()%((int)rect.size.width);
        y = arc4random()%((int)rect.size.height);
        CGContextAddLineToPoint(context, x, y);
        CGContextSetLineJoin(context, kCGLineJoinRound);
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextStrokePath(context);

    }
    
}

- (void)getCode {
    [self setNeedsDisplay];
}
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
        _lineCount = 6;
        _chartCount = 6;
        _localArr = [[NSArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z",nil];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(getCode)];
        [self addGestureRecognizer:tap];
        
    
    }
    return self;
    
}
- (void)getCodeStr {
    _codeStr = [[NSMutableString alloc]initWithCapacity:_chartCount];
    for (int i = 0; i < _chartCount; i ++) {
        NSInteger index = arc4random()%(_localArr.count);
        _codeStr = (NSMutableString *)[_codeStr stringByAppendingString:[_localArr objectAtIndex:index]];
        NSLog(@"%@------",_codeStr);
    }
}

@end
