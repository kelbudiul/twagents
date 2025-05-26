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
r(r_10). %  street
r(r_11). %  supermarket
r(r_2). %  bedroom
r(r_3). %  corridor
r(r_9). %  driveway
r(r_6). %  backyard
r(r_1). %  livingroom
r(r_4). %  bathroom
r(r_5). %  pantry
r(r_7). %  garden
r(r_8). %  shed
d(d_0). %  plain door
d(d_1). %  screen door
d(d_4). %  sliding door
d(d_3). %  fiberglass door
d(d_2). %  wooden door
c(c_0). % conventional fridge
c(c_1). % metallic toolbox
oven(oven_0). % conventional oven
s(s_0). % massive table
s(s_1). % vast counter
s(s_2). % wooden shelf
s(s_3). % metallic showcase
s(s_4). % stylish patio table
s(s_5). % comfy sofa
s(s_6). % wooden workbench
s(s_7). % large bed
s(s_8). % stylish patio chair
s(s_9). % white toilet
stove(stove_0). % conventional stove
toaster(toaster_0). % recent BBQ
f(f_0). %  purple potato
f(f_1). %  salt
f(f_2). %  olive oil
f(f_4). %  yellow potato
f(f_5). %  red tuna
f(f_6). %  white onion
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
ingredient(ingredient_1).
ingredient(ingredient_0).
recipe(recipe).
ingredient(ingredient_2).
f(f_3). %  vegetable oil
o(o_0). % interesting cookbook
o(o_1). % sharp knife

% ======= Facts =======
cookable(f_0). % cookable(purple potato: f)
cookable(f_4). % cookable(yellow potato: f)
cookable(f_5). % cookable(red tuna: f)
cookable(f_6). % cookable(white onion: f)
cuttable(f_0). % cuttable(purple potato: f)
cuttable(f_4). % cuttable(yellow potato: f)
cuttable(f_5). % cuttable(red tuna: f)
cuttable(f_6). % cuttable(white onion: f)
_east_of(r_10, r_11). % east_of(street: r, supermarket: r)
_east_of(r_2, r_3). % east_of(bedroom: r, corridor: r)
_east_of(r_3, r_9). % east_of(corridor: r, driveway: r)
_east_of(r_6, r_0). % east_of(backyard: r, kitchen: r)
_north_of(r_0, r_5). % north_of(kitchen: r, pantry: r)
_north_of(r_1, r_0). % north_of(livingroom: r, kitchen: r)
_north_of(r_2, r_1). % north_of(bedroom: r, livingroom: r)
_north_of(r_3, r_4). % north_of(corridor: r, bathroom: r)
_north_of(r_6, r_8). % north_of(backyard: r, shed: r)
_north_of(r_7, r_6). % north_of(garden: r, backyard: r)
_north_of(r_9, r_10). % north_of(driveway: r, street: r)
sharp(o_1). % sharp(knife: o)
_south_of(r_0, r_1). % south_of(kitchen: r, livingroom: r)
_south_of(r_1, r_2). % south_of(livingroom: r, bedroom: r)
_south_of(r_10, r_9). % south_of(street: r, driveway: r)
_south_of(r_4, r_3). % south_of(bathroom: r, corridor: r)
_south_of(r_5, r_0). % south_of(pantry: r, kitchen: r)
_south_of(r_6, r_7). % south_of(backyard: r, garden: r)
_south_of(r_8, r_6). % south_of(shed: r, backyard: r)
_west_of(r_0, r_6). % west_of(kitchen: r, backyard: r)
_west_of(r_11, r_10). % west_of(supermarket: r, street: r)
_west_of(r_3, r_2). % west_of(corridor: r, bedroom: r)
_west_of(r_9, r_3). % west_of(driveway: r, corridor: r)


% ------- initial fluents (initialized with t=0) -------
#program initial_state(t).

