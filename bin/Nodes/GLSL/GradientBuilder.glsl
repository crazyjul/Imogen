vec4 GetRamp(float v, vec4 arr[8]) 
{
    for (int i = 0;i<(arr.length()-1);i++)
    {
        if (v >= arr[i].w && v <= arr[i+1].w)
        {
            // linear
            float t = (v-arr[i].w)/(arr[i+1].w-arr[i].w);
            // smooth
            //float t = smoothstep(arr[i].w, arr[i+1].w, v);
            return sqrt(mix(arr[i]*arr[i], arr[i+1]*arr[i+1], t));
        }
    }
    
    return vec4(0.0);
}

layout (std140) uniform GradientBuilderBlock
{
	vec4 ramp[8];
} GradientBuilderParam;

vec4 GradientBuilder()
{
	return vec4(GetRamp(vUV.x, GradientBuilderParam.ramp).xyz, 1.0);
}