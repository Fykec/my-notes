parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Android set On Item Long Click Listener {.heading-level2}
---------------------------------------

ava代码 \
 private ListView fileList; \
 \
 \
 Java代码 \
 fileList

.setOnCreateContextMenuListener(new OnCreateContextMenuListener() { \

@Override \
 public void onCreateContextMenu(ContextMenu menu, View v,

// TODO Auto-generated method stub \
 menu.setHeaderTitle(R.string.contentMenu); \
 menu.add(0, AndBoxConstant.OPEN, 0, R.string.open); \
 menu.add(0, AndBoxConstant.PROPERTIY, 6,

} \

}); \
 \

Java代码 \
 fileList.setOnItemLongClickListener(new OnItemLongClickListener() { \

@Override \
 public boolean onItemLongClick(AdapterView\<?\> ada, View view,

} \

});
