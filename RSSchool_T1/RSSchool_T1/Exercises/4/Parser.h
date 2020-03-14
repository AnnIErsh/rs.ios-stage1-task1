#import <Foundation/Foundation.h>

@interface Parser : NSObject

@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) NSMutableString *changeString;

- (NSArray <NSString*>*)parseString: (NSString*)string;
- (NSString*)ifStr:(NSString*)ch;
- (NSString*)ifString:(char)ch;

@end

