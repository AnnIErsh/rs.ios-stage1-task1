#import "PalindromeSolver.h"

@interface NSArray(Array)
+ (NSArray*)splitStringIntoArray:(NSString*)string;
+ (BOOL)isPalindrom:(NSArray*)array;
@end

@implementation NSArray(Array)
+ (NSArray*)splitStringIntoArray:(NSString*)string;
{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < string.length; i++) {
        NSString *ch = [string substringWithRange:NSMakeRange(i, 1)];
        [array addObject:ch];
    }
    return array;
    
}

+ (BOOL)isPalindrom:(NSArray*)array
{
    int count = 0;
    
    for (int i = 0, j = (int)array.count - 1; i < j; i++, j--)
    {
        if ([array[i] isEqual:array[j]])
        {
            count++;
        }
    }
    
    if (count == array.count / 2)
    {
        return YES;
    }
    return NO;
}
@end

@implementation PalindromeSolver

- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    
    int kk = [k intValue];
    int nn = [n intValue];
    NSMutableString *string = [s mutableCopy];
    unsigned long length = s.length;
    
    if (length != nn)
    {
        return @"-1";
    }
    
    NSMutableArray *array = [[NSArray splitStringIntoArray:string] mutableCopy];
    if (kk == 0)
    {
        return [array componentsJoinedByString:@""];
    }
    
    while (kk > 0)
    {
        if ([NSArray isPalindrom:[array copy]] == YES)
        {
            break;
        }
        for (int i = 0, j = nn - 1; i < j; i++, j--)
        {
            if (kk == 0)
            {
                return [array componentsJoinedByString:@""];
            }
            
            int ii = [array[i] intValue];
            int jj = [array[j] intValue];
            if (ii != jj)
            {
                if (ii - jj > 0)
                {
                    [array replaceObjectAtIndex:j withObject:array[i]];
                    kk--;
                    break;
                }
                else
                {
                    [array replaceObjectAtIndex:i withObject:array[j]];
                    kk--;
                    break;
                }
            }
        }
        [self highestValuePalindrome:[array componentsJoinedByString:@""] n:[NSNumber numberWithInt:nn] k:[NSNumber numberWithInt:kk]];
    }
    
    if ([NSArray isPalindrom:[array copy]] == YES)
    {
        if (kk == 0)
        {
            return [array componentsJoinedByString:@""];
        }
        
        for (int i = 0, j = (int)array.count - 1; kk > 0; i++, j--)
        {
            if (![array[i]  isEqual: @"9"] && ![array[j]  isEqual: @"9"])
            {
                if (array.count % 2 && kk == 1 && ![array[array.count / 2]  isEqual: @"9"])
                {
                    array[array.count / 2] = @"9";
                    break;
                }
                array[i] = @"9";
                kk--;
                array[j] = @"9";
                kk--;
            }
        }
    }
    
    if ([NSArray isPalindrom:[array copy]] == NO)
    {
        return @"-1";
    }
    return [array componentsJoinedByString:@""];
}


@end



