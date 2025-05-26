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
r(r_4). %  pantry
r(r_1). %  livingroom
r(r_3). %  bedroom
r(r_2). %  corridor
r(r_5). %  bathroom
r(r_6). %  backyard
r(r_7). %  shed
r(r_8). %  garden
d(d_0). %  frosted-glass door
d(d_1). %  patio door
d(d_2). %  barn door
c(c_0). % conventional fridge
c(c_1). % metallic toolbox
oven(oven_0). % conventional oven
s(s_0). % massive table
s(s_1). % vast counter
s(s_2). % wooden shelf
s(s_3). % wooden workbench
s(s_4). % stylish patio chair
s(s_5). % white toilet
s(s_6). % large bed
s(s_7). % comfy sofa
s(s_8). % stylish patio table
stove(stove_0). % conventional stove
toaster(toaster_0). % recent BBQ
f(f_0). %  chicken wing
f(f_1). %  pork chop
f(f_2). %  red potato
f(f_3). %  chicken leg
f(f_4). %  red bell pepper
f(f_5). %  purple potato
ingredient(ingredient_1).
ingredient(ingredient_2).
f(f_6). %  flour
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
cookable(f_0). % cookable(chicken wing: f)
cookable(f_1). % cookable(pork chop: f)
cookable(f_2). % cookable(red potato: f)
cookable(f_3). % cookable(chicken leg: f)
cookable(f_4). % cookable(red bell pepper: f)
cookable(f_5). % cookable(purple potato: f)
cuttable(f_1). % cuttable(pork chop: f)
cuttable(f_2). % cuttable(red potato: f)
cuttable(f_4). % cuttable(red bell pepper: f)
cuttable(f_5). % cuttable(purple potato: f)
_east_of(r_0, r_4). % east_of(kitchen: r, pantry: r)
_east_of(r_1, r_3). % east_of(livingroom: r, bedroom: r)
_east_of(r_2, r_5). % east_of(corridor: r, bathroom: r)
_east_of(r_6, r_7). % east_of(backyard: r, shed: r)
_north_of(r_0, r_1). % north_of(kitchen: r, livingroom: r)
_north_of(r_1, r_2). % north_of(livingroom: r, corridor: r)
_north_of(r_6, r_0). % north_of(backyard: r, kitchen: r)
_north_of(r_8, r_6). % north_of(garden: r, backyard: r)
sharp(o_1). % sharp(knife: o)
_south_of(r_0, r_6). % south_of(kitchen: r, backyard: r)
_south_of(r_1, r_0). % south_of(livingroom: r, kitchen: r)
_south_of(r_2, r_1). % south_of(corridor: r, livingroom: r)
_south_of(r_6, r_8). % south_of(backyard: r, garden: r)
_west_of(r_3, r_1). % west_of(bedroom: r, livingroom: r)
_west_of(r_4, r_0). % west_of(pantry: r, kitchen: r)
_west_of(r_5, r_2). % west_of(bathroom: r, corridor: r)
_west_of(r_7, r_6). % west_of(shed: r, backyard: r)


% ------- initial fluents (initialized with t=0) -------
#program initial_state(t).

edible(f_4, t). % edible(red bell pepper: f)
edible(f_6, t). % edible(flour: f)
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
inedible(f_0, t). % inedible(chicken wing: f)
inedible(f_1, t). % inedible(pork chop: f)
inedible(f_2, t). % inedible(red potato: f)
inedible(f_3, t). % inedible(chicken leg: f)
inedible(f_5, t). % inedible(purple potato: f)
cooked_state(f_0, needs_cooking, t). % needs_cooking(chicken wing: f)
cooked_state(f_1, needs_cooking, t). % needs_cooking(pork chop: f)
cooked_state(f_2, needs_cooking, t). % needs_cooking(red potato: f)
cooked_state(f_3, needs_cooking, t). % needs_cooking(chicken leg: f)
cooked_state(f_5, needs_cooking, t). % needs_cooking(purple potato: f)
open(c_0, t). % open(fridge: c)
open(c_1, t). % open(toolbox: c)
open(d_0, t). % open(frosted-glass door: d)
open(d_1, t). % open(patio door: d)
open(d_2, t). % open(barn door: d)
cooked_state(f_4, raw, t). % raw(red bell pepper: f)
cut_state(f_1, uncut, t). % uncut(pork chop: f)
cut_state(f_2, uncut, t). % uncut(red potato: f)
cut_state(f_4, uncut, t). % uncut(red bell pepper: f)
cut_state(f_5, uncut, t). % uncut(purple potato: f)


% ------- Recipe -------
#program recipe(t).

base(f_0, ingredient_0). % base(chicken wing: f, ingredient_0: ingredient)
base(f_1, ingredient_1). % base(pork chop: f, ingredient_1: ingredient)
base(f_2, ingredient_2). % base(red potato: f, ingredient_2: ingredient)
cooking_location(r_0, recipe). % cooking_location(kitchen: r, RECIPE)
should_cut(ingredient_1, diced). % diced(ingredient_1: ingredient)
should_cut(ingredient_2, diced). % diced(ingredient_2: ingredient)
should_cook(ingredient_1, fried). % fried(ingredient_1: ingredient)
should_cook(ingredient_2, grilled). % grilled(ingredient_2: ingredient)
in(ingredient_0, recipe). % in(ingredient_0: ingredient, RECIPE)
in(ingredient_1, recipe). % in(ingredient_1: ingredient, RECIPE)
in(ingredient_2, recipe). % in(ingredient_2: ingredient, RECIPE)
ingredient_1(f_0). % ingredient_1(chicken wing: f)
ingredient_2(f_1). % ingredient_2(pork chop: f)
ingredient_3(f_2). % ingredient_3(red potato: f)
out(meal_0, recipe). % out(meal, RECIPE)
should_cook(ingredient_0, roasted). % roasted(ingredient_0: ingredient)
should_cut(ingredient_0, uncut). % uncut(ingredient_0: ingredient)

