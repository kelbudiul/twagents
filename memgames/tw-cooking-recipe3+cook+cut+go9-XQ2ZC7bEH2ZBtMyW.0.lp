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
r(r_1). %  pantry
r(r_3). %  corridor
r(r_4). %  bedroom
r(r_6). %  backyard
r(r_7). %  shed
r(r_5). %  bathroom
r(r_8). %  garden
d(d_0). %  plain door
d(d_1). %  sliding patio door
d(d_2). %  wooden door
c(c_0). % conventional fridge
c(c_1). % metallic toolbox
oven(oven_0). % conventional oven
s(s_0). % massive table
s(s_1). % vast counter
s(s_2). % wooden shelf
s(s_3). % wooden workbench
s(s_4). % stylish patio chair
s(s_5). % comfy sofa
s(s_6). % stylish patio table
s(s_7). % white toilet
s(s_8). % large bed
stove(stove_0). % conventional stove
toaster(toaster_0). % recent BBQ
f(f_0). %  purple potato
f(f_1). %  banana
f(f_2). %  salt
f(f_3). %  yellow potato
meal(meal_0). %  meal
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
o(o_0). % interesting cookbook
o(o_1). % sharp knife
slot(slot_0).
slot(slot_1).
slot(slot_2).
slot(slot_3).

% ======= Facts =======
cookable(f_0). % cookable(purple potato: f)
cookable(f_1). % cookable(banana: f)
cookable(f_3). % cookable(yellow potato: f)
cuttable(f_0). % cuttable(purple potato: f)
cuttable(f_1). % cuttable(banana: f)
cuttable(f_3). % cuttable(yellow potato: f)
_east_of(r_0, r_2). % east_of(kitchen: r, livingroom: r)
_east_of(r_1, r_0). % east_of(pantry: r, kitchen: r)
_east_of(r_2, r_3). % east_of(livingroom: r, corridor: r)
_east_of(r_3, r_4). % east_of(corridor: r, bedroom: r)
_east_of(r_6, r_7). % east_of(backyard: r, shed: r)
_north_of(r_0, r_6). % north_of(kitchen: r, backyard: r)
_north_of(r_3, r_5). % north_of(corridor: r, bathroom: r)
_north_of(r_6, r_8). % north_of(backyard: r, garden: r)
sharp(o_1). % sharp(knife: o)
_south_of(r_5, r_3). % south_of(bathroom: r, corridor: r)
_south_of(r_6, r_0). % south_of(backyard: r, kitchen: r)
_south_of(r_8, r_6). % south_of(garden: r, backyard: r)
_west_of(r_0, r_1). % west_of(kitchen: r, pantry: r)
_west_of(r_2, r_0). % west_of(livingroom: r, kitchen: r)
_west_of(r_3, r_2). % west_of(corridor: r, livingroom: r)
_west_of(r_4, r_3). % west_of(bedroom: r, corridor: r)
_west_of(r_7, r_6). % west_of(shed: r, backyard: r)


% ------- initial fluents (initialized with t=0) -------
#program initial_state(t).

edible(f_1, t). % edible(banana: f)
edible(f_2, t). % edible(salt: f)
edible(meal_0, t). % edible(meal)
%free(slot_4, t). % free(slot_4: slot)
%free(slot_5, t). % free(slot_5: slot)
%free(slot_6, t). % free(slot_6: slot)
%free(slot_7, t). % free(slot_7: slot)
%free(slot_8, t). % free(slot_8: slot)
%free(slot_9, t). % free(slot_9: slot)
in(f_0, inventory, t). % in(purple potato: f, I)
in(f_1, inventory, t). % in(banana: f, I)
in(f_2, inventory, t). % in(salt: f, I)
in(f_3, inventory, t). % in(yellow potato: f, I)
inedible(f_0, t). % inedible(purple potato: f)
inedible(f_3, t). % inedible(yellow potato: f)
cooked_state(f_0, needs_cooking, t). % needs_cooking(purple potato: f)
cooked_state(f_3, needs_cooking, t). % needs_cooking(yellow potato: f)
open(c_0, t). % open(fridge: c)
open(c_1, t). % open(toolbox: c)
open(d_0, t). % open(plain door: d)
open(d_1, t). % open(sliding patio door: d)
open(d_2, t). % open(wooden door: d)
cooked_state(f_1, raw, t). % raw(banana: f)
cut_state(f_0, uncut, t). % uncut(purple potato: f)
cut_state(f_1, uncut, t). % uncut(banana: f)
cut_state(f_3, uncut, t). % uncut(yellow potato: f)
used(slot_0, t). % used(slot_0: slot)
used(slot_1, t). % used(slot_1: slot)
used(slot_2, t). % used(slot_2: slot)
used(slot_3, t). % used(slot_3: slot)


% ------- Recipe -------
#program recipe(t).

