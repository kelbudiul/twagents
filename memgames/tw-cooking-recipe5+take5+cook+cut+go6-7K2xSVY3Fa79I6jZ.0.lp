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
r(r_2). %  corridor
r(r_5). %  bathroom
r(r_3). %  livingroom
r(r_4). %  bedroom
r(r_1). %  pantry
d(d_0). %  plain door
c(c_0). % conventional fridge
oven(oven_0). % conventional oven
s(s_0). % massive table
s(s_1). % vast counter
s(s_2). % wooden shelf
s(s_3). % white toilet
s(s_4). % comfy sofa
s(s_5). % large bed
stove(stove_0). % conventional stove
f(f_0). %  banana
f(f_1). %  egg
f(f_2). %  chicken wing
f(f_3). %  yellow bell pepper
f(f_4). %  red hot pepper
f(f_10). %  red onion
f(f_5). %  chicken leg
f(f_6). %  red apple
f(f_8). %  yellow apple
f(f_9). %  orange bell pepper
ingredient(ingredient_3).
f(f_7). %  black pepper
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
ingredient(ingredient_4).
o(o_0). % interesting cookbook
o(o_1). % sharp knife

% ======= Facts =======
cookable(f_0). % cookable(banana: f)
cookable(f_1). % cookable(egg: f)
cookable(f_10). % cookable(red onion: f)
cookable(f_2). % cookable(chicken wing: f)
cookable(f_3). % cookable(yellow bell pepper: f)
cookable(f_4). % cookable(red hot pepper: f)
cookable(f_5). % cookable(chicken leg: f)
cookable(f_6). % cookable(red apple: f)
cookable(f_8). % cookable(yellow apple: f)
cookable(f_9). % cookable(orange bell pepper: f)
cuttable(f_0). % cuttable(banana: f)
cuttable(f_10). % cuttable(red onion: f)
cuttable(f_3). % cuttable(yellow bell pepper: f)
cuttable(f_4). % cuttable(red hot pepper: f)
cuttable(f_6). % cuttable(red apple: f)
cuttable(f_8). % cuttable(yellow apple: f)
cuttable(f_9). % cuttable(orange bell pepper: f)
_east_of(r_0, r_2). % east_of(kitchen: r, corridor: r)
_east_of(r_2, r_5). % east_of(corridor: r, bathroom: r)
_east_of(r_3, r_4). % east_of(livingroom: r, bedroom: r)
_north_of(r_1, r_0). % north_of(pantry: r, kitchen: r)
_north_of(r_3, r_2). % north_of(livingroom: r, corridor: r)
sharp(o_1). % sharp(knife: o)
_south_of(r_0, r_1). % south_of(kitchen: r, pantry: r)
_south_of(r_2, r_3). % south_of(corridor: r, livingroom: r)
_west_of(r_2, r_0). % west_of(corridor: r, kitchen: r)
_west_of(r_4, r_3). % west_of(bedroom: r, livingroom: r)
_west_of(r_5, r_2). % west_of(bathroom: r, corridor: r)


% ------- initial fluents (initialized with t=0) -------
#program initial_state(t).

edible(f_0, t). % edible(banana: f)
edible(f_10, t). % edible(red onion: f)
edible(f_3, t). % edible(yellow bell pepper: f)
edible(f_4, t). % edible(red hot pepper: f)
edible(f_6, t). % edible(red apple: f)
edible(f_7, t). % edible(black pepper: f)
edible(f_8, t). % edible(yellow apple: f)
edible(f_9, t). % edible(orange bell pepper: f)
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
inedible(f_1, t). % inedible(egg: f)
inedible(f_2, t). % inedible(chicken wing: f)
inedible(f_5, t). % inedible(chicken leg: f)
cooked_state(f_1, needs_cooking, t). % needs_cooking(egg: f)
cooked_state(f_2, needs_cooking, t). % needs_cooking(chicken wing: f)
cooked_state(f_5, needs_cooking, t). % needs_cooking(chicken leg: f)
open(c_0, t). % open(fridge: c)
open(d_0, t). % open(plain door: d)
cooked_state(f_0, raw, t). % raw(banana: f)
cooked_state(f_10, raw, t). % raw(red onion: f)
cooked_state(f_3, raw, t). % raw(yellow bell pepper: f)
cooked_state(f_4, raw, t). % raw(red hot pepper: f)
cooked_state(f_6, raw, t). % raw(red apple: f)
cooked_state(f_8, raw, t). % raw(yellow apple: f)
cooked_state(f_9, raw, t). % raw(orange bell pepper: f)
cut_state(f_0, uncut, t). % uncut(banana: f)
cut_state(f_10, uncut, t). % uncut(red onion: f)
cut_state(f_3, uncut, t). % uncut(yellow bell pepper: f)
cut_state(f_4, uncut, t). % uncut(red hot pepper: f)
cut_state(f_6, uncut, t). % uncut(red apple: f)
cut_state(f_8, uncut, t). % uncut(yellow apple: f)
cut_state(f_9, uncut, t). % uncut(orange bell pepper: f)


% ------- Recipe -------
#program recipe(t).

