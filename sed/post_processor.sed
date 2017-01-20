# post_processor.sed
# This file is part of project known as "PhoneFormatter"
# post_processor.sed is a pack of some sed rules for postprocessing
# ikenfin@gmail.com 2017

s/^\s*([[:digit:]]{6})\s*$/8422\1/

s/^[^7]([[:digit:]]{10})$/7\1/

# split 6-digit phones to multilines
#/((\s[[:digit:]]{6}[,\s])\s*)/ {
#    s/[,\s]/\n/g
#}

