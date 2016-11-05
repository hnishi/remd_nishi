for i in no{1..64}
do
cd $i
    g_energy -f md.edr -o pot <<< "Temperature" #<<< "Potential"
    g_analyze -f pot.xvg -dist dist_pot -bw 0.100
    cd ..
done
