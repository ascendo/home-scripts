#!/bin/sh
/psc/program/install/SHOREmap_v3.0/SHOREmap convert --marker Fup_intersection.vcf  --folder MBS_up_intersection -runid 1
/psc/program/install/SHOREmap_v3.0/SHOREmap backcross --chrsizes ~/zihailing/zhaowensheng_20151204/FP2/chrsize_cucumber.txt --folder up_intersection_mapping --marker MBS_up_intersection/1_converted_variant.txt --consen MBS_up_intersection/1_converted_consen.txt -plot-bc -plot-win -plot-scale
/psc/program/install/SHOREmap_v3.0/SHOREmap convert --marker Fdown_intersection.vcf  --folder MBS_down_intersection -runid 1
/psc/program/install/SHOREmap_v3.0/SHOREmap backcross --chrsizes ~/zihailing/zhaowensheng_20151204/FP2/chrsize_cucumber.txt --folder down_intersection_mapping --marker MBS_down_intersection/1_converted_variant.txt --consen MBS_down_intersection/1_converted_consen.txt -plot-bc -plot-win -plot-scale
