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
r(r_6). %  backyard
r(r_1). %  pantry
r(r_2). %  corridor
r(r_3). %  bedroom
r(r_5). %  bathroom
r(r_7). %  garden
r(r_4). %  livingroom
r(r_8). %  shed
d(d_0). %  frosted-glass door
d(d_1). %  screen door
d(d_2). %  barn door
c(c_0). % conventional fridge
oven(oven_0). % conventional oven
s(s_0). % massive table
s(s_1). % vast counter
s(s_2). % wooden shelf
s(s_3). % large bed
s(s_4). % stylish patio chair
s(s_5). % white toilet
s(s_6). % wooden workbench
s(s_7). % comfy sofa
stove(stove_0). % conventional stove
toaster(toaster_0). % recent BBQ
f(f_0). %  yellow onion
f(f_1). %  black pepper
f(f_2). %  green hot pepper
f(f_3). %  yellow apple
f(f_4). %  red onion
f(f_5). %  egg
f(f_6). %  red apple
f(f_7). %  white tuna
f(f_8). %  banana
ingredient(ingredient_1).
f(f_9). %  flour
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
o(o_0). % interesting cookbook
o(o_1). % sharp knife

% ======= Facts =======
cookable(f_0). % cookable(yellow onion: f)
cookable(f_2). % cookable(green hot pepper: f)
cookable(f_3). % cookable(yellow apple: f)
cookable(f_4). % cookable(red onion: f)
cookable(f_5). % cookable(egg: f)
cookable(f_6). % cookable(red apple: f)
cookable(f_7). % cookable(white tuna: f)
cookable(f_8). % cookable(banana: f)
cuttable(f_0). % cuttable(yellow onion: f)
cuttable(f_2). % cuttable(green hot pepper: f)
cuttable(f_3). % cuttable(yellow apple: f)
cuttable(f_4). % cuttable(red onion: f)
cuttable(f_6). % cuttable(red apple: f)
cuttable(f_7). % cuttable(white tuna: f)
cuttable(f_8). % cuttable(banana: f)
_east_of(r_0, r_6). % east_of(kitchen: r, backyard: r)
_east_of(r_1, r_0). % east_of(pantry: r, kitchen: r)
_east_of(r_2, r_3). % east_of(corridor: r, bedroom: r)
_east_of(r_5, r_2). % east_of(bathroom: r, corridor: r)
_east_of(r_6, r_7). % east_of(backyard: r, garden: r)
_north_of(r_0, r_2). % north_of(kitchen: r, corridor: r)
_north_of(r_4, r_0). % north_of(livingroom: r, kitchen: r)
_north_of(r_8, r_6). % north_of(shed: r, backyard: r)
sharp(o_1). % sharp(knife: o)
_south_of(r_0, r_4). % south_of(kitchen: r, livingroom: r)
_south_of(r_2, r_0). % south_of(corridor: r, kitchen: r)
_south_of(r_6, r_8). % south_of(backyard: r, shed: r)
_west_of(r_0, r_1). % west_of(kitchen: r, pantry: r)
_west_of(r_2, r_5). % west_of(corridor: r, bathroom: r)
_west_of(r_3, r_2). % west_of(bedroom: r, corridor: r)
_west_of(r_6, r_0). % west_of(backyard: r, kitchen: r)
_west_of(r_7, r_6). % west_of(garden: r, backyard: r)


% ------- initial fluents (initialized with t=0) -------
#program initial_state(t).

edible(f_0, t). % edible(yellow onion: f)
edible(f_1, t). % edible(black pepper: f)
edible(f_2, t). % edible(green hot pepper: f)
edible(f_3, t). % edible(yellow apple: f)
edible(f_4, t). % edible(red onion: f)
edible(f_6, t). % edible(red apple: f)
edible(f_8, t). % edible(banana: f)
edible(f_9, t). % edible(flour: f)
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
inedible(f_5, t). % inedible(egg: f)
inedible(f_7, t). % inedible(white tuna: f)
cooked_state(f_5, needs_cooking, t). % needs_cooking(egg: f)
cooked_state(f_7, needs_cooking, t). % needs_cooking(white tuna: f)
open(c_0, t). % open(fridge: c)
open(d_0, t). % open(frosted-glass door: d)
open(d_1, t). % open(screen door: d)
open(d_2, t). % open(barn door: d)
cooked_state(f_0, raw, t). % raw(yellow onion: f)
cooked_state(f_2, raw, t). % raw(green hot pepper: f)
cooked_state(f_3, raw, t). % raw(yellow apple: f)
cooked_state(f_4, raw, t). % raw(red onion: f)
cooked_state(f_6, raw, t). % raw(red apple: f)
cooked_state(f_8, raw, t). % raw(banana: f)
cut_state(f_0, uncut, t). % uncut(yellow onion: f)
cut_state(f_2, uncut, t). % uncut(green hot pepper: f)
cut_state(f_3, uncut, t). % uncut(yellow apple: f)
cut_state(f_4, uncut, t). % uncut(red onion: f)
cut_state(f_6, uncut, t). % uncut(red apple: f)
cut_state(f_7, uncut, t). % uncut(white tuna: f)
cut_state(f_8, uncut, t). % uncut(banana: f)


% ------- Recipe -------
#program recipe(t).

base(f_0, ingredient_1). % base(yellow onion: f, ingredient_1: ingredient)
base(f_1, ingredient_0). % base(black pepper: f, ingredient_0: ingredient)
cooking_location(r_0, recipe). % cooking_location(kitchen: r, RECIPE)
should_cut(ingredient_1, diced). % diced(ingredient_1: ingredient)
should_cook(ingredient_1, grilled). % grilled(ingredient_1: ingredient)
in(ingredient_0, recipe). % in(ingredient_0: ingredient, RECIPE)
in(ingredient_1, recipe). % in(ingredient_1: ingredient, RECIPE)
ingredient_1(f_1). % ingredient_1(black pepper: f)
ingredient_2(f_0). % ingredient_2(yellow onion: f)
out(meal_0, recipe). % out(meal, RECIPE)
should_cook(ingredient_0, raw). % raw(ingredient_0: ingredient)
should_cut(ingredient_0, uncut). % uncut(ingredient_0: ingredient)

