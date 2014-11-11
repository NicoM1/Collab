// Modified version of a tilt shift shader from Martin Jonasson (http://grapefrukt.com/)
// Read http://notes.underscorediscovery.com/ for context on shaders and this file
// License : MIT
 
uniform sampler2D tex0;
varying vec2 tcoord;
varying vec4 color;
    
const float bluramount  = 1.0;
const float center      = 1.5;
const float stepSize    = 0.004;
const float steps       = 3.0;
 
const float minOffs     = (float(steps-1.0)) / -2.0;
const float maxOffs     = (float(steps-1.0)) / +2.0;
 
void main() {
 
    float amount;
    vec4 blurred;
        
        //Work out how much to blur based on the mid point 
    amount = bluramount;
        
        //This is the accumulation of color from the surrounding pixels in the texture
    blurred = vec4(0.0, 0.0, 0.0, 1.0);
        
        //From minimum offset to maximum offset
    for (float offsX = minOffs; offsX <= maxOffs; ++offsX) {
        for (float offsY = minOffs; offsY <= maxOffs; ++offsY) {
 
                //copy the coord so we can mess with it
            vec2 temp_tcoord = tcoord.xy;
 
                //work out which uv we want to sample now
            temp_tcoord.x += offsX * amount * stepSize;
            temp_tcoord.y += offsY * amount * stepSize;
 
                //accumulate the sample 
            blurred += texture2D(tex0, temp_tcoord);
        
        } //for y
    } //for x 
        
        //because we are doing an average, we divide by the amount (x AND y, hence steps * steps)
    blurred /= float(steps * steps);
 
        //return the final blurred color
    gl_FragColor = blurred;
 
} //main 