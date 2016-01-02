#import <Cocoa/Cocoa.h>
#import "xcc_general_include.h"

@interface AppController : NSObject

@property (assign) IBOutlet NSWindow* theWindow;
@property (assign) IBOutlet NSTableView* tableView;
@property (assign) IBOutlet NSTextField* textField;

- (IBAction)addItem:(id)sender;
- (IBAction)removeItem:(id)sender;

@end
