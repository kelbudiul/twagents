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
r(r_2). %  livingroom
r(r_5). %  bedroom
r(r_6). %  backyard
r(r_1). %  pantry
r(r_3). %  corridor
r(r_4). %  bathroom
r(r_7). %  garden
r(r_8). %  shed
d(d_0). %  plain door
d(d_1). %  sliding patio door
d(d_2). %  barn door
c(c_0). % conventional fridge
c(c_1). % metallic toolbox
f(f_12). %  red onion
f(f_15). %  carrot
f(f_16). %  tomato
f(f_4). %  green hot pepper
f(f_6). %  black pepper
oven(oven_0). % conventional oven
s(s_0). % massive table
s(s_1). % vast counter
s(s_2). % wooden shelf
s(s_3). % stylish patio table
s(s_4). % wooden workbench
s(s_5). % comfy sofa
s(s_6). % large bed
s(s_7). % white toilet
s(s_8). % stylish patio chair
stove(stove_0). % conventional stove
toaster(toaster_0). % recent BBQ
f(f_0). %  banana
f(f_1). %  chicken leg
f(f_2). %  yellow apple
f(f_3). %  cilantro
ingredient(ingredient_2).
f(f_11). %  purple potato
f(f_14). %  red hot pepper
f(f_5). %  chicken wing
f(f_7). %  yellow potato
f(f_8). %  red apple
f(f_9). %  egg
f(f_13). %  parsley
ingredient(ingredient_4).
f(f_10). %  milk
meal(meal_0). %  meal
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
ingredient(ingredient_3).
o(o_0). % interesting cookbook
o(o_1). % sharp knife
slot(slot_0).
slot(slot_1).
slot(slot_2).

% ======= Facts =======
cookable(f_0). % cookable(banana: f)
cookable(f_1). % cookable(chicken leg: f)
cookable(f_11). % cookable(purple potato: f)
cookable(f_12). % cookable(red onion: f)
cookable(f_14). % cookable(red hot pepper: f)
cookable(f_15). % cookable(carrot: f)
cookable(f_16). % cookable(tomato: f)
cookable(f_2). % cookable(yellow apple: f)
cookable(f_4). % cookable(green hot pepper: f)
cookable(f_5). % cookable(chicken wing: f)
cookable(f_7). % cookable(yellow potato: f)
cookable(f_8). % cookable(red apple: f)
cookable(f_9). % cookable(egg: f)
cuttable(f_0). % cuttable(banana: f)
cuttable(f_11). % cuttable(purple potato: f)
cuttable(f_12). % cuttable(red onion: f)
cuttable(f_13). % cuttable(parsley: f)
cuttable(f_14). % cuttable(red hot pepper: f)
cuttable(f_15). % cuttable(carrot: f)
cuttable(f_16). % cuttable(tomato: f)
cuttable(f_2). % cuttable(yellow apple: f)
cuttable(f_3). % cuttable(cilantro: f)
cuttable(f_4). % cuttable(green hot pepper: f)
cuttable(f_7). % cuttable(yellow potato: f)
cuttable(f_8). % cuttable(red apple: f)
_east_of(r_0, r_2). % east_of(kitchen: r, livingroom: r)
_east_of(r_2, r_5). % east_of(livingroom: r, bedroom: r)
_east_of(r_6, r_0). % east_of(backyard: r, kitchen: r)
_north_of(r_1, r_0). % north_of(pantry: r, kitchen: r)
_north_of(r_3, r_2). % north_of(corridor: r, livingroom: r)
_north_of(r_4, r_3). % north_of(bathroom: r, corridor: r)
_north_of(r_6, r_8). % north_of(backyard: r, shed: r)
_north_of(r_7, r_6). % north_of(garden: r, backyard: r)
sharp(o_1). % sharp(knife: o)
_south_of(r_0, r_1). % south_of(kitchen: r, pantry: r)
_south_of(r_2, r_3). % south_of(livingroom: r, corridor: r)
_south_of(r_3, r_4). % south_of(corridor: r, bathroom: r)
_south_of(r_6, r_7). % south_of(backyard: r, garden: r)
_south_of(r_8, r_6). % south_of(shed: r, backyard: r)
_west_of(r_0, r_6). % west_of(kitchen: r, backyard: r)
_west_of(r_2, r_0). % west_of(livingroom: r, kitchen: r)
_west_of(r_5, r_2). % west_of(bedroom: r, livingroom: r)


