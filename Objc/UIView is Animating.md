parent nodes: [ObjC](ObjC.html)\
\

UI View is Animating {.heading-level2}
--------------------

1 down vote accepted\
 \
 \
 A UIView has a layer (CALayer). You can send animationKeys to it which
will give you an array of keys which identify the animations attached to
the layer. I suppose that if there are any entries, the animation(s) are
running. If you want to dig even deeper have a look at the CAMediaTiming
protocol which CALayer adopts. It does some more information on the
current animation.\
 \
 myView.layer.animationKeys
