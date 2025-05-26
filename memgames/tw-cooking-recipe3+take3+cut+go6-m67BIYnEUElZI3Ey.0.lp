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
r(r_3). %  corridor
r(r_1). %  livingroom
r(r_5). %  bathroom
r(r_2). %  pantry
r(r_4). %  bedroom
d(d_0). %  frosted-glass door
c(c_0). % conventional fridge
oven(oven_0). % conventional oven
s(s_0). % massive table
s(s_1). % vast counter
s(s_2). % wooden shelf
s(s_3). % comfy sofa
s(s_4). % large bed
s(s_5). % white toilet
stove(stove_0). % conventional stove
f(f_0). %  vegetable oil
f(f_1). %  green bell pepper
f(f_2). %  salt
ingredient(ingredient_0).
f(f_3). %  green apple
f(f_4). %  orange bell pepper
f(f_6). %  red tuna
f(f_7). %  water
f(f_8). %  black pepper
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
f(f_5). %  peanut oil
o(o_0). % interesting cookbook
o(o_1). % sharp knife

% ======= Facts =======
cookable(f_1). % cookable(green bell pepper: f)
cookable(f_3). % cookable(green apple: f)
cookable(f_4). % cookable(orange bell pepper: f)
cookable(f_6). % cookable(red tuna: f)
cuttable(f_1). % cuttable(green bell pepper: f)
cuttable(f_3). % cuttable(green apple: f)
cuttable(f_4). % cuttable(orange bell pepper: f)
cuttable(f_6). % cuttable(red tuna: f)
_east_of(r_0, r_3). % east_of(kitchen: r, corridor: r)
_east_of(r_1, r_0). % east_of(livingroom: r, kitchen: r)
_east_of(r_3, r_5). % east_of(corridor: r, bathroom: r)
_north_of(r_0, r_2). % north_of(kitchen: r, pantry: r)
_north_of(r_3, r_4). % north_of(corridor: r, bedroom: r)
sharp(o_1). % sharp(knife: o)
_south_of(r_2, r_0). % south_of(pantry: r, kitchen: r)
_south_of(r_4, r_3). % south_of(bedroom: r, corridor: r)
_west_of(r_0, r_1). % west_of(kitchen: r, livingroom: r)
_west_of(r_3, r_0). % west_of(corridor: r, kitchen: r)
_west_of(r_5, r_3). % west_of(bathroom: r, corridor: r)


% ------- initial fluents (initialized with t=0) -------
#program initial_state(t).

cooked(f_0, t). % cooked(vegetable oil: f)
cooked(f_1, t). % cooked(green bell pepper: f)
cooked(f_2, t). % cooked(salt: f)
drinkable(f_7, t). % drinkable(water: f)
edible(f_0, t). % edible(vegetable oil: f)
edible(f_1, t). % edible(green bell pepper: f)
edible(f_2, t). % edible(salt: f)
edible(f_3, t). % edible(green apple: f)
edible(f_4, t). % edible(orange bell pepper: f)
edible(f_8, t). % edible(black pepper: f)
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
inedible(f_5, t). % inedible(peanut oil: f)
inedible(f_6, t). % inedible(red tuna: f)
inedible(f_7, t). % inedible(water: f)
cooked_state(f_6, needs_cooking, t). % needs_cooking(red tuna: f)
open(c_0, t). % open(fridge: c)
open(d_0, t). % open(frosted-glass door: d)
cooked_state(f_3, raw, t). % raw(green apple: f)
cooked_state(f_4, raw, t). % raw(orange bell pepper: f)
cooked_state(f_1, roasted, t). % roasted(green bell pepper: f)
cut_state(f_1, uncut, t). % uncut(green bell pepper: f)
cut_state(f_3, uncut, t). % uncut(green apple: f)
cut_state(f_4, uncut, t). % uncut(orange bell pepper: f)
cut_state(f_6, uncut, t). % uncut(red tuna: f)


% ------- Recipe -------
#program recipe(t).

