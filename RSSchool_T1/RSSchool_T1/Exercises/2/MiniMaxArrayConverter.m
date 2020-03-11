#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    
    NSMutableArray *arr = [[array sortedArrayUsingSelector:@selector(compare:)] mutableCopy];
    NSUInteger maxSum = 0;
    NSUInteger minSum = 0;
    NSMutableArray *arrForMax = [arr mutableCopy];
    NSMutableArray *arrForMin = [arr mutableCopy];
    [arrForMin removeObjectAtIndex:0];
    [arrForMax removeLastObject];
    
    for (int i = 0; i < arr.count - 1; i++)
    {
        maxSum += [arrForMax[i] intValue];
        minSum += [arrForMin[i] intValue];
    }
    
    
    return @[[NSNumber numberWithUnsignedLong:maxSum], [NSNumber numberWithUnsignedLong:minSum]];
}

@end
