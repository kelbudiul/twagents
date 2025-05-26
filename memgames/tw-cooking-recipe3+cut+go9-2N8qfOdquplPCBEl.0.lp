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
r(r_3). %  corridor
r(r_5). %  bedroom
r(r_6). %  backyard
r(r_7). %  garden
r(r_8). %  shed
r(r_1). %  pantry
r(r_4). %  bathroom
d(d_0). %  frosted-glass door
d(d_1). %  screen door
d(d_2). %  wooden door
c(c_0). % conventional fridge
c(c_1). % metallic toolbox
oven(oven_0). % conventional oven
s(s_0). % massive table
s(s_1). % vast counter
s(s_2). % wooden shelf
s(s_3). % large bed
s(s_4). % white toilet
s(s_5). % stylish patio chair
s(s_6). % wooden workbench
s(s_7). % comfy sofa
s(s_8). % stylish patio table
stove(stove_0). % conventional stove
toaster(toaster_0). % recent BBQ
f(f_0). %  green bell pepper
f(f_1). %  red tuna
f(f_2). %  chicken breast
f(f_10). %  white onion
f(f_13). %  block of cheese
f(f_14). %  yellow bell pepper
f(f_3). %  chicken leg
f(f_4). %  green apple
f(f_6). %  red hot pepper
f(f_7). %  red onion
f(f_9). %  red potato
f(f_12). %  cilantro
f(f_11). %  water
f(f_5). %  black pepper
f(f_8). %  salt
meal(meal_0). %  meal
slot(slot_7).
slot(slot_8).
slot(slot_9).
ingredient(ingredient_2).
ingredient(ingredient_0).
ingredient(ingredient_1).
recipe(recipe).
o(o_0). % interesting cookbook
o(o_1). % sharp knife
slot(slot_0).
slot(slot_1).
slot(slot_2).
slot(slot_3).
slot(slot_4).
slot(slot_5).
slot(slot_6).

% ======= Facts =======
cookable(f_0). % cookable(green bell pepper: f)
cookable(f_1). % cookable(red tuna: f)
cookable(f_10). % cookable(white onion: f)
cookable(f_13). % cookable(block of cheese: f)
cookable(f_14). % cookable(yellow bell pepper: f)
cookable(f_2). % cookable(chicken breast: f)
cookable(f_3). % cookable(chicken leg: f)
cookable(f_4). % cookable(green apple: f)
cookable(f_6). % cookable(red hot pepper: f)
cookable(f_7). % cookable(red onion: f)
cookable(f_9). % cookable(red potato: f)
cuttable(f_0). % cuttable(green bell pepper: f)
cuttable(f_1). % cuttable(red tuna: f)
cuttable(f_10). % cuttable(white onion: f)
cuttable(f_12). % cuttable(cilantro: f)
cuttable(f_13). % cuttable(block of cheese: f)
cuttable(f_14). % cuttable(yellow bell pepper: f)
cuttable(f_4). % cuttable(green apple: f)
cuttable(f_6). % cuttable(red hot pepper: f)
cuttable(f_7). % cuttable(red onion: f)
cuttable(f_9). % cuttable(red potato: f)
_east_of(r_2, r_3). % east_of(livingroom: r, corridor: r)
_east_of(r_3, r_5). % east_of(corridor: r, bedroom: r)
_east_of(r_6, r_7). % east_of(backyard: r, garden: r)
_east_of(r_8, r_6). % east_of(shed: r, backyard: r)
_north_of(r_0, r_2). % north_of(kitchen: r, livingroom: r)
_north_of(r_1, r_0). % north_of(pantry: r, kitchen: r)
_north_of(r_3, r_6). % north_of(corridor: r, backyard: r)
_north_of(r_4, r_3). % north_of(bathroom: r, corridor: r)
sharp(o_1). % sharp(knife: o)
_south_of(r_0, r_1). % south_of(kitchen: r, pantry: r)
_south_of(r_2, r_0). % south_of(livingroom: r, kitchen: r)
_south_of(r_3, r_4). % south_of(corridor: r, bathroom: r)
_south_of(r_6, r_3). % south_of(backyard: r, corridor: r)
_west_of(r_3, r_2). % west_of(corridor: r, livingroom: r)
_west_of(r_5, r_3). % west_of(bedroom: r, corridor: r)
_west_of(r_6, r_8). % west_of(backyard: r, shed: r)
_west_of(r_7, r_6). % west_of(garden: r, backyard: r)


% ------- initial fluents (initialized with t=0) -------
#program initial_state(t).

