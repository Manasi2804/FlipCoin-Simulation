#!/bin/bash -x

function singlet(){
H=0
T=0

declare -A singletCombinationDictionary
singletCombinationDictionary=([H]=$H [T]=$T)

read -p"Enter the number of flips:" numberOfFlips
for((flipCount=1;flipCount<=$numberOfFlips;flipCount++))
do
   case $((RANDOM%2+1)) in
      1)
         singletCombinationDictionary[H]=$((${singletCombinationDictionary[H]}+1))
         echo -ne "H"
			;;
      2)
         singletCombinationDictionary[T]=$((${singletCombinationDictionary[T]}+1))
         echo -ne "T"
      	;;
      3)
         echo "Invalid choice"
      	;;
   esac
done
echo ""
for key in "${!singletCombinationDictionary[@]}"
do
   echo "${key}:${singletCombinationDictionary[$key]}"
done

percentageHead=`echo " scale=2 ; ${singletCombinationDictionary[H]}*100/$numberOfFlips" | bc`
echo "Head Percentage:" $percentageHead
echo "Tail percentage: `echo " scale=2; 100-$percentageHead"  | bc `"
}
Singlet

function Doublet() {
HH=0
TT=0
HT=0
TH=0

declare -A flipCoinDictionary
flipCoinDictionary=([HH]=$HH [TT]=$TT [HT]=$HT [TH]=$TH)

read -p "Enter the number of flips:" numberOfFlipsDoublet
for((flipCount=1;flipCount<=$numberOfFlipsDoublet;flipCount++))
do
	case $((RANDOM%4+1)) in
	1)
		flipCoinDictionary[HH]=$((${flipCoinDictionary[HH]}+1))
		echo -ne "HH"
		;;
	2)
		flipCoinDictionary[TT]=$((${flipCoinDictionary[TT]}+1))
		echo -ne "TT"
		;;
	3)
		flipCoinDictionary[HT]=$((${flipCoinDictionary[HT]}+1))
		echo -ne "HT"
		;;
	4)
		flipCoinDictionary[TH]=$((${flipCoinDictionary[TH]}+1))
		echo -ne "TH"
		;;
	*)
		echo "Invalid Choice"
		;;
	esac
done

echo ""
for key in "${!flipCoinDictionary[@]}"
do
	echo "${key}:${flipCoinDictionary[$key]}"
done

echo "HH percentage: `echo " scale=2 ; ${flipCoinDictionary[HH]}*100/$numberOfFlipsDoublet" | bc ` "
echo "TT percentage: `echo " scale=2 ; ${flipCoinDictionary[TT]}*100/$numberOfFlipsDoublet" | bc ` "
echo "HT percentage: `echo " scale=2 ; ${flipCoinDictionary[HT]}*100/$numberOfFlipsDoublet" | bc ` "
echo "TH percentage: `echo " scale=2 ; ${flipCoinDictionary[TH]}*100/$numberOfFlipsDoublet" | bc ` "
}
Doublet

function Triplet(){
HHH=0
TTT=0
HHT=0
TTH=0
THT=0
HTH=0
HTT=0
THH=0

declare -A flipCoinDictionary
flipCoinDictionary=([HHH=$HHH [TTT]=$TTT [HHT]=$HHT [TTH]=$TTH [HTH]=$HTH [THT]=$THT [THH]=$THH [HTT]=$HTT)

read -p "Enter the number of flips you want to perform for triplet:" numberOfFlipsTriplet
for((flipCount=1;flipCount<=$numberOfFlipsTriplet;flipCount++))
do
	case $((RANDOM%8+1)) in
	1)
		flipCoinDictionary[HHH]=$((${flipCoinDictionary[HHH]}+1))
		echo -ne "HHH"
		;;
	2)
   	flipCoinDictionary[TTT]=$((${flipCoinDictionary[TTT]}+1))
   	echo -ne "TTT"
   	;;
	3)
   	flipCoinDictionary[HHT]=$((${flipCoinDictionary[HHT]}+1))
   	echo -ne "HHT"
   	;;
	4)
   	flipCoinDictionary[TTH]=$((${flipCoinDictionary[TTH]}+1))
   	echo -ne "TTH"
   	;;
	5)
   	flipCoinDictionary[THT]=$((${flipCoinDictionary[THT]}+1))
   	echo -ne "THT"
		;;
	6)
   	flipCoinDictionary[HTH]=$((${flipCoinDictionary[HTH]}+1))
   	echo -ne "HTH"
		;;
	7)
   	flipCoinDictionary[THH]=$((${flipCoinDictionary[THH]}+1))
   	echo -ne "THH"
		;;
	8)
   	flipCoinDictionary[HTT]=$((${flipCoinDictionary[HTT]}+1))
   	echo -ne "HTT"
		;;
	*)
		echo "Invalid Choice"
		;;
	esac
done

echo ""
for key in "$(!flipCoinDictionary[@]}"
do
	echo "${key}:${flipCoinDictionary[$key]}"
done

echo "HHH percentage: `echo " scale=2 ; ${flipCoinDictionary[HHH]}*100/$numberOfFlipsTriplet" | bc ` "
echo "TTT percentage: `echo " scale=2 ; ${flipCoinDictionary[TTT]}*100/$numberOfFlipsTriplet" | bc ` "
echo "HTH percentage: `echo " scale=2 ; ${flipCoinDictionary[HTH]}*100/$numberOfFlipsTriplet" | bc ` "
echo "THT percentage: `echo " scale=2 ; ${flipCoinDictionary[THT]}*100/$numberOfFlipsTriplet" | bc ` "
echo "HHT percentage: `echo " scale=2 ; ${flipCoinDictionary[HHT]}*100/$numberOfFlipsTriplet" | bc ` "
echo "TTH percentage: `echo " scale=2 ; ${flipCoinDictionary[TTH]}*100/$numberOfFlipsTriplet" | bc ` "
echo "THH percentage: `echo " scale=2 ; ${flipCoinDictionary[THH]}*100/$numberOfFlipsTriplet" | bc ` "
echo "HTT percentage: `echo " scale=2 ; ${flipCoinDictionary[HTT]}*100/$numberOfFlipsTriplet" | bc ` "
}
Triplet
