function Tabduration=stateduration(tWind,state)
statecount=tabulate(state);
duration=cellfun(@(x)x*tWind/60,statecount(:,2));%unit min
pecentage=cellfun(@(x)x*0.01,statecount(:,3));
Tabduration=[statecount(:,1),num2cell(duration),num2cell(pecentage)];