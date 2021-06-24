function y=chooseBSorGA(Seq,MatDict,MatPinv,Tag,C,h,idx)

if Tag < 4
    y=BsAlgorithm(Seq,MatDict,MatPinv,C,h,idx);
elseif Tag >= 4
    y=GaAlgorithm(C,h,idx);
end