/*
    balatrothing
*/

return shader_pixel_create_base64("
    eJydVU1oXFUU/t59b5KZZJIHKoKgOAj+LQxNoyWRZCYxWViJC9s8KF0YpI06IXVK
    Ul0U0Tt2I4yLLop0U7ijbnyBKtKVVsnGRSHZuFHIShndmp1tFz757rn3zZvUVSYE
    7v3Oud/5Pw9hlv2bTWBxZeGVxwFcAYAwyxQA3hEAHwJYAqAQIcBDWCEO4LzFSgjw
    KDYctto8tbbV2nj/UrP1Hra3twOEkH8vX2leWMM2LMY/+V3cWp1aPYbXm+c2W1ut
    ty/Vnjv1fO3V5dPLtdPvvnV+bbO22LpwsbmxtlmbmTg+MzHz0vGJqcnJSbwBlIDY
    kOOTv795GUAD0A3iAWKzejOdPXH25o9/fDBdj574+ifiCrGZ/ufjBoCd/fhO452/
    Pl8kHgqP3o9P7gC6DsxbniGLm4Ur956qC//BAvFhxGb99q369PUv5+9/9FrjseiE
    1S8jNvvxnXnyRHfXacf6WRGeeUDv7O3u1rvj61Z/BLH57c/rc79c/mH2xtQXs15/
    FLH5ufbt3Pcnq/XfLz9S93gVsXnhuxtze7tVcjX2dpfrxMdcHuZGfq2v334xtztO
    f+692Zi59Wl9qbNheY5J3g5KGPw9CagSoIHwaolFQqgj9AzQuzoEqACBjgAjZ6Uj
    JMbrAT0doKeLd74NrG6Jd3MWiIDI4k6mh9lGiDSQavICZXsWHp4zDSTOZmDvgzah
    H7YyuatBf9rUpSxA6uzSB5GTy+sIllrc+yk6/Id50E85n7G69DP5DMi6ALp9DMR0
    HxP/2WdAZkasb8TQAZLOqL0rcnWI+XwESAbywZglLs+XsS4R31IWACZAYgaxhDn4
    HyxzWJBjCjCH7ancHuNE50zhDfPDeDw33ygkRjl7PgbRzWzOXNw6BExodQftFXJD
    m7qQG4v5fJKXtulDH/M+id9wPvk8oc/bFl+pI5hyccibVIdITZhjNn7Wn3Ue4Bqy
    PZoa9qLHivIyYMpIzNN5r0oNfd8dnp0hZC4nUR6zzFKky0jz+rCvS7belMUa+Eo/
    Yzd374A5U4W60h/e1SF/PVaUF/0NoSxGf5SdpZ4OpU/CAFV7V1jK3wfIONfsCfdG
    OIddTx7NB8EYp0Kkh11vUZfxK6RtmfGj8UcuRvJHCNiXTtfuQNbISJyMJ2J/F/h4
    Tw/ZE6wofzCeopz5Yc2T9lE5JYY091FiSNpSp5CytkJPPwtAdhxrJXu7v+N8P/fP
    0mtyrgLFvcU8dP38BADnqTAr6FSRdKtITX9+ZTa9DntzUMfPJmua8/q95P0o2OEu
    S3QFMJX8eyQzU0XmdoLfG9zvstsUhi3vWP5NiOx9kEe+RRWkjkd2vtvhzj/ZE+SX
    /UfeRI+jZ5hrb4sxjaLneMZc7q4VeIixFtfc3uCbu7pid5uLvUysp0fcdxVluy9N
    lgH/AdlTvQw=
")

/*
    // Original by localthunk (https://www.playbalatro.com)

    // Configuration (modify these values to change the effect)
    #define SPIN_ROTATION -2.0
    #define SPIN_SPEED 7.0
    #define OFFSET vec2(0.0)
    #define COLOUR_1 vec4(0.871, 0.267, 0.231, 1.0)
    #define COLOUR_2 vec4(0.0, 0.42, 0.706, 1.0)
    #define COLOUR_3 vec4(0.086, 0.137, 0.145, 1.0)
    #define CONTRAST 3.5
    #define LIGTHING 0.4
    #define SPIN_AMOUNT 0.25
    #define PIXEL_FILTER 745.0
    #define SPIN_EASE 1.0
    #define PI 3.14159265359
    #define IS_ROTATE false

    vec4 effect(vec2 screenSize, vec2 screen_coords) {
        float pixel_size = length(screenSize.xy) / PIXEL_FILTER;
        vec2 uv = (floor(screen_coords.xy*(1./pixel_size))*pixel_size - 0.5*screenSize.xy)/length(screenSize.xy) - OFFSET;
        float uv_len = length(uv);

        float speed = (SPIN_ROTATION*SPIN_EASE*0.2);
        if(IS_ROTATE){
           speed = iTime * speed;
        }
        speed += 302.2;
        float new_pixel_angle = atan(uv.y, uv.x) + speed - SPIN_EASE*20.*(1.*SPIN_AMOUNT*uv_len + (1. - 1.*SPIN_AMOUNT));
        vec2 mid = (screenSize.xy/length(screenSize.xy))/2.;
        uv = (vec2((uv_len * cos(new_pixel_angle) + mid.x), (uv_len * sin(new_pixel_angle) + mid.y)) - mid);

        uv *= 30.;
        speed = iTime*(SPIN_SPEED);
        vec2 uv2 = vec2(uv.x+uv.y);

        for(int i=0; i < 5; i++) {
            uv2 += sin(max(uv.x, uv.y)) + uv;
            uv  += 0.5*vec2(cos(5.1123314 + 0.353*uv2.y + speed*0.131121),sin(uv2.x - 0.113*speed));
            uv  -= 1.0*cos(uv.x + uv.y) - 1.0*sin(uv.x*0.711 - uv.y);
        }

        float contrast_mod = (0.25*CONTRAST + 0.5*SPIN_AMOUNT + 1.2);
        float paint_res = min(2., max(0.,length(uv)*(0.035)*contrast_mod));
        float c1p = max(0.,1. - contrast_mod*abs(1.-paint_res));
        float c2p = max(0.,1. - contrast_mod*abs(paint_res));
        float c3p = 1. - min(1., c1p + c2p);
        float light = (LIGTHING - 0.2)*max(c1p*5. - 4., 0.) + LIGTHING*max(c2p*5. - 4., 0.);
        return (0.3/CONTRAST)*COLOUR_1 + (1. - 0.3/CONTRAST)*(COLOUR_1*c1p + COLOUR_2*c2p + vec4(c3p*COLOUR_3.rgb, c3p*COLOUR_1.a)) + light;
    }

    void mainImage(out vec4 fragColor, in vec2 fragCoord) {
        vec2 uv = fragCoord/iResolution.xy;

        fragColor = effect(iResolution.xy, uv * iResolution.xy);
    }

*/
