{
  description = "Jupyter Lab Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          (python3.withPackages (ps: with ps; [
            ipykernel
            jupyter
            # Add your libraries here
            numpy
            pandas
            matplotlib
          ]))
        ];

        shellHook = ''
          export PYTHONPATH=$PYTHONPATH:$(pwd)
        '';
      };
    };
}
