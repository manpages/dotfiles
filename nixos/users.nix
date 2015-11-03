{ wheel ? {}, users ? {}, ...}:
{ pkgs, ...} :

let 

maybeAttr = name: default: attrs: attrs.${name} or default;

fold = op: nul: list:
  if list == []
  then nul
  else op (builtins.head list) (fold op nul (builtins.tail list));

foldAttrs = op: nul: list_of_attrs:
  fold (n: a:
      fold (name: o:
        o // (builtins.listToAttrs [{inherit name; value = op n.${name} (maybeAttr name nul a); }])
      ) a (builtins.attrNames n)
  ) {} list_of_attrs;

mapAttrs = f: set:
  builtins.listToAttrs (builtins.map (attr: { name = attr; value = f attr set.${attr}; }) (builtins.attrNames set));

mergeAttrs = x: y: x // y;

in

{ users.extraUsers = 
          (mapAttrs (x: _y: { group = "wheel";
                              createHome = true;
                              home = "/home/${x}";
                              shell = "/run/current-system/sw/bin/bash"; }) wheel)
          //
          (mapAttrs (x: _y: { group = "users";
                              createHome = true;
                              home = "/home/${x}";
                              shell = "/run/current-system/sw/bin/bash"; }) users);
}
