#!/bin/bash

# cara separate tabs
# awk -F$'\t' '{print $1}'

# Row ID dan profit percentage terbesar (jika hasil profit percentage terbesar lebih dari 1, maka ambil Row ID yang paling besar)
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

echo

# nama customer pada transaksi tahun 2017 di Albuquerque.
awk -F"\t" '
BEGIN {print "Daftar nama customer di Albuquerque pada tahun 2017 antara lain:"}
{city=$10;trx=$3;name=$7
    last2trxdate=substr(trx,length(trx)-1,2)
    if (city == "Albuquerque" && last2trxdate == "17")
        print name
}
END {}' Laporan-TokoShiSop.tsv

echo

awk -F"\t"  '
BEGIN {}
{segment=$8
    if (NR == 1) next 

    count[segment]++
} 
END {min=99999;tipe=0;
for (segment in count) {
    if (min > count[segment]) {
        min=count[segment]
        tipe=segment
    }
}

    printf("Tipe segmen customer yang penjualannya paling sedikit adalah %s dengan %s transaksi.", tipe, min)
}' Laporan-TokoShiSop.tsv