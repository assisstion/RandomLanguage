//
//  RandomLanguage.h
//  RandomLanguage
//
//  Created by Markus Feng on 12/10/15.
//  Copyright © 2015 Markus Feng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RandomLanguage : NSObject

-(NSString*)generateRandomParagraph:(NSString *)input ofOrder:(int)order length:(int)length;

@end
