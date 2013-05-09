parent nodes: [ObjC](ObjC.html)\
\

String Format Specifiers {.heading-level2}
------------------------

String Format Specifiers\
 \

[https://developer.apple.com/library/ios/\#documentation/Cocoa/Conceptual/Strings/Articles/formatSpecifiers.html\#//apple\_ref/doc/uid/TP40004265](https://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/Strings/Articles/formatSpecifiers.html#//apple_ref/doc/uid/TP40004265)\
 \
 This article summarizes the format specifiers supported by string
formatting methods and functions.\
 \
 Format Specifiers\
 \
 The format specifiers supported by the NSString formatting methods and
CFString formatting functions follow the IEEE printf specification; the
specifiers are summarized in Table 1. Note that you can also use the
“n\$” positional specifiers such as %1\$@ %2\$s. For more details, see
the IEEE printf specification. You can also use these format specifiers
with the NSLog function.\
 \
 Table 1 Format specifiers supported by the NSString formatting methods
and CFString formatting functions\
 Specifier\
 Description\
 %@\
 Objective-C object, printed as the string returned by
descriptionWithLocale: if available, or description otherwise. Also
works with CFTypeRef objects, returning the result of the
CFCopyDescription function.\
 %%\
 '%' character.\
 %d, %D\
 Signed 32-bit integer (int).\
 %u, %U\
 Unsigned 32-bit integer (unsigned int).\
 %x\
 Unsigned 32-bit integer (unsigned int), printed in hexadecimal using
the digits 0–9 and lowercase a–f.\
 %X\
 Unsigned 32-bit integer (unsigned int), printed in hexadecimal using
the digits 0–9 and uppercase A–F.\
 %o, %O\
 Unsigned 32-bit integer (unsigned int), printed in octal.\
 %f\
 64-bit floating-point number (double).\
 %e\
 64-bit floating-point number (double), printed in scientific notation
using a lowercase e to introduce the exponent.\
 %E\
 64-bit floating-point number (double), printed in scientific notation
using an uppercase E to introduce the exponent.\
 %g\
 64-bit floating-point number (double), printed in the style of %e if
the exponent is less than –4 or greater than or equal to the precision,
in the style of %f otherwise.\
 %G\
 64-bit floating-point number (double), printed in the style of %E if
the exponent is less than –4 or greater than or equal to the precision,
in the style of %f otherwise.\
 %c\
 8-bit unsigned character (unsigned char), printed by NSLog() as an
ASCII character, or, if not an ASCII character, in the octal format
\\ddd or the Unicode hexadecimal format \\udddd, where d is a digit.\
 %C\
 16-bit Unicode character (unichar), printed by NSLog() as an ASCII
character, or, if not an ASCII character, in the octal format \\ddd or
the Unicode hexadecimal format \\udddd, where d is a digit.\
 %s\
 Null-terminated array of 8-bit unsigned characters. Because the %s
specifier causes the characters to be interpreted in the system default
encoding, the results can be variable, especially with right-to-left
languages. For example, with RTL, %s inserts direction markers when the
characters are not strongly directional. For this reason, it’s best to
avoid %s and specify encodings explicitly.\
 %S\
 Null-terminated array of 16-bit Unicode characters.\
 %p\
 Void pointer (void \*), printed in hexadecimal with the digits 0–9 and
lowercase a–f, with a leading 0x.\
 %a\
 64-bit floating-point number (double), printed in scientific notation
with a leading 0x and one hexadecimal digit before the decimal point
using a lowercase p to introduce the exponent.\
 %A\
 64-bit floating-point number (double), printed in scientific notation
with a leading 0X and one hexadecimal digit before the decimal point
using a uppercase P to introduce the exponent.\
 %F\
 64-bit floating-point number (double), printed in decimal notation.\
 Table 2 Length modifiers supported by the NSString formatting methods
and CFString formatting functions\
 Length modifier\
 Description\
 h\
 Length modifier specifying that a following d, o, u, x, or X conversion
specifier applies to a short or unsigned short argument.\
 hh\
 Length modifier specifying that a following d, o, u, x, or X conversion
specifier applies to a signed char or unsigned char argument.\
 l\
 Length modifier specifying that a following d, o, u, x, or X conversion
specifier applies to a long or unsigned long argument.\
 ll, q\
 Length modifiers specifying that a following d, o, u, x, or X
conversion specifier applies to a long long or unsigned long long
argument.\
 L\
 Length modifier specifying that a following a, A, e, E, f, F, g, or G
conversion specifier applies to a long double argument.\
 z\
 Length modifier specifying that a following d, o, u, x, or X conversion
specifier applies to a size\_t or the corresponding signed integer type
argument.\
 t\
 Length modifier specifying that a following d, o, u, x, or X conversion
specifier applies to a ptrdiff\_t or the corresponding unsigned integer
type argument.\
 j\
 Length modifier specifying that a following d, o, u, x, or X conversion
specifier applies to a intmax\_t or uintmax\_t argument.\
 Platform Dependencies\
 \
 OS X uses several data types—NSInteger, NSUInteger,CGFloat, and
CFIndex—to provide a consistent means of representing values in 32- and
64-bit environments. In a 32-bit environment, NSInteger and NSUInteger
are defined as int and unsigned int, respectively. In 64-bit
environments, NSInteger and NSUInteger are defined as long and unsigned
long, respectively. To avoid the need to use different printf-style type
specifiers depending on the platform, you can use the specifiers shown
in Table 3. Note that in some cases you may have to cast the value.\
 \
 Table 3 Format specifiers for data types\
 Type\
 Format specifier\
 Considerations\
 NSInteger\
 %ld or %lx\
 Cast the value to long.\
 NSUInteger\
 %lu or %lx\
 Cast the value to unsigned long.\
 CGFloat\
 %f or %g\
 %f works for floats and doubles when formatting; but note the technique
described below for scanning.\
 CFIndex\
 %ld or %lx\
 The same as NSInteger.\
 pointer\
 %p or %zx\
 %p adds 0x to the beginning of the output. If you don't want that, use
%zx and no typecast.\
 The following example illustrates the use of %ld to format an NSInteger
and the use of a cast.\
 \
 NSInteger i = 42;\
 printf("%ldn", (long)i);\
 In addition to the considerations mentioned in Table 3, there is one
extra case with scanning: you must distinguish the types for float and
double. You should use %f for float, %lf for double. If you need to use
scanf (or a variant thereof) with CGFloat, switch to double instead, and
copy the double to CGFloat.\
 \
 CGFloat imageWidth;\
 double tmp;\
 sscanf (str, "%lf", &tmp);\
 imageWidth = tmp;\
 It is important to remember that %lf does not represent CGFloat
correctly on either 32- or 64-bit platforms. This is unlike %ld, which
works for long in all cases.\
 \
 NextPrevious