cooked(f_0, t). % cooked(green bell pepper: f)
cooked(f_1, t). % cooked(red tuna: f)
cooked(f_2, t). % cooked(chicken breast: f)
drinkable(f_11, t). % drinkable(water: f)
edible(f_0, t). % edible(green bell pepper: f)
edible(f_1, t). % edible(red tuna: f)
edible(f_10, t). % edible(white onion: f)
edible(f_12, t). % edible(cilantro: f)
edible(f_13, t). % edible(block of cheese: f)
edible(f_14, t). % edible(yellow bell pepper: f)
edible(f_2, t). % edible(chicken breast: f)
edible(f_4, t). % edible(green apple: f)
edible(f_5, t). % edible(black pepper: f)
edible(f_6, t). % edible(red hot pepper: f)
edible(f_7, t). % edible(red onion: f)
edible(f_8, t). % edible(salt: f)
edible(meal_0, t). % edible(meal)
%free(slot_7, t). % free(slot_7: slot)
%free(slot_8, t). % free(slot_8: slot)
%free(slot_9, t). % free(slot_9: slot)
cooked_state(f_1, fried, t). % fried(red tuna: f)
cooked_state(f_0, grilled, t). % grilled(green bell pepper: f)
cooked_state(f_2, grilled, t). % grilled(chicken breast: f)
in(f_0, inventory, t). % in(green bell pepper: f, I)
in(f_1, inventory, t). % in(red tuna: f, I)
in(f_2, inventory, t). % in(chicken breast: f, I)
in(f_3, inventory, t). % in(chicken leg: f, I)
in(f_4, inventory, t). % in(green apple: f, I)
in(f_5, inventory, t). % in(black pepper: f, I)
in(f_6, inventory, t). % in(red hot pepper: f, I)
inedible(f_11, t). % inedible(water: f)
inedible(f_3, t). % inedible(chicken leg: f)
inedible(f_9, t). % inedible(red potato: f)
cooked_state(f_3, needs_cooking, t). % needs_cooking(chicken leg: f)
cooked_state(f_9, needs_cooking, t). % needs_cooking(red potato: f)
open(c_0, t). % open(fridge: c)
open(c_1, t). % open(toolbox: c)
open(d_0, t). % open(frosted-glass door: d)
open(d_1, t). % open(screen door: d)
open(d_2, t). % open(wooden door: d)
cooked_state(f_10, raw, t). % raw(white onion: f)
cooked_state(f_13, raw, t). % raw(block of cheese: f)
cooked_state(f_14, raw, t). % raw(yellow bell pepper: f)
cooked_state(f_4, raw, t). % raw(green apple: f)
cooked_state(f_6, raw, t). % raw(red hot pepper: f)
cooked_state(f_7, raw, t). % raw(red onion: f)
cut_state(f_0, uncut, t). % uncut(green bell pepper: f)
cut_state(f_1, uncut, t). % uncut(red tuna: f)
cut_state(f_10, uncut, t). % uncut(white onion: f)
cut_state(f_12, uncut, t). % uncut(cilantro: f)
cut_state(f_13, uncut, t). % uncut(block of cheese: f)
cut_state(f_14, uncut, t). % uncut(yellow bell pepper: f)
cut_state(f_4, uncut, t). % uncut(green apple: f)
cut_state(f_6, uncut, t). % uncut(red hot pepper: f)
cut_state(f_7, uncut, t). % uncut(red onion: f)
cut_state(f_9, uncut, t). % uncut(red potato: f)
used(slot_0, t). % used(slot_0: slot)
used(slot_1, t). % used(slot_1: slot)
used(slot_2, t). % used(slot_2: slot)
used(slot_3, t). % used(slot_3: slot)
used(slot_4, t). % used(slot_4: slot)
used(slot_5, t). % used(slot_5: slot)
used(slot_6, t). % used(slot_6: slot)


% ------- Recipe -------
#program recipe(t).

base(f_0, ingredient_1). % base(green bell pepper: f, ingredient_1: ingredient)
base(f_1, ingredient_2). % base(red tuna: f, ingredient_2: ingredient)
base(f_2, ingredient_0). % base(chicken breast: f, ingredient_0: ingredient)
cooking_location(r_0, recipe). % cooking_location(kitchen: r, RECIPE)
should_cook(ingredient_2, fried). % fried(ingredient_2: ingredient)
should_cook(ingredient_0, grilled). % grilled(ingredient_0: ingredient)
should_cook(ingredient_1, grilled). % grilled(ingredient_1: ingredient)
in(ingredient_0, recipe). % in(ingredient_0: ingredient, RECIPE)
in(ingredient_1, recipe). % in(ingredient_1: ingredient, RECIPE)
in(ingredient_2, recipe). % in(ingredient_2: ingredient, RECIPE)
ingredient_1(f_2). % ingredient_1(chicken breast: f)
ingredient_2(f_0). % ingredient_2(green bell pepper: f)
ingredient_3(f_1). % ingredient_3(red tuna: f)
out(meal_0, recipe). % out(meal, RECIPE)
should_cut(ingredient_1, sliced). % sliced(ingredient_1: ingredient)
should_cut(ingredient_2, sliced). % sliced(ingredient_2: ingredient)
should_cut(ingredient_0, uncut). % uncut(ingredient_0: ingredient)

in_recipe(I,F) :- ingredient(I), in(I,recipe), base(F,I), instance_of(F,f).
in_recipe(F) :- in_recipe(I,F).


% ------- ROOM fluents -------

