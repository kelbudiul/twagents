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
s(s_4). % comfy sofa
s(s_5). % white toilet
stove(stove_0). % conventional stove
f(f_0). %  green bell pepper
f(f_1). %  purple potato
f(f_2). %  green apple
f(f_3). %  yellow bell pepper
f(f_4). %  yellow potato
f(f_5). %  banana
f(f_6). %  pork chop
f(f_7). %  red onion
f(f_8). %  lettuce
ingredient(ingredient_0).
meal(meal_0). %  meal
slot(slot_5).
slot(slot_6).
slot(slot_7).
slot(slot_8).
slot(slot_9).
ingredient(ingredient_1).
recipe(recipe).
o(o_0). % interesting cookbook
o(o_1). % sharp knife
slot(slot_0).
slot(slot_1).
slot(slot_2).
slot(slot_3).
slot(slot_4).

% ======= Facts =======
cookable(f_0). % cookable(green bell pepper: f)
cookable(f_1). % cookable(purple potato: f)
cookable(f_2). % cookable(green apple: f)
cookable(f_3). % cookable(yellow bell pepper: f)
cookable(f_4). % cookable(yellow potato: f)
cookable(f_5). % cookable(banana: f)
cookable(f_6). % cookable(pork chop: f)
cookable(f_7). % cookable(red onion: f)
cookable(f_8). % cookable(lettuce: f)
cuttable(f_0). % cuttable(green bell pepper: f)
cuttable(f_1). % cuttable(purple potato: f)
cuttable(f_2). % cuttable(green apple: f)
cuttable(f_3). % cuttable(yellow bell pepper: f)
cuttable(f_4). % cuttable(yellow potato: f)
cuttable(f_5). % cuttable(banana: f)
cuttable(f_6). % cuttable(pork chop: f)
cuttable(f_7). % cuttable(red onion: f)
cuttable(f_8). % cuttable(lettuce: f)
_east_of(r_0, r_1). % east_of(kitchen: r, livingroom: r)
_east_of(r_1, r_2). % east_of(livingroom: r, bedroom: r)
_north_of(r_3, r_2). % north_of(corridor: r, bedroom: r)
_north_of(r_4, r_3). % north_of(bathroom: r, corridor: r)
_north_of(r_5, r_0). % north_of(pantry: r, kitchen: r)
sharp(o_1). % sharp(knife: o)
_south_of(r_0, r_5). % south_of(kitchen: r, pantry: r)
_south_of(r_2, r_3). % south_of(bedroom: r, corridor: r)
_south_of(r_3, r_4). % south_of(corridor: r, bathroom: r)
_west_of(r_1, r_0). % west_of(livingroom: r, kitchen: r)
_west_of(r_2, r_1). % west_of(bedroom: r, livingroom: r)


% ------- initial fluents (initialized with t=0) -------
#program initial_state(t).

cooked(f_0, t). % cooked(green bell pepper: f)
cooked(f_1, t). % cooked(purple potato: f)
edible(f_0, t). % edible(green bell pepper: f)
edible(f_1, t). % edible(purple potato: f)
edible(f_2, t). % edible(green apple: f)
edible(f_3, t). % edible(yellow bell pepper: f)
edible(f_5, t). % edible(banana: f)
edible(f_7, t). % edible(red onion: f)
edible(f_8, t). % edible(lettuce: f)
edible(meal_0, t). % edible(meal)
%free(slot_5, t). % free(slot_5: slot)
%free(slot_6, t). % free(slot_6: slot)
%free(slot_7, t). % free(slot_7: slot)
%free(slot_8, t). % free(slot_8: slot)
%free(slot_9, t). % free(slot_9: slot)
cooked_state(f_0, fried, t). % fried(green bell pepper: f)
cooked_state(f_1, fried, t). % fried(purple potato: f)
in(f_0, inventory, t). % in(green bell pepper: f, I)
in(f_1, inventory, t). % in(purple potato: f, I)
in(f_2, inventory, t). % in(green apple: f, I)
in(f_3, inventory, t). % in(yellow bell pepper: f, I)
in(f_4, inventory, t). % in(yellow potato: f, I)
inedible(f_4, t). % inedible(yellow potato: f)
inedible(f_6, t). % inedible(pork chop: f)
cooked_state(f_4, needs_cooking, t). % needs_cooking(yellow potato: f)
cooked_state(f_6, needs_cooking, t). % needs_cooking(pork chop: f)
open(c_0, t). % open(fridge: c)
open(d_0, t). % open(frosted-glass door: d)
cooked_state(f_2, raw, t). % raw(green apple: f)
cooked_state(f_3, raw, t). % raw(yellow bell pepper: f)
cooked_state(f_5, raw, t). % raw(banana: f)
cooked_state(f_7, raw, t). % raw(red onion: f)
cooked_state(f_8, raw, t). % raw(lettuce: f)
cut_state(f_0, uncut, t). % uncut(green bell pepper: f)
cut_state(f_1, uncut, t). % uncut(purple potato: f)
cut_state(f_2, uncut, t). % uncut(green apple: f)
cut_state(f_3, uncut, t). % uncut(yellow bell pepper: f)
cut_state(f_4, uncut, t). % uncut(yellow potato: f)
cut_state(f_5, uncut, t). % uncut(banana: f)
cut_state(f_6, uncut, t). % uncut(pork chop: f)
cut_state(f_7, uncut, t). % uncut(red onion: f)
cut_state(f_8, uncut, t). % uncut(lettuce: f)
used(slot_0, t). % used(slot_0: slot)
used(slot_1, t). % used(slot_1: slot)
used(slot_2, t). % used(slot_2: slot)
used(slot_3, t). % used(slot_3: slot)
used(slot_4, t). % used(slot_4: slot)


