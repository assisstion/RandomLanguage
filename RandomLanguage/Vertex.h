//
//  Vertex.h
//  WordLadder
//
//  Created by Markus Feng on 12/3/15.
//  Copyright © 2015 Markus Feng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vertex : NSObject <NSCopying>

@property NSString * value;
@property NSMutableDictionary<NSString *, NSNumber *> * adjacent;

-(instancetype)initWithValue:(NSString *)value;
-(int)getWeight:(NSString *)vertex;

@end
