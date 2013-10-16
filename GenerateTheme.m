// To run this file, replace main.m with the contents in a new iOS project.
// Then import verbs.txt and nouns.txt into the project.
// Ensure that these two files are represented in Target->Build Phases->Copy Bundle Resources
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        NSError *error;
        NSString * ( ^ sentenceCapitalizedString )( NSString * );
        sentenceCapitalizedString = ^( NSString * mystring )
        {
            if (![mystring length]) {
                return mystring;
            }
            NSString *uppercase = [[mystring substringToIndex:1] uppercaseString];
            NSString *lowercase = [[mystring substringFromIndex:1] lowercaseString];
            return [uppercase stringByAppendingString:lowercase];
        };
        
#pragma mark verbs
        NSString *verbPath = [[NSBundle mainBundle] pathForResource:@"verbs"
                                                             ofType:@"txt"];
        NSString *verbString = [[NSString alloc] initWithContentsOfFile:verbPath
                                                               encoding:NSUTF8StringEncoding
                                                                  error:&error];
        NSArray * verbs = [verbString componentsSeparatedByString:@"\n"];
        
#pragma mark nouns
        NSString *nounPath = [[NSBundle mainBundle] pathForResource:@"nouns"
                                                             ofType:@"txt"];
        NSString *nounString = [[NSString alloc] initWithContentsOfFile:nounPath
                                                          encoding:NSUTF8StringEncoding
                                                             error:&error];
        NSArray * nouns = [nounString componentsSeparatedByString:@"\n"];
        
#pragma mark VtN generation
        for (int i = 0; i < 10; i++) {
            NSUInteger randomVerbIndex = arc4random() % [verbs count];
            NSString *verb = verbs[randomVerbIndex];
            NSString *capitalVerb = sentenceCapitalizedString(verb);
            
            NSUInteger randomNounIndex = arc4random() % [nouns count];
            NSString *noun = nouns[randomNounIndex];
            NSString *capitalNoun = sentenceCapitalizedString(noun);
            
            NSLog(@"%@ the %@",capitalNoun, capitalVerb);
            

        }
    }
    //return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
}