base(f_0, ingredient_2). % base(vegetable oil: f, ingredient_2: ingredient)
base(f_1, ingredient_0). % base(green bell pepper: f, ingredient_0: ingredient)
base(f_2, ingredient_1). % base(salt: f, ingredient_1: ingredient)
should_cut(ingredient_0, chopped). % chopped(ingredient_0: ingredient)
cooking_location(r_0, recipe). % cooking_location(kitchen: r, RECIPE)
in(ingredient_0, recipe). % in(ingredient_0: ingredient, RECIPE)
in(ingredient_1, recipe). % in(ingredient_1: ingredient, RECIPE)
in(ingredient_2, recipe). % in(ingredient_2: ingredient, RECIPE)
ingredient_1(f_1). % ingredient_1(green bell pepper: f)
ingredient_2(f_2). % ingredient_2(salt: f)
ingredient_3(f_0). % ingredient_3(vegetable oil: f)
out(meal_0, recipe). % out(meal, RECIPE)
should_cook(ingredient_1, raw). % raw(ingredient_1: ingredient)
should_cook(ingredient_2, raw). % raw(ingredient_2: ingredient)
should_cook(ingredient_0, roasted). % roasted(ingredient_0: ingredient)
should_cut(ingredient_1, uncut). % uncut(ingredient_1: ingredient)
should_cut(ingredient_2, uncut). % uncut(ingredient_2: ingredient)

in_recipe(I,F) :- ingredient(I), in(I,recipe), base(F,I), instance_of(F,f).
in_recipe(F) :- in_recipe(I,F).


% ------- ROOM fluents -------

#program initial_room(t).
at(player, r_2, t). % at(P, pantry: r)
room_changed(nowhere,r_2,t).

#program room_r_0(t).
east_of(unknownE, r_0). % east_of(livingroom: r, kitchen: r)
%free(r_0, r_1, t). % free(kitchen: r, livingroom: r)
%free(r_0, r_2, t). % free(kitchen: r, pantry: r)
%free(r_0, r_3, t). % free(kitchen: r, corridor: r)
link(r_0, d_0, unknownS). % link(kitchen: r, frosted-glass door: d, pantry: r)
south_of(unknownS, r_0). % south_of(pantry: r, kitchen: r)
west_of(unknownW, r_0). % west_of(corridor: r, kitchen: r)
at(c_0, r_0, t). % at(fridge: c, kitchen: r)
at(oven_0, r_0, t). % at(oven, kitchen: r)
at(s_0, r_0, t). % at(table: s, kitchen: r)
at(s_1, r_0, t). % at(counter: s, kitchen: r)
at(stove_0, r_0, t). % at(stove, kitchen: r)
in(f_1, c_0, t). % in(green bell pepper: f, fridge: c)
in(f_3, c_0, t). % in(green apple: f, fridge: c)
in(f_4, c_0, t). % in(orange bell pepper: f, fridge: c)
in(f_6, c_0, t). % in(red tuna: f, fridge: c)
in(f_7, c_0, t). % in(water: f, fridge: c)
on(o_0, s_0, t). % on(cookbook: o, table: s)
on(o_1, s_0, t). % on(knife: o, table: s)

#program room_r_1(t).
%free(r_1, r_0, t). % free(livingroom: r, kitchen: r)
west_of(unknownW, r_1). % west_of(kitchen: r, livingroom: r)
at(s_3, r_1, t). % at(sofa: s, livingroom: r)

#program room_r_2(t).
%free(r_2, r_0, t). % free(pantry: r, kitchen: r)
link(r_2, d_0, unknownN). % link(pantry: r, frosted-glass door: d, kitchen: r)
north_of(unknownN, r_2). % north_of(kitchen: r, pantry: r)
at(s_2, r_2, t). % at(shelf: s, pantry: r)
on(f_0, s_2, t). % on(vegetable oil: f, shelf: s)
on(f_2, s_2, t). % on(salt: f, shelf: s)
on(f_5, s_2, t). % on(peanut oil: f, shelf: s)
on(f_8, s_2, t). % on(black pepper: f, shelf: s)

#program room_r_3(t).
east_of(unknownE, r_3). % east_of(kitchen: r, corridor: r)
%free(r_3, r_0, t). % free(corridor: r, kitchen: r)
%free(r_3, r_4, t). % free(corridor: r, bedroom: r)
%free(r_3, r_5, t). % free(corridor: r, bathroom: r)
south_of(unknownS, r_3). % south_of(bedroom: r, corridor: r)
west_of(unknownW, r_3). % west_of(bathroom: r, corridor: r)

#program room_r_4(t).
%free(r_4, r_3, t). % free(bedroom: r, corridor: r)
north_of(unknownN, r_4). % north_of(corridor: r, bedroom: r)
at(s_4, r_4, t). % at(bed: s, bedroom: r)

#program room_r_5(t).
east_of(unknownE, r_5). % east_of(corridor: r, bathroom: r)
%free(r_5, r_3, t). % free(bathroom: r, corridor: r)
at(s_5, r_5, t). % at(toilet: s, bathroom: r)

