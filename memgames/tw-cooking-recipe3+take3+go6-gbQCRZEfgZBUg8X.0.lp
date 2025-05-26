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
r(r_1). %  livingroom
r(r_2). %  bedroom
r(r_3). %  corridor
r(r_4). %  bathroom
r(r_5). %  pantry
d(d_0). %  frosted-glass door
c(c_0). % conventional fridge
oven(oven_0). % conventional oven
s(s_0). % massive table
s(s_1). % vast counter
s(s_2). % wooden shelf
s(s_3). % large bed
s(s_4). % white toilet
s(s_5). % comfy sofa
stove(stove_0). % conventional stove
f(f_0). %  lettuce
f(f_1). %  salt
f(f_2). %  peanut oil
ingredient(ingredient_0).
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
recipe(recipe).
ingredient(ingredient_1).
ingredient(ingredient_2).
f(f_3). %  olive oil
o(o_0). % interesting cookbook

% ======= Facts =======
cookable(f_0). % cookable(lettuce: f)
cuttable(f_0). % cuttable(lettuce: f)
_east_of(r_0, r_1). % east_of(kitchen: r, livingroom: r)
_north_of(r_2, r_1). % north_of(bedroom: r, livingroom: r)
_north_of(r_3, r_2). % north_of(corridor: r, bedroom: r)
_north_of(r_4, r_3). % north_of(bathroom: r, corridor: r)
_north_of(r_5, r_0). % north_of(pantry: r, kitchen: r)
_south_of(r_0, r_5). % south_of(kitchen: r, pantry: r)
_south_of(r_1, r_2). % south_of(livingroom: r, bedroom: r)
_south_of(r_2, r_3). % south_of(bedroom: r, corridor: r)
_south_of(r_3, r_4). % south_of(corridor: r, bathroom: r)
_west_of(r_1, r_0). % west_of(livingroom: r, kitchen: r)


% ------- initial fluents (initialized with t=0) -------
#program initial_state(t).

cooked(f_0, t). % cooked(lettuce: f)
cooked(f_1, t). % cooked(salt: f)
cooked(f_2, t). % cooked(peanut oil: f)
cut_state(f_0, diced, t). % diced(lettuce: f)
edible(f_0, t). % edible(lettuce: f)
edible(f_1, t). % edible(salt: f)
edible(f_2, t). % edible(peanut oil: f)
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
inedible(f_3, t). % inedible(olive oil: f)
open(c_0, t). % open(fridge: c)
open(d_0, t). % open(frosted-glass door: d)
cooked_state(f_0, raw, t). % raw(lettuce: f)


% ------- Recipe -------
#program recipe(t).

base(f_0, ingredient_0). % base(lettuce: f, ingredient_0: ingredient)
base(f_1, ingredient_2). % base(salt: f, ingredient_2: ingredient)
base(f_2, ingredient_1). % base(peanut oil: f, ingredient_1: ingredient)
cooking_location(r_0, recipe). % cooking_location(kitchen: r, RECIPE)
should_cut(ingredient_0, diced). % diced(ingredient_0: ingredient)
in(ingredient_0, recipe). % in(ingredient_0: ingredient, RECIPE)
in(ingredient_1, recipe). % in(ingredient_1: ingredient, RECIPE)
in(ingredient_2, recipe). % in(ingredient_2: ingredient, RECIPE)
ingredient_1(f_0). % ingredient_1(lettuce: f)
ingredient_2(f_2). % ingredient_2(peanut oil: f)
ingredient_3(f_1). % ingredient_3(salt: f)
out(meal_0, recipe). % out(meal, RECIPE)
should_cook(ingredient_0, raw). % raw(ingredient_0: ingredient)
should_cook(ingredient_1, raw). % raw(ingredient_1: ingredient)
should_cook(ingredient_2, raw). % raw(ingredient_2: ingredient)
should_cut(ingredient_1, uncut). % uncut(ingredient_1: ingredient)
should_cut(ingredient_2, uncut). % uncut(ingredient_2: ingredient)

in_recipe(I,F) :- ingredient(I), in(I,recipe), base(F,I), instance_of(F,f).
in_recipe(F) :- in_recipe(I,F).


% ------- ROOM fluents -------

#program initial_room(t).
at(player, r_0, t). % at(P, kitchen: r)
room_changed(nowhere,r_0,t).

#program room_r_0(t).
%free(r_0, r_1, t). % free(kitchen: r, livingroom: r)
%free(r_0, r_5, t). % free(kitchen: r, pantry: r)
link(r_0, d_0, unknownN). % link(kitchen: r, frosted-glass door: d, pantry: r)
north_of(unknownN, r_0). % north_of(pantry: r, kitchen: r)
west_of(unknownW, r_0). % west_of(livingroom: r, kitchen: r)
at(c_0, r_0, t). % at(fridge: c, kitchen: r)
at(oven_0, r_0, t). % at(oven, kitchen: r)
at(s_0, r_0, t). % at(table: s, kitchen: r)
at(s_1, r_0, t). % at(counter: s, kitchen: r)
at(stove_0, r_0, t). % at(stove, kitchen: r)
in(f_0, c_0, t). % in(lettuce: f, fridge: c)
on(o_0, s_0, t). % on(cookbook: o, table: s)

#program room_r_1(t).
east_of(unknownE, r_1). % east_of(kitchen: r, livingroom: r)
%free(r_1, r_0, t). % free(livingroom: r, kitchen: r)
%free(r_1, r_2, t). % free(livingroom: r, bedroom: r)
north_of(unknownN, r_1). % north_of(bedroom: r, livingroom: r)
at(s_5, r_1, t). % at(sofa: s, livingroom: r)

#program room_r_2(t).
%free(r_2, r_1, t). % free(bedroom: r, livingroom: r)
%free(r_2, r_3, t). % free(bedroom: r, corridor: r)
north_of(unknownN, r_2). % north_of(corridor: r, bedroom: r)
south_of(unknownS, r_2). % south_of(livingroom: r, bedroom: r)
at(s_3, r_2, t). % at(bed: s, bedroom: r)

#program room_r_3(t).
%free(r_3, r_2, t). % free(corridor: r, bedroom: r)
%free(r_3, r_4, t). % free(corridor: r, bathroom: r)
north_of(unknownN, r_3). % north_of(bathroom: r, corridor: r)
south_of(unknownS, r_3). % south_of(bedroom: r, corridor: r)

#program room_r_4(t).
%free(r_4, r_3, t). % free(bathroom: r, corridor: r)
south_of(unknownS, r_4). % south_of(corridor: r, bathroom: r)
at(s_4, r_4, t). % at(toilet: s, bathroom: r)

#program room_r_5(t).
%free(r_5, r_0, t). % free(pantry: r, kitchen: r)
link(r_5, d_0, unknownS). % link(pantry: r, frosted-glass door: d, kitchen: r)
south_of(unknownS, r_5). % south_of(kitchen: r, pantry: r)
at(s_2, r_5, t). % at(shelf: s, pantry: r)
on(f_1, s_2, t). % on(salt: f, shelf: s)
on(f_2, s_2, t). % on(peanut oil: f, shelf: s)
on(f_3, s_2, t). % on(olive oil: f, shelf: s)