base(f_0, ingredient_0). % base(banana: f, ingredient_0: ingredient)
base(f_1, ingredient_2). % base(egg: f, ingredient_2: ingredient)
base(f_2, ingredient_1). % base(chicken wing: f, ingredient_1: ingredient)
base(f_3, ingredient_4). % base(yellow bell pepper: f, ingredient_4: ingredient)
base(f_4, ingredient_3). % base(red hot pepper: f, ingredient_3: ingredient)
cooking_location(r_0, recipe). % cooking_location(kitchen: r, RECIPE)
should_cut(ingredient_3, diced). % diced(ingredient_3: ingredient)
should_cook(ingredient_1, fried). % fried(ingredient_1: ingredient)
should_cook(ingredient_3, fried). % fried(ingredient_3: ingredient)
in(ingredient_0, recipe). % in(ingredient_0: ingredient, RECIPE)
in(ingredient_1, recipe). % in(ingredient_1: ingredient, RECIPE)
in(ingredient_2, recipe). % in(ingredient_2: ingredient, RECIPE)
in(ingredient_3, recipe). % in(ingredient_3: ingredient, RECIPE)
in(ingredient_4, recipe). % in(ingredient_4: ingredient, RECIPE)
ingredient_1(f_0). % ingredient_1(banana: f)
ingredient_2(f_2). % ingredient_2(chicken wing: f)
ingredient_3(f_1). % ingredient_3(egg: f)
ingredient_4(f_4). % ingredient_4(red hot pepper: f)
ingredient_5(f_3). % ingredient_5(yellow bell pepper: f)
out(meal_0, recipe). % out(meal, RECIPE)
should_cook(ingredient_0, raw). % raw(ingredient_0: ingredient)
should_cook(ingredient_4, raw). % raw(ingredient_4: ingredient)
should_cook(ingredient_2, roasted). % roasted(ingredient_2: ingredient)
should_cut(ingredient_0, uncut). % uncut(ingredient_0: ingredient)
should_cut(ingredient_1, uncut). % uncut(ingredient_1: ingredient)
should_cut(ingredient_2, uncut). % uncut(ingredient_2: ingredient)
should_cut(ingredient_4, uncut). % uncut(ingredient_4: ingredient)

in_recipe(I,F) :- ingredient(I), in(I,recipe), base(F,I), instance_of(F,f).
in_recipe(F) :- in_recipe(I,F).


% ------- ROOM fluents -------

#program initial_room(t).
at(player, r_3, t). % at(P, livingroom: r)
room_changed(nowhere,r_3,t).

#program room_r_0(t).
%free(r_0, r_1, t). % free(kitchen: r, pantry: r)
%free(r_0, r_2, t). % free(kitchen: r, corridor: r)
link(r_0, d_0, unknownN). % link(kitchen: r, plain door: d, pantry: r)
north_of(unknownN, r_0). % north_of(pantry: r, kitchen: r)
west_of(unknownW, r_0). % west_of(corridor: r, kitchen: r)
at(c_0, r_0, t). % at(fridge: c, kitchen: r)
at(oven_0, r_0, t). % at(oven, kitchen: r)
at(s_0, r_0, t). % at(table: s, kitchen: r)
at(s_1, r_0, t). % at(counter: s, kitchen: r)
at(stove_0, r_0, t). % at(stove, kitchen: r)
in(f_1, c_0, t). % in(egg: f, fridge: c)
in(f_10, c_0, t). % in(red onion: f, fridge: c)
in(f_2, c_0, t). % in(chicken wing: f, fridge: c)
in(f_3, c_0, t). % in(yellow bell pepper: f, fridge: c)
in(f_5, c_0, t). % in(chicken leg: f, fridge: c)
in(f_8, c_0, t). % in(yellow apple: f, fridge: c)
in(f_9, c_0, t). % in(orange bell pepper: f, fridge: c)
on(f_0, s_1, t). % on(banana: f, counter: s)
on(f_4, s_1, t). % on(red hot pepper: f, counter: s)
on(f_6, s_1, t). % on(red apple: f, counter: s)
on(f_7, s_1, t). % on(black pepper: f, counter: s)
on(o_0, s_0, t). % on(cookbook: o, table: s)
on(o_1, s_0, t). % on(knife: o, table: s)

#program room_r_1(t).
%free(r_1, r_0, t). % free(pantry: r, kitchen: r)
link(r_1, d_0, unknownS). % link(pantry: r, plain door: d, kitchen: r)
south_of(unknownS, r_1). % south_of(kitchen: r, pantry: r)
at(s_2, r_1, t). % at(shelf: s, pantry: r)

#program room_r_2(t).
east_of(unknownE, r_2). % east_of(kitchen: r, corridor: r)
%free(r_2, r_0, t). % free(corridor: r, kitchen: r)
%free(r_2, r_3, t). % free(corridor: r, livingroom: r)
%free(r_2, r_5, t). % free(corridor: r, bathroom: r)
north_of(unknownN, r_2). % north_of(livingroom: r, corridor: r)
west_of(unknownW, r_2). % west_of(bathroom: r, corridor: r)

#program room_r_3(t).
%free(r_3, r_2, t). % free(livingroom: r, corridor: r)
%free(r_3, r_4, t). % free(livingroom: r, bedroom: r)
south_of(unknownS, r_3). % south_of(corridor: r, livingroom: r)
west_of(unknownW, r_3). % west_of(bedroom: r, livingroom: r)
at(s_4, r_3, t). % at(sofa: s, livingroom: r)

#program room_r_4(t).
east_of(unknownE, r_4). % east_of(livingroom: r, bedroom: r)
%free(r_4, r_3, t). % free(bedroom: r, livingroom: r)
at(s_5, r_4, t). % at(bed: s, bedroom: r)

#program room_r_5(t).
east_of(unknownE, r_5). % east_of(corridor: r, bathroom: r)
%free(r_5, r_2, t). % free(bathroom: r, corridor: r)
at(s_3, r_5, t). % at(toilet: s, bathroom: r)

