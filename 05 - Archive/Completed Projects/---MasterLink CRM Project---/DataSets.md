
**Names of Lists:**

FROM **Dropdown** Tab:
AcctManagerList
DistributorList
InteractionList
LossList
PositionList
PrincipalList
PriorityList
ProductList
SegmentList
SourceList
StageList
StatusList

FROM **Operators** Tab:
OperatorList

Created Lists:

**US State List**
AL,AK,AZ,AR,CA,CO,CT,DE,FL,GA,HI,ID,IL,IN,IA,KS,KY,LA,ME,MD,MA,MI,MN,MS,MO,MT,NE,NV,NH,NJ,NM,NY,NC,ND,OH,OK,OR,PA,RI,SC,SD,TN,TX,UT,VT,VA,WA,WV,WI,WY

**Zip Code**
=OR(
    AND(LEN(M5)=5,ISNUMBER(--M5)),
    AND(LEN(M5)=10,ISNUMBER(--LEFT(M5,5)),ISNUMBER(--RIGHT(M5,4)),MID(M5,6,1)="-")
)

```
=Dropdowns!$R$6:INDEX(Dropdowns!$R$6:$R$1000, COUNTA(Dropdowns!$R$6:$R$1000))


=FILTER(Dropdowns!$M$5:$M$1000, Dropdowns!$L$5:$L$1000=Opportunities!$K5)

=OFFSET(Dropdowns!$Q$5, 0, 0, COUNTA(Dropdowns!$Q$5:$Q$100), 1)



```


I want the product dropdown of the Opportunities sheet to be determine by the principal name of the opportunities sheet. To find the product list use the principal name and the product names of the Dropdown Sheet

Opportunities Sheet:
Principal is starting at J5
Product is starting at K5

Dropdown sheet:
Principal starting at L5
Product starting at M5



![[EXCEL_pTn72Tcmf5.png]]


Stages: 


What are the principals asking? 
	-Meet and Greet
	-Tasting
	-Quote 
	-Trial Run
	-1st Purchase



Why isnt there any progress? 
Show account manager activity
What we as principals  can help? 