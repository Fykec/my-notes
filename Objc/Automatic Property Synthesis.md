# Automatic Property Synthesis

2013-06-09 16:08:26

As the current version of Xcode is 4.6.1 you should be using automatic property synthesis.

Some points to look out for when chucking away all your @synthesize statement:

1. @property will create variables with a leading underscore.
Fine if you’ve been doing 

			@synthesize myVar = _myVar. 
	If not, you need to go through your code and refactor.

2. An important gotcha is that Xcode will not create the instance variable if you implement both the getter and setter.
3. Protocols: auto property synthesis will not synthesize a property declared in a protocol.
Also,
4. Properties are atomic by default so you’ll need to use:

		@property (nonatomic, strong) NSString *title;


http://useyourloaf.com/blog/2012/08/01/property-synthesis-with-xcode-4-dot-4.html