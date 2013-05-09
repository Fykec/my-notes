parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Java定时器 {.heading-level2}
----------

public void startTimer() {

mTimer = new Timer(true);\
 mTimer.schedule(new TimerTask() {\

@Override\
 public void run() {

}

}, 500, 2000);


