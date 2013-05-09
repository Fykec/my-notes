parent nodes: [ObjC](ObjC.html)\
\

X Code快捷键 {.heading-level2}
------------

Xcode 主题字体 \
 Update: [XCode](XCode.html) 4
请下载：DarkCity.dvtcolortheme。然后拷贝到
/Users/jjyin/Library/Developer/Xcode/UserData/FontAndColorThemes
目录下。\
 \
 \
 Change theme on Mac OS X Lion, Xcode 4.2\
 1. Show all hidden file defaults write com.apple.finder
AppleShowAllFiles YES\
 2. Find folder /Users//Library/Application Support/Xcode/Color Themes\
 3. download custom theme like EGOv2
[http://developers.enormego.com/assets/egotheme/EGOv2.dvtcolortheme](http://developers.enormego.com/assets/egotheme/EGOv2.dvtcolortheme)\
 4. Copy theme to theme folder \
 5. Relauch Xcode will say new theme in preference-\>font & color, now
you can change theme \
 6. Restore file visibility defaults write com.apple.finder
AppleShowAllFiles NO\
 \
 \

[http://digitalflapjack.com/blog/2011/jan/24/xcodedpthemes/](http://digitalflapjack.com/blog/2011/jan/24/xcodedpthemes/)\
 \
 Migrating themes from Xcode 3 to Xcode 4 developer previews\
 \
 Posted by Michael Dales on 2011-01-24 09:41:14\
 \
 I've been trying out the Xcode 4 Developer Previews, and the first
thing that hit me was the current DPs don't find your nice font/colour
settings for the code editor - a trivial thing on one hand, but
something most coders are very sensitive about :)\
 \
 The issue is it's not just a file location change (that is also the
case), but it's also a file format change, so you can't just move your
old custom theme into place. Thankfully aktowns has provided a nice ruby
script to convert the themes from old to new format. You can grab the
script from here - I modified it only to make it run slightly more
easily on a stock ruby environment.\
 \
 So, to migrate your themes:\
 \
 Install the "plist" ruby gem with: sudo gem install plist\
 Download the script, and know where it is :)\
 Your custom Xcode 3 themes are saved in \~/Library/Application
Support/Xcode/Color Themes, go find the file there that you want to
migrate (it'll have a .xccolortheme extension)\
 Run dvtcolorconvert.rb passing it the path to your theme file\
 It'll create a file in the same directory containing the theme in the
new format with a .dvtcolortheme extension\
 Move the .dvtcolortheme file into
\~/Library/Developer/Xcode/UserData/FontAndColorThemes\
 Restart Xcode 4\
 And your theme should now appear in the Xcode preferences. I found that
it wasn't perfect - the font size got confused - but with developer
previews I'd expect a little inconsistency. That said it was a few
seconds to correct for that, compared to migrating it all by hand!
