/*
 * AppController.j
 * CPTableView1
 *
 * Created by You on November 27, 2015.
 * Copyright 2015, Your Company All rights reserved.
 */

@import <Foundation/Foundation.j>
@import <AppKit/AppKit.j>


@implementation AppController : CPObject
{
    @outlet CPWindow    theWindow;
    @outlet CPTableView tableView;
    @outlet CPTextField textField;
    CPMutableArray      nameArray @accessors;
    CPInteger           row;
}

- (id)init
{
    self = [super init];

    if (self)
    {
        nameArray = [[CPMutableArray alloc]initWithObjects:"Alpha", "Beta", "Charlie", "Delta", nil];
    }
    return self;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things.

    // In this case, we want the window from Cib to become our full browser window
    [theWindow setFullPlatformWindow:NO];
}

- (int)numberOfRowsInTableView:(CPTableView)aTableView
{
    return [nameArray count];
}

- (id)tableView:(CPTableView)aTableView objectValueForTableColumn:(CPTableColumn)aColumn row:(CPInteger)aRowIndex
{
    return [nameArray objectAtIndex: aRowIndex];
}

- (@action)addItem:(id)sender
{
    [nameArray addObject: [textField stringValue]];
    [textField setStringValue:""];
    [tableView reloadData];
}

- (BOOL)tableView:(CPTableView)aTableView shouldSelectRow:(CPInteger)rowIndex
{
    if (rowIndex != null)
    {
        row = rowIndex;
    }

    return true;
}

- (@action)removeItem:(id)sender
{
    if (row != null)
    {
        [nameArray removeObject: [nameArray objectAtIndex: row]];
    }

    [tableView reloadData];
}

@end
