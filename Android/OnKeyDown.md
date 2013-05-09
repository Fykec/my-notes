parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

On Key Down {.heading-level2}
-----------

@Override

public boolean onKeyDown(int keyCode, KeyEvent event) {

if (keyCode == KeyEvent.KEYCODE\_BACK) {

if(HomeActivity.sInstance.isPanelOpen()){

}\
 if (mMode == DEFUALT\_MODE) {

} else if (isChartExpand || isGenresExpand) {

} else if (isTopYearExpand) {

} else if (isSingerExpand && (!isFromGallery)) {

} else {

} \
 setMode(mMode);

}\
 if (keyCode == KeyEvent.KEYCODE\_MENU) {

}\
 return super.onKeyDown(keyCode, event);
//如果想调用底层的响应事件，一定要super而不是return true

}
