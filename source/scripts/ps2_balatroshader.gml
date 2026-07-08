/*
    balatrothing
*/

return shader_pixel_create_base64("
    eJztWEtoJEUY/qp7Jo95bIOCoFEZdhHUQyAJLgmamWTjYYWRxV0bZC/jqnGNZM2S
    RK/WIMiKXhUPHmoQBHtg8eDjsrvmGpiAiLfcZPDixZt4seWrv2v6sYloNoKHJHSo
    /uqv//l11V9RXhz/GZ/HyovL5x4G8CsA5cVxGQDfoYAhAA3AwxgUHsJHxAF8ZrFx
    KDw6wr6w2AQUTo+wryxWgsJ9uJVgA4uVofAAfkqwzsqF9oXwYmcG/b6CD2XX5Odm
    R6M5dDZXtzbW395e23gLIu+l8ttr11bR78Pi/JWf61ud2c4reH7t1c2NrY3XtxuP
    X3yicb59qd249MaV11Y3Gysb166vra9uNhamZxemF56anZ6bmZnBC0AZCEznZvTM
    2cs3b//8znyz9MiXd4grBGb+93dbAHb2g93W1V8+WSHuITBM3X7w3M7eoL04N7fV
    Iu5b3Cy/98fpJoAW8Nsy8UkEZj/YXaL8m7e+bs5/+vkS8QoC8/Gz7zc/XL/afLB0
    tnXu5dVF4lXRT7s08z3/EK8hMHuDQQvQLcAsAXqHeF3w23uDweLeoN3aG7SbxE8h
    MKr+wzdXqt9+14+efPqDGzcWiAcITD+KWLI7ogstxbLB11UMTZnJRZnU0CXsmstA
    CfB0CUPDBwj1uJX3NMeUV/DtGPixK+vlnfLyXtMKU/Z5yeoraSDqVhGZKmKTYnEX
    iHQei7QCdBVR74y1O2ExjhVKWiHUVcD3MKEVIurQY3ZuQnuIdcXOKYtznoGKDvve
    FTvyXkXcox2Jibpjyicxin4+dIw6OQ+AOTFZjGuA6AAstpjoEkwBJmvP6U/thUYl
    uuin2BQ5+s51zIcHGA+hKcRn4xUZWSe5ok+sV5Tkh7W0trTUm74M7VNFaKTeYmcs
    Mxb7ysbBvDF/Kca60HfyyPnOeKMu/cj76fLCOtHnyHgJ5tb5QI+yDuPYR2h8ROb+
    ES/y85OAmURoHrO6yclYn8LQBAkvFWoamGJORrVyfGOeBUtz42oj/GZu0PMw1I7j
    1OUjNsyxxMKcu3qqJI7UZ4dl57M+0zYx53PWNu0wx1Jf8TvNq8hkdfN7nERkJhGz
    Jp4HX1cSnZwvW/5YPh7ZXz/Bsv6musMu7kF3qZALxuDbfYn7DPNS035SS8ZezMtx
    x0SdFUSG+9hxxeR89u2asOuNeGVr2T0uXvkH2vUT/oYFDg31cdaxaFu+Q9lDqF/W
    eSO+Ulb84zpibq+Q97xtwbLz+XzLvpfnkKL833DIK3Do39v1C3bTGIscOkpMguVr
    6R3CoTDhkFfg0FFiOthusi9nzp3oAE7t6v+yzofl+27+3nu+/9k+dMKhEw6dcOj/
    ug+hsA8Jdvd5R4zjfN8pWHY+33dSd/6sFbl0jzuKXulV8/2QO0ddnyj9O/ehqSRu
    5oF9v5MZ5SVjV7DsfD4e6anyPSnlkJxlYfeoul2vnc8V7yI8G9xZxtrxDjFM7ir0
    Z5j04+6uIrkZy4ylR5dxBbHhvUdiYc8b9lxdpM+Keo4XtF0DejWEmb5e7jZnDqlT
    Xl7qT3nxIbA6x0e5C/SYrR/r4s4LibnI+xoiU8vclZS1JVi6zt6re+k9j/dpse1j
    3PJjIum7fHtHZp5kPX2Ru4W708h7Xb4Le6eujzjr/Ob3K/LO7zpCe393PmZ9cHf2
    OpDISGwi4+Jw69z3Kn4Ixn9FyXscA38BGBhrvA==
")

/*
    precision mediump float;
                uniform vec2 resolution;
                uniform float time;

                #define SPIN_ROTATION -2.0
                #define SPIN_SPEED 2.0
                #define OFFSET vec2(0.0)
                uniform vec4 COLOUR_1;
                uniform vec4 COLOUR_2;
                uniform vec4 COLOUR_3;
                #define CONTRAST 1.5
                #define LIGTHING 0.1
                #define SPIN_AMOUNT 0.05
                uniform float PIXEL_FILTER;
                #define SPIN_EASE 1.0
                #define PI 3.14159265359
                #define IS_ROTATE false

                vec4 effect(vec2 screenSize, vec2 screen_coords) {
                    float pixel_size = length(screenSize.xy) / PIXEL_FILTER;
                    vec2 uv = (floor(screen_coords.xy*(1./pixel_size))*pixel_size - 0.5*screenSize.xy)/length(screenSize.xy) - OFFSET;
                    float uv_len = length(uv);

                    float speed = (SPIN_ROTATION*SPIN_EASE*0.2);
                    if(IS_ROTATE){
                        speed = time * speed;
                    }
                    speed += 302.2;
                    float new_pixel_angle = atan(uv.y, uv.x) + speed - SPIN_EASE*20.*(1.*SPIN_AMOUNT*uv_len + (1. - 1.*SPIN_AMOUNT));
                    vec2 mid = (screenSize.xy/length(screenSize.xy))/2.;
                    uv = (vec2((uv_len * cos(new_pixel_angle) + mid.x), (uv_len * sin(new_pixel_angle) + mid.y)) - mid);

                    uv *= 30.;
                    speed = time*(SPIN_SPEED);
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
                    vec2 uv = fragCoord / resolution.xy;
                    fragColor = effect(resolution.xy, uv * resolution.xy);
                }

                void main() {
                    vec4 fragment_color;
                    mainImage(fragment_color, gl_FragCoord.xy);
                    gl_FragColor = fragment_color;
                }

*/
