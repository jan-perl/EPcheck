# EPcheck


Een open-source / open-data berekening van de label-C plicht bedrijven
<https://www.nrc.nl/nieuws/2022/12/29/ruim-een-derde-kantoorpanden-riskeert-sluiting-om-energielabelplicht-a4152892#/krant/2022/12/30/>

Dit tool kan gemeenten helpen in hun voorbereiding
https://iplo.nl/thema/energiebesparing/energielabel-verplichting-kantoren/informatieblad-toezicht-handhaving-energielabel/voorbereiden-toezicht/

Werkt door EPonline met BAG te combineren

Installatie:
maak folder data, op zelfde niveau als cfg, ernaast
maak folder output, op zelfde niveau als cfg, ernaast

in folder data, installeer:
- BAG download (link https://www.geoparaat.nl/bag/  , eerst registrereren)
zip uitpakken naar data/bag_snapshot_20221001/snapshot_20221001.gpkg 
- EP download (link https://www.rvo.nl/onderwerpen/wetten-en-regels-gebouwen/ep-online , eerst registrereren)
zip uitpakken naar data/v20230101_v2_csv.csv
- gemfrompc4.csv (uit intern tool, staat al in git )

eenmalig: converteer csv data naar dbf fss formaat
wis eerst (als die al bestaan) de .fss folders in de data folder
klik binnen ToDbf op:
i_epdat_fss
i_gemfrompc4_fss

om te runnen:
klik op Results/koppel1
op epnoaddr -> check of er struktuur zit in uitval op ep versus adressen
nieuwe adresssen mogen hier

op epnovbosel  -> check
'geenNietWoon', -> adresssen met nieuwe functies
'Industrie', (OK, geen plicht)
'Klein', (OK, geen plicht)
'Uitzoeken' -> nagaan of hier struktuur in zit

wis output/outp2land.dbf als deze bestaat
klik op i_land_dbf -> om dbf bij te7 werken


