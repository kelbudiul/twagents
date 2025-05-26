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
r(r_1). %  livingroom
r(r_2). %  bedroom
r(r_3). %  corridor
r(r_4). %  bathroom
r(r_6). %  backyard
r(r_7). %  shed
r(r_8). %  garden
d(d_0). %  frosted-glass door
d(d_1). %  patio door
d(d_2). %  wooden door
c(c_0). % conventional fridge
c(c_1). % metallic toolbox
f(f_10). %  white onion
f(f_11). %  red bell pepper
f(f_12). %  carrot
f(f_14). %  orange bell pepper
f(f_2). %  green bell pepper
f(f_4). %  green apple
f(f_5). %  red hot pepper
oven(oven_0). % conventional oven
s(s_0). % massive table
s(s_1). % vast counter
s(s_2). % wooden shelf
stove(stove_0). % conventional stove
toaster(toaster_0). % recent BBQ
f(f_0). %  red potato
f(f_1). %  chicken leg
ingredient(ingredient_1).
f(f_3). %  chicken wing
f(f_6). %  red onion
f(f_7). %  yellow potato
f(f_9). %  red apple
f(f_8). %  water
f(f_13). %  black pepper
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
ingredient(ingredient_2).
recipe(recipe).
o(o_0). % interesting cookbook
o(o_1). % sharp knife

% ======= Facts =======
cookable(f_0). % cookable(red potato: f)
cookable(f_1). % cookable(chicken leg: f)
cookable(f_10). % cookable(white onion: f)
cookable(f_11). % cookable(red bell pepper: f)
cookable(f_12). % cookable(carrot: f)
cookable(f_14). % cookable(orange bell pepper: f)
cookable(f_2). % cookable(green bell pepper: f)
cookable(f_3). % cookable(chicken wing: f)
cookable(f_4). % cookable(green apple: f)
cookable(f_5). % cookable(red hot pepper: f)
cookable(f_6). % cookable(red onion: f)
cookable(f_7). % cookable(yellow potato: f)
cookable(f_9). % cookable(red apple: f)
cuttable(f_0). % cuttable(red potato: f)
cuttable(f_10). % cuttable(white onion: f)
cuttable(f_11). % cuttable(red bell pepper: f)
cuttable(f_12). % cuttable(carrot: f)
cuttable(f_14). % cuttable(orange bell pepper: f)
cuttable(f_2). % cuttable(green bell pepper: f)
cuttable(f_4). % cuttable(green apple: f)
cuttable(f_5). % cuttable(red hot pepper: f)
cuttable(f_6). % cuttable(red onion: f)
cuttable(f_7). % cuttable(yellow potato: f)
cuttable(f_9). % cuttable(red apple: f)
_east_of(r_0, r_5). % east_of(kitchen: r, pantry: r)
_east_of(r_1, r_0). % east_of(livingroom: r, kitchen: r)
_east_of(r_2, r_1). % east_of(bedroom: r, livingroom: r)
_east_of(r_3, r_4). % east_of(corridor: r, bathroom: r)
_east_of(r_6, r_7). % east_of(backyard: r, shed: r)
_north_of(r_0, r_6). % north_of(kitchen: r, backyard: r)
_north_of(r_2, r_3). % north_of(bedroom: r, corridor: r)
_north_of(r_6, r_8). % north_of(backyard: r, garden: r)
sharp(o_1). % sharp(knife: o)
_south_of(r_3, r_2). % south_of(corridor: r, bedroom: r)
_south_of(r_6, r_0). % south_of(backyard: r, kitchen: r)
_south_of(r_8, r_6). % south_of(garden: r, backyard: r)
_west_of(r_0, r_1). % west_of(kitchen: r, livingroom: r)
_west_of(r_1, r_2). % west_of(livingroom: r, bedroom: r)
_west_of(r_4, r_3). % west_of(bathroom: r, corridor: r)
_west_of(r_5, r_0). % west_of(pantry: r, kitchen: r)
_west_of(r_7, r_6). % west_of(shed: r, backyard: r)


% ------- initial fluents (initialized with t=0) -------
#program initial_state(t).

