//
//  ViewController.h
//  MakeHtml
//
//  Created by Daniel Suarez on 12/27/15.
//  Copyright © 2015 Daniel Suarez. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController{
    
    NSString *fileNameInput;
    NSString *htmlFileName;
    NSString *stylesheetFileName;
    BOOL makeStylesheet;
    BOOL makeHtml;
    NSString *url;
    NSString *content;
    NSData *file;
    NSString *urlForStylesheet;
    NSString *contentForStylesheet;
    NSData *stylesheetFile;
    int countInt;
    NSTimer *resetTimer;
    BOOL goToCheckButton;
    NSString *titleOfDocument;
    BOOL makeForMcat;
    BOOL isProperName;
    BOOL regularCheckBoxInteraction;
    BOOL mcatCheckBoxInteraction;

}
@property (weak) IBOutlet NSTextField *mainInputLabel;
@property (weak) IBOutlet NSTextField *secondLabel;
@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSTextField *updateWithHtmlName;
@property (weak) IBOutlet NSTextField *updatedStyleSheetFileName;
@property (weak) IBOutlet NSButton *noButton;
@property (weak) IBOutlet NSButton *yesButton;
@property (weak) IBOutlet NSTextField *errorLabel;
@property (weak) IBOutlet NSButton *makeFileButtonOutlet;
@property (weak) IBOutlet NSButton *resetButtonOutlet;
@property (weak) IBOutlet NSButton *mcatYesCheckBox;
@property (weak) IBOutlet NSButton *mcatNoCheckBox;
@property (weak) IBOutlet NSButton *testButtonOutlet;


- (IBAction)makeFiles:(id)sender;
- (IBAction)resetFields:(id)sender;
- (IBAction)declareSytlesheetState:(id)sender;
- (IBAction)declareForMcat:(id)sender;
- (IBAction)testAction:(id)sender;
-(void)makeHtmlFile;
-(void)makeStylesheet;
-(void)makeMcatStylesheet;
-(void)makeMcatHtml;
@end

