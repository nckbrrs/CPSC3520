Nicholas Barrs
CPSC 3520-001
March 13, 2017

###############################  SDE 2 ########################################
      Implementing an ocaml verison of a simple fuzzy system for
                         rule-based inference
###############################################################################

PLEDGE:
	On my honor I have neither given nor received aid on this exam.

CONTENTS:
  *  sde2.caml
      - This file contains the functions that:
          1) intersect membership function sets
          2) determine max membership function values across that intersection
          3) truncate intensity of original consequent by the value from step 2
          4) apply MOM defuzzification on the consequent fuzzy set from step 3

  *  sde2.log
      - a log of 2 sample uses of each required function in sde2.caml
