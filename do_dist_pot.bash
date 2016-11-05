for i in no{0..127}
do
cd $i
    g_energy -f md.edr -o pot <<< "Potential"
    g_analyze -f pot.xvg -dist dist_pot -bw 100  #1000
    cd ..
done
