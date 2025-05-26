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
r(r_5). %  pantry
r(r_1). %  corridor
r(r_3). %  bathroom
r(r_2). %  bedroom
r(r_4). %  livingroom
d(d_0). %  plain door
c(c_0). % conventional fridge
oven(oven_0). % conventional oven
s(s_0). % massive table
s(s_1). % vast counter
s(s_2). % wooden shelf
s(s_3). % white toilet
s(s_4). % large bed
s(s_5). % comfy sofa
stove(stove_0). % conventional stove
f(f_0). %  water
f(f_1). %  green bell pepper
f(f_2). %  parsley
ingredient(ingredient_0).
f(f_3). %  green apple
f(f_4). %  orange bell pepper
f(f_5). %  red apple
f(f_6). %  chicken wing
f(f_7). %  banana
f(f_9). %  carrot
f(f_10). %  salt
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
f(f_8). %  olive oil
o(o_0). % interesting cookbook
o(o_1). % sharp knife

% ======= Facts =======
cookable(f_1). % cookable(green bell pepper: f)
cookable(f_3). % cookable(green apple: f)
cookable(f_4). % cookable(orange bell pepper: f)
cookable(f_5). % cookable(red apple: f)
cookable(f_6). % cookable(chicken wing: f)
cookable(f_7). % cookable(banana: f)
cookable(f_9). % cookable(carrot: f)
cuttable(f_1). % cuttable(green bell pepper: f)
cuttable(f_2). % cuttable(parsley: f)
cuttable(f_3). % cuttable(green apple: f)
cuttable(f_4). % cuttable(orange bell pepper: f)
cuttable(f_5). % cuttable(red apple: f)
cuttable(f_7). % cuttable(banana: f)
cuttable(f_9). % cuttable(carrot: f)
_east_of(r_0, r_5). % east_of(kitchen: r, pantry: r)
_east_of(r_1, r_3). % east_of(corridor: r, bathroom: r)
_east_of(r_2, r_1). % east_of(bedroom: r, corridor: r)
_east_of(r_4, r_0). % east_of(livingroom: r, kitchen: r)
_north_of(r_1, r_0). % north_of(corridor: r, kitchen: r)
_north_of(r_2, r_4). % north_of(bedroom: r, livingroom: r)
sharp(o_1). % sharp(knife: o)
_south_of(r_0, r_1). % south_of(kitchen: r, corridor: r)
_south_of(r_4, r_2). % south_of(livingroom: r, bedroom: r)
_west_of(r_0, r_4). % west_of(kitchen: r, livingroom: r)
_west_of(r_1, r_2). % west_of(corridor: r, bedroom: r)
_west_of(r_3, r_1). % west_of(bathroom: r, corridor: r)
_west_of(r_5, r_0). % west_of(pantry: r, kitchen: r)


% ------- initial fluents (initialized with t=0) -------
#program initial_state(t).

cut_state(f_1, chopped, t). % chopped(green bell pepper: f)
drinkable(f_0, t). % drinkable(water: f)
edible(f_1, t). % edible(green bell pepper: f)
edible(f_10, t). % edible(salt: f)
edible(f_2, t). % edible(parsley: f)
edible(f_3, t). % edible(green apple: f)
edible(f_4, t). % edible(orange bell pepper: f)
edible(f_5, t). % edible(red apple: f)
edible(f_7, t). % edible(banana: f)
edible(f_9, t). % edible(carrot: f)
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
inedible(f_0, t). % inedible(water: f)
inedible(f_6, t). % inedible(chicken wing: f)
inedible(f_8, t). % inedible(olive oil: f)
cooked_state(f_6, needs_cooking, t). % needs_cooking(chicken wing: f)
open(c_0, t). % open(fridge: c)
open(d_0, t). % open(plain door: d)
cooked_state(f_1, raw, t). % raw(green bell pepper: f)
cooked_state(f_3, raw, t). % raw(green apple: f)
cooked_state(f_4, raw, t). % raw(orange bell pepper: f)
cooked_state(f_5, raw, t). % raw(red apple: f)
cooked_state(f_7, raw, t). % raw(banana: f)
cooked_state(f_9, raw, t). % raw(carrot: f)
cut_state(f_2, uncut, t). % uncut(parsley: f)
cut_state(f_3, uncut, t). % uncut(green apple: f)
cut_state(f_4, uncut, t). % uncut(orange bell pepper: f)
cut_state(f_5, uncut, t). % uncut(red apple: f)
cut_state(f_7, uncut, t). % uncut(banana: f)
cut_state(f_9, uncut, t). % uncut(carrot: f)


% ------- Recipe -------
#program recipe(t).