cooked(f_0, t). % cooked(red potato: f)
cooked(f_1, t). % cooked(chicken leg: f)
cooked(f_2, t). % cooked(green bell pepper: f)
drinkable(f_8, t). % drinkable(water: f)
edible(f_0, t). % edible(red potato: f)
edible(f_1, t). % edible(chicken leg: f)
edible(f_10, t). % edible(white onion: f)
edible(f_11, t). % edible(red bell pepper: f)
edible(f_12, t). % edible(carrot: f)
edible(f_13, t). % edible(black pepper: f)
edible(f_14, t). % edible(orange bell pepper: f)
edible(f_2, t). % edible(green bell pepper: f)
edible(f_4, t). % edible(green apple: f)
edible(f_5, t). % edible(red hot pepper: f)
edible(f_6, t). % edible(red onion: f)
edible(f_9, t). % edible(red apple: f)
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
cooked_state(f_1, fried, t). % fried(chicken leg: f)
cooked_state(f_0, grilled, t). % grilled(red potato: f)
cooked_state(f_2, grilled, t). % grilled(green bell pepper: f)
inedible(f_3, t). % inedible(chicken wing: f)
inedible(f_7, t). % inedible(yellow potato: f)
inedible(f_8, t). % inedible(water: f)
cooked_state(f_3, needs_cooking, t). % needs_cooking(chicken wing: f)
cooked_state(f_7, needs_cooking, t). % needs_cooking(yellow potato: f)
open(c_0, t). % open(fridge: c)
open(c_1, t). % open(toolbox: c)
open(d_0, t). % open(frosted-glass door: d)
open(d_1, t). % open(patio door: d)
open(d_2, t). % open(wooden door: d)
cooked_state(f_10, raw, t). % raw(white onion: f)
cooked_state(f_11, raw, t). % raw(red bell pepper: f)
cooked_state(f_12, raw, t). % raw(carrot: f)
cooked_state(f_14, raw, t). % raw(orange bell pepper: f)
cooked_state(f_4, raw, t). % raw(green apple: f)
cooked_state(f_5, raw, t). % raw(red hot pepper: f)
cooked_state(f_6, raw, t). % raw(red onion: f)
cooked_state(f_9, raw, t). % raw(red apple: f)
cut_state(f_0, uncut, t). % uncut(red potato: f)
cut_state(f_10, uncut, t). % uncut(white onion: f)
cut_state(f_11, uncut, t). % uncut(red bell pepper: f)
cut_state(f_12, uncut, t). % uncut(carrot: f)
cut_state(f_14, uncut, t). % uncut(orange bell pepper: f)
cut_state(f_2, uncut, t). % uncut(green bell pepper: f)
cut_state(f_4, uncut, t). % uncut(green apple: f)
cut_state(f_5, uncut, t). % uncut(red hot pepper: f)
cut_state(f_6, uncut, t). % uncut(red onion: f)
cut_state(f_7, uncut, t). % uncut(yellow potato: f)
cut_state(f_9, uncut, t). % uncut(red apple: f)


% ------- Recipe -------
#program recipe(t).

base(f_0, ingredient_2). % base(red potato: f, ingredient_2: ingredient)
base(f_1, ingredient_0). % base(chicken leg: f, ingredient_0: ingredient)
base(f_2, ingredient_1). % base(green bell pepper: f, ingredient_1: ingredient)
should_cut(ingredient_1, chopped). % chopped(ingredient_1: ingredient)
cooking_location(r_0, recipe). % cooking_location(kitchen: r, RECIPE)
should_cook(ingredient_0, fried). % fried(ingredient_0: ingredient)
should_cook(ingredient_1, grilled). % grilled(ingredient_1: ingredient)
should_cook(ingredient_2, grilled). % grilled(ingredient_2: ingredient)
in(ingredient_0, recipe). % in(ingredient_0: ingredient, RECIPE)
in(ingredient_1, recipe). % in(ingredient_1: ingredient, RECIPE)
in(ingredient_2, recipe). % in(ingredient_2: ingredient, RECIPE)
ingredient_1(f_1). % ingredient_1(chicken leg: f)
ingredient_2(f_2). % ingredient_2(green bell pepper: f)
ingredient_3(f_0). % ingredient_3(red potato: f)
out(meal_0, recipe). % out(meal, RECIPE)
should_cut(ingredient_2, sliced). % sliced(ingredient_2: ingredient)
should_cut(ingredient_0, uncut). % uncut(ingredient_0: ingredient)

in_recipe(I,F) :- ingredient(I), in(I,recipe), base(F,I), instance_of(F,f).
in_recipe(F) :- in_recipe(I,F).


% ------- ROOM fluents -------

#program initial_room(t).
at(player, r_1, t). % at(P, livingroom: r)
room_changed(nowhere,r_1,t).