% ------- initial fluents (initialized with t=0) -------
#program initial_state(t).

drinkable(f_10, t). % drinkable(milk: f)
edible(f_0, t). % edible(banana: f)
edible(f_12, t). % edible(red onion: f)
edible(f_13, t). % edible(parsley: f)
edible(f_14, t). % edible(red hot pepper: f)
edible(f_15, t). % edible(carrot: f)
edible(f_16, t). % edible(tomato: f)
edible(f_2, t). % edible(yellow apple: f)
edible(f_3, t). % edible(cilantro: f)
edible(f_4, t). % edible(green hot pepper: f)
edible(f_6, t). % edible(black pepper: f)
edible(f_8, t). % edible(red apple: f)
edible(meal_0, t). % edible(meal)
%free(slot_3, t). % free(slot_3: slot)
%free(slot_4, t). % free(slot_4: slot)
%free(slot_5, t). % free(slot_5: slot)
%free(slot_6, t). % free(slot_6: slot)
%free(slot_7, t). % free(slot_7: slot)
%free(slot_8, t). % free(slot_8: slot)
%free(slot_9, t). % free(slot_9: slot)
in(f_2, inventory, t). % in(yellow apple: f, I)
in(f_7, inventory, t). % in(yellow potato: f, I)
in(f_8, inventory, t). % in(red apple: f, I)
inedible(f_1, t). % inedible(chicken leg: f)
inedible(f_10, t). % inedible(milk: f)
inedible(f_11, t). % inedible(purple potato: f)
inedible(f_5, t). % inedible(chicken wing: f)
inedible(f_7, t). % inedible(yellow potato: f)
inedible(f_9, t). % inedible(egg: f)
cooked_state(f_1, needs_cooking, t). % needs_cooking(chicken leg: f)
cooked_state(f_11, needs_cooking, t). % needs_cooking(purple potato: f)
cooked_state(f_5, needs_cooking, t). % needs_cooking(chicken wing: f)
cooked_state(f_7, needs_cooking, t). % needs_cooking(yellow potato: f)
cooked_state(f_9, needs_cooking, t). % needs_cooking(egg: f)
open(c_0, t). % open(fridge: c)
open(c_1, t). % open(toolbox: c)
open(d_0, t). % open(plain door: d)
open(d_1, t). % open(sliding patio door: d)
open(d_2, t). % open(barn door: d)
cooked_state(f_0, raw, t). % raw(banana: f)
cooked_state(f_12, raw, t). % raw(red onion: f)
cooked_state(f_14, raw, t). % raw(red hot pepper: f)
cooked_state(f_15, raw, t). % raw(carrot: f)
cooked_state(f_16, raw, t). % raw(tomato: f)
cooked_state(f_2, raw, t). % raw(yellow apple: f)
cooked_state(f_4, raw, t). % raw(green hot pepper: f)
cooked_state(f_8, raw, t). % raw(red apple: f)
cut_state(f_0, uncut, t). % uncut(banana: f)
cut_state(f_11, uncut, t). % uncut(purple potato: f)
cut_state(f_12, uncut, t). % uncut(red onion: f)
cut_state(f_13, uncut, t). % uncut(parsley: f)
cut_state(f_14, uncut, t). % uncut(red hot pepper: f)
cut_state(f_15, uncut, t). % uncut(carrot: f)
cut_state(f_16, uncut, t). % uncut(tomato: f)
cut_state(f_2, uncut, t). % uncut(yellow apple: f)
cut_state(f_3, uncut, t). % uncut(cilantro: f)
cut_state(f_4, uncut, t). % uncut(green hot pepper: f)
cut_state(f_7, uncut, t). % uncut(yellow potato: f)
cut_state(f_8, uncut, t). % uncut(red apple: f)
used(slot_0, t). % used(slot_0: slot)
used(slot_1, t). % used(slot_1: slot)
used(slot_2, t). % used(slot_2: slot)


