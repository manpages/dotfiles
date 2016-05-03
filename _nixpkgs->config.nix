{ pkgs }:

let myAndroidSdk = pkgs.androidenv.androidsdk {
    platformVersions = [ "24" ];
    abiVersions = [ "armeabi-v7a" ];
    useGoogleAPIs = true;
}; in

{

  packageOverrides = pkgs: rec {
    androidEnv = pkgs.buildEnv {
      name = "android-env";
      paths = [
        pkgs.idea.android-studio
        myAndroidSdk
      ];
    };
    myTexLive = pkgs.texLiveAggregationFun {
      paths = [ pkgs.texLive pkgs.texLiveExtra pkgs.texLiveBeamer pkgs.lmodern ];
    };
  };

}
