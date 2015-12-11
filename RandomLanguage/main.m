//
//  main.m
//  RandomLanguage
//
//  Created by Markus Feng on 12/10/15.
//  Copyright © 2015 Markus Feng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RandomLanguage.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //NSLog(@"Hello, World!");
        
        char path[200];
        int order;
        int length;
        
        printf("File path: ");
        scanf(" %s", path);
        
        printf("Substring length: ");
        scanf(" %i", &order);
        
        printf("Paragraph length: ");
        scanf(" %i", &length);
        
        NSString * pathString = [[NSString alloc] initWithUTF8String:path];
        
        //Example path:
        ///Users/mfeng17/Desktop/pg2852.txt
        
        NSURL *myPath = [NSURL fileURLWithPath:pathString];
        
        // read the contents into a string
        NSString *myFile = [[NSString alloc] initWithContentsOfURL:myPath encoding:NSUTF8StringEncoding error:nil];
        
        // eliminate new lines
        myFile = [myFile stringByReplacingOccurrencesOfString:@"\r\n" withString:@" "];
        myFile = [myFile stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
        
        NSLog(@"Begin generating...");
        
        RandomLanguage * rl = [[RandomLanguage alloc] init];
        NSString * output = [rl generateRandomParagraph:myFile ofOrder:order length:length];
        
        NSLog(@"%@", output);
    }
    return 0;
}
