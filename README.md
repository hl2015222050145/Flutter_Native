# Flutter_Native
iOS Native与flutter混合开发


源码集成方式
1 创建native工程
2 创建flutter工程	
	flutter create -t module my_flutter
3 更改Podfile文件

# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

flutter_application_path = '../flutter_demo/'
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

target 'native_demo' do
	install_all_flutter_pods(flutter_application_path)
end

4 pod install 

5 修改工程支持native与flutter混合编程
	5.1 继承类修改 @interface AppDelegate : FlutterAppDelegate
	5.2 初始化flutter相关engine
	
	- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    	self.flutterEngine = [[FlutterEngine alloc] initWithName:@"io.flutter" project:nil];
    	[self.flutterEngine runWithEntrypoint:nil];
    	[GeneratedPluginRegistrant registerWithRegistry:self.flutterEngine];
    	return [super application:application didFinishLaunchingWithOptions:launchOptions];
	}
