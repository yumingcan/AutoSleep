function Tabtransiton=statetrainsition(state)
State=char(state);
NumWSTransit=1;
NumWPTransit=1;
NumSWTransit=1;
NumSPTransit=1;
NumPSTransit=1;
NumPWTransit=1;
LocWS={0};
LocWP={0};
LocSW={0};
LocSP={0};
LocPS={0};
LocPW={0};
for iUnit=1:1:(length(State)-1)
    if ~isequal(State(iUnit+1),State(iUnit))
       if isequal({State(iUnit),State(iUnit+1)},{'W','S'})
                LocWS{NumWSTransit,:}=iUnit;
                NumWSTransit=NumWSTransit+1;
       elseif isequal({State(iUnit),State(iUnit+1)},{'W','P'})
                LocWP{NumWPTransit,:}=iUnit;
                NumWPTransit=NumWPTransit+1;
       elseif isequal({State(iUnit),State(iUnit+1)}, {'S','W'})
                LocSW{NumSWTransit,:}=iUnit;
                NumSWTransit= NumSWTransit+1;         
       elseif isequal({State(iUnit),State(iUnit+1)},{'S','P'})
                LocSP{NumSPTransit,:}=iUnit;
                NumSPTransit=NumSPTransit+1;
       elseif isequal({State(iUnit),State(iUnit+1)},{'P','S'})
                LocPS{NumPSTransit,:}=iUnit;
                NumPSTransit=NumPSTransit+1;
       elseif isequal({State(iUnit),State(iUnit+1)},{'P','W'})
                LocPW{NumPWTransit,:}=iUnit;
                NumPWTransit=NumPWTransit+1;
       end
    else continue;
    end
end
type={'W-S' 'W-P' 'S-W' 'S-P' 'P-S' 'P-W'};
transition=num2cell([NumWSTransit,NumWPTransit,NumSWTransit,NumSPTransit,NumPSTransit,NumPWTransit]);
Tabtransiton=[type;transition];