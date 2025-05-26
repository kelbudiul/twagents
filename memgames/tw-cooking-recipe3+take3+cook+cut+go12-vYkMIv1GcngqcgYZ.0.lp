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
r(r_9). %  driveway
r(r_11). %  supermarket
r(r_4). %  corridor
r(r_3). %  bedroom
r(r_5). %  bathroom
r(r_6). %  backyard
r(r_8). %  garden
r(r_1). %  pantry
r(r_2). %  livingroom
r(r_7). %  shed
d(d_0). %  plain door
d(d_1). %  screen door
d(d_4). %  commercial glass door
d(d_3). %  fiberglass door
d(d_2). %  wooden door
c(c_0). % conventional fridge
f(f_10). %  red bell pepper
oven(oven_0). % conventional oven
s(s_0). % massive table
s(s_1). % vast counter
s(s_2). % wooden shelf
s(s_3). % metallic showcase
s(s_4). % white toilet
s(s_5). % stylish patio table
s(s_6). % comfy sofa
stove(stove_0). % conventional stove
toaster(toaster_0). % recent BBQ
f(f_0). %  salt
f(f_1). %  yellow potato
f(f_2). %  red apple
f(f_11). %  chicken breast
f(f_3). %  red hot pepper
f(f_4). %  green apple
f(f_5). %  yellow bell pepper
f(f_6). %  red potato
f(f_7). %  banana
f(f_8). %  block of cheese
ingredient(ingredient_0).
f(f_9). %  water
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
ingredient(ingredient_2).
recipe(recipe).
ingredient(ingredient_1).
o(o_0). % interesting cookbook
o(o_1). % sharp knife

% ======= Facts =======
cookable(f_1). % cookable(yellow potato: f)
cookable(f_10). % cookable(red bell pepper: f)
cookable(f_11). % cookable(chicken breast: f)
cookable(f_2). % cookable(red apple: f)
cookable(f_3). % cookable(red hot pepper: f)
cookable(f_4). % cookable(green apple: f)
cookable(f_5). % cookable(yellow bell pepper: f)
cookable(f_6). % cookable(red potato: f)
cookable(f_7). % cookable(banana: f)
cookable(f_8). % cookable(block of cheese: f)
cuttable(f_1). % cuttable(yellow potato: f)
cuttable(f_10). % cuttable(red bell pepper: f)
cuttable(f_2). % cuttable(red apple: f)
cuttable(f_3). % cuttable(red hot pepper: f)
cuttable(f_4). % cuttable(green apple: f)
cuttable(f_5). % cuttable(yellow bell pepper: f)
cuttable(f_6). % cuttable(red potato: f)
cuttable(f_7). % cuttable(banana: f)
cuttable(f_8). % cuttable(block of cheese: f)
_east_of(r_10, r_9). % east_of(street: r, driveway: r)
_east_of(r_11, r_10). % east_of(supermarket: r, street: r)
_east_of(r_4, r_3). % east_of(corridor: r, bedroom: r)
_east_of(r_5, r_4). % east_of(bathroom: r, corridor: r)
_east_of(r_6, r_0). % east_of(backyard: r, kitchen: r)
_east_of(r_8, r_6). % east_of(garden: r, backyard: r)
_north_of(r_0, r_1). % north_of(kitchen: r, pantry: r)
_north_of(r_2, r_0). % north_of(livingroom: r, kitchen: r)
_north_of(r_3, r_2). % north_of(bedroom: r, livingroom: r)
_north_of(r_4, r_9). % north_of(corridor: r, driveway: r)
_north_of(r_6, r_7). % north_of(backyard: r, shed: r)
sharp(o_1). % sharp(knife: o)
_south_of(r_0, r_2). % south_of(kitchen: r, livingroom: r)
_south_of(r_1, r_0). % south_of(pantry: r, kitchen: r)
_south_of(r_2, r_3). % south_of(livingroom: r, bedroom: r)
_south_of(r_7, r_6). % south_of(shed: r, backyard: r)
_south_of(r_9, r_4). % south_of(driveway: r, corridor: r)
_west_of(r_0, r_6). % west_of(kitchen: r, backyard: r)
_west_of(r_10, r_11). % west_of(street: r, supermarket: r)
_west_of(r_3, r_4). % west_of(bedroom: r, corridor: r)
_west_of(r_4, r_5). % west_of(corridor: r, bathroom: r)
_west_of(r_6, r_8). % west_of(backyard: r, garden: r)
_west_of(r_9, r_10). % west_of(driveway: r, street: r)


% ------- initial fluents (initialized with t=0) -------
#program initial_state(t).

