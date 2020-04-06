#!/bin/bash -x
H=0
T=0
HH=0
TT=0
HT=0
TH=0
HHH=0
TTT=0
HHT=0
TTH=0
THT=0
HTH=0
HTT=0
THH=0
choice=0

declare -A flipCoinDictionary
flipCoinDictionary=([H]=$H [T]=$T [HH]=$HH [TT]=$TT [HT]=$HT [TH]=$TH [HHH]=$HHH [TTT]=$TTT
							[HHT]=$HHT [TTH]=$TTH [THT]=$THT [HTH]=$HTH [HTT]=$HTT [THH]=$THH)
# Function for singlet combination
function getSingletCombination(){

read -p "Enter the number of flips you want to perform for singlet:" numberOfFlipSinglet
for((flipCount=1;flipCount<=$numberOfFlipSinglet;flipCount++))
do
   case $((RANDOM%2)) in
   1)
      flipCoinDictionary[H]=$((${flipCountDictionary[H]}+1))
      ;;
   2)
      flipCoinDictionary[T]=$((${flipCountDictionary[T]}+1))
      ;;
   esac
done
	#Print dictionary of singlet combination
	for key in "${!flipCoinDictionary[@]}"
	do
		echo "${key} : ${flipCoinDictionary[$key]}"
	done

echo ""
percentageHead=`echo "scale=4; (${flipCoinDictionary[H]}*100/$numberOfFlipSinglet") | bc -1 `
percentageTail=`echo "scale=4; 100-$percentageHead" | bc -1 `
echo "Head Percentage: " $percentageHead
echo "Tail Percentage: " $percentageTail
}

function getDoubletCombination(){

read -p "Enter the number of flips you want to perform for doublet:"numberOfFlipsDoublet
for((flipCount=1;flipCount<=$numberOfFlipsDoublet;flipCount++))
do
   case $((RANDOM%4)) in
	1)
		flipCoinDictionary[HH]=$((${flipCoinDictionary[HH]}+1))
      		;;
   	2)	
      		flipCoinDictionary[TT]=$((${flipCoinDictionary[TT]}+1))
       		;;
   	3)	
      		flipCoinDictionary[HT]=$((${flipCoinDictionary[HT]}+1))
		;;
   	4)
      		flipCoinDictionary[TH]=$((${flipCoinDictionary[TH]}+1))
      		;;
   esac
done
	#Print the dictionary for doublet combination
	
	for key in "${!flipCoinDictionary[@]}"
	do
		echo "${key} : ${flipCoinDictionary[$key]}"
	done
echo ""
echo "HH percentage:`echo "scale=4; ${flipCoinDictionary[HH]}*100/$numberOfFlipsDoublet" | bc -1` "
echo "TT percentage:`echo "scale=4; ${flipCoinDictionary[TT]}*100/$numberOfFlipsDoublet" | bc -1` "
echo "HT percentage:`echo "scale=4; ${flipCoinDictionary[HT]}*100/$numberOfFlipsDoublet" | bc -1` "
echo "TH percentage:`echo "scale=4; ${flipCoinDictionary[TH]}*100/$numberOfFlipsDoublet" | bc -1` "
}

function getTripletCombination(){

read -p "Enter the number of flips you want to perform for triplet:"numberOfFlipsTriplet
for((flipCount=1;flipCount<=$numberOfFlipsTriplet;flipCount++))
do
	case $((RANDOM%8)) in
	1)
		flipCoinDictionary[HHH]=$((${flipCoinDictionary[HHH]}+1))
		;;
	2)
   		flipCoinDictionary[TTT]=$((${flipCoinDictionary[TTT]}+1))
   		;;
	3)
   		flipCoinDictionary[HHT]=$((${flipCoinDictionary[HHT]}+1))
   		;;
	4)
   		flipCoinDictionary[TTH]=$((${flipCoinDictionary[TTH]}+1))
   		;;
	5)
   		flipCoinDictionary[THT]=$((${flipCoinDictionary[THT]}+1))
		;;
	6)
   		flipCoinDictionary[HTH]=$((${flipCoinDictionary[HTH]}+1))  
		;;
	7)
   		flipCoinDictionary[THH]=$((${flipCoinDictionary[THH]}+1))
		;;
	8)
   		flipCoinDictionary[HTT]=$((${flipCoinDictionary[HTT]}+1))
		;;
	esac
done
	#Print the dictionary for triplet combination
	
	for key in "${!flipCoinDictionary[@]}"
	do
		echo "${key} : ${flipCoinDictionary[$key]}"
	done
	

echo ""
echo "HHH percentage: `echo "scale=4; ${flipCoinDictionary[HHH]}*100/$numberOfFlipsTriplet" | bc -1` "
echo "TTT percentage: `echo "scale=4; ${flipCoinDictionary[TTT]}*100/$numberOfFlipsTriplet" | bc -1` "
echo "HTH percentage: `echo "scale=4; ${flipCoinDictionary[HTH]}*100/$numberOfFlipsTriplet" | bc -1` "
echo "THT percentage: `echo "scale=4; ${flipCoinDictionary[THT]}*100/$numberOfFlipsTriplet" | bc -1` "
echo "HHT percentage: `echo "scale=4; ${flipCoinDictionary[HHT]}*100/$numberOfFlipsTriplet" | bc -1` "
echo "TTH percentage: `echo "scale=4; ${flipCoinDictionary[TTH]}*100/$numberOfFlipsTriplet" | bc -1` "
echo "THH percentage: `echo "scale=4; ${flipCoinDictionary[THH]}*100/$numberOfFlipsTriplet" | bc -1` "
echo "HTT percentage: `echo "scale=4; ${flipCoinDictionary[HTT]}*100/$numberOfFlipsTriplet" | bc -1` "
}
function sortingTheValues() {

echo "Count of each combination is: "
for value in "${!flipCoinDictionary[@]}"
do
	echo "$value:${flipCoinDictionary["$value"]}"
done | sort -rn -k3
echo""
echo "Winning combination is:"
for value in "${!flipCoinDictionary[@]}"
do
	echo "$value: ${flipCoinDictionary["$value"]}"
done | sort -rn -k3 | head -1
}
while(($choice<4))
do
	echo "Welcome to flip coin simulation"
	echo "1.Flip coin for singlet combination"
	echo "2.Flip coin for doublet combination"
	echo "3.Flip coin for triplet combination"
	read -p "Enter your choice:" choice
	case $choice in
		1)
			getSingletCombination ;;
		2)
			getDoubletCombination ;;
		3)
			getTripletCombination ;;
		*)
			echo "Exit" ;;
	esac
done
sortingTheValues
