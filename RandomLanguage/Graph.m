//
//  Graph.m
//  WordLadder
//
//  Created by Markus Feng on 12/3/15.
//  Copyright © 2015 Markus Feng. All rights reserved.
//

#import "Graph.h"

@implementation Graph

-(instancetype)init{
    self = [super init];
    if(self) {
        self.dict = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(void)addVertex:(NSString *)vertex{
    if(![self contains:vertex]){
        Vertex * v = [[Vertex alloc] initWithValue:vertex];
        [self.dict setObject:v forKey:vertex];
    }
}

-(void)addConnection:(NSString *)vertex1 with:(NSString*)vertex2 ofWeight:(int)weight{
    if(![self contains:vertex1]){
        [self addVertex:vertex1];
    }
    if(![self contains:vertex2]){
        [self addVertex:vertex2];
    }
    Vertex * v1 = [self.dict objectForKey:vertex1];
    [v1.adjacent setObject:[[NSNumber alloc] initWithInt:weight] forKey:vertex2];
}

-(bool)contains: (NSString *) vertex{
    return [self getVertex:vertex] != nil;
}

-(Vertex *)getVertex:(NSString *)vertex{
    return [self.dict objectForKey:vertex];
}


@end
