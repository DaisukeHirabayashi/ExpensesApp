//
//  BorderButton.m
//  UNDAMESI
//
//  Created by Edasan0308 on 2018/05/08.
//  Copyright © 2018年 AIT. All rights reserved.
//

#import "BorderButton.h"

@implementation BorderButton

- (void)drawRect:(CGRect)rect
{
    self.layer.cornerRadius = self.cornerRadius;
    self.layer.borderColor = self.borderColor.CGColor;
    self.layer.borderWidth = self.borderWidth;
    
    [super drawRect:rect];
}

@end