cooked(f_0, t). % cooked(purple potato: f)
cooked(f_1, t). % cooked(salt: f)
cooked(f_2, t). % cooked(olive oil: f)
edible(f_0, t). % edible(purple potato: f)
edible(f_1, t). % edible(salt: f)
edible(f_2, t). % edible(olive oil: f)
edible(f_6, t). % edible(white onion: f)
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
cooked_state(f_0, grilled, t). % grilled(purple potato: f)
inedible(f_3, t). % inedible(vegetable oil: f)
inedible(f_4, t). % inedible(yellow potato: f)
inedible(f_5, t). % inedible(red tuna: f)
cooked_state(f_4, needs_cooking, t). % needs_cooking(yellow potato: f)
cooked_state(f_5, needs_cooking, t). % needs_cooking(red tuna: f)
open(c_0, t). % open(fridge: c)
open(c_1, t). % open(toolbox: c)
open(d_0, t). % open(plain door: d)
open(d_1, t). % open(screen door: d)
open(d_2, t). % open(wooden door: d)
open(d_3, t). % open(fiberglass door: d)
open(d_4, t). % open(sliding door: d)
cooked_state(f_6, raw, t). % raw(white onion: f)
cut_state(f_0, uncut, t). % uncut(purple potato: f)
cut_state(f_4, uncut, t). % uncut(yellow potato: f)
cut_state(f_5, uncut, t). % uncut(red tuna: f)
cut_state(f_6, uncut, t). % uncut(white onion: f)


% ------- Recipe -------
#program recipe(t).

base(f_0, ingredient_1). % base(purple potato: f, ingredient_1: ingredient)
base(f_1, ingredient_2). % base(salt: f, ingredient_2: ingredient)
base(f_2, ingredient_0). % base(olive oil: f, ingredient_0: ingredient)
cooking_location(r_0, recipe). % cooking_location(kitchen: r, RECIPE)
should_cook(ingredient_1, grilled). % grilled(ingredient_1: ingredient)
in(ingredient_0, recipe). % in(ingredient_0: ingredient, RECIPE)
in(ingredient_1, recipe). % in(ingredient_1: ingredient, RECIPE)
in(ingredient_2, recipe). % in(ingredient_2: ingredient, RECIPE)
ingredient_1(f_2). % ingredient_1(olive oil: f)
ingredient_2(f_0). % ingredient_2(purple potato: f)
ingredient_3(f_1). % ingredient_3(salt: f)
out(meal_0, recipe). % out(meal, RECIPE)
should_cook(ingredient_0, raw). % raw(ingredient_0: ingredient)
should_cook(ingredient_2, raw). % raw(ingredient_2: ingredient)
should_cut(ingredient_0, uncut). % uncut(ingredient_0: ingredient)
should_cut(ingredient_1, uncut). % uncut(ingredient_1: ingredient)
should_cut(ingredient_2, uncut). % uncut(ingredient_2: ingredient)

in_recipe(I,F) :- ingredient(I), in(I,recipe), base(F,I), instance_of(F,f).
in_recipe(F) :- in_recipe(I,F).


% ------- ROOM fluents -------

#program initial_room(t).
at(player, r_4, t). % at(P, bathroom: r)
room_changed(nowhere,r_4,t).

#program room_r_0(t).
east_of(unknownE, r_0). % east_of(backyard: r, kitchen: r)
%free(r_0, r_1, t). % free(kitchen: r, livingroom: r)
%free(r_0, r_5, t). % free(kitchen: r, pantry: r)
%free(r_0, r_6, t). % free(kitchen: r, backyard: r)
link(r_0, d_0, unknownS). % link(kitchen: r, plain door: d, pantry: r)
link(r_0, d_1, unknownE). % link(kitchen: r, screen door: d, backyard: r)
north_of(unknownN, r_0). % north_of(livingroom: r, kitchen: r)
south_of(unknownS, r_0). % south_of(pantry: r, kitchen: r)
at(c_0, r_0, t). % at(fridge: c, kitchen: r)
at(oven_0, r_0, t). % at(oven, kitchen: r)
at(s_0, r_0, t). % at(table: s, kitchen: r)
at(s_1, r_0, t). % at(counter: s, kitchen: r)
at(stove_0, r_0, t). % at(stove, kitchen: r)
in(f_6, c_0, t). % in(white onion: f, fridge: c)
on(f_0, s_1, t). % on(purple potato: f, counter: s)
on(f_4, s_1, t). % on(yellow potato: f, counter: s)
on(o_0, s_0, t). % on(cookbook: o, table: s)
on(o_1, s_1, t). % on(knife: o, counter: s)

#program room_r_1(t).
%free(r_1, r_0, t). % free(livingroom: r, kitchen: r)
%free(r_1, r_2, t). % free(livingroom: r, bedroom: r)
north_of(unknownN, r_1). % north_of(bedroom: r, livingroom: r)
south_of(unknownS, r_1). % south_of(kitchen: r, livingroom: r)
at(s_5, r_1, t). % at(sofa: s, livingroom: r)