% ------- Recipe -------
#program recipe(t).

base(f_0, ingredient_0). % base(banana: f, ingredient_0: ingredient)
base(f_1, ingredient_1). % base(chicken leg: f, ingredient_1: ingredient)
base(f_2, ingredient_4). % base(yellow apple: f, ingredient_4: ingredient)
base(f_3, ingredient_2). % base(cilantro: f, ingredient_2: ingredient)
base(f_4, ingredient_3). % base(green hot pepper: f, ingredient_3: ingredient)
should_cut(ingredient_2, chopped). % chopped(ingredient_2: ingredient)
cooking_location(r_0, recipe). % cooking_location(kitchen: r, RECIPE)
should_cut(ingredient_4, diced). % diced(ingredient_4: ingredient)
should_cook(ingredient_4, fried). % fried(ingredient_4: ingredient)
in(ingredient_0, recipe). % in(ingredient_0: ingredient, RECIPE)
in(ingredient_1, recipe). % in(ingredient_1: ingredient, RECIPE)
in(ingredient_2, recipe). % in(ingredient_2: ingredient, RECIPE)
in(ingredient_3, recipe). % in(ingredient_3: ingredient, RECIPE)
in(ingredient_4, recipe). % in(ingredient_4: ingredient, RECIPE)
ingredient_1(f_0). % ingredient_1(banana: f)
ingredient_2(f_1). % ingredient_2(chicken leg: f)
ingredient_3(f_3). % ingredient_3(cilantro: f)
ingredient_4(f_4). % ingredient_4(green hot pepper: f)
ingredient_5(f_2). % ingredient_5(yellow apple: f)
out(meal_0, recipe). % out(meal, RECIPE)
should_cook(ingredient_0, raw). % raw(ingredient_0: ingredient)
should_cook(ingredient_2, raw). % raw(ingredient_2: ingredient)
should_cook(ingredient_3, raw). % raw(ingredient_3: ingredient)
should_cook(ingredient_1, roasted). % roasted(ingredient_1: ingredient)
should_cut(ingredient_3, sliced). % sliced(ingredient_3: ingredient)
should_cut(ingredient_0, uncut). % uncut(ingredient_0: ingredient)
should_cut(ingredient_1, uncut). % uncut(ingredient_1: ingredient)

in_recipe(I,F) :- ingredient(I), in(I,recipe), base(F,I), instance_of(F,f).
in_recipe(F) :- in_recipe(I,F).


% ------- ROOM fluents -------

#program initial_room(t).
at(player, r_0, t). % at(P, kitchen: r)
room_changed(nowhere,r_0,t).

#program room_r_0(t).
east_of(unknownE, r_0). % east_of(backyard: r, kitchen: r)
%free(r_0, r_1, t). % free(kitchen: r, pantry: r)
%free(r_0, r_2, t). % free(kitchen: r, livingroom: r)
%free(r_0, r_6, t). % free(kitchen: r, backyard: r)
link(r_0, d_0, unknownN). % link(kitchen: r, plain door: d, pantry: r)
link(r_0, d_1, unknownE). % link(kitchen: r, sliding patio door: d, backyard: r)
north_of(unknownN, r_0). % north_of(pantry: r, kitchen: r)
west_of(unknownW, r_0). % west_of(livingroom: r, kitchen: r)
at(c_0, r_0, t). % at(fridge: c, kitchen: r)
at(oven_0, r_0, t). % at(oven, kitchen: r)
at(s_0, r_0, t). % at(table: s, kitchen: r)
at(s_1, r_0, t). % at(counter: s, kitchen: r)
at(stove_0, r_0, t). % at(stove, kitchen: r)
in(f_1, c_0, t). % in(chicken leg: f, fridge: c)
in(f_10, c_0, t). % in(milk: f, fridge: c)
in(f_13, c_0, t). % in(parsley: f, fridge: c)
in(f_3, c_0, t). % in(cilantro: f, fridge: c)
in(f_5, c_0, t). % in(chicken wing: f, fridge: c)
in(f_9, c_0, t). % in(egg: f, fridge: c)
on(f_0, s_1, t). % on(banana: f, counter: s)
on(f_11, s_1, t). % on(purple potato: f, counter: s)
on(f_14, s_1, t). % on(red hot pepper: f, counter: s)
on(o_0, s_1, t). % on(cookbook: o, counter: s)
on(o_1, s_0, t). % on(knife: o, table: s)

