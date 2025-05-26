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
r(r_1). %  corridor
r(r_4). %  bathroom
r(r_3). %  bedroom
r(r_2). %  livingroom
r(r_5). %  pantry
r(r_6). %  backyard
r(r_8). %  shed
r(r_7). %  garden
d(d_0). %  frosted-glass door
d(d_1). %  patio door
d(d_2). %  wooden door
c(c_0). % conventional fridge
c(c_1). % metallic toolbox
f(f_1). %  carrot
oven(oven_0). % conventional oven
s(s_0). % massive table
s(s_1). % vast counter
s(s_2). % wooden shelf
s(s_3). % stylish patio chair
s(s_4). % stylish patio table
s(s_5). % wooden workbench
s(s_6). % white toilet
s(s_7). % comfy sofa
s(s_8). % large bed
stove(stove_0). % conventional stove
toaster(toaster_0). % recent BBQ
f(f_0). %  chicken breast
f(f_2). %  olive oil
f(f_3). %  chicken wing
ingredient(ingredient_0).
f(f_5). %  salt
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
ingredient(ingredient_2).
f(f_4). %  vegetable oil
o(o_0). % interesting cookbook

% ======= Facts =======
cookable(f_0). % cookable(chicken breast: f)
cookable(f_1). % cookable(carrot: f)
cookable(f_3). % cookable(chicken wing: f)
cuttable(f_1). % cuttable(carrot: f)
_east_of(r_0, r_1). % east_of(kitchen: r, corridor: r)
_east_of(r_1, r_4). % east_of(corridor: r, bathroom: r)
_east_of(r_3, r_2). % east_of(bedroom: r, livingroom: r)
_east_of(r_5, r_0). % east_of(pantry: r, kitchen: r)
_east_of(r_6, r_8). % east_of(backyard: r, shed: r)
_north_of(r_2, r_0). % north_of(livingroom: r, kitchen: r)
_north_of(r_6, r_1). % north_of(backyard: r, corridor: r)
_north_of(r_7, r_6). % north_of(garden: r, backyard: r)
_south_of(r_0, r_2). % south_of(kitchen: r, livingroom: r)
_south_of(r_1, r_6). % south_of(corridor: r, backyard: r)
_south_of(r_6, r_7). % south_of(backyard: r, garden: r)
_west_of(r_0, r_5). % west_of(kitchen: r, pantry: r)
_west_of(r_1, r_0). % west_of(corridor: r, kitchen: r)
_west_of(r_2, r_3). % west_of(livingroom: r, bedroom: r)
_west_of(r_4, r_1). % west_of(bathroom: r, corridor: r)
_west_of(r_8, r_6). % west_of(shed: r, backyard: r)


% ------- initial fluents (initialized with t=0) -------
#program initial_state(t).

cut_state(f_1, diced, t). % diced(carrot: f)
edible(f_1, t). % edible(carrot: f)
edible(f_5, t). % edible(salt: f)
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
inedible(f_0, t). % inedible(chicken breast: f)
inedible(f_2, t). % inedible(olive oil: f)
inedible(f_3, t). % inedible(chicken wing: f)
inedible(f_4, t). % inedible(vegetable oil: f)
cooked_state(f_0, needs_cooking, t). % needs_cooking(chicken breast: f)
cooked_state(f_3, needs_cooking, t). % needs_cooking(chicken wing: f)
open(c_0, t). % open(fridge: c)
open(c_1, t). % open(toolbox: c)
open(d_0, t). % open(frosted-glass door: d)
open(d_1, t). % open(patio door: d)
open(d_2, t). % open(wooden door: d)
cooked_state(f_1, raw, t). % raw(carrot: f)


% ------- Recipe -------
#program recipe(t).

base(f_0, ingredient_1). % base(chicken breast: f, ingredient_1: ingredient)
base(f_1, ingredient_0). % base(carrot: f, ingredient_0: ingredient)
base(f_2, ingredient_2). % base(olive oil: f, ingredient_2: ingredient)
cooking_location(r_0, recipe). % cooking_location(kitchen: r, RECIPE)
should_cut(ingredient_0, diced). % diced(ingredient_0: ingredient)
in(ingredient_0, recipe). % in(ingredient_0: ingredient, RECIPE)
in(ingredient_1, recipe). % in(ingredient_1: ingredient, RECIPE)
in(ingredient_2, recipe). % in(ingredient_2: ingredient, RECIPE)
ingredient_1(f_1). % ingredient_1(carrot: f)
ingredient_2(f_0). % ingredient_2(chicken breast: f)
ingredient_3(f_2). % ingredient_3(olive oil: f)
out(meal_0, recipe). % out(meal, RECIPE)
should_cook(ingredient_2, raw). % raw(ingredient_2: ingredient)
should_cook(ingredient_0, roasted). % roasted(ingredient_0: ingredient)
should_cook(ingredient_1, roasted). % roasted(ingredient_1: ingredient)
should_cut(ingredient_1, uncut). % uncut(ingredient_1: ingredient)
should_cut(ingredient_2, uncut). % uncut(ingredient_2: ingredient)

