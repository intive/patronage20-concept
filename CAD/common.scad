module hexagon(d) {
    a = d / sqrt(3);
    ha = 0.5 * a;
    hd = 0.5 * d;
    polygon([[-ha,-hd],[-a,0],[-ha,hd],[ha,hd],[a,0],[ha,-hd]]);
}
