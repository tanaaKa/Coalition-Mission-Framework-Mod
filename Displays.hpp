class RscTitles {
  class mapTimeLeft {
    idd = 9913;
    movingEnable = 0;
    enableSimulation = 1;
    enableDisplay = 1;
    duration = 9999;
    fadein = 0;
    fadeout = 0;
    name = "mapTimeLeft";
    onLoad = "uiNamespace setVariable ['mapTimeLeft', _this select 0];";
    onUnLoad = "uiNamespace setVariable ['mapTimeLeft', nil]";
    class controls {
      class structuredText3 {
        type = 13;
        idc = 1003;
        style = 0x00;
        lineSpacing = 1;
        x = 0.78 * safezoneW + safezoneX;
        y = 0.980 * safezoneH + safezoneY;
        h = 0.020 * safezoneH;
        w = 0.10 * safezoneW;
        size = 0.020;
        colorBackground[] = {0,0,0,0.85};
        colorText[] = {1,1,1,1};
        text = "";
        font = "PuristaBold";
        class Attributes {
            font = "PuristaBold";
            color = "#FFFFFF";
            align = "CENTER";
            valign = "bottom";
            shadow = true;
            shadowColor = "#000000";
            underline = false;
            size = "1.7";
        };
      };
    };
  };
};
