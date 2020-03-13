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
- (NSArray <NSString*>*)parseString:(NSString*)string {

    NSMutableString *str = [string mutableCopy];
    NSRange rangeOpen = [str rangeOfString:@"("];
    NSRange rangeOpenTwo = [str rangeOfString:@"["];
    NSRange rangeOpenThree = [str rangeOfString:@"<"];
    NSRange rangeClose;
    char c;
    unsigned long open = 0;
    unsigned long close = 0;

    for (int i = 0; i < str.length; i++)
    {
        if (i == rangeOpen.location || i == rangeOpenTwo.location || i == rangeOpenThree.location)
        {
            open = i;
            c = [[str copy] characterAtIndex:i];
            NSString *newStr = [self ifString:c];
            rangeClose = [[str copy] rangeOfString: newStr];
            close = rangeClose.location - i;
            break;
        }
    }

    if (open && close)
    {
        NSRange range = NSMakeRange(open + 1, close - 1);
        NSRange rangeBracket = NSMakeRange(open, close + 1);
        NSString *subString = [[str copy] substringWithRange:range];
        [str deleteCharactersInRange:rangeBracket];
        
        if (self.array == nil) {
            self.array = [NSMutableArray new];
            [self.array addObject:subString];
        }
        else
        {
            [self.array addObject:subString];
        }
        [self parseString:subString];
        [self parseString:[str copy]];
    }
    return [self.array copy];
} 

@end
