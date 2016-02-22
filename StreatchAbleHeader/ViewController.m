//
//  ViewController.m
//  StreatchAbleHeader
//
//  Created by Siba Prasad Hota on 22/02/16.
//  Copyright © 2016 Sibahota. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    CGRect cachedImageViewSize;

}

@property (strong, nonatomic)IBOutlet UIImageView *imageView;
@property (strong, nonatomic)IBOutlet UIView *viewHeader;
@property (weak, nonatomic) IBOutlet UITableView *testTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0,320, 220)];
    self.imageView = [[UIImageView alloc] initWithFrame:self.viewHeader.frame];
    [self.viewHeader addSubview:self.imageView];
    self.testTableView.tableHeaderView = self.viewHeader;
    [self initializetableheaderView];
    // Do any additional setup after loading the view from its nib.
}

-(void)initializetableheaderView
{
    [self.imageView setUserInteractionEnabled:YES];
    self.imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    self.imageView.image = [UIImage imageNamed:@"scene.png"];
    CGRect rctImage = self.imageView.frame;
    rctImage.size.height = self.viewHeader.frame.size.height-16;
    [self.imageView setFrame:rctImage];
    cachedImageViewSize = self.imageView.frame;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollViewd
{
    CGFloat y = -scrollViewd.contentOffset.y;
    
    if (y > 0){
        self.imageView.frame = CGRectMake(0, scrollViewd.contentOffset.y, cachedImageViewSize.size.width+y, cachedImageViewSize.size.height+y);
        self.imageView.center = CGPointMake(self.view.center.x, self.imageView.center.y);
    }
}

- (UIView*)viewForZoomingInScrollView:(UIScrollView *)aScrollView {
    return self.imageView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return   1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"testTableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text= [NSString stringWithFormat:@"Cell %ld",(long)indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
