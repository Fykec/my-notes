parent nodes: [ObjC](ObjC.html)\
\

处理半透明PNG图片 {.heading-level2}
-----------------

[http://calendar.perfplanet.com/2010/png-that-works/](http://calendar.perfplanet.com/2010/png-that-works/)\
 \
 \
 PNG that works\
 \
 \
 Performance Calendar\
 The speed geek's favorite time of the year\
 \
 201120102009\
 16th\
 Dec 2010\
 PNG that works\
 by Kornel Lesiński\
 Once you sprite your images, the next step is to compress them as much
as possible. PNG is a great format for this, but…\
 \
 Does PNG work everywhere?\
 \
 Yes, it does! No, it doesn’t! Which PNG?\
 \
 Photoshop IE6 IE7-8 Safari Mobile Safari Firefox Opera\
 Paletted with 1-bit alpha\
 (like GIF)\
 Yes Yes Yes Yes Yes Yes Yes\
 24-bit without alpha\
 Yes Yes Yes Yes Yes Yes Yes\
 Paletted with 8-bit alpha\
 No No Yes Yes Yes Yes Yes\
 24-bit with 8-bit alpha\
 Yes No Yes Yes Yes Yes Yes\
 8-bit alpha and CSS opacity\
 (filter:alpha in IE)\
 N/A No No Yes Yes Yes Yes\
 Gamma correction\
 Sometimes sort-of works, but that makes things worse…\
 ICC color profiles\
 Yes No No Yes No Yes No\
 PNG supports various combinations of color depth, transparency and
color correction. Some combinations work perfectly with every piece of
software produced in the last decade, and some more esoteric features
are practically useless.\
 \
 Palette with 1-bit transparency (like GIF)\
 IE6 IE7-8 Your browser\
 \
 GIF-like PNG images with simple transparency are supported in all
browsers (even as old as IE4) without any hacks, so whenever you can use
GIF — don’t. Use PNG instead.\
 \
 You’ll get the same quality and compatibility as GIF, but a smaller
file size.\
 \
 24-bit without alpha channel\
 IE6 IE7-8 Your browser\
 \
 24-bit PNG files have perfect quality, but perfection costs a lot of
bandwidth. Even though they work in all browsers, don’t use them.\
 \
 When you need full color, but don’t need transparency, use JPEG
instead.\
 \
 24-bit with 8-bit alpha channel\
 IE6 IE7-8 Your browser\
 \
 This type is often mistaken for one and only true PNG, and infamously
fails in IE6. There are hacks that make it work, but they’re slow and
don’t mix well with other CSS properties.\
 \
 Aside from the IE6 problem, this type creates pretty large files. Avoid
it. The silver bullet is below:\
 \
 Palette with 8-bit alpha channel\
 Photoshop IE6 IE7-8 Your browser\
 \
 If you’ve only ever used Photoshop, you may believe that this type of
PNG cannot exist. In reality it’s just Photoshop’s PNG support lacking.\
 \
 With this type of PNG you get file sizes smaller than GIF, but retain
ability to use several levels of transparency.\
 \
 In paletted PNGs alpha is not a mask, but only an extra component in
each palette entry. Thanks to this it gracefully degrades in IE6 — fully
opaque pixels are displayed correctly and other pixels are completely
transparent. Usually this means that IE6 will drop smooth edges and
shadows, but the image will be good enough:\
 \
 IE6 Your browser\
 \
 Use this type of PNG whenever you want semi-transparency. You can
create these files with (ex-Macromedia) Fireworks. If you’re stuck with
Photoshop, you can convert 24-bit PNGs to 8-bit.\
 \
 24-bit with 8-bit alpha channel and CSS opacity (filter:alpha in IE)\
 IE6 IE7-8 Your browser\
 \
 There’s a combination of transparencies that doesn’t work even in IE8.
If you apply filter:alpha(opacity=α) to an image that is transparent
already, IE7-8 will revert to 1-bit transparency and apply alpha channel
as a black mask.\
 \
 If possible, instead of relying on CSS, just create an image that is
bit more transparent itself. If you’re only using opacity for
fade-in/fade-out, you can probably ignore this problem. If you need a
workaround, it’s the same as for IE6.\
 \
 PNG with ICC color profile\
 IE8, Chrome, Opera, Mobile Safari Firefox, Desktop Safari Your browser\
 \
 How red is \#FF0000? Answer to this nearly-philosophical question
depends on the monitor you have, its settings, and even lighting
conditions around you.\
 \
 But what if you wanted colors in PNG to exactly match the color of your
shoes? Color profiles are supposed to solve this oh-so-important
problem.\
 \
 In practice they’re not useful on the Web (even when they work right,
and they rarely do.)\
 \
 If anyone asks, images for the Web are expected to be in the sRGB color
space with gamma 2.2.\
 \
 Don’t enable color management in your software, don’t embed ICC
profiles when saving for the Web, and use a PNG optimizer to get rid of
any profiles that were embedded.\
 \
 PNG with gamma correction\
 Matching Mismatched\
 \
 Color intensity goes from 0 to 255. What’s the value of color that
looks half as bright as 255? When PNG was young, different systems
agreed only on one thing: it was not between 127 and 128.\
 \
 I’m serious. For monitors half of 255 is not 127.5. It’s 186! (or 173
if you have a previous version of Mac OS X.)\
 \
 \
 If the color 186 doesn’t look almost like the 0/255 pattern, your
monitor is miscalibrated or your browser’s scaling algorithm is buggy.\
 \
 That crazy thing is called gamma correction and the formula for it is:\
 \
 (color\_sane\_person\_expects ÷ 255)1⁄gamma × 255 =
color\_that’s\_actually\_used\
 \
 It’s not a PNG quirk. The problem dates back to CRT monitors which
didn’t display brightness evenly — applying ¾ of maximum voltage gave
only ½ of maximum brightness. Some operating systems tried to compensate
for this effect, others didn’t.\
 \
 PNG had good intentions to fix this mess by encoding gamma value of
system/monitor that was used to create the image, allowing other systems
to adjust brightness accordigly.\
 \
 This caused a silly problem: most browsers correct colors in PNGs, but
nothing else. All colors in GIFs, JPEGs and CSS may be “incorrect”.\
 \
 To get colors in PNG exactly as “incorrect” as all other colors in the
system, you have to remove gamma information from the files, which
prevents browsers from making PNGs holier than the pope.\
 \
 PNG tools\
 \
 Optimisation\
 \
 Typical PNG-saving programs trade compression efficiency for speed and
don’t refrain from embedding useless or even problematic metadata in the
files.\
 \
 PNG optimizers fix this. PNGOUT removes all junk and gives the best
compression. You can also use OptiPNG + Pngcrush combo. They’re
commandline tools. If you’d like to optimize images on a Linux server,
this is a useful snippet:\
 \
 find . -name '\*.png' -print0 | xargs -P4 -0 -n1 pngout

For the mouse-loving people I wrote ImageOptim. It combines all the best
image opti­misa­tion tools with drag’n'drop Mac GUI. Trimage is
ImageOptim’s Linux cousin. Windows users might use PNGOUTWin or
PNGGauntlet.\
 \
 Whichever method you prefer, always optimize PNGs.\
 \
 Quantisation\
 \
 Since Photoshop doesn’t have a full support for PNG with alpha yet, to
get small files and nice transparency, you’ll need pngnq or pngquant. I
wrote a simple GUI for it: ImageAlpha.\
 \
 pngnq uses a very cool algorithm based on neural networks. Side-effect
of this is that results are a bit random. Sometimes an image with less
colors looks better than an image with more colors (try 255, 254, 253
colors, and so on.)\
 Troubleshooting\
 \
 Problem Solution\
 File is huge Use 256-color PNG instead of 24-bit (remember: 256-color
type also supports full alpha channel)\
 File is larger than GIF Use a PNG optimizer\
 Colors in PNG have diff­erent bright­ness than same colors in CSS or
HTML Remove gamma information. PNG optimizers usually do it, e.g.,\
 pngcrush -rem alla input.png output.png\
 Colors in PNG are still odd Make sure you use the sRGB color space
(experiment with the Convert to the sRGB option in Photoshop when saving
for Web)\
 Image has solid gray background in IE6 Use PNG8+alpha instead of
24-bit\
 Image is invisible in IE6 Make sure the image has some fully-opaque
pixels. Use improved pngquant that supports the -iebug flag\
 Photoshop displays transparency wrong You’ve got PNG8 with alpha not
supported by Photoshop. For editing, keep PNG in 24-bit, and convert to
PNG8+alpha only when done. You can convert PNG8 to 24-bit by resaving it
in Preview.app, Fireworks or with:\
 pngout -s1 -c6 -force file.png\
 Summary\
 \
 You don’t have to read such a long article to use PNG properly. Quick
version:\
 \
 PNG works since IE4. If you’re still using GIF, you’re wasting
bandwidth.\
 Use 256-color PNGs.\
 Avoid 24-bit PNGs. Use pngquant if you want to have a cake and eat it
too.\
 Use a PNG optimizer. You’ll get smaller files and avoid some pitfalls.\
 ABOUT THE AUTHOR\
 \
 Kornel Lesiński (@pornelski). Web developer since “best viewed in AWeb
in 640×256.” Creator of ImageOptim. London Standardista.\
 \
 36 Responses to “PNG that works”\
 \
 porneL December 17th, 2010\
 I forgot to mention in the article that the nifty icon used as example
is based on Mozilla Prism.\
 \
 stoyan December 17th, 2010\
 Thanks @porneL, it’s an awesome article. And these mouseover background
changes really take the points home\
 \
 Tweets that mention Performance Calendar » PNG that works -- Topsy.com
December 17th, 2010\
 [...] This post was mentioned on Twitter by Mrinal Wadhwa, Stoyan
Stefanov, JuwalBose, Jeroen van Duffelen, Jean Ximenes and others. Jean
Ximenes said: Performance calendar day 16: PNG that works by @pornelski
[http://perfplanet.com/201016](http://perfplanet.com/201016) [...]\
 Kyle Simpson December 17th, 2010\
 Really an excellent article. I learned a ton. Thanks so much for
writing it!\
 The only thing I’d say is, on your chart, the “paletted with 8-bit
alpha” row, for IE6… I know technically IE6 doesn’t support the alpha,
but saying “No” is also misleading in that IE6 does sorta support that
format by at least gracefully dropping unrecognizable pixels. As you
point out, this is a great choice with a somewhat reasonable fallback
for IE6. I’d change the “No” to “Sorta” or something, to indicate that
the option has pretty decent support, even if diminished in IE6.\
 \
 PNG 現況整理… | Gea-Suan Lin's BLOG December 18th, 2010\
 [...] Opt-out 改成 Opt-inPNG 現況整理… Posted on December 18, 2010 by
Gea-Suan Lin「Does PNG work everywhere?」這篇文章把 PNG [...]\
 GreLI December 18th, 2010\
 Great post! But for «Image has solid gray background in IE6» another
one solution exists. You can set background property for PNG (bKGD)
using TweakPNG e.g. white. And IE6 will use this color instead of gray.
It’s handy for graceful degradation without losing beauty shadows,
anti-aliasing e.t.c. All you need is a plain one color background. I
think it’s ok for IE6 to achieve maximum quality with minimum cost (not
involving filters and so on).\
 \
 GreLI December 18th, 2010\
 Also in case of very small one or few color images such as small icons
GIF can win PNG in size (I mean already optimized). So it’s hard to
achieve PNG image less then 100 bytes, but the same GIF can have just
about 50 bytes. It’s somewhat worth and noticeable when you encode such
images as base64 data:uri (mhtml can be used in case of IE7−).\
 \
 Eric Lawrence December 18th, 2010\
 Why not mention that native CSS Opacity and PNG Transparency get along
just fine in IE9?\
 \
 porneL December 18th, 2010\
 @Kyle: I thought about that, but OTOH Photoshop has similar bug, so it
was hard to judge how many “Sortas” should be there. Hopefully detailed
explanation later makes up for it.\
 @GreLI: I haven’t expected bKGD to work. Thanks for that tip!\
 @Eric: that’s sublty implied by “IE7-8” in the tables \
 \
 Mr. Fussyfont December 19th, 2010\
 Superb article. BTW, Fireworks is an excellent tool for image
optimization and supports more versions of PNG than Photoshop.\
 \
 Meanwhile in Gotham City ← pseudopost.org December 19th, 2010\
 [...] Shared Performance Calendar » PNG that works. [...]\
 ArtedeMagia.com December 20th, 2010\
 How is the support for PNG by Gimp?\
 I’ve played with it and it looks like it can save to Palette with alpha
channel, but I didn’t found how to save more than one bit of alpha, just
transparent or opaque.\
 I would appreciate if you say explicitly that “Palette” is the same as
“256 indexed color”.\
 In the section about that, is said “Palette” and in the summary says
just “256 color”.\
 \
 Advent Explosion :: Jasongraphix December 22nd, 2010\
 [...] PNG That Works by Kornel Lesiński [...]\
 Miszka January 8th, 2011\
 What’s up with IE9? All pngs work fine here\
 \
 PNG现状整理. - CssRain-前端技术 - 读者的进步速度远大于博客的进步速度。
January 11th, 2011\
 [...]
PNG现状整理：[http://calendar.perfplanet.com/2010/png-that-works/](http://calendar.perfplanet.com/2010/png-that-works/)
[...]\
 Technikwürze 176 – HTML5, Reset, Mobil, PNG und Weballtag »
Technikwürze – Web Standards Podcast January 23rd, 2011\
 [...] Übersicht über PNG und deren Eigenschaften und Einbindungen in
[...]\
 Today, is it still necessary to refrain from using the 24-bit PNG
because of backward compatibility with older browsers? - Quora January
27th, 2011\
 [...] "Avoid 24-bit PNGs. Use pngquant if you want to have a cake and
eat it too." See
[http://calendar.perfplanet.com/2](http://calendar.perfplanet.com/2)...
. The main reason against 24-bit PNGs is mostly filesize. Many people
accept this downside to get [...]\
 Stu January 30th, 2011\
 I’m gonna have all my bitches read this article so they can call
themselves designers. Do we have a virus built yet that can erase all
instances of ie across the globe? That would take care of so many
problems.\
 \
 Μr.子灵 -很喜欢火狐，于是就有了 | 关于PNG【转】 January 31st, 2011\
 [...]
PNG现状整理：[http://calendar.perfplanet.com/2010/png-that-works/](http://calendar.perfplanet.com/2010/png-that-works/)
[...]\
 richtaur February 2nd, 2011\
 Yay, useful, thanks! Though internally I told IE to go F itself long
ago \
 \
 links for 2011-02-03 - Maven Services February 3rd, 2011\
 [...] PNG that works (tags: Image.PNG) // Uncategorized none [...]\
 Peter Dunning February 10th, 2011\
 who gives a fuck what ie6 supports? ie6 can go to hell forever.\
 \
 Alexander March 1st, 2011\
 bookmarked. thank you!\
 \
 Ivan March 17th, 2011\
 I’ve noticed problems with transparent PNGs on Windows Phone 7 (IE7
apparently). Sometimes the transparent parts display as black.\
 \
 balls March 17th, 2011\
 Outdated even at the date of publishing: no IE9 beta nor Chrome. Also,
state the versions of each browser you use!\
 \
 Kyle March 17th, 2011\
 As useful as this article is, we don’t really need to see a giant
picture of your face\
 \
 Visa to Offer Person-to-person Payments (to compete with PayPal) « V E
X E D March 17th, 2011\
 [...] approaches to mobile couponing Microsoft both embraces and shuns
Google’s open video codec Full guide to PNG compatibility Google for
Nonprofits, “You’re changing the world. We want to help.” Code Standards
[...]\
 ryan March 17th, 2011\
 Great article but you should put your nice summary at the top.\
 \
 Brajeshwar March 18th, 2011\
 This is a brilliant. Thanks a lot for such an insight.\
 However, ImageOptim have been my tool for quite sometime and its
brilliant.\
 \
 Renaud March 19th, 2011\
 Excellent write-up and resource on PNG.\
 The variations in PNG support are maddening but hopefully things are
getting better.\
 Thanks for taking the time to put this together.\
 \
 Compression de PNG « chto.fr March 22nd, 2011\
 [...] Alors que j’étais totalement coincé pour un problème de PNG qui
se dégradait avec la fonction jquery.slow(). fvsch du forum AlsaCreation
m’a orienté vers un site intéressant sur les PNG. [...]\
 Web designer May 2nd, 2011\
 Except on the 8bit png part, I agree with your tips. Quite honestly,
the bandwith gains you would expect by using 8 bit colour palletes won’t
be that great, and they come at the cost of colour fidelity.\
 Just as IE6 is dead, so should be 256 colour images. Really, the world
has been 24+8 for almost 15 years\
 \
 PNG och alfakanaler « Teknikbloggen May 3rd, 2011\
 [...] En intressant artikel om PNG-filer och alfakanaler kan ni läsa
här. [...]\
 Abraão Coelho July 1st, 2011\
 A little bit late but not too much to ask… Considering this
possibility, why use PNG24 from Photoshop or PNG32 from Fireworks?\
 I made a few tests and the exported PNG8 images are virtually the same
as the ones exported as PNG24… And I tried it with complex textures and
shadings…\
 Maybe not exactly the same but the quality loss is almost none when
showing up on a browser…\
 \
 PNG Compressor – сжимаем png-файлы парой кликов | Программы для Mac
October 10th, 2011\
 [...] и придет программа PNG Compressor использующая движок OptiPNG,
которая заменит вам консольную команду pngcrush. Зеленым [...]\
 Webguide for you November 11th, 2011\
 I like the helpful information you provide in your articles. I’ll
bookmark your blog and test again here frequently. I am moderately
certain I will be told many new stuff right right here! Best of luck for
the following!\
 \
 Leave a Reply\

You can use these tags: [****]()

> \
>  And here's a tool to convert HTML entities\
>  \
>  \
>  \
>  \
>  \
>  Pssst... you'll probably also enjoy the RSS feed, as well as Planet
> Performance blog agregator and the @perfplanet tweets.\
>  Powered by WordPress, custom theme by Stoyan loosely based on design
> by Javor
