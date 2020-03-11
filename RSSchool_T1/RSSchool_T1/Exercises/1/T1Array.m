#import "T1Array.h"

@implementation T1Array

- (NSArray *)convertToHappy:(NSArray *)sadArray {
    NSMutableArray *happyArray = [NSMutableArray arrayWithArray:sadArray];
    int i = 0;
    
    if (happyArray.count <= 2)
    {
        return sadArray;
    }
    while (i < happyArray.count - 1)
    {
        if (i == 0)
            i++;
        if ([happyArray[i - 1] intValue] + [happyArray[i + 1] intValue] < [happyArray[i] intValue])
        {
            [happyArray removeObjectAtIndex:i];
            happyArray = [[self convertToHappy:[happyArray mutableCopy]] mutableCopy];
            return [happyArray copy];
        }
        else
        {
            i++;
        }
    }
    return sadArray;
}

@end
