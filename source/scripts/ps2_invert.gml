/*
    invertshader
*/

return shader_pixel_create_base64("
    eJxNjsFKw0AURc9LU8lCyA8IDrjRTWgiLrKz6cZFBbUVl2nVqAVLSlLB5XxCPiFr
    V/2ofocjMwnUGS7cO4f73ohnzK85YzIfZyfAEyCeMQLYjMAdMAIGLnpc23cgf1/n
    2bIu5sX39qsq8DlG3O3Ops6T/Jnb1UtV1uXbVp0/XKib6WyqZh/L16JSk3K9WX0W
    lUqjJI3SqyS6jOOYexhC2MIiAz8DNbbzTsEDNAx2Bx82vW8IwjZz3ww17HcE+3Z4
    yFaNzUKguy7tkeuKFozumGh4tOqZpwX+sR+rnvmOifVBt8MY+AOAPzv5
")

/*
    //
    // Invert Color Shader
    //
    varying vec2 v_vTexcoord;
    varying vec4 v_vColour;

    void main()
    {
        vec4 OC = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
        float NCr = 1.0 / ( 112.0 * ( OC.r / 2.0));
        float NCg = 1.0 / ( 66.0 * ( OC.g / 2.0 ));
        float NCb = 1.0 / ( 20.0 * ( OC.b / 2.0 ));
        gl_FragColor = vec4( NCr, NCg, NCb, OC.a );
    }

*/