in_recipe(I,F) :- ingredient(I), in(I,recipe), base(F,I), instance_of(F,f).
in_recipe(F) :- in_recipe(I,F).


% ------- ROOM fluents -------

#program initial_room(t).
at(player, r_5, t). % at(P, pantry: r)
room_changed(nowhere,r_5,t).

#program room_r_0(t).
east_of(unknownE, r_0). % east_of(pantry: r, kitchen: r)
%free(r_0, r_1, t). % free(kitchen: r, corridor: r)
%free(r_0, r_2, t). % free(kitchen: r, livingroom: r)
%free(r_0, r_5, t). % free(kitchen: r, pantry: r)
link(r_0, d_0, unknownE). % link(kitchen: r, frosted-glass door: d, pantry: r)
north_of(unknownN, r_0). % north_of(livingroom: r, kitchen: r)
west_of(unknownW, r_0). % west_of(corridor: r, kitchen: r)
at(c_0, r_0, t). % at(fridge: c, kitchen: r)
at(oven_0, r_0, t). % at(oven, kitchen: r)
at(s_0, r_0, t). % at(table: s, kitchen: r)
at(s_1, r_0, t). % at(counter: s, kitchen: r)
at(stove_0, r_0, t). % at(stove, kitchen: r)
in(f_0, c_0, t). % in(chicken breast: f, fridge: c)
in(f_3, c_0, t). % in(chicken wing: f, fridge: c)
on(o_0, s_1, t). % on(cookbook: o, counter: s)

#program room_r_1(t).
east_of(unknownE, r_1). % east_of(kitchen: r, corridor: r)
%free(r_1, r_0, t). % free(corridor: r, kitchen: r)
%free(r_1, r_4, t). % free(corridor: r, bathroom: r)
%free(r_1, r_6, t). % free(corridor: r, backyard: r)
link(r_1, d_1, unknownN). % link(corridor: r, patio door: d, backyard: r)
north_of(unknownN, r_1). % north_of(backyard: r, corridor: r)
west_of(unknownW, r_1). % west_of(bathroom: r, corridor: r)

#program room_r_2(t).
east_of(unknownE, r_2). % east_of(bedroom: r, livingroom: r)
%free(r_2, r_0, t). % free(livingroom: r, kitchen: r)
%free(r_2, r_3, t). % free(livingroom: r, bedroom: r)
south_of(unknownS, r_2). % south_of(kitchen: r, livingroom: r)
at(s_7, r_2, t). % at(sofa: s, livingroom: r)

#program room_r_3(t).
%free(r_3, r_2, t). % free(bedroom: r, livingroom: r)
west_of(unknownW, r_3). % west_of(livingroom: r, bedroom: r)
at(s_8, r_3, t). % at(bed: s, bedroom: r)

#program room_r_4(t).
east_of(unknownE, r_4). % east_of(corridor: r, bathroom: r)
%free(r_4, r_1, t). % free(bathroom: r, corridor: r)
at(s_6, r_4, t). % at(toilet: s, bathroom: r)

#program room_r_5(t).
%free(r_5, r_0, t). % free(pantry: r, kitchen: r)
link(r_5, d_0, unknownW). % link(pantry: r, frosted-glass door: d, kitchen: r)
west_of(unknownW, r_5). % west_of(kitchen: r, pantry: r)
at(s_2, r_5, t). % at(shelf: s, pantry: r)
on(f_2, s_2, t). % on(olive oil: f, shelf: s)
on(f_4, s_2, t). % on(vegetable oil: f, shelf: s)
on(f_5, s_2, t). % on(salt: f, shelf: s)

#program room_r_6(t).
%free(r_6, r_1, t). % free(backyard: r, corridor: r)
%free(r_6, r_7, t). % free(backyard: r, garden: r)
%free(r_6, r_8, t). % free(backyard: r, shed: r)
link(r_6, d_1, unknownS). % link(backyard: r, patio door: d, corridor: r)
link(r_6, d_2, unknownW). % link(backyard: r, wooden door: d, shed: r)
north_of(unknownN, r_6). % north_of(garden: r, backyard: r)
south_of(unknownS, r_6). % south_of(corridor: r, backyard: r)
west_of(unknownW, r_6). % west_of(shed: r, backyard: r)
at(s_3, r_6, t). % at(patio chair: s, backyard: r)
at(s_4, r_6, t). % at(patio table: s, backyard: r)
at(toaster_0, r_6, t). % at(BBQ: toaster, backyard: r)

#program room_r_7(t).
%free(r_7, r_6, t). % free(garden: r, backyard: r)
south_of(unknownS, r_7). % south_of(backyard: r, garden: r)
at(f_1, r_7, t). % at(carrot: f, garden: r)

#program room_r_8(t).
east_of(unknownE, r_8). % east_of(backyard: r, shed: r)
%free(r_8, r_6, t). % free(shed: r, backyard: r)
link(r_8, d_2, unknownE). % link(shed: r, wooden door: d, backyard: r)
at(c_1, r_8, t). % at(toolbox: c, shed: r)
at(s_5, r_8, t). % at(workbench: s, shed: r)

