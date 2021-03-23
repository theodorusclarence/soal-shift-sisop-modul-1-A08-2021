#!/bin/bash

# cara separate tabs
# awk -F$'\t' '{print $1}'


awk -F"\t" '
BEGIN {max=0;rid=0;}
{sales=$18;profit=$21;rid=$2;
	costprice=sales-profit;
    if (costprice != 0)
    {
        profper=(profit/costprice)*100;
    }
    if (max <= profper) {
        max=profper
        maxidx=rid
    }
}
END {
    printf("Transaksi terakhir dengan profit percentage terbesar yaitu %s dengan persentase %s.\n", maxidx,max)
}' Laporan-TokoShiSop.tsv