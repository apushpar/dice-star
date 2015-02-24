//
//  DKQueue.m
//  dicesterTest
//
//  Created by Akshay Pushparaja on 2/24/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "DKQueue.h"

@implementation DKQueue

-(id)init
{
    if ( (self = [super init]) ) {
        array = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(id)dequeue
{
    if ([array count] > 0) {
        id object = [self peek];
        [array removeObjectAtIndex:0];
        return object;
    }
    
    return nil;
}

-(void)enqueue:(id)element
{
    [array addObject:element];
}

-(void)enqueueElementsFromArray:(NSArray*)arr
{
    [array addObjectsFromArray:arr];
}

-(void)enqueueElementsFromQueue:(DKQueue*)queue
{
    while (![queue isEmpty]) {
        [self enqueue:[queue dequeue]];
    }
}

-(id)peek
{
    if ([array count] > 0)
        return [array objectAtIndex:0];
    
    return nil;
}

-(NSInteger)size
{
    return [array count];
}

-(BOOL)isEmpty
{
    return [array count] == 0;
}

-(void)clear
{
    [array removeAllObjects];
}


@end
