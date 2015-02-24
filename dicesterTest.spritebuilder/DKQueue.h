//
//  DKQueue.h
//  dicesterTest
//
//  Created by Akshay Pushparaja on 2/24/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DKQueue : NSObject {
    NSMutableArray* array;
}

// Removes and returns the element at the front of the queue
-(id)dequeue;
// Add the element to the back of the queue
-(void)enqueue:(id)element;
// Remove all elements
-(void)enqueueElementsFromArray:(NSArray*)arr;
-(void)enqueueElementsFromQueue:(DKQueue*)queue;
-(void)clear;

// Returns the element at the front of the queue
-(id)peek;
// Returns YES if the queue is empty
-(BOOL)isEmpty;
// Returns the size of the queue
-(NSInteger)size;

@end
