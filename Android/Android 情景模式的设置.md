parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Android 情景模式的设置 {.heading-level2}
----------------------

情景模式的设置大家应当相当熟悉了，但是在Android中如何通过自己的程序进行情景模式的设置呢，情景模式分为多种多种，即可以使用系统自带的，也可以使用自定义的，但是在开发某些程序时，可能需要在程序中更改情景模式，那么此就需要进行情景模式的设置。下面简单介绍一下情况模式的设置方式：\
 　　首先获取当前的情景模式：\
 代码\
 void getInitring(AudioManager audio)

{

}

　　通过此代码，当然需要再加工一下，那么就可以得到当前的情景模式，为以后的设置做一下准备，然后也可能知道要不要再次设置。设置情景模式一：只声音，无振动：\
 代码

void ring(AudioManager audio) {

audio.setRingerMode(AudioManager.RINGER\_MODE\_NORMAL);\
 audio.setVibrateSetting(AudioManager.VIBRATE\_TYPE\_RINGER,

audio.setVibrateSetting(AudioManager.VIBRATE\_TYPE\_NOTIFICATION,

Toast.makeText(this, "设置成功！当前为铃声", Toast.LENGTH\_LONG).show();

}

　　设置后系统只有声音，没有振动。\
 　　设置情景模式二：即有声音也有振动：\
 代码

void ringAndVibrate(AudioManager audio) {

audio.setRingerMode(AudioManager.RINGER\_MODE\_NORMAL);\
 audio.setVibrateSetting(AudioManager.VIBRATE\_TYPE\_RINGER,

audio.setVibrateSetting(AudioManager.VIBRATE\_TYPE\_NOTIFICATION,

Toast.makeText(this, "设置成功！当前为铃声加振动",
Toast.LENGTH\_LONG).show();

}

　　这样设置后，在发声的时候同时也会有振动提醒。\
 　　设置情景模式三：只能振动：\
 代码

void vibrate(AudioManager audio) {

audio.setRingerMode(AudioManager.RINGER\_MODE\_VIBRATE);\
 audio.setVibrateSetting(AudioManager.VIBRATE\_TYPE\_RINGER,

audio.setVibrateSetting(AudioManager.VIBRATE\_TYPE\_NOTIFICATION,

Toast.makeText(this, "设置成功！当前为振动", Toast.LENGTH\_LONG).show();

}\

　　此设置后只有振动，没有声音：\
 　　设置情景模式四：无声无振动：\
 代码

void noRingAndVibrate(AudioManager audio) {

audio.setRingerMode(AudioManager.RINGER\_MODE\_SILENT);\
 audio.setVibrateSetting(AudioManager.VIBRATE\_TYPE\_RINGER,

audio.setVibrateSetting(AudioManager.VIBRATE\_TYPE\_NOTIFICATION,

Toast.makeText(this, "设置成功！当前为无声无振动",
Toast.LENGTH\_LONG).show();

}

　　设置后系统没有声音和振动。无法进行相应的提示。\

　　以上所有设置的声音均为系统默认的声音大小，那么我们是否可以自定义声音的大小呢，答案是当然可以。要设置声音的大小
，需要设置以下函数：提高音量：

　　减小音量：

　　以上为最基本的设置方法，在使用中有许多更复杂的组合都是由此基本的方法组合而成的。
