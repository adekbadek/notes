# Cordova

## Change WebView background color

The `config.xml` preference did not work for me, but the background color can be changed though XCode. Open Classes/MainViewController.m and find the block starting with `- (void)viewWillAppear:` and add the lines starting with `self.webView`

```Objective-C
- (void)viewWillAppear:(BOOL)animated
{
  // View defaults to full size.  If you want to customize the view's size, or its subviews (e.g. webView),
  // you can do so here.

  self.webView.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1.0];
  self.webView.opaque=NO;

  [super viewWillAppear:animated];
}
```

Then change the `UIColor` to anything you like. This [HEX to Objective-C/Swift converter](http://uicolor.xyz/#/hex-to-ui) helps. There are also color options in `MainViewController.xib`.

## Hide status bar permanently in iOS app

In order to hide the status bar permanently, not only during application launch, add a line to the App-info.plist file. You can do that through XCode - in 'Info' tab, right click and choose 'Add row', then write (it will autofill) `View-controller based status bar appearance`, and set it to type boolean with `NO` (false) as value. That's it.
