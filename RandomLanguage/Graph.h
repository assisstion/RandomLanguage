//
//  Graph.h
//  WordLadder
//
//  Created by Markus Feng on 12/3/15.
//  Copyright © 2015 Markus Feng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vertex.h"

@interface Graph : NSObject

@property NSMutableDictionary<NSString *, Vertex *> * dict;

-(void)addVertex:(NSString *)vertex;
-(void)addConnection:(NSString *)vertex1 with:(NSString*)vertex2 ofWeight:(int)weight;
-(bool)contains:(NSString *)vertex;
-(Vertex *)getVertex:(NSString *)vertex;

@end
