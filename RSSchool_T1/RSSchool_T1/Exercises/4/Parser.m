#import "Parser.h"

@implementation Parser

- (NSString*)ifString:(char)ch {
    if (ch == '(')
    {
        return @")";
    }
    if (ch == '[')
    {
        return @"]";
    }
    if (ch == '<')
    {
        return @">";
    }
    return @"";
}

- (NSString*)ifStr:(NSString*)ch {
    if ([ch  isEqual: @")"])
    {
        return @"(";
    }
    if ([ch  isEqual: @"]"])
    {
        return @"[";
    }
    if ([ch  isEqual: @">"])
    {
        return @"<";
    }
    return @"";
}

- (NSArray <NSString*>*)parseString:(NSString*)string {
    
    NSRange leftP = [string rangeOfString:@"(" options:NSBackwardsSearch];
    NSRange leftB = [string rangeOfString:@"[" options:NSBackwardsSearch];
    NSRange leftBr = [string rangeOfString:@"<" options:NSBackwardsSearch];
    self.changeString = [string mutableCopy];
    unsigned long start = 0;
    unsigned long end = 0;
    char c;
    unsigned long i = string.length;
    
    for (;i ;i--) {
        if (i == leftP.location || i == leftB.location || i == leftBr.location)
        {
            start = i;
            c = [string characterAtIndex:start];
            NSString *searchString = [string substringFromIndex:start];
            NSString *bracket = [self ifString:c];
            NSRange rightClose = [searchString rangeOfString: bracket];
            NSRange starRange = [string rangeOfString:bracket];
            
            if ([self.changeString characterAtIndex: starRange.location] == '*')
            {
                searchString = [self.changeString substringFromIndex:start];
                rightClose = [searchString rangeOfString:bracket];
                searchString = [string substringFromIndex:start];
            }
            
            end = rightClose.location;
            NSString *substring = [searchString substringWithRange:NSMakeRange(1, end - 1)];
            
            if (self.array == nil) {
                self.array = [NSMutableArray new];
                [self.array addObject:substring];
            }
            else
            {
                [self.array addObject:substring];
            }
    
            NSString *str = [self ifStr:bracket];
            [self.changeString replaceCharactersInRange:NSMakeRange(i + substring.length + 1, 1) withString:@"*"];
            [self.changeString replaceCharactersInRange:NSMakeRange(i, 1) withString:@"*"];
            
            if (i == leftP.location)
            {
                leftP = [self.changeString rangeOfString:str options:NSBackwardsSearch];
            }
            
            if (i == leftB.location)
            {
                leftB = [self.changeString rangeOfString:str options:NSBackwardsSearch];
            }
            
            if (i == leftBr.location)
            {
                leftBr = [self.changeString rangeOfString:str options:NSBackwardsSearch];
            }
        }
    }
    NSArray *results = [[self.array reverseObjectEnumerator] allObjects];
    return results;
} 

@end
