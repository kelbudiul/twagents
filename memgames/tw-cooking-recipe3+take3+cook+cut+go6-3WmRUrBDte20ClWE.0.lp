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
r(r_4). %  corridor
r(r_1). %  livingroom
r(r_2). %  bedroom
r(r_3). %  pantry
r(r_5). %  bathroom
d(d_0). %  plain door
c(c_0). % conventional fridge
oven(oven_0). % conventional oven
s(s_0). % massive table
s(s_1). % vast counter
s(s_2). % wooden shelf
s(s_3). % comfy sofa
s(s_4). % large bed
s(s_5). % white toilet
stove(stove_0). % conventional stove
f(f_0). %  yellow bell pepper
f(f_1). %  red tuna
f(f_2). %  lettuce
ingredient(ingredient_2).
f(f_11). %  red potato
f(f_3). %  red onion
f(f_4). %  yellow potato
f(f_5). %  red bell pepper
f(f_6). %  banana
f(f_7). %  white onion
f(f_9). %  purple potato
f(f_10). %  cilantro
ingredient(ingredient_0).
ingredient(ingredient_1).
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
f(f_8). %  peanut oil
o(o_0). % interesting cookbook
o(o_1). % sharp knife

% ======= Facts =======
cookable(f_0). % cookable(yellow bell pepper: f)
cookable(f_1). % cookable(red tuna: f)
cookable(f_11). % cookable(red potato: f)
cookable(f_2). % cookable(lettuce: f)
cookable(f_3). % cookable(red onion: f)
cookable(f_4). % cookable(yellow potato: f)
cookable(f_5). % cookable(red bell pepper: f)
cookable(f_6). % cookable(banana: f)
cookable(f_7). % cookable(white onion: f)
cookable(f_9). % cookable(purple potato: f)
cuttable(f_0). % cuttable(yellow bell pepper: f)
cuttable(f_1). % cuttable(red tuna: f)
cuttable(f_10). % cuttable(cilantro: f)
cuttable(f_11). % cuttable(red potato: f)
cuttable(f_2). % cuttable(lettuce: f)
cuttable(f_3). % cuttable(red onion: f)
cuttable(f_4). % cuttable(yellow potato: f)
cuttable(f_5). % cuttable(red bell pepper: f)
cuttable(f_6). % cuttable(banana: f)
cuttable(f_7). % cuttable(white onion: f)
cuttable(f_9). % cuttable(purple potato: f)
_east_of(r_0, r_4). % east_of(kitchen: r, corridor: r)
_east_of(r_1, r_2). % east_of(livingroom: r, bedroom: r)
_east_of(r_3, r_0). % east_of(pantry: r, kitchen: r)
_east_of(r_4, r_5). % east_of(corridor: r, bathroom: r)
_north_of(r_0, r_1). % north_of(kitchen: r, livingroom: r)
sharp(o_1). % sharp(knife: o)
_south_of(r_1, r_0). % south_of(livingroom: r, kitchen: r)
_west_of(r_0, r_3). % west_of(kitchen: r, pantry: r)
_west_of(r_2, r_1). % west_of(bedroom: r, livingroom: r)
_west_of(r_4, r_0). % west_of(corridor: r, kitchen: r)
_west_of(r_5, r_4). % west_of(bathroom: r, corridor: r)


% ------- initial fluents (initialized with t=0) -------
#program initial_state(t).

edible(f_0, t). % edible(yellow bell pepper: f)
edible(f_10, t). % edible(cilantro: f)
edible(f_2, t). % edible(lettuce: f)
edible(f_3, t). % edible(red onion: f)
edible(f_5, t). % edible(red bell pepper: f)
edible(f_6, t). % edible(banana: f)
edible(f_7, t). % edible(white onion: f)
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
inedible(f_1, t). % inedible(red tuna: f)
inedible(f_11, t). % inedible(red potato: f)
inedible(f_4, t). % inedible(yellow potato: f)
inedible(f_8, t). % inedible(peanut oil: f)
inedible(f_9, t). % inedible(purple potato: f)
cooked_state(f_1, needs_cooking, t). % needs_cooking(red tuna: f)
cooked_state(f_11, needs_cooking, t). % needs_cooking(red potato: f)
cooked_state(f_4, needs_cooking, t). % needs_cooking(yellow potato: f)
cooked_state(f_9, needs_cooking, t). % needs_cooking(purple potato: f)
open(c_0, t). % open(fridge: c)
open(d_0, t). % open(plain door: d)
cooked_state(f_0, raw, t). % raw(yellow bell pepper: f)
cooked_state(f_2, raw, t). % raw(lettuce: f)
cooked_state(f_3, raw, t). % raw(red onion: f)
cooked_state(f_5, raw, t). % raw(red bell pepper: f)
cooked_state(f_6, raw, t). % raw(banana: f)
cooked_state(f_7, raw, t). % raw(white onion: f)
cut_state(f_0, uncut, t). % uncut(yellow bell pepper: f)
cut_state(f_1, uncut, t). % uncut(red tuna: f)
cut_state(f_10, uncut, t). % uncut(cilantro: f)
cut_state(f_11, uncut, t). % uncut(red potato: f)
cut_state(f_2, uncut, t). % uncut(lettuce: f)
cut_state(f_3, uncut, t). % uncut(red onion: f)
cut_state(f_4, uncut, t). % uncut(yellow potato: f)
cut_state(f_5, uncut, t). % uncut(red bell pepper: f)
cut_state(f_6, uncut, t). % uncut(banana: f)
cut_state(f_7, uncut, t). % uncut(white onion: f)
cut_state(f_9, uncut, t). % uncut(purple potato: f)


