%% A %%

% Tents %
tent('Dreamer', 2, 4.5, 199).
tent('Hermite', 1, 2, 159).
tent('Family', 5, 5, 349).
tent('Expedition',  8, 8.5, 699).

% Sleeping bags %
sleepingbag('Mountain', -15, 1, 1.5, 350).
sleepingbag('Cabin', 5, 2, 5, 250).
sleepingbag('Square', -3, 1, 2.5, 150).

% Sleeping pads %
sleepingpad('Rock', 2, 0.2, 100).
sleepingpad('Pfft', 3, 0.8, 10).
sleepingpad('Heaven', 10, 0.4, 80).
sleepingpad('Moon', 5, 0.4, 50).

% Backpacks %
backpack('Trapper', 20, 250).
backpack('Prospector', 25, 220).
backpack('Air', 10, 150).
backpack('Comfort', 15, 200). 

%% B %%
buyForPaul(T, S, P, B, C) :- tent(T, _, _, TentCost),
                            sleepingbag(S, Temp, _, _, SleepingbagCost),
                            Temp =< 0,
                            sleepingpad(P, Thickness, _, SleepingpadCost),
                            Thickness >= 5,
                            backpack(B, _, BackpackCost),
                            C is (TentCost + SleepingbagCost + SleepingpadCost + BackpackCost).

%% C %%

tripFor4(PersonalWeight, mary(MB, MP), sean(SB, SP), paula(PTB, PP), thomas(PTB, TP), tents(T1, T2), backpacks(B1, B2)):- tripFor4(PersonalWeight, mary(MB, MP), sean(SB, SP), paula(PTB, PP), thomas(PTB, TP), tents(T1, T2), backpacks(B1, B2), _, _).
tripFor4(PersonalWeight, mary(MB, MP), sean(SB, SP), paula(PTB, PP), thomas(PTB, TP), tents(T1, T2), backpacks(B1, B2), TotalBackpack, TotalWeight):- 
                                sleepingbag(MB, _, _, MBW, _),
                                sleepingpad(MP, _, MPW, _), 
                                sleepingbag(SB, _, _, SBW, _),
                                sleepingpad(SP, _, SPW, _),
                                sleepingbag(PTB, _, 2, PTBW, _),
                                sleepingpad(PP, _, PPW, _),
                                sleepingbag(PTB, _, 2, PTBW, _),
                                sleepingpad(TP, _, TPW, _),
                                tent(T1, T1P, T1W, _),
                                tent(T2, T2P, T2W, _),
                                backpack(B1, B1C , _),
                                backpack(B2, B2C, _),
                                TentPersons is (T1P + T2P),
                                TentPersons > 4,
                                TotalFPError is ((PersonalWeight * 4) + MBW + MPW + SBW + SPW + PTBW + PPW + TPW + T1W + T2W),
                                TotalBackpack is (B1C + B2C),
                                TotalWeight is (truncate(TotalFPError * 10) / 10), %Allow up to two decimal place to prevent floating point error
                                TotalWeight =< TotalBackpack.

%% D %%

%% The packates are not included since they don't actually benefit the users going on this specific trip.

equipment2(PersonalWeight, jill(JB,JP), kyle(KB,KP), tents(Tent), backpacks(BP), TotalSpendingCost) :- equipment2(PersonalWeight, jill(JB,JP), kyle(KB,KP), tents(Tent), backpacks(BP), TotalSpendingCost, _, _, _).
equipment2(PersonalWeight, jill(JB,JP), kyle(KB,KP), tents(Tent), backpacks(BP), TotalSpendingCost, TotalCost, BW, TotalWeight) :- 
                                tent(Tent, _, TW, TC),
                                sleepingbag(JB, _, _, JBW, JBC),
                                sleepingpad(JP, _, JPW, JPC), 
                                sleepingbag(KB, _, _, KBW, KBC),
                                sleepingpad(KP, _, KPW, KPC),
                                backpack(BP, BW, BC),
                                TotalWeightError is ((PersonalWeight * 2) + TW + JBW + JPW + KBW + KPW),
                                TotalCostError is (TC + JBC + JPC + KBC + KPC + BC),
                                TotalWeight is (truncate(TotalWeightError * 10) / 10),
                                TotalCost is (truncate(TotalCostError * 10) / 10),
                                TotalWeight =< BW,
                                TotalCost =< TotalSpendingCost.

%% E %%

comfort(GuideWeight, guide(GB,GP), backpacks(GBP), N, TotalWeight, BackpackCapacity) :- 
                                                        sleepingbag(GB, _, _, GBW, _),
                                                        sleepingpad(GP, _, GPW, _),
                                                        tent(_, _, TW, _),
                                                        sleepingpad('Heaven', _, SW, _),
                                                        backpack(GBP, BackpackCapacity, _),
                                                        TotalWeightError is ((N * (SW + TW)) + GuideWeight + GBW + GPW),
                                                        TotalWeight is (truncate(TotalWeightError * 10) / 10),
                                                        TotalWeight =< BackpackCapacity.