in_recipe(I,F) :- ingredient(I), in(I,recipe), base(F,I), instance_of(F,f).
in_recipe(F) :- in_recipe(I,F).


% ------- ROOM fluents -------

#program initial_room(t).
at(player, r_0, t). % at(P, kitchen: r)
room_changed(nowhere,r_0,t).

#program room_r_0(t).
east_of(unknownE, r_0). % east_of(pantry: r, kitchen: r)
%free(r_0, r_1, t). % free(kitchen: r, pantry: r)
%free(r_0, r_2, t). % free(kitchen: r, corridor: r)
%free(r_0, r_4, t). % free(kitchen: r, livingroom: r)
%free(r_0, r_6, t). % free(kitchen: r, backyard: r)
link(r_0, d_0, unknownE). % link(kitchen: r, frosted-glass door: d, pantry: r)
link(r_0, d_1, unknownW). % link(kitchen: r, screen door: d, backyard: r)
north_of(unknownN, r_0). % north_of(livingroom: r, kitchen: r)
south_of(unknownS, r_0). % south_of(corridor: r, kitchen: r)
west_of(unknownW, r_0). % west_of(backyard: r, kitchen: r)
at(c_0, r_0, t). % at(fridge: c, kitchen: r)
at(oven_0, r_0, t). % at(oven, kitchen: r)
at(s_0, r_0, t). % at(table: s, kitchen: r)
at(s_1, r_0, t). % at(counter: s, kitchen: r)
at(stove_0, r_0, t). % at(stove, kitchen: r)
in(f_0, c_0, t). % in(yellow onion: f, fridge: c)
in(f_3, c_0, t). % in(yellow apple: f, fridge: c)
in(f_4, c_0, t). % in(red onion: f, fridge: c)
in(f_5, c_0, t). % in(egg: f, fridge: c)
in(f_7, c_0, t). % in(white tuna: f, fridge: c)
on(f_6, s_1, t). % on(red apple: f, counter: s)
on(f_8, s_1, t). % on(banana: f, counter: s)
on(o_0, s_1, t). % on(cookbook: o, counter: s)
on(o_1, s_0, t). % on(knife: o, table: s)

#program room_r_1(t).
%free(r_1, r_0, t). % free(pantry: r, kitchen: r)
link(r_1, d_0, unknownW). % link(pantry: r, frosted-glass door: d, kitchen: r)
west_of(unknownW, r_1). % west_of(kitchen: r, pantry: r)
at(s_2, r_1, t). % at(shelf: s, pantry: r)
on(f_1, s_2, t). % on(black pepper: f, shelf: s)
on(f_2, s_2, t). % on(green hot pepper: f, shelf: s)
on(f_9, s_2, t). % on(flour: f, shelf: s)

#program room_r_2(t).
east_of(unknownE, r_2). % east_of(bathroom: r, corridor: r)
%free(r_2, r_0, t). % free(corridor: r, kitchen: r)
%free(r_2, r_3, t). % free(corridor: r, bedroom: r)
%free(r_2, r_5, t). % free(corridor: r, bathroom: r)
north_of(unknownN, r_2). % north_of(kitchen: r, corridor: r)
west_of(unknownW, r_2). % west_of(bedroom: r, corridor: r)

#program room_r_3(t).
east_of(unknownE, r_3). % east_of(corridor: r, bedroom: r)
%free(r_3, r_2, t). % free(bedroom: r, corridor: r)
at(s_3, r_3, t). % at(bed: s, bedroom: r)

#program room_r_4(t).
%free(r_4, r_0, t). % free(livingroom: r, kitchen: r)
south_of(unknownS, r_4). % south_of(kitchen: r, livingroom: r)
at(s_7, r_4, t). % at(sofa: s, livingroom: r)

#program room_r_5(t).
%free(r_5, r_2, t). % free(bathroom: r, corridor: r)
west_of(unknownW, r_5). % west_of(corridor: r, bathroom: r)
at(s_5, r_5, t). % at(toilet: s, bathroom: r)

#program room_r_6(t).
east_of(unknownE, r_6). % east_of(kitchen: r, backyard: r)
%free(r_6, r_0, t). % free(backyard: r, kitchen: r)
%free(r_6, r_7, t). % free(backyard: r, garden: r)
%free(r_6, r_8, t). % free(backyard: r, shed: r)
link(r_6, d_1, unknownE). % link(backyard: r, screen door: d, kitchen: r)
link(r_6, d_2, unknownN). % link(backyard: r, barn door: d, shed: r)
north_of(unknownN, r_6). % north_of(shed: r, backyard: r)
west_of(unknownW, r_6). % west_of(garden: r, backyard: r)
at(s_4, r_6, t). % at(patio chair: s, backyard: r)
at(toaster_0, r_6, t). % at(BBQ: toaster, backyard: r)

#program room_r_7(t).
east_of(unknownE, r_7). % east_of(backyard: r, garden: r)
%free(r_7, r_6, t). % free(garden: r, backyard: r)

#program room_r_8(t).
%free(r_8, r_6, t). % free(shed: r, backyard: r)
link(r_8, d_2, unknownS). % link(shed: r, barn door: d, backyard: r)
south_of(unknownS, r_8). % south_of(backyard: r, shed: r)
at(s_6, r_8, t). % at(workbench: s, shed: r)

