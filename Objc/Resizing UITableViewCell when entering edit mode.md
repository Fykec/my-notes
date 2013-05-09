parent nodes: [ObjC](ObjC.html)\
\

Resizing UI Table View Cell when entering edit mode {.heading-level2}
---------------------------------------------------

\
 Whenever the size of a view changes, UIKit applies the autoresizing
behaviors of that view’s subviews and then calls the layoutSubviews
method of the view to let it make manual changes. You can implement the
layoutSubviews method in custom views when the autoresizing behaviors by
themselves do not yield the results you want. Your implementation of
this method can do any of the following:\
 Adjust the size and position of any immediate subviews.\
 Add or remove subviews or Core Animation layers.\
 Force a subview to be redrawn by calling its setNeedsDisplay or
setNeedsDisplayInRect: method\
 \
 1. Make a UITableViewCell subclass\
 \
 2. Add the subviews to the contentView in the init method\
 \
 3. Position them in the layoutSubviews method, based on the dimensions
of the contentView\
 ( 可以把编辑状态当做一个变量传进来，放在layoutSubViews里做判断)
