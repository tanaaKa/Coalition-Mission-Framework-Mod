if (hasInterface) then
{
    fnc_MonitorShadowDistance =
    {
        MinShadowDistance = 200
        waitUntil
        {
            if (getShadowDistance != MinShadowDistance) then
            {
                setShadowDistance MinShadowDistance;
            };
            sleep 30;
            false
        };
    };
};