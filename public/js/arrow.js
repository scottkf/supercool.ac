var arrow = [
    [ 2, 0 ],
    [ -10, -4 ],
    [ -10, 4]
];
function drawFilledPolygon(shape) {
    ctx.beginPath();
    ctx.moveTo(shape[0][0],shape[0][1]);

    for(p in shape)
        if (p > 0) ctx.lineTo(shape[p][0],shape[p][1]);

    ctx.lineTo(shape[0][0],shape[0][1]);
    ctx.fill();
};
function translateShape(shape,x,y) {
    var rv = [];
    for(p in shape)
        rv.push([ shape[p][0] + x, shape[p][1] + y ]);
    return rv;
};
function rotateShape(shape,ang) {
    var rv = [];
    for(p in shape)
        rv.push(rotatePoint(ang,shape[p][0],shape[p][1]));
    return rv;
};
function rotatePoint(ang,x,y) {
    return [
        (x * Math.cos(ang)) - (y * Math.sin(ang)),
        (x * Math.sin(ang)) + (y * Math.cos(ang))
    ];
};
function drawLineArrow(canvas_id, x1,y1,x2,y2) {
	canvas = document.getElementById(canvas_id);
    ctx = canvas.getContext('2d');
    ctx.beginPath();
    ctx.moveTo(x1,y1);
    ctx.lineTo(x2,y2);
    ctx.stroke();
    var ang = Math.atan2(y2-y1,x2-x1);
    drawFilledPolygon(translateShape(rotateShape(arrow,ang),x2,y2));
};
$(document).ready(function() {
	drawLineArrow('condenser-canvas',50,0,50,50);
	drawLineArrow('compressor-canvas',50,0,100,30);
	drawLineArrow('lines2-canvas',50,0,65,20);
	drawLineArrow('lines2-canvas',30,0,20,60);
	drawLineArrow('orifice-canvas',70,30,20,0);
	drawLineArrow('refrigerant-canvas',190,20,20,50);
	drawLineArrow('evaporator-canvas',35,5,30,40);
	drawLineArrow('accumulator-canvas',35,5,120,52)
});