base(f_0, ingredient_2). % base(water: f, ingredient_2: ingredient)
base(f_1, ingredient_0). % base(green bell pepper: f, ingredient_0: ingredient)
base(f_2, ingredient_1). % base(parsley: f, ingredient_1: ingredient)
should_cut(ingredient_0, chopped). % chopped(ingredient_0: ingredient)
cooking_location(r_0, recipe). % cooking_location(kitchen: r, RECIPE)
should_cook(ingredient_0, fried). % fried(ingredient_0: ingredient)
in(ingredient_0, recipe). % in(ingredient_0: ingredient, RECIPE)
in(ingredient_1, recipe). % in(ingredient_1: ingredient, RECIPE)
in(ingredient_2, recipe). % in(ingredient_2: ingredient, RECIPE)
ingredient_1(f_1). % ingredient_1(green bell pepper: f)
ingredient_2(f_2). % ingredient_2(parsley: f)
ingredient_3(f_0). % ingredient_3(water: f)
out(meal_0, recipe). % out(meal, RECIPE)
should_cook(ingredient_1, raw). % raw(ingredient_1: ingredient)
should_cook(ingredient_2, raw). % raw(ingredient_2: ingredient)
should_cut(ingredient_1, uncut). % uncut(ingredient_1: ingredient)
should_cut(ingredient_2, uncut). % uncut(ingredient_2: ingredient)

in_recipe(I,F) :- ingredient(I), in(I,recipe), base(F,I), instance_of(F,f).
in_recipe(F) :- in_recipe(I,F).


% ------- ROOM fluents -------

#program initial_room(t).
at(player, r_2, t). % at(P, bedroom: r)
room_changed(nowhere,r_2,t).

#program room_r_0(t).
east_of(unknownE, r_0). % east_of(livingroom: r, kitchen: r)
%free(r_0, r_1, t). % free(kitchen: r, corridor: r)
%free(r_0, r_4, t). % free(kitchen: r, livingroom: r)
%free(r_0, r_5, t). % free(kitchen: r, pantry: r)
link(r_0, d_0, unknownW). % link(kitchen: r, plain door: d, pantry: r)
north_of(unknownN, r_0). % north_of(corridor: r, kitchen: r)
west_of(unknownW, r_0). % west_of(pantry: r, kitchen: r)
at(c_0, r_0, t). % at(fridge: c, kitchen: r)
at(oven_0, r_0, t). % at(oven, kitchen: r)
at(s_0, r_0, t). % at(table: s, kitchen: r)
at(s_1, r_0, t). % at(counter: s, kitchen: r)
at(stove_0, r_0, t). % at(stove, kitchen: r)
in(f_0, c_0, t). % in(water: f, fridge: c)
in(f_1, c_0, t). % in(green bell pepper: f, fridge: c)
in(f_2, c_0, t). % in(parsley: f, fridge: c)
in(f_3, c_0, t). % in(green apple: f, fridge: c)
in(f_4, c_0, t). % in(orange bell pepper: f, fridge: c)
in(f_6, c_0, t). % in(chicken wing: f, fridge: c)
in(f_9, c_0, t). % in(carrot: f, fridge: c)
on(f_5, s_1, t). % on(red apple: f, counter: s)
on(f_7, s_1, t). % on(banana: f, counter: s)
on(o_0, s_0, t). % on(cookbook: o, table: s)
on(o_1, s_0, t). % on(knife: o, table: s)

#program room_r_1(t).
east_of(unknownE, r_1). % east_of(bedroom: r, corridor: r)
%free(r_1, r_0, t). % free(corridor: r, kitchen: r)
%free(r_1, r_2, t). % free(corridor: r, bedroom: r)
%free(r_1, r_3, t). % free(corridor: r, bathroom: r)
south_of(unknownS, r_1). % south_of(kitchen: r, corridor: r)
west_of(unknownW, r_1). % west_of(bathroom: r, corridor: r)

#program room_r_2(t).
%free(r_2, r_1, t). % free(bedroom: r, corridor: r)
%free(r_2, r_4, t). % free(bedroom: r, livingroom: r)
south_of(unknownS, r_2). % south_of(livingroom: r, bedroom: r)
west_of(unknownW, r_2). % west_of(corridor: r, bedroom: r)
at(s_4, r_2, t). % at(bed: s, bedroom: r)

#program room_r_3(t).
east_of(unknownE, r_3). % east_of(corridor: r, bathroom: r)
%free(r_3, r_1, t). % free(bathroom: r, corridor: r)
at(s_3, r_3, t). % at(toilet: s, bathroom: r)

#program room_r_4(t).
%free(r_4, r_0, t). % free(livingroom: r, kitchen: r)
%free(r_4, r_2, t). % free(livingroom: r, bedroom: r)
north_of(unknownN, r_4). % north_of(bedroom: r, livingroom: r)
west_of(unknownW, r_4). % west_of(kitchen: r, livingroom: r)
at(s_5, r_4, t). % at(sofa: s, livingroom: r)

#program room_r_5(t).
east_of(unknownE, r_5). % east_of(kitchen: r, pantry: r)
%free(r_5, r_0, t). % free(pantry: r, kitchen: r)
link(r_5, d_0, unknownE). % link(pantry: r, plain door: d, kitchen: r)
at(s_2, r_5, t). % at(shelf: s, pantry: r)
on(f_10, s_2, t). % on(salt: f, shelf: s)
on(f_8, s_2, t). % on(olive oil: f, shelf: s)