drinkable(f_9, t). % drinkable(water: f)
edible(f_0, t). % edible(salt: f)
edible(f_10, t). % edible(red bell pepper: f)
edible(f_2, t). % edible(red apple: f)
edible(f_3, t). % edible(red hot pepper: f)
edible(f_4, t). % edible(green apple: f)
edible(f_5, t). % edible(yellow bell pepper: f)
edible(f_7, t). % edible(banana: f)
edible(f_8, t). % edible(block of cheese: f)
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
inedible(f_1, t). % inedible(yellow potato: f)
inedible(f_11, t). % inedible(chicken breast: f)
inedible(f_6, t). % inedible(red potato: f)
inedible(f_9, t). % inedible(water: f)
cooked_state(f_1, needs_cooking, t). % needs_cooking(yellow potato: f)
cooked_state(f_11, needs_cooking, t). % needs_cooking(chicken breast: f)
cooked_state(f_6, needs_cooking, t). % needs_cooking(red potato: f)
open(c_0, t). % open(fridge: c)
open(d_0, t). % open(plain door: d)
open(d_1, t). % open(screen door: d)
open(d_2, t). % open(wooden door: d)
open(d_3, t). % open(fiberglass door: d)
open(d_4, t). % open(commercial glass door: d)
cooked_state(f_10, raw, t). % raw(red bell pepper: f)
cooked_state(f_2, raw, t). % raw(red apple: f)
cooked_state(f_3, raw, t). % raw(red hot pepper: f)
cooked_state(f_4, raw, t). % raw(green apple: f)
cooked_state(f_5, raw, t). % raw(yellow bell pepper: f)
cooked_state(f_7, raw, t). % raw(banana: f)
cooked_state(f_8, raw, t). % raw(block of cheese: f)
cut_state(f_1, uncut, t). % uncut(yellow potato: f)
cut_state(f_10, uncut, t). % uncut(red bell pepper: f)
cut_state(f_2, uncut, t). % uncut(red apple: f)
cut_state(f_3, uncut, t). % uncut(red hot pepper: f)
cut_state(f_4, uncut, t). % uncut(green apple: f)
cut_state(f_5, uncut, t). % uncut(yellow bell pepper: f)
cut_state(f_6, uncut, t). % uncut(red potato: f)
cut_state(f_7, uncut, t). % uncut(banana: f)
cut_state(f_8, uncut, t). % uncut(block of cheese: f)


% ------- Recipe -------
#program recipe(t).

base(f_0, ingredient_1). % base(salt: f, ingredient_1: ingredient)
base(f_1, ingredient_2). % base(yellow potato: f, ingredient_2: ingredient)
base(f_2, ingredient_0). % base(red apple: f, ingredient_0: ingredient)
cooking_location(r_0, recipe). % cooking_location(kitchen: r, RECIPE)
should_cut(ingredient_0, diced). % diced(ingredient_0: ingredient)
should_cook(ingredient_2, grilled). % grilled(ingredient_2: ingredient)
in(ingredient_0, recipe). % in(ingredient_0: ingredient, RECIPE)
in(ingredient_1, recipe). % in(ingredient_1: ingredient, RECIPE)
in(ingredient_2, recipe). % in(ingredient_2: ingredient, RECIPE)
ingredient_1(f_2). % ingredient_1(red apple: f)
ingredient_2(f_0). % ingredient_2(salt: f)
ingredient_3(f_1). % ingredient_3(yellow potato: f)
out(meal_0, recipe). % out(meal, RECIPE)
should_cook(ingredient_1, raw). % raw(ingredient_1: ingredient)
should_cook(ingredient_0, roasted). % roasted(ingredient_0: ingredient)
should_cut(ingredient_1, uncut). % uncut(ingredient_1: ingredient)
should_cut(ingredient_2, uncut). % uncut(ingredient_2: ingredient)

in_recipe(I,F) :- ingredient(I), in(I,recipe), base(F,I), instance_of(F,f).
in_recipe(F) :- in_recipe(I,F).


% ------- ROOM fluents -------

#program initial_room(t).
at(player, r_9, t). % at(P, driveway: r)
room_changed(nowhere,r_9,t).

#program room_r_0(t).
east_of(unknownE, r_0). % east_of(backyard: r, kitchen: r)
%free(r_0, r_1, t). % free(kitchen: r, pantry: r)
%free(r_0, r_2, t). % free(kitchen: r, livingroom: r)
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
in(f_8, c_0, t). % in(block of cheese: f, fridge: c)
on(f_1, s_1, t). % on(yellow potato: f, counter: s)
on(f_2, s_1, t). % on(red apple: f, counter: s)
on(f_3, s_1, t). % on(red hot pepper: f, counter: s)
on(f_4, s_1, t). % on(green apple: f, counter: s)
on(f_5, s_1, t). % on(yellow bell pepper: f, counter: s)
on(f_6, s_1, t). % on(red potato: f, counter: s)
on(f_7, s_1, t). % on(banana: f, counter: s)
on(o_0, s_0, t). % on(cookbook: o, table: s)
on(o_1, s_0, t). % on(knife: o, table: s)

