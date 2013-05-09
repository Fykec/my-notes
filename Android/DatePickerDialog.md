parent nodes: [Android\_Wiki](Android_Wiki.html) |
[DatePickerDialog](DatePickerDialog.html)\
\

Date Picker Dialog {.heading-level2}
------------------

调用\
 1.\
 Date date = new Date(System.currentTimeMillis());

​2. 处理listener\
 [DatePickerDialog](DatePickerDialog.html).OnDateSetListener
mDateSetListener = new
[DatePickerDialog](DatePickerDialog.html).OnDateSetListener() {\

@Override\
 public void onDateSet(DatePicker view, int year, int monthOfYear,

}

注意的地方是DatePickerDialog，参数month是0\~11，所以传入时要减一，从listener中拿到时加一\
 还有Date对象的年是从1900算起的，比如2011年就返回111，所以年要加1900
