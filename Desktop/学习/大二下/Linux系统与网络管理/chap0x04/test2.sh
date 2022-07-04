#!/bin/env bash

function player_Age {
      awk -F "\t" 
        BEGIN {a=0; b=0; c=0;}
        $6!="Age" {
            if($6>=0&&$6<20) {a++;}
            else if($6<=30) {b++;}
            else {c++;}
        }
        END {
            sum=a+b+c;
            printf("Age\tCount\tPercentage\n");
            printf("<20\t%d\t%f%%\n",a,a*100.0/sum);
            printf("[20,30]\t%d\t%f%%\n",b,b*100.0/sum);
            printf(">30\t%d\t%f%%\n",c,c*100.0/sum);
        }worldcupplayerinfo.tsv
    }

function player_position {
      awk -F "\t" 
        BEGIN {sum=0}
        $5!="Position" {
            pos[$5]++;
            sum++;
        }
        END {
            printf("    Position\tCount\tPercentage\n");
            for(i in pos) {
                printf("%13s\t%d\t%f%%\n",i,pos[i],pos[i]*100.0/sum);
            }
        }worldcupplayerinfo.tsv
    }

function max_min_Name {
      awk -F "\t" 
        BEGIN {max=-1; min=1000;}
        $9!="Player" {
            len=length($9);
            names[$9]=len;
            max=len>max?len:max;
            min=len<min?len:min;
        }
        END {
            for(i in names) {
                if(names[i]==max) {
                    printf("The longest : %s\n", i);
                } else  if(names[i]==min) {
                    printf("The shortest : s\n", i);
                }
            }
        }worldcupplayerinfo.tsv
    }

function max_min_Age {
      awk -F "\t" 
        BEGIN {max=-1; min=1000;}
        NR>1 {
            age=$6;
            names[$9]=age;
            max=age>max?age:max;
            min=age<min?age:min;
        }
        END {
            printf("The oldest age is %d, who is\n", max);
            for(i in names) {
                if(names[i]==max) { printf("%s\n", i); }
            }
            printf("The youngest age is %d, who is\n", min);
            for(i in names) {
                if(names[i]==min) { printf("%s\n", i); }
            }
        } worldcupplayerinfo.tsv
    }


