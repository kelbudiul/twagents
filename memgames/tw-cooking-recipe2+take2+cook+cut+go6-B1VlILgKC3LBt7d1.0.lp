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
r(r_1). %  pantry
r(r_2). %  corridor
r(r_4). %  livingroom
r(r_5). %  bedroom
r(r_3). %  bathroom
d(d_0). %  frosted-glass door
c(c_0). % conventional fridge
oven(oven_0). % conventional oven
s(s_0). % massive table
s(s_1). % vast counter
s(s_2). % wooden shelf
s(s_3). % white toilet
s(s_4). % large bed
s(s_5). % comfy sofa
stove(stove_0). % conventional stove
f(f_0). %  yellow apple
f(f_1). %  purple potato
ingredient(ingredient_0).
f(f_2). %  red potato
f(f_3). %  yellow onion
f(f_4). %  red apple
f(f_5). %  red onion
f(f_6). %  salt
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
o(o_0). % interesting cookbook
o(o_1). % sharp knife

% ======= Facts =======
cookable(f_0). % cookable(yellow apple: f)
cookable(f_1). % cookable(purple potato: f)
cookable(f_2). % cookable(red potato: f)
cookable(f_3). % cookable(yellow onion: f)
cookable(f_4). % cookable(red apple: f)
cookable(f_5). % cookable(red onion: f)
cuttable(f_0). % cuttable(yellow apple: f)
cuttable(f_1). % cuttable(purple potato: f)
cuttable(f_2). % cuttable(red potato: f)
cuttable(f_3). % cuttable(yellow onion: f)
cuttable(f_4). % cuttable(red apple: f)
cuttable(f_5). % cuttable(red onion: f)
_east_of(r_0, r_1). % east_of(kitchen: r, pantry: r)
_east_of(r_2, r_0). % east_of(corridor: r, kitchen: r)
_east_of(r_4, r_5). % east_of(livingroom: r, bedroom: r)
_north_of(r_3, r_2). % north_of(bathroom: r, corridor: r)
_north_of(r_4, r_0). % north_of(livingroom: r, kitchen: r)
sharp(o_1). % sharp(knife: o)
_south_of(r_0, r_4). % south_of(kitchen: r, livingroom: r)
_south_of(r_2, r_3). % south_of(corridor: r, bathroom: r)
_west_of(r_0, r_2). % west_of(kitchen: r, corridor: r)
_west_of(r_1, r_0). % west_of(pantry: r, kitchen: r)
_west_of(r_5, r_4). % west_of(bedroom: r, livingroom: r)


% ------- initial fluents (initialized with t=0) -------
#program initial_state(t).

edible(f_0, t). % edible(yellow apple: f)
edible(f_3, t). % edible(yellow onion: f)
edible(f_4, t). % edible(red apple: f)
edible(f_5, t). % edible(red onion: f)
edible(f_6, t). % edible(salt: f)
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
inedible(f_1, t). % inedible(purple potato: f)
inedible(f_2, t). % inedible(red potato: f)
cooked_state(f_1, needs_cooking, t). % needs_cooking(purple potato: f)
cooked_state(f_2, needs_cooking, t). % needs_cooking(red potato: f)
open(c_0, t). % open(fridge: c)
open(d_0, t). % open(frosted-glass door: d)
cooked_state(f_0, raw, t). % raw(yellow apple: f)
cooked_state(f_3, raw, t). % raw(yellow onion: f)
cooked_state(f_4, raw, t). % raw(red apple: f)
cooked_state(f_5, raw, t). % raw(red onion: f)
cut_state(f_0, uncut, t). % uncut(yellow apple: f)
cut_state(f_1, uncut, t). % uncut(purple potato: f)
cut_state(f_2, uncut, t). % uncut(red potato: f)
cut_state(f_3, uncut, t). % uncut(yellow onion: f)
cut_state(f_4, uncut, t). % uncut(red apple: f)
cut_state(f_5, uncut, t). % uncut(red onion: f)


% ------- Recipe -------
#program recipe(t).