% ------- Recipe -------
#program recipe(t).

base(f_0, ingredient_2). % base(yellow bell pepper: f, ingredient_2: ingredient)
base(f_1, ingredient_1). % base(red tuna: f, ingredient_1: ingredient)
base(f_2, ingredient_0). % base(lettuce: f, ingredient_0: ingredient)
should_cut(ingredient_2, chopped). % chopped(ingredient_2: ingredient)
cooking_location(r_0, recipe). % cooking_location(kitchen: r, RECIPE)
should_cut(ingredient_0, diced). % diced(ingredient_0: ingredient)
should_cut(ingredient_1, diced). % diced(ingredient_1: ingredient)
in(ingredient_0, recipe). % in(ingredient_0: ingredient, RECIPE)
in(ingredient_1, recipe). % in(ingredient_1: ingredient, RECIPE)
in(ingredient_2, recipe). % in(ingredient_2: ingredient, RECIPE)
ingredient_1(f_2). % ingredient_1(lettuce: f)
ingredient_2(f_1). % ingredient_2(red tuna: f)
ingredient_3(f_0). % ingredient_3(yellow bell pepper: f)
out(meal_0, recipe). % out(meal, RECIPE)
should_cook(ingredient_2, raw). % raw(ingredient_2: ingredient)
should_cook(ingredient_0, roasted). % roasted(ingredient_0: ingredient)
should_cook(ingredient_1, roasted). % roasted(ingredient_1: ingredient)

in_recipe(I,F) :- ingredient(I), in(I,recipe), base(F,I), instance_of(F,f).
in_recipe(F) :- in_recipe(I,F).


% ------- ROOM fluents -------

#program initial_room(t).
at(player, r_5, t). % at(P, bathroom: r)
room_changed(nowhere,r_5,t).

#program room_r_0(t).
east_of(unknownE, r_0). % east_of(pantry: r, kitchen: r)
%free(r_0, r_1, t). % free(kitchen: r, livingroom: r)
%free(r_0, r_3, t). % free(kitchen: r, pantry: r)
%free(r_0, r_4, t). % free(kitchen: r, corridor: r)
link(r_0, d_0, unknownE). % link(kitchen: r, plain door: d, pantry: r)
south_of(unknownS, r_0). % south_of(livingroom: r, kitchen: r)
west_of(unknownW, r_0). % west_of(corridor: r, kitchen: r)
at(c_0, r_0, t). % at(fridge: c, kitchen: r)
at(oven_0, r_0, t). % at(oven, kitchen: r)
at(s_0, r_0, t). % at(table: s, kitchen: r)
at(s_1, r_0, t). % at(counter: s, kitchen: r)
at(stove_0, r_0, t). % at(stove, kitchen: r)
in(f_0, c_0, t). % in(yellow bell pepper: f, fridge: c)
in(f_1, c_0, t). % in(red tuna: f, fridge: c)
in(f_10, c_0, t). % in(cilantro: f, fridge: c)
in(f_2, c_0, t). % in(lettuce: f, fridge: c)
in(f_3, c_0, t). % in(red onion: f, fridge: c)
in(f_4, c_0, t). % in(yellow potato: f, fridge: c)
in(f_5, c_0, t). % in(red bell pepper: f, fridge: c)
in(f_7, c_0, t). % in(white onion: f, fridge: c)
on(f_11, s_1, t). % on(red potato: f, counter: s)
on(f_6, s_1, t). % on(banana: f, counter: s)
on(f_9, s_1, t). % on(purple potato: f, counter: s)
on(o_0, s_1, t). % on(cookbook: o, counter: s)
on(o_1, s_1, t). % on(knife: o, counter: s)

#program room_r_1(t).
%free(r_1, r_0, t). % free(livingroom: r, kitchen: r)
%free(r_1, r_2, t). % free(livingroom: r, bedroom: r)
north_of(unknownN, r_1). % north_of(kitchen: r, livingroom: r)
west_of(unknownW, r_1). % west_of(bedroom: r, livingroom: r)
at(s_3, r_1, t). % at(sofa: s, livingroom: r)

#program room_r_2(t).
east_of(unknownE, r_2). % east_of(livingroom: r, bedroom: r)
%free(r_2, r_1, t). % free(bedroom: r, livingroom: r)
at(s_4, r_2, t). % at(bed: s, bedroom: r)

#program room_r_3(t).
%free(r_3, r_0, t). % free(pantry: r, kitchen: r)
link(r_3, d_0, unknownW). % link(pantry: r, plain door: d, kitchen: r)
west_of(unknownW, r_3). % west_of(kitchen: r, pantry: r)
at(s_2, r_3, t). % at(shelf: s, pantry: r)
on(f_8, s_2, t). % on(peanut oil: f, shelf: s)

#program room_r_4(t).
east_of(unknownE, r_4). % east_of(kitchen: r, corridor: r)
%free(r_4, r_0, t). % free(corridor: r, kitchen: r)
%free(r_4, r_5, t). % free(corridor: r, bathroom: r)
west_of(unknownW, r_4). % west_of(bathroom: r, corridor: r)

#program room_r_5(t).
east_of(unknownE, r_5). % east_of(corridor: r, bathroom: r)
%free(r_5, r_4, t). % free(bathroom: r, corridor: r)
at(s_5, r_5, t). % at(toilet: s, bathroom: r)