% ------- Recipe -------
#program recipe(t).

base(f_0, ingredient_0). % base(green bell pepper: f, ingredient_0: ingredient)
base(f_1, ingredient_1). % base(purple potato: f, ingredient_1: ingredient)
cooking_location(r_0, recipe). % cooking_location(kitchen: r, RECIPE)
should_cut(ingredient_0, diced). % diced(ingredient_0: ingredient)
should_cook(ingredient_0, fried). % fried(ingredient_0: ingredient)
should_cook(ingredient_1, fried). % fried(ingredient_1: ingredient)
in(ingredient_0, recipe). % in(ingredient_0: ingredient, RECIPE)
in(ingredient_1, recipe). % in(ingredient_1: ingredient, RECIPE)
ingredient_1(f_0). % ingredient_1(green bell pepper: f)
ingredient_2(f_1). % ingredient_2(purple potato: f)
out(meal_0, recipe). % out(meal, RECIPE)
should_cut(ingredient_1, uncut). % uncut(ingredient_1: ingredient)

in_recipe(I,F) :- ingredient(I), in(I,recipe), base(F,I), instance_of(F,f).
in_recipe(F) :- in_recipe(I,F).


% ------- ROOM fluents -------

#program initial_room(t).
at(player, r_5, t). % at(P, pantry: r)
room_changed(nowhere,r_5,t).

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
in(f_6, c_0, t). % in(pork chop: f, fridge: c)
in(f_7, c_0, t). % in(red onion: f, fridge: c)
in(f_8, c_0, t). % in(lettuce: f, fridge: c)
on(f_5, s_1, t). % on(banana: f, counter: s)
on(o_0, s_0, t). % on(cookbook: o, table: s)
on(o_1, s_1, t). % on(knife: o, counter: s)

#program room_r_1(t).
east_of(unknownE, r_1). % east_of(kitchen: r, livingroom: r)
%free(r_1, r_0, t). % free(livingroom: r, kitchen: r)
%free(r_1, r_2, t). % free(livingroom: r, bedroom: r)
west_of(unknownW, r_1). % west_of(bedroom: r, livingroom: r)
at(s_4, r_1, t). % at(sofa: s, livingroom: r)

#program room_r_2(t).
east_of(unknownE, r_2). % east_of(livingroom: r, bedroom: r)
%free(r_2, r_1, t). % free(bedroom: r, livingroom: r)
%free(r_2, r_3, t). % free(bedroom: r, corridor: r)
north_of(unknownN, r_2). % north_of(corridor: r, bedroom: r)
at(s_3, r_2, t). % at(bed: s, bedroom: r)

#program room_r_3(t).
%free(r_3, r_2, t). % free(corridor: r, bedroom: r)
%free(r_3, r_4, t). % free(corridor: r, bathroom: r)
north_of(unknownN, r_3). % north_of(bathroom: r, corridor: r)
south_of(unknownS, r_3). % south_of(bedroom: r, corridor: r)

#program room_r_4(t).
%free(r_4, r_3, t). % free(bathroom: r, corridor: r)
south_of(unknownS, r_4). % south_of(corridor: r, bathroom: r)
at(s_5, r_4, t). % at(toilet: s, bathroom: r)

#program room_r_5(t).
%free(r_5, r_0, t). % free(pantry: r, kitchen: r)
link(r_5, d_0, unknownS). % link(pantry: r, frosted-glass door: d, kitchen: r)
south_of(unknownS, r_5). % south_of(kitchen: r, pantry: r)
at(s_2, r_5, t). % at(shelf: s, pantry: r)