in_recipe(I,F) :- ingredient(I), in(I,recipe), base(F,I), instance_of(F,f).
in_recipe(F) :- in_recipe(I,F).


% ------- ROOM fluents -------

#program initial_room(t).
at(player, r_5, t). % at(P, bathroom: r)
room_changed(nowhere,r_5,t).

#program room_r_0(t).
%free(r_0, r_1, t). % free(kitchen: r, livingroom: r)
%free(r_0, r_4, t). % free(kitchen: r, pantry: r)
%free(r_0, r_6, t). % free(kitchen: r, backyard: r)
link(r_0, d_0, unknownW). % link(kitchen: r, frosted-glass door: d, pantry: r)
link(r_0, d_1, unknownN). % link(kitchen: r, patio door: d, backyard: r)
north_of(unknownN, r_0). % north_of(backyard: r, kitchen: r)
south_of(unknownS, r_0). % south_of(livingroom: r, kitchen: r)
west_of(unknownW, r_0). % west_of(pantry: r, kitchen: r)
at(c_0, r_0, t). % at(fridge: c, kitchen: r)
at(oven_0, r_0, t). % at(oven, kitchen: r)
at(s_0, r_0, t). % at(table: s, kitchen: r)
at(s_1, r_0, t). % at(counter: s, kitchen: r)
at(stove_0, r_0, t). % at(stove, kitchen: r)
in(f_0, c_0, t). % in(chicken wing: f, fridge: c)
in(f_1, c_0, t). % in(pork chop: f, fridge: c)
in(f_3, c_0, t). % in(chicken leg: f, fridge: c)
on(f_2, s_1, t). % on(red potato: f, counter: s)
on(f_4, s_1, t). % on(red bell pepper: f, counter: s)
on(f_5, s_1, t). % on(purple potato: f, counter: s)
on(o_0, s_1, t). % on(cookbook: o, counter: s)
on(o_1, s_0, t). % on(knife: o, table: s)

#program room_r_1(t).
%free(r_1, r_0, t). % free(livingroom: r, kitchen: r)
%free(r_1, r_2, t). % free(livingroom: r, corridor: r)
%free(r_1, r_3, t). % free(livingroom: r, bedroom: r)
north_of(unknownN, r_1). % north_of(kitchen: r, livingroom: r)
south_of(unknownS, r_1). % south_of(corridor: r, livingroom: r)
west_of(unknownW, r_1). % west_of(bedroom: r, livingroom: r)
at(s_7, r_1, t). % at(sofa: s, livingroom: r)

#program room_r_2(t).
%free(r_2, r_1, t). % free(corridor: r, livingroom: r)
%free(r_2, r_5, t). % free(corridor: r, bathroom: r)
north_of(unknownN, r_2). % north_of(livingroom: r, corridor: r)
west_of(unknownW, r_2). % west_of(bathroom: r, corridor: r)

#program room_r_3(t).
east_of(unknownE, r_3). % east_of(livingroom: r, bedroom: r)
%free(r_3, r_1, t). % free(bedroom: r, livingroom: r)
at(s_6, r_3, t). % at(bed: s, bedroom: r)

#program room_r_4(t).
east_of(unknownE, r_4). % east_of(kitchen: r, pantry: r)
%free(r_4, r_0, t). % free(pantry: r, kitchen: r)
link(r_4, d_0, unknownE). % link(pantry: r, frosted-glass door: d, kitchen: r)
at(s_2, r_4, t). % at(shelf: s, pantry: r)
on(f_6, s_2, t). % on(flour: f, shelf: s)

#program room_r_5(t).
east_of(unknownE, r_5). % east_of(corridor: r, bathroom: r)
%free(r_5, r_2, t). % free(bathroom: r, corridor: r)
at(s_5, r_5, t). % at(toilet: s, bathroom: r)

#program room_r_6(t).
%free(r_6, r_0, t). % free(backyard: r, kitchen: r)
%free(r_6, r_7, t). % free(backyard: r, shed: r)
%free(r_6, r_8, t). % free(backyard: r, garden: r)
link(r_6, d_1, unknownS). % link(backyard: r, patio door: d, kitchen: r)
link(r_6, d_2, unknownW). % link(backyard: r, barn door: d, shed: r)
north_of(unknownN, r_6). % north_of(garden: r, backyard: r)
south_of(unknownS, r_6). % south_of(kitchen: r, backyard: r)
west_of(unknownW, r_6). % west_of(shed: r, backyard: r)
at(s_4, r_6, t). % at(patio chair: s, backyard: r)
at(s_8, r_6, t). % at(patio table: s, backyard: r)
at(toaster_0, r_6, t). % at(BBQ: toaster, backyard: r)

#program room_r_7(t).
east_of(unknownE, r_7). % east_of(backyard: r, shed: r)
%free(r_7, r_6, t). % free(shed: r, backyard: r)
link(r_7, d_2, unknownE). % link(shed: r, barn door: d, backyard: r)
at(c_1, r_7, t). % at(toolbox: c, shed: r)
at(s_3, r_7, t). % at(workbench: s, shed: r)

#program room_r_8(t).
%free(r_8, r_6, t). % free(garden: r, backyard: r)
south_of(unknownS, r_8). % south_of(backyard: r, garden: r)