#program room_r_1(t).
%free(r_1, r_0, t). % free(pantry: r, kitchen: r)
link(r_1, d_0, unknownN). % link(pantry: r, plain door: d, kitchen: r)
north_of(unknownN, r_1). % north_of(kitchen: r, pantry: r)
at(s_2, r_1, t). % at(shelf: s, pantry: r)
on(f_0, s_2, t). % on(salt: f, shelf: s)

#program room_r_10(t).
east_of(unknownE, r_10). % east_of(supermarket: r, street: r)
%free(r_10, r_11, t). % free(street: r, supermarket: r)
%free(r_10, r_9, t). % free(street: r, driveway: r)
link(r_10, d_4, unknownE). % link(street: r, commercial glass door: d, supermarket: r)
west_of(unknownW, r_10). % west_of(driveway: r, street: r)

#program room_r_11(t).
%free(r_11, r_10, t). % free(supermarket: r, street: r)
link(r_11, d_4, unknownW). % link(supermarket: r, commercial glass door: d, street: r)
west_of(unknownW, r_11). % west_of(street: r, supermarket: r)
at(s_3, r_11, t). % at(showcase: s, supermarket: r)
on(f_11, s_3, t). % on(chicken breast: f, showcase: s)
on(f_9, s_3, t). % on(water: f, showcase: s)

#program room_r_2(t).
%free(r_2, r_0, t). % free(livingroom: r, kitchen: r)
%free(r_2, r_3, t). % free(livingroom: r, bedroom: r)
north_of(unknownN, r_2). % north_of(bedroom: r, livingroom: r)
south_of(unknownS, r_2). % south_of(kitchen: r, livingroom: r)
at(s_6, r_2, t). % at(sofa: s, livingroom: r)

#program room_r_3(t).
east_of(unknownE, r_3). % east_of(corridor: r, bedroom: r)
%free(r_3, r_2, t). % free(bedroom: r, livingroom: r)
%free(r_3, r_4, t). % free(bedroom: r, corridor: r)
south_of(unknownS, r_3). % south_of(livingroom: r, bedroom: r)

#program room_r_4(t).
east_of(unknownE, r_4). % east_of(bathroom: r, corridor: r)
%free(r_4, r_3, t). % free(corridor: r, bedroom: r)
%free(r_4, r_5, t). % free(corridor: r, bathroom: r)
%free(r_4, r_9, t). % free(corridor: r, driveway: r)
link(r_4, d_3, unknownS). % link(corridor: r, fiberglass door: d, driveway: r)
south_of(unknownS, r_4). % south_of(driveway: r, corridor: r)
west_of(unknownW, r_4). % west_of(bedroom: r, corridor: r)

#program room_r_5(t).
%free(r_5, r_4, t). % free(bathroom: r, corridor: r)
west_of(unknownW, r_5). % west_of(corridor: r, bathroom: r)
at(s_4, r_5, t). % at(toilet: s, bathroom: r)

#program room_r_6(t).
east_of(unknownE, r_6). % east_of(garden: r, backyard: r)
%free(r_6, r_0, t). % free(backyard: r, kitchen: r)
%free(r_6, r_7, t). % free(backyard: r, shed: r)
%free(r_6, r_8, t). % free(backyard: r, garden: r)
link(r_6, d_1, unknownW). % link(backyard: r, screen door: d, kitchen: r)
link(r_6, d_2, unknownS). % link(backyard: r, wooden door: d, shed: r)
south_of(unknownS, r_6). % south_of(shed: r, backyard: r)
west_of(unknownW, r_6). % west_of(kitchen: r, backyard: r)
at(s_5, r_6, t). % at(patio table: s, backyard: r)
at(toaster_0, r_6, t). % at(BBQ: toaster, backyard: r)

#program room_r_7(t).
%free(r_7, r_6, t). % free(shed: r, backyard: r)
link(r_7, d_2, unknownN). % link(shed: r, wooden door: d, backyard: r)
north_of(unknownN, r_7). % north_of(backyard: r, shed: r)

#program room_r_8(t).
%free(r_8, r_6, t). % free(garden: r, backyard: r)
west_of(unknownW, r_8). % west_of(backyard: r, garden: r)
at(f_10, r_8, t). % at(red bell pepper: f, garden: r)

#program room_r_9(t).
east_of(unknownE, r_9). % east_of(street: r, driveway: r)
%free(r_9, r_10, t). % free(driveway: r, street: r)
%free(r_9, r_4, t). % free(driveway: r, corridor: r)
link(r_9, d_3, unknownN). % link(driveway: r, fiberglass door: d, corridor: r)
north_of(unknownN, r_9). % north_of(corridor: r, driveway: r)

