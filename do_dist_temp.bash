for i in no{0..127}
#for i in no{1..64}
do
cd $i
    g_energy -f md.edr -o temp <<< "Temperature" #<<< "Potential"
    g_analyze -f temp.xvg -dist dist_temp -bw 0.100
    cd ..
done
