#!/system/bin/sh
#

# Update the multisim config based on Radio version
radio=`getprop ro.boot.radio`
case $radio in
	"0x1") #xt1032
		setprop ro.product.device falcon_umts
		setprop ro.product.model "Moto G"
		setprop mot.build.customerid RTGB
		setprop telephony.default_network 0
		setprop persist.radio.multisim.config ""
	"0x3") # CDMA XT1028 / NO XT1031
		setprop ro.product.device falcon_cdma
		setprop ro.product.model "Moto G"
		setprop persist.radio.multisim.config ""
		setprop ro.mot.build.customerid verizon
		setprop ro.cdma.home.operator.alpha Verizon
		setprop ro.cdma.home.operator.numeric 310004
		setprop ro.com.google.clientidbase.ms android-verizon
		setprop ro.com.google.clientidbase.am android-verizon
		setprop ro.com.google.clientidbase.yt android-verizon
		;;
	"0x5") # Dual SIM XT1033
		setprop ro.product.device falcon_umtsds
		setprop ro.product.model "Moto G"
		setprop ro.mot.build.customerid RETBR
		setprop persist.radio.dont_use_dsd true
		setprop persist.radio.multisim.config dsds
		setprop telephony.default_network 0
		setproppersist.radio.plmn_name_cmp 1
	"0x6") # Retail US XT1034
		setprop ro.product.device falcon_umts
		setprop ro.product.model "Moto G"
		setprop mot.build.customerid retusa_aws
		setprop telephony.default_network 0
		setprop persist.radio.multisim.config ""
		setprop ro.mot.build.customerid retusa_aws
    }
		;;
	*) # All others
		setprop ro.product.device falcon
		setprop ro.product.model "Moto G"
		setprop persist.radio.multisim.config ""
		setprop ro.mot.build.customerid RTGB
		;;
esac
