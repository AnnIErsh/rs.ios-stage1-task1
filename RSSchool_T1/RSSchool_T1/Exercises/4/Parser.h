#import <Foundation/Foundation.h>

@interface Parser : NSObject

@property (nonatomic, strong) NSMutableArray *array;
- (NSArray <NSString*>*)parseString: (NSString*)string;

@end