base(f_0, ingredient_1). % base(purple potato: f, ingredient_1: ingredient)
base(f_1, ingredient_0). % base(banana: f, ingredient_0: ingredient)
base(f_2, ingredient_2). % base(salt: f, ingredient_2: ingredient)
cooking_location(r_0, recipe). % cooking_location(kitchen: r, RECIPE)
should_cook(ingredient_1, fried). % fried(ingredient_1: ingredient)
should_cook(ingredient_0, grilled). % grilled(ingredient_0: ingredient)
in(ingredient_0, recipe). % in(ingredient_0: ingredient, RECIPE)
in(ingredient_1, recipe). % in(ingredient_1: ingredient, RECIPE)
in(ingredient_2, recipe). % in(ingredient_2: ingredient, RECIPE)
ingredient_1(f_1). % ingredient_1(banana: f)
ingredient_2(f_0). % ingredient_2(purple potato: f)
ingredient_3(f_2). % ingredient_3(salt: f)
out(meal_0, recipe). % out(meal, RECIPE)
should_cook(ingredient_2, raw). % raw(ingredient_2: ingredient)
should_cut(ingredient_0, uncut). % uncut(ingredient_0: ingredient)
should_cut(ingredient_1, uncut). % uncut(ingredient_1: ingredient)
should_cut(ingredient_2, uncut). % uncut(ingredient_2: ingredient)

in_recipe(I,F) :- ingredient(I), in(I,recipe), base(F,I), instance_of(F,f).
in_recipe(F) :- in_recipe(I,F).


% ------- ROOM fluents -------

#program initial_room(t).
at(player, r_0, t). % at(P, kitchen: r)
room_changed(nowhere,r_0,t).

#program room_r_0(t).
east_of(unknownE, r_0). % east_of(pantry: r, kitchen: r)
%free(r_0, r_1, t). % free(kitchen: r, pantry: r)
%free(r_0, r_2, t). % free(kitchen: r, livingroom: r)
%free(r_0, r_6, t). % free(kitchen: r, backyard: r)
link(r_0, d_0, unknownE). % link(kitchen: r, plain door: d, pantry: r)
link(r_0, d_1, unknownS). % link(kitchen: r, sliding patio door: d, backyard: r)
south_of(unknownS, r_0). % south_of(backyard: r, kitchen: r)
west_of(unknownW, r_0). % west_of(livingroom: r, kitchen: r)
at(c_0, r_0, t). % at(fridge: c, kitchen: r)
at(oven_0, r_0, t). % at(oven, kitchen: r)
at(s_0, r_0, t). % at(table: s, kitchen: r)
at(s_1, r_0, t). % at(counter: s, kitchen: r)
at(stove_0, r_0, t). % at(stove, kitchen: r)
on(o_0, s_0, t). % on(cookbook: o, table: s)
on(o_1, s_0, t). % on(knife: o, table: s)

#program room_r_1(t).
%free(r_1, r_0, t). % free(pantry: r, kitchen: r)
link(r_1, d_0, unknownW). % link(pantry: r, plain door: d, kitchen: r)
west_of(unknownW, r_1). % west_of(kitchen: r, pantry: r)
at(s_2, r_1, t). % at(shelf: s, pantry: r)

#program room_r_2(t).
east_of(unknownE, r_2). % east_of(kitchen: r, livingroom: r)
%free(r_2, r_0, t). % free(livingroom: r, kitchen: r)
%free(r_2, r_3, t). % free(livingroom: r, corridor: r)
west_of(unknownW, r_2). % west_of(corridor: r, livingroom: r)
at(s_5, r_2, t). % at(sofa: s, livingroom: r)

#program room_r_3(t).
east_of(unknownE, r_3). % east_of(livingroom: r, corridor: r)
%free(r_3, r_2, t). % free(corridor: r, livingroom: r)
%free(r_3, r_4, t). % free(corridor: r, bedroom: r)
%free(r_3, r_5, t). % free(corridor: r, bathroom: r)
south_of(unknownS, r_3). % south_of(bathroom: r, corridor: r)
west_of(unknownW, r_3). % west_of(bedroom: r, corridor: r)

#program room_r_4(t).
east_of(unknownE, r_4). % east_of(corridor: r, bedroom: r)
%free(r_4, r_3, t). % free(bedroom: r, corridor: r)
at(s_8, r_4, t). % at(bed: s, bedroom: r)

#program room_r_5(t).
%free(r_5, r_3, t). % free(bathroom: r, corridor: r)
north_of(unknownN, r_5). % north_of(corridor: r, bathroom: r)
at(s_7, r_5, t). % at(toilet: s, bathroom: r)

#program room_r_6(t).
%free(r_6, r_0, t). % free(backyard: r, kitchen: r)
%free(r_6, r_7, t). % free(backyard: r, shed: r)
%free(r_6, r_8, t). % free(backyard: r, garden: r)
link(r_6, d_1, unknownN). % link(backyard: r, sliding patio door: d, kitchen: r)
link(r_6, d_2, unknownW). % link(backyard: r, wooden door: d, shed: r)
north_of(unknownN, r_6). % north_of(kitchen: r, backyard: r)
south_of(unknownS, r_6). % south_of(garden: r, backyard: r)
west_of(unknownW, r_6). % west_of(shed: r, backyard: r)
at(s_4, r_6, t). % at(patio chair: s, backyard: r)
at(s_6, r_6, t). % at(patio table: s, backyard: r)
at(toaster_0, r_6, t). % at(BBQ: toaster, backyard: r)

#program room_r_7(t).
east_of(unknownE, r_7). % east_of(backyard: r, shed: r)
%free(r_7, r_6, t). % free(shed: r, backyard: r)
link(r_7, d_2, unknownE). % link(shed: r, wooden door: d, backyard: r)
at(c_1, r_7, t). % at(toolbox: c, shed: r)
at(s_3, r_7, t). % at(workbench: s, shed: r)

#program room_r_8(t).
%free(r_8, r_6, t). % free(garden: r, backyard: r)
north_of(unknownN, r_8). % north_of(backyard: r, garden: r)

