#!/bin/bash

cdir=$(pwd)
temp_list="temp2.list"
#pre_dir="/lfs/mtateno/hnishi/kek9/3rdMD/101_remd_try/md4_eq_128"
pre_dir="/lfs/mtateno/hnishi/kek9/3rdMD/101_remd_try/md5_mdx"
#tdir=${cdir}/md5_mdx
tdir=${cdir}/md6_mdx
fn_mdp="REMD.mdp.template"


mkdir -p $tdir

cp ${pre_dir}/prm.top ${tdir}/

i=0
for temp in $(cat $temp_list);
do
  echo no${i}, temperature: $temp K 
  mkdir -p ${tdir}/no${i}
  sed -e "s;298.00;$temp;g" $fn_mdp > ${tdir}/no${i}/MD.mdp
  grep $temp ${tdir}/no${i}/MD.mdp
  cp ${pre_dir}/no${i}/md.gro  ${tdir}/no${i}/in.gro
  #cp ${pre_dir}/no${i}/prm.top   ${tdir}/no${i}/
  cp ${pre_dir}/no${i}/md.cpt   ${tdir}/no${i}/in.cpt

  i=$(($i+1))
done