#program room_r_0(t).
east_of(unknownE, r_0). % east_of(livingroom: r, kitchen: r)
%free(r_0, r_1, t). % free(kitchen: r, livingroom: r)
%free(r_0, r_5, t). % free(kitchen: r, pantry: r)
%free(r_0, r_6, t). % free(kitchen: r, backyard: r)
link(r_0, d_0, unknownW). % link(kitchen: r, frosted-glass door: d, pantry: r)
link(r_0, d_1, unknownS). % link(kitchen: r, patio door: d, backyard: r)
south_of(unknownS, r_0). % south_of(backyard: r, kitchen: r)
west_of(unknownW, r_0). % west_of(pantry: r, kitchen: r)
at(c_0, r_0, t). % at(fridge: c, kitchen: r)
at(oven_0, r_0, t). % at(oven, kitchen: r)
at(s_0, r_0, t). % at(table: s, kitchen: r)
at(s_1, r_0, t). % at(counter: s, kitchen: r)
at(stove_0, r_0, t). % at(stove, kitchen: r)
in(f_1, c_0, t). % in(chicken leg: f, fridge: c)
in(f_3, c_0, t). % in(chicken wing: f, fridge: c)
in(f_8, c_0, t). % in(water: f, fridge: c)
on(f_0, s_1, t). % on(red potato: f, counter: s)
on(f_6, s_1, t). % on(red onion: f, counter: s)
on(f_7, s_1, t). % on(yellow potato: f, counter: s)
on(f_9, s_1, t). % on(red apple: f, counter: s)
on(o_0, s_1, t). % on(cookbook: o, counter: s)
on(o_1, s_1, t). % on(knife: o, counter: s)

#program room_r_1(t).
east_of(unknownE, r_1). % east_of(bedroom: r, livingroom: r)
%free(r_1, r_0, t). % free(livingroom: r, kitchen: r)
%free(r_1, r_2, t). % free(livingroom: r, bedroom: r)
west_of(unknownW, r_1). % west_of(kitchen: r, livingroom: r)

#program room_r_2(t).
%free(r_2, r_1, t). % free(bedroom: r, livingroom: r)
%free(r_2, r_3, t). % free(bedroom: r, corridor: r)
south_of(unknownS, r_2). % south_of(corridor: r, bedroom: r)
west_of(unknownW, r_2). % west_of(livingroom: r, bedroom: r)

#program room_r_3(t).
%free(r_3, r_2, t). % free(corridor: r, bedroom: r)
%free(r_3, r_4, t). % free(corridor: r, bathroom: r)
north_of(unknownN, r_3). % north_of(bedroom: r, corridor: r)
west_of(unknownW, r_3). % west_of(bathroom: r, corridor: r)

#program room_r_4(t).
east_of(unknownE, r_4). % east_of(corridor: r, bathroom: r)
%free(r_4, r_3, t). % free(bathroom: r, corridor: r)

#program room_r_5(t).
east_of(unknownE, r_5). % east_of(kitchen: r, pantry: r)
%free(r_5, r_0, t). % free(pantry: r, kitchen: r)
link(r_5, d_0, unknownE). % link(pantry: r, frosted-glass door: d, kitchen: r)
at(s_2, r_5, t). % at(shelf: s, pantry: r)
on(f_13, s_2, t). % on(black pepper: f, shelf: s)

#program room_r_6(t).
%free(r_6, r_0, t). % free(backyard: r, kitchen: r)
%free(r_6, r_7, t). % free(backyard: r, shed: r)
%free(r_6, r_8, t). % free(backyard: r, garden: r)
link(r_6, d_1, unknownN). % link(backyard: r, patio door: d, kitchen: r)
link(r_6, d_2, unknownW). % link(backyard: r, wooden door: d, shed: r)
north_of(unknownN, r_6). % north_of(kitchen: r, backyard: r)
south_of(unknownS, r_6). % south_of(garden: r, backyard: r)
west_of(unknownW, r_6). % west_of(shed: r, backyard: r)
at(toaster_0, r_6, t). % at(BBQ: toaster, backyard: r)

#program room_r_7(t).
east_of(unknownE, r_7). % east_of(backyard: r, shed: r)
%free(r_7, r_6, t). % free(shed: r, backyard: r)
link(r_7, d_2, unknownE). % link(shed: r, wooden door: d, backyard: r)
at(c_1, r_7, t). % at(toolbox: c, shed: r)

#program room_r_8(t).
%free(r_8, r_6, t). % free(garden: r, backyard: r)
north_of(unknownN, r_8). % north_of(backyard: r, garden: r)
at(f_10, r_8, t). % at(white onion: f, garden: r)
at(f_11, r_8, t). % at(red bell pepper: f, garden: r)
at(f_12, r_8, t). % at(carrot: f, garden: r)
at(f_14, r_8, t). % at(orange bell pepper: f, garden: r)
at(f_2, r_8, t). % at(green bell pepper: f, garden: r)
at(f_4, r_8, t). % at(green apple: f, garden: r)
at(f_5, r_8, t). % at(red hot pepper: f, garden: r)

