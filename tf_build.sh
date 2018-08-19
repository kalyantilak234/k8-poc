#!/usr/bin/env bash

echo "Started Terraform script execution"

if [ -z $3 ]; then
  echo env must be supplied as second param: \"dev\", \"qa\", \"uat\", \"stag\", \"int\", or \"prod\";
  exit -1;
fi
if [ -z $2 ]; then
  echo command must be supplied as first param: \"plan\", \"apply\", \"destroy\", \"show\";
  exit -1;
fi

if [ "$3" = "all" ]; then
  WD=$PWD

  #cd $WD/ec2-lin
  #../tf.sh $1 $2 $4 $5 $6 $7 $8

  exit 0
fi

cd $4

terraform init
#sed -i "/key/c\key = \""$3"/"$4"/terrafform-state.tf\" " remote-state.tf



if [ $2 = "destroy" ]; then
	cmd="$1 $2 -force "
else
	cmd="$1 $2 "
fi

cmd=$cmd"-var-file=../conf/vars_default.tfvars -var-file=../conf/vars_$3.tfvars -var-file=../conf/vars_$3_secret.tfvars -state=./states/state_$3.tfstate $5 $6 $7 $8"

echo $cmd
$cmd