base(f_0, ingredient_1). % base(yellow apple: f, ingredient_1: ingredient)
base(f_1, ingredient_0). % base(purple potato: f, ingredient_0: ingredient)
should_cut(ingredient_0, chopped). % chopped(ingredient_0: ingredient)
cooking_location(r_0, recipe). % cooking_location(kitchen: r, RECIPE)
in(ingredient_0, recipe). % in(ingredient_0: ingredient, RECIPE)
in(ingredient_1, recipe). % in(ingredient_1: ingredient, RECIPE)
ingredient_1(f_1). % ingredient_1(purple potato: f)
ingredient_2(f_0). % ingredient_2(yellow apple: f)
out(meal_0, recipe). % out(meal, RECIPE)
should_cook(ingredient_1, raw). % raw(ingredient_1: ingredient)
should_cook(ingredient_0, roasted). % roasted(ingredient_0: ingredient)
should_cut(ingredient_1, uncut). % uncut(ingredient_1: ingredient)

in_recipe(I,F) :- ingredient(I), in(I,recipe), base(F,I), instance_of(F,f).
in_recipe(F) :- in_recipe(I,F).


% ------- ROOM fluents -------

#program initial_room(t).
at(player, r_4, t). % at(P, livingroom: r)
room_changed(nowhere,r_4,t).

#program room_r_0(t).
east_of(unknownE, r_0). % east_of(corridor: r, kitchen: r)
%free(r_0, r_1, t). % free(kitchen: r, pantry: r)
%free(r_0, r_2, t). % free(kitchen: r, corridor: r)
%free(r_0, r_4, t). % free(kitchen: r, livingroom: r)
link(r_0, d_0, unknownW). % link(kitchen: r, frosted-glass door: d, pantry: r)
north_of(unknownN, r_0). % north_of(livingroom: r, kitchen: r)
west_of(unknownW, r_0). % west_of(pantry: r, kitchen: r)
at(c_0, r_0, t). % at(fridge: c, kitchen: r)
at(oven_0, r_0, t). % at(oven, kitchen: r)
at(s_0, r_0, t). % at(table: s, kitchen: r)
at(s_1, r_0, t). % at(counter: s, kitchen: r)
at(stove_0, r_0, t). % at(stove, kitchen: r)
in(f_5, c_0, t). % in(red onion: f, fridge: c)
on(f_0, s_1, t). % on(yellow apple: f, counter: s)
on(f_1, s_1, t). % on(purple potato: f, counter: s)
on(f_2, s_1, t). % on(red potato: f, counter: s)
on(f_3, s_1, t). % on(yellow onion: f, counter: s)
on(f_4, s_1, t). % on(red apple: f, counter: s)
on(o_0, s_1, t). % on(cookbook: o, counter: s)
on(o_1, s_0, t). % on(knife: o, table: s)

#program room_r_1(t).
east_of(unknownE, r_1). % east_of(kitchen: r, pantry: r)
%free(r_1, r_0, t). % free(pantry: r, kitchen: r)
link(r_1, d_0, unknownE). % link(pantry: r, frosted-glass door: d, kitchen: r)
at(s_2, r_1, t). % at(shelf: s, pantry: r)
on(f_6, s_2, t). % on(salt: f, shelf: s)

#program room_r_2(t).
%free(r_2, r_0, t). % free(corridor: r, kitchen: r)
%free(r_2, r_3, t). % free(corridor: r, bathroom: r)
north_of(unknownN, r_2). % north_of(bathroom: r, corridor: r)
west_of(unknownW, r_2). % west_of(kitchen: r, corridor: r)

#program room_r_3(t).
%free(r_3, r_2, t). % free(bathroom: r, corridor: r)
south_of(unknownS, r_3). % south_of(corridor: r, bathroom: r)
at(s_3, r_3, t). % at(toilet: s, bathroom: r)

#program room_r_4(t).
%free(r_4, r_0, t). % free(livingroom: r, kitchen: r)
%free(r_4, r_5, t). % free(livingroom: r, bedroom: r)
south_of(unknownS, r_4). % south_of(kitchen: r, livingroom: r)
west_of(unknownW, r_4). % west_of(bedroom: r, livingroom: r)
at(s_5, r_4, t). % at(sofa: s, livingroom: r)

#program room_r_5(t).
east_of(unknownE, r_5). % east_of(livingroom: r, bedroom: r)
%free(r_5, r_4, t). % free(bedroom: r, livingroom: r)
at(s_4, r_5, t). % at(bed: s, bedroom: r)