#program initial_room(t).
at(player, r_0, t). % at(P, kitchen: r)
room_changed(nowhere,r_0,t).

#program room_r_0(t).
%free(r_0, r_1, t). % free(kitchen: r, pantry: r)
%free(r_0, r_2, t). % free(kitchen: r, livingroom: r)
link(r_0, d_0, unknownN). % link(kitchen: r, frosted-glass door: d, pantry: r)
north_of(unknownN, r_0). % north_of(pantry: r, kitchen: r)
south_of(unknownS, r_0). % south_of(livingroom: r, kitchen: r)
at(c_0, r_0, t). % at(fridge: c, kitchen: r)
at(oven_0, r_0, t). % at(oven, kitchen: r)
at(s_0, r_0, t). % at(table: s, kitchen: r)
at(s_1, r_0, t). % at(counter: s, kitchen: r)
at(stove_0, r_0, t). % at(stove, kitchen: r)
in(f_10, c_0, t). % in(white onion: f, fridge: c)
in(f_11, c_0, t). % in(water: f, fridge: c)
in(f_12, c_0, t). % in(cilantro: f, fridge: c)
in(f_13, c_0, t). % in(block of cheese: f, fridge: c)
in(f_14, c_0, t). % in(yellow bell pepper: f, fridge: c)
in(f_7, c_0, t). % in(red onion: f, fridge: c)
on(f_9, s_1, t). % on(red potato: f, counter: s)
on(o_0, s_0, t). % on(cookbook: o, table: s)
on(o_1, s_0, t). % on(knife: o, table: s)

#program room_r_1(t).
%free(r_1, r_0, t). % free(pantry: r, kitchen: r)
link(r_1, d_0, unknownS). % link(pantry: r, frosted-glass door: d, kitchen: r)
south_of(unknownS, r_1). % south_of(kitchen: r, pantry: r)
at(s_2, r_1, t). % at(shelf: s, pantry: r)
on(f_8, s_2, t). % on(salt: f, shelf: s)

#program room_r_2(t).
%free(r_2, r_0, t). % free(livingroom: r, kitchen: r)
%free(r_2, r_3, t). % free(livingroom: r, corridor: r)
north_of(unknownN, r_2). % north_of(kitchen: r, livingroom: r)
west_of(unknownW, r_2). % west_of(corridor: r, livingroom: r)
at(s_7, r_2, t). % at(sofa: s, livingroom: r)

#program room_r_3(t).
east_of(unknownE, r_3). % east_of(livingroom: r, corridor: r)
%free(r_3, r_2, t). % free(corridor: r, livingroom: r)
%free(r_3, r_4, t). % free(corridor: r, bathroom: r)
%free(r_3, r_5, t). % free(corridor: r, bedroom: r)
%free(r_3, r_6, t). % free(corridor: r, backyard: r)
link(r_3, d_1, unknownS). % link(corridor: r, screen door: d, backyard: r)
north_of(unknownN, r_3). % north_of(bathroom: r, corridor: r)
south_of(unknownS, r_3). % south_of(backyard: r, corridor: r)
west_of(unknownW, r_3). % west_of(bedroom: r, corridor: r)

#program room_r_4(t).
%free(r_4, r_3, t). % free(bathroom: r, corridor: r)
south_of(unknownS, r_4). % south_of(corridor: r, bathroom: r)
at(s_4, r_4, t). % at(toilet: s, bathroom: r)

#program room_r_5(t).
east_of(unknownE, r_5). % east_of(corridor: r, bedroom: r)
%free(r_5, r_3, t). % free(bedroom: r, corridor: r)
at(s_3, r_5, t). % at(bed: s, bedroom: r)

#program room_r_6(t).
east_of(unknownE, r_6). % east_of(shed: r, backyard: r)
%free(r_6, r_3, t). % free(backyard: r, corridor: r)
%free(r_6, r_7, t). % free(backyard: r, garden: r)
%free(r_6, r_8, t). % free(backyard: r, shed: r)
link(r_6, d_1, unknownN). % link(backyard: r, screen door: d, corridor: r)
link(r_6, d_2, unknownE). % link(backyard: r, wooden door: d, shed: r)
north_of(unknownN, r_6). % north_of(corridor: r, backyard: r)
west_of(unknownW, r_6). % west_of(garden: r, backyard: r)
at(s_5, r_6, t). % at(patio chair: s, backyard: r)
at(s_8, r_6, t). % at(patio table: s, backyard: r)
at(toaster_0, r_6, t). % at(BBQ: toaster, backyard: r)

#program room_r_7(t).
east_of(unknownE, r_7). % east_of(backyard: r, garden: r)
%free(r_7, r_6, t). % free(garden: r, backyard: r)

#program room_r_8(t).
%free(r_8, r_6, t). % free(shed: r, backyard: r)
link(r_8, d_2, unknownW). % link(shed: r, wooden door: d, backyard: r)
west_of(unknownW, r_8). % west_of(backyard: r, shed: r)
at(c_1, r_8, t). % at(toolbox: c, shed: r)
at(s_6, r_8, t). % at(workbench: s, shed: r)

