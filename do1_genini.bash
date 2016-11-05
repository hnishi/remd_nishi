#!/bin/bash

temp_list="temp2.list"
cdir=$(pwd)

pre_dir="/lfs/mtateno/hnishi/kek9/3rdMD/101_remd_try/md1_heat"

tdir=${cdir}/md4_eq_128
mkdir -p $tdir

#bin=300 #1000/64=15-->30ps, 300*64=19200ps
bin=140 #1000step-->1000*20ps,7.8125step,7*128=896ps
j=0

cp ${pre_dir}/prm.top   ${tdir}/

i=0
for temp in $(cat $temp_list);
do
  echo no${i}, temperature: $temp K 
  mkdir -p ${tdir}/no${i}
  sed -e "s;300.00;$temp;g" MD2_EQ.mdp.template > ${tdir}/no${i}/MD.mdp
  grep $temp ${tdir}/no${i}/MD.mdp
  trjconv -f ${pre_dir}/md1.xtc -s ${pre_dir}/md1.tpr -o ${tdir}/no${i}/in.gro -b ${j} -e ${j} <<< 0 
  #cp ${pre_dir}/md1.gro  ${tdir}/no${i}/
  #cp ${pre_dir}/9.cpt   ${tdir}/no${i}/

  j=$(($j+$bin))
  i=$(($i+1))
done


