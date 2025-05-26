#const find_first=o_0.   % the cookbook is always o_0

% ======= Types ======
% ------- IS_A -------
instance_of(X,inventory) :- inventory(X).
instance_of(X,player) :- player(X).
instance_of(X,recipe) :- recipe(X).
instance_of(X,c) :- c(X).
instance_of(X,d) :- d(X).
instance_of(X,f) :- f(X).
instance_of(X,ingredient) :- ingredient(X).
instance_of(X,k) :- k(X).
instance_of(X,meal) :- meal(X).
instance_of(X,o) :- o(X).
instance_of(X,object) :- object(X).
instance_of(X,oven) :- oven(X).
instance_of(X,r) :- r(X).
instance_of(X,s) :- s(X).
instance_of(X,slot) :- slot(X).
instance_of(X,stove) :- stove(X).
instance_of(X,thing) :- thing(X).
instance_of(X,toaster) :- toaster(X).
subclass_of(c,thing).
subclass_of(d,thing).
subclass_of(f,o).
subclass_of(ingredient,thing).
subclass_of(k,o).
subclass_of(meal,f).
subclass_of(o,thing).
subclass_of(oven,c).
subclass_of(s,thing).
subclass_of(stove,s).
subclass_of(toaster,c).

% ------- Things -------
player(player).
inventory(inventory).
r(r_0). %  kitchen
c(c_0). % conventional fridge
oven(oven_0). % conventional oven
s(s_0). % massive table
s(s_1). % vast counter
stove(stove_0). % conventional stove
f(f_0). %  pork chop
f(f_1). %  chicken leg
f(f_2). %  chicken wing
meal(meal_0). %  meal
slot(slot_0).
slot(slot_1).
slot(slot_2).
slot(slot_3).
slot(slot_4).
slot(slot_5).
slot(slot_6).
slot(slot_7).
slot(slot_8).
slot(slot_9).
ingredient(ingredient_0).
recipe(recipe).
ingredient(ingredient_1).
o(o_0). % interesting cookbook
o(o_1). % sharp knife

% ======= Facts =======
cookable(f_0). % cookable(pork chop: f)
cookable(f_1). % cookable(chicken leg: f)
cookable(f_2). % cookable(chicken wing: f)
cuttable(f_0). % cuttable(pork chop: f)
sharp(o_1). % sharp(knife: o)


% ------- initial fluents (initialized with t=0) -------
#program initial_state(t).

cooked(f_0, t). % cooked(pork chop: f)
cooked(f_1, t). % cooked(chicken leg: f)
edible(f_0, t). % edible(pork chop: f)
edible(f_1, t). % edible(chicken leg: f)
edible(meal_0, t). % edible(meal)
%free(slot_0, t). % free(slot_0: slot)
%free(slot_1, t). % free(slot_1: slot)
%free(slot_2, t). % free(slot_2: slot)
%free(slot_3, t). % free(slot_3: slot)
%free(slot_4, t). % free(slot_4: slot)
%free(slot_5, t). % free(slot_5: slot)
%free(slot_6, t). % free(slot_6: slot)
%free(slot_7, t). % free(slot_7: slot)
%free(slot_8, t). % free(slot_8: slot)
%free(slot_9, t). % free(slot_9: slot)
cooked_state(f_1, fried, t). % fried(chicken leg: f)
inedible(f_2, t). % inedible(chicken wing: f)
cooked_state(f_2, needs_cooking, t). % needs_cooking(chicken wing: f)
open(c_0, t). % open(fridge: c)
cooked_state(f_0, roasted, t). % roasted(pork chop: f)
cut_state(f_0, uncut, t). % uncut(pork chop: f)


% ------- Recipe -------
#program recipe(t).

base(f_0, ingredient_1). % base(pork chop: f, ingredient_1: ingredient)
base(f_1, ingredient_0). % base(chicken leg: f, ingredient_0: ingredient)
cooking_location(r_0, recipe). % cooking_location(kitchen: r, RECIPE)
should_cook(ingredient_0, fried). % fried(ingredient_0: ingredient)
in(ingredient_0, recipe). % in(ingredient_0: ingredient, RECIPE)
in(ingredient_1, recipe). % in(ingredient_1: ingredient, RECIPE)
ingredient_1(f_1). % ingredient_1(chicken leg: f)
ingredient_2(f_0). % ingredient_2(pork chop: f)
out(meal_0, recipe). % out(meal, RECIPE)
should_cook(ingredient_1, roasted). % roasted(ingredient_1: ingredient)
should_cut(ingredient_0, uncut). % uncut(ingredient_0: ingredient)
should_cut(ingredient_1, uncut). % uncut(ingredient_1: ingredient)

in_recipe(I,F) :- ingredient(I), in(I,recipe), base(F,I), instance_of(F,f).
in_recipe(F) :- in_recipe(I,F).


% ------- ROOM fluents -------

#program initial_room(t).
at(player, r_0, t). % at(P, kitchen: r)
room_changed(nowhere,r_0,t).

#program room_r_0(t).
at(c_0, r_0, t). % at(fridge: c, kitchen: r)
at(oven_0, r_0, t). % at(oven, kitchen: r)
at(s_0, r_0, t). % at(table: s, kitchen: r)
at(s_1, r_0, t). % at(counter: s, kitchen: r)
at(stove_0, r_0, t). % at(stove, kitchen: r)
in(f_0, c_0, t). % in(pork chop: f, fridge: c)
in(f_1, c_0, t). % in(chicken leg: f, fridge: c)
in(f_2, c_0, t). % in(chicken wing: f, fridge: c)
on(o_0, s_1, t). % on(cookbook: o, counter: s)
on(o_1, s_1, t). % on(knife: o, counter: s)

