//
//  Vertex.m
//  WordLadder
//
//  Created by Markus Feng on 12/3/15.
//  Copyright © 2015 Markus Feng. All rights reserved.
//

#import "Vertex.h"

@implementation Vertex

-(instancetype)initWithValue:(NSString *)value{
    self = [super init];
    if(self){
        self.value = value;
        self.adjacent = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(NSString*)description{
    return [NSString stringWithFormat:@"%@", self.value];
}

-(id)copyWithZone:(NSZone *)zone{
    Vertex* copy = [[Vertex alloc] init];
    if(copy){
        copy.value = self.value;
        copy.adjacent = self.adjacent;
    }
    return copy;
}

-(int)getWeight:(NSString *)vertex{
    NSNumber * oldValue = [self.adjacent objectForKey:vertex];
    if(oldValue == nil){
        return -1;
    }
    else{
        return oldValue.intValue;
    }
}

-(BOOL)isEqual:(id)anObject{
    if([anObject isKindOfClass:[Vertex class]]){
        return [((Vertex*)anObject).value isEqualToString:self.value];
    }
    return false;
}

@end
