# processor.sed
# This file is part of project known as "PhoneFormatter"
# processor.sed is a pack of sed rules to process hacky phones list
# ikenfin@gmail.com 2017

# safe remove \" from lines
s/\s{1,}[\"\']//g
s/[\"\']\s{1,}//g
s/[\"\']$//g
s/^[\"\']//g

s/;\s*$//g

s/	/ /g

h

# +7 999 999 99 99
s/^\+(7)\s([[:digit:]]{3})\s([[:digit:]]{3})\s([[:digit:]]{2})\s([[:digit:]]{2})/\1\2\3\4\5/

# normal phone format (+7 903 320 11 11)
s/^\+(7)\s{1}([[:digit:]]{3})\s{1}([[:digit:]]{3})\s{1}([[:digit:]]{2})\s{1}([[:digit:]]{2}).*/\1\2\3\4\5/

# strange format (+7 9510 99 48 88)
s/^\+(7)\s([[:digit:]]{4})\s([[:digit:]]{2})\s([[:digit:]]{2})\s([[:digit:]]{2}).*/\1\2\3\4\5/

# 6 format
s/^([[:digit:]]{2})-([[:digit:]]{2})-([[:digit:]]{2})/78422\1\2\3/

#(8422) 41-95-50
s/^\(([[:digit:]]{4})\)\s([[:digit:]]{2})\s([[:digit:]]{2})\s([[:digit:]]{2}).*/7\1\2\3\4/

#+8422 (99) 99-99
s/^\+(8422)\s\(([[:digit:]]{2})\)\s([[:digit:]]{2})-([[:digit:]]{2})/7\1\2\3\4/

#+8 (84422) 99-99-99
s/^\+8\s\(84422\)\s([[:digit:]]{2})-([[:digit:]]{2})-([[:digit:]]{2})/78422\1\2\3/

# +7|8 (999) 999-99-99
s/^\+[78]{1}\s\(([[:digit:]]{3})\)\s([[:digit:]]{3})-([[:digit:]]{2})-([[:digit:]]{2}).*/7\1\2\3\4/

# +7 (9999)99-99-99
s/^\+(7)\s\(([[:digit:]]{4})\)\s([[:digit:]]{2})-([[:digit:]]{2})-([[:digit:]]{2}).*/\1\2\3\4\5/

# +7|8 (999) 99-99-99
s/^\+[78]\s\(([[:digit:]]{3})\)\s([[:digit:]]{2})-([[:digit:]]{2})-([[:digit:]]{2})/7\1\2\3\4/

# 8-999-999-99-99 OR 8 999 999 99 99
s/^8[-\s]([[:digit:]]{3})[-\s]([[:digit:]]{3})[-\s]([[:digit:]]{2})[-\s]([[:digit:]]{2})/7\1\2\3\4/

# (9999) 99-99-99
s/^\(([[:digit:]]{4})\)\s?([[:digit:]]{2})-([[:digit:]]{2})-([[:digit:]]{2}).*/7\1\2\3\4/

# (99999) 999-99-99
s/^\(([[:digit:]]{5})\)\s([[:digit:]]{3})-([[:digit:]]{2})-([[:digit:]]{2})/\1\2\3\4/

# (9999) 999-99-99
s/^\(([[:digit:]]{4})\)\s([[:digit:]]{3})-([[:digit:]]{2})-([[:digit:]]{2})/\1\2\3\4/

# +9999 (999) 99-99
s/^\+([[:digit:]]{4})\s\(([[:digit:]])\)\s([[:digit:]]{2})-([[:digit:]])/\1\2\3\4/

# +8 (9999) 99-99-99
s/^\+8\s\(([[:digit:]]{4})\)\s([[:digit:]]{2})-([[:digit:]]{2})-([[:digit:]]{2})/7\1\2\3\4/ 

# +8 (422) 99-99-99
s/^\+8\s\(422\)\s([[:digit:]]{2})-([[:digit:]]{2})-([[:digit:]]{2})/78422\1\2\3/

# (84235) 9-99-99
s/^\+?7?\s?\(([[:digit:]]{5})\)\s([[:digit:]]{1})-([[:digit:]]{2})-([[:digit:]]{2})/7\1\2\3\4/

# 8999 999 99 99
s/^8([[:digit:]]{3})\s([[:digit:]]{3})\s([[:digit:]]{2})\s([[:digit:]]{2})/7\1\2\3\4/

# (999) 999-99-99
s/^\(([[:digit:]]{3})\)\s([[:digit:]]{3})-([[:digit:]]{2})-([[:digit:]]{2}).*/7\1\2\3\4/

# +79999999999
s/^\+(7[[:digit:]]{10})$/\1/

# +7, 9999 999999
s/^\+(7),\s([[:digit:]]{4})\s([[:digit:]]{6})/\1\2\3/

# +7, 9999999999
s/^\+(7),\s([[:digit:]]{10})/\1\2/

# (89999) 99-99-99
s/^\(8([[:digit:]]{4})\)\s([[:digit:]]{2})-([[:digit:]]{2})-([[:digit:]]{2})/7\1\2\3\4/

# +8999 (999) 99-99
s/^\+8([[:digit:]]{3})\s\(([[:digit:]]{3})\)\s([[:digit:]]{2})-([[:digit:]]{2})/7\1\2\3\4/

# 8 999 999 99 99 OR 8999 999 99 99 OR 999-999-99-99 OR 999-999-9999
s/^8[-\s]?([[:digit:]]{3})[-\s]([[:digit:]]{3})[-\s]([[:digit:]]{3})[-\s]([[:digit:]]{2})[-\s]?([[:digit:]]{2})/7\1\2\3\4/

s/8-([[:digit:]]{3})-([[:digit:]]{3})-([[:digit:]]{4})/7\1\2\3/

# 8 9999...
s/^8\s([[:digit:]]{10})/7\1/

# (495) 8 9999999
s/^\(([[:digit:]]{3})\)\s8\s([[:digit:]]{7})/7\1\2/

# +495, 999-99-99
s/^\+(495),\s([[:digit:]]{3})-([[:digit:]]{2})-([[:digit:]]{2})/7\1\2\3\4/

# 10 digits
s/^([[:digit:]]{10})$/7\1/

# 6 digits
s/^([[digit:]]{6})$/78422\1/


# 10 numbers, starting with 9 --> 7999...
s/^(9[[:digit:]]{9})/7\1/

# +999 (999) 99-99
s/^\+([[:digit:]]{3})\s\(([[:digit:]]{3})\)\s([[:digit:]]{2})-([[:digit:]]{2})/7\1\2\3\4/

# +8999, 999-99-99
s/^\+8([[:digit:]]{3}),\s([[:digit:]]{3})-([[:digit:]]{2})-([[:digit:]]{2})/7\1\2\3\4/

# +8422, 99-99-99
s/^\+(8422),\s([[:digit:]]{2})-([[:digit:]]{2})-([[:digit:]]{2})/7\1\2\3\4/

# +7, 99-99-99
s/^\+7,\s([[:digit:]]{2})-([[:digit:]]{2})-([[:digit:]]{2})/78422\1\2\3/

# +7, 999 999 99 99
s/^\+7,?[-\s]([[:digit:]]{3})[-\s]([[:digit:]]{3})[-\s]([[:digit:]]{2})[-\s]([[:digit:]]{2})/7\1\2\3\4/

# 6 digits phone lists
#s/\b(\b[[:digit:]]{6}\b)*\b/78422\1\n/g

#s/.*/[HMM: &]/
t ch

:ch
#b
#p
#g
#ts/.*/[WAS: &]/

# split 6-digit phones to multilines
/((\s[[:digit:]]{6}[,\s])\s*)/ {
    s/([[:digit:]]{6})[,\s]/\1\n/g
}

b