#program room_r_10(t).
%free(r_10, r_11, t). % free(street: r, supermarket: r)
%free(r_10, r_9, t). % free(street: r, driveway: r)
link(r_10, d_4, unknownW). % link(street: r, sliding door: d, supermarket: r)
north_of(unknownN, r_10). % north_of(driveway: r, street: r)
west_of(unknownW, r_10). % west_of(supermarket: r, street: r)

#program room_r_11(t).
east_of(unknownE, r_11). % east_of(street: r, supermarket: r)
%free(r_11, r_10, t). % free(supermarket: r, street: r)
link(r_11, d_4, unknownE). % link(supermarket: r, sliding door: d, street: r)
at(s_3, r_11, t). % at(showcase: s, supermarket: r)
on(f_5, s_3, t). % on(red tuna: f, showcase: s)

#program room_r_2(t).
%free(r_2, r_1, t). % free(bedroom: r, livingroom: r)
%free(r_2, r_3, t). % free(bedroom: r, corridor: r)
south_of(unknownS, r_2). % south_of(livingroom: r, bedroom: r)
west_of(unknownW, r_2). % west_of(corridor: r, bedroom: r)
at(s_7, r_2, t). % at(bed: s, bedroom: r)

#program room_r_3(t).
east_of(unknownE, r_3). % east_of(bedroom: r, corridor: r)
%free(r_3, r_2, t). % free(corridor: r, bedroom: r)
%free(r_3, r_4, t). % free(corridor: r, bathroom: r)
%free(r_3, r_9, t). % free(corridor: r, driveway: r)
link(r_3, d_3, unknownW). % link(corridor: r, fiberglass door: d, driveway: r)
south_of(unknownS, r_3). % south_of(bathroom: r, corridor: r)
west_of(unknownW, r_3). % west_of(driveway: r, corridor: r)

#program room_r_4(t).
%free(r_4, r_3, t). % free(bathroom: r, corridor: r)
north_of(unknownN, r_4). % north_of(corridor: r, bathroom: r)
at(s_9, r_4, t). % at(toilet: s, bathroom: r)

#program room_r_5(t).
%free(r_5, r_0, t). % free(pantry: r, kitchen: r)
link(r_5, d_0, unknownN). % link(pantry: r, plain door: d, kitchen: r)
north_of(unknownN, r_5). % north_of(kitchen: r, pantry: r)
at(s_2, r_5, t). % at(shelf: s, pantry: r)
on(f_1, s_2, t). % on(salt: f, shelf: s)
on(f_2, s_2, t). % on(olive oil: f, shelf: s)
on(f_3, s_2, t). % on(vegetable oil: f, shelf: s)

#program room_r_6(t).
%free(r_6, r_0, t). % free(backyard: r, kitchen: r)
%free(r_6, r_7, t). % free(backyard: r, garden: r)
%free(r_6, r_8, t). % free(backyard: r, shed: r)
link(r_6, d_1, unknownW). % link(backyard: r, screen door: d, kitchen: r)
link(r_6, d_2, unknownS). % link(backyard: r, wooden door: d, shed: r)
north_of(unknownN, r_6). % north_of(garden: r, backyard: r)
south_of(unknownS, r_6). % south_of(shed: r, backyard: r)
west_of(unknownW, r_6). % west_of(kitchen: r, backyard: r)
at(s_4, r_6, t). % at(patio table: s, backyard: r)
at(s_8, r_6, t). % at(patio chair: s, backyard: r)
at(toaster_0, r_6, t). % at(BBQ: toaster, backyard: r)

#program room_r_7(t).
%free(r_7, r_6, t). % free(garden: r, backyard: r)
south_of(unknownS, r_7). % south_of(backyard: r, garden: r)

#program room_r_8(t).
%free(r_8, r_6, t). % free(shed: r, backyard: r)
link(r_8, d_2, unknownN). % link(shed: r, wooden door: d, backyard: r)
north_of(unknownN, r_8). % north_of(backyard: r, shed: r)
at(c_1, r_8, t). % at(toolbox: c, shed: r)
at(s_6, r_8, t). % at(workbench: s, shed: r)

#program room_r_9(t).
east_of(unknownE, r_9). % east_of(corridor: r, driveway: r)
%free(r_9, r_10, t). % free(driveway: r, street: r)
%free(r_9, r_3, t). % free(driveway: r, corridor: r)
link(r_9, d_3, unknownE). % link(driveway: r, fiberglass door: d, corridor: r)
south_of(unknownS, r_9). % south_of(street: r, driveway: r)

