{
  description = "Pip-Based Environment (Binary Wheels)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          stdenv.cc.cc.lib
          zlib
          glib
          libGL
          libGLU
          libxml2
          libxslt
          
          xorg.libxcb
          xorg.libX11
          
          linuxPackages.nvidia_x11
          
          (python3.withPackages (ps: [
            ps.pip
            ps.venvShellHook
            ps.ipykernel
          ]))
        ];

        venvDir = "./.venv";

        shellHook = ''
          export LD_LIBRARY_PATH=/run/opengl-driver/lib:${pkgs.stdenv.cc.cc.lib}/lib:${pkgs.zlib}/lib:${pkgs.glib.out}/lib:${pkgs.libGL}/lib:${pkgs.libGLU}/lib:${pkgs.xorg.libxcb}/lib:${pkgs.xorg.libX11}/lib:$LD_LIBRARY_PATH
          export PYTHONPATH=$PYTHONPATH:$(pwd)
          
          if [ -d .venv ]; then
            source .venv/bin/activate
          fi
          
          echo "Environment Ready."
        '';
      };
    };
}
