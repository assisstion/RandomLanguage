//
//  RandomLanguage.m
//  RandomLanguage
//
//  Created by Markus Feng on 12/10/15.
//  Copyright © 2015 Markus Feng. All rights reserved.
//

#import "RandomLanguage.h"
#import "Graph.h"

@implementation RandomLanguage

-(NSString*)generateRandomParagraph:(NSString *)input ofOrder:(int)order length:(int)length{
    
    Graph * graph = [self generateMarkovGraph:input ofOrder:order];
    
    NSString * mostFrequentSubstring = [self findMostFrequentSubstring:graph];
    
    NSString * output = [self generateStringFromGraph:graph initialSeed:mostFrequentSubstring];
    
    return output;
}

-(Graph *)generateMarkovGraph:(NSString *)input ofOrder:(int)order{
    Graph * graph = [[Graph alloc] init];
    for(int i = 0; i <= [input length] - order; i++){
        NSString * current = [input substringWithRange:NSMakeRange(i, order)];
        NSString * next;
        if(i == [input length] - order){
            next = @"";
        }
        else{
            next = [input substringWithRange:NSMakeRange(i + 1, order)];
        }
        [self addConnectionToGraph:graph from:current to:next];
    }
    return graph;
}

-(int)addConnectionToGraph:(Graph *)graph from:(NSString *)vertex1 to:(NSString *)vertex2{
    [graph addVertex:vertex1];
    [graph addVertex:vertex2];
    Vertex * v1 = [graph getVertex:vertex1];
    int weight = [v1 getWeight:vertex2];
    if(weight != -1){
        [graph addConnection:vertex1 with:vertex2 ofWeight:weight + 1];
        return weight + 1;
    }
    else{
        [graph addConnection:vertex1 with:vertex2 ofWeight:1];
        return 1;
    }
    
}

-(NSString *)findMostFrequentSubstring:(Graph *)graph{
    int maxOccurances = 0;
    NSString * mostFrequentSubstring = nil;
    
    for(Vertex * current in [graph.dict allValues]){
        int total = 0;
        for(NSNumber * i in [current.adjacent allValues]){
            total += i.intValue;
        }
        if(total > maxOccurances){
            maxOccurances = total;
            mostFrequentSubstring = current.value;
        }
    }
    return mostFrequentSubstring;
}

-(NSString *)generateStringFromGraph:(Graph *)graph initialSeed:(NSString *)initial{
    
    NSMutableString * output = [[NSMutableString alloc] initWithString:initial];
    
    int counter = (int)[output length];
    
    Vertex * current = [graph getVertex:initial];
    while(counter < 2000){
        int total = 0;
        for(NSNumber * i in [current.adjacent allValues]){
            total += i.intValue;
        }
        int random = (arc4random() % total);
        Vertex * target = nil;
        for(NSString * checking in [current.adjacent allKeys]){
            random -= [current.adjacent objectForKey:checking].intValue;
            if(random < 0){
                target = [graph getVertex:checking];
                break;
            }
        }
        if([target.value length] == 0){
            break;
        }
        [output appendString:[target.value substringFromIndex:[target.value length] - 1]];
        current = target;
        counter++;
    }
    return output;
}

@end