#program room_r_1(t).
%free(r_1, r_0, t). % free(pantry: r, kitchen: r)
link(r_1, d_0, unknownS). % link(pantry: r, plain door: d, kitchen: r)
south_of(unknownS, r_1). % south_of(kitchen: r, pantry: r)
at(s_2, r_1, t). % at(shelf: s, pantry: r)

#program room_r_2(t).
east_of(unknownE, r_2). % east_of(kitchen: r, livingroom: r)
%free(r_2, r_0, t). % free(livingroom: r, kitchen: r)
%free(r_2, r_3, t). % free(livingroom: r, corridor: r)
%free(r_2, r_5, t). % free(livingroom: r, bedroom: r)
north_of(unknownN, r_2). % north_of(corridor: r, livingroom: r)
west_of(unknownW, r_2). % west_of(bedroom: r, livingroom: r)
at(s_5, r_2, t). % at(sofa: s, livingroom: r)

#program room_r_3(t).
%free(r_3, r_2, t). % free(corridor: r, livingroom: r)
%free(r_3, r_4, t). % free(corridor: r, bathroom: r)
north_of(unknownN, r_3). % north_of(bathroom: r, corridor: r)
south_of(unknownS, r_3). % south_of(livingroom: r, corridor: r)

#program room_r_4(t).
%free(r_4, r_3, t). % free(bathroom: r, corridor: r)
south_of(unknownS, r_4). % south_of(corridor: r, bathroom: r)
at(s_7, r_4, t). % at(toilet: s, bathroom: r)

#program room_r_5(t).
east_of(unknownE, r_5). % east_of(livingroom: r, bedroom: r)
%free(r_5, r_2, t). % free(bedroom: r, livingroom: r)
at(s_6, r_5, t). % at(bed: s, bedroom: r)

#program room_r_6(t).
%free(r_6, r_0, t). % free(backyard: r, kitchen: r)
%free(r_6, r_7, t). % free(backyard: r, garden: r)
%free(r_6, r_8, t). % free(backyard: r, shed: r)
link(r_6, d_1, unknownW). % link(backyard: r, sliding patio door: d, kitchen: r)
link(r_6, d_2, unknownS). % link(backyard: r, barn door: d, shed: r)
north_of(unknownN, r_6). % north_of(garden: r, backyard: r)
south_of(unknownS, r_6). % south_of(shed: r, backyard: r)
west_of(unknownW, r_6). % west_of(kitchen: r, backyard: r)
at(s_3, r_6, t). % at(patio table: s, backyard: r)
at(s_8, r_6, t). % at(patio chair: s, backyard: r)
at(toaster_0, r_6, t). % at(BBQ: toaster, backyard: r)

#program room_r_7(t).
%free(r_7, r_6, t). % free(garden: r, backyard: r)
south_of(unknownS, r_7). % south_of(backyard: r, garden: r)
at(f_12, r_7, t). % at(red onion: f, garden: r)
at(f_15, r_7, t). % at(carrot: f, garden: r)
at(f_16, r_7, t). % at(tomato: f, garden: r)
at(f_4, r_7, t). % at(green hot pepper: f, garden: r)
at(f_6, r_7, t). % at(black pepper: f, garden: r)

#program room_r_8(t).
%free(r_8, r_6, t). % free(shed: r, backyard: r)
link(r_8, d_2, unknownN). % link(shed: r, barn door: d, backyard: r)
north_of(unknownN, r_8). % north_of(backyard: r, shed: r)
at(c_1, r_8, t). % at(toolbox: c, shed: r)
at(s_4, r_8, t). % at(workbench: s, shed: r)

