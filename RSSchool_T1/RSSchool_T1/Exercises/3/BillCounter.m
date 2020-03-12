#import "BillCounter.h"

@implementation BillCounter

- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    
    NSInteger sumOfAnna = 0;
    NSMutableArray *billOfAnna = [bill mutableCopy];
    NSInteger sumOfBill = 0;
    [billOfAnna removeObjectAtIndex:index];
    
    for (int i = 0; i < billOfAnna.count; i++)
    {
        sumOfBill += [billOfAnna[i] intValue];
    }
    sumOfAnna = sumOfBill / 2;
    
    if ([sum intValue] == sumOfAnna)
    {
        return @"Bon Appetit";
    }
    
    return [@([sum intValue] - sumOfAnna) stringValue];
}

@end
