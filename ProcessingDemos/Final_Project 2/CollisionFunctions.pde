boolean circleCircleCollisionCheck(float x1, float y1, float d1, float x2, float y2, float d2) {
  float distance = dist(x1, y1, x2, y2);
  return (distance <= d1/2 + d2/2);
}

boolean rectangleCircleCollisionCheck(float rx, float ry, float rw, float rh,
  float cx, float cy, float cd) {
    float testX = cx;
    float testY = cy;
    
    if(cx < rx) testX = rx;
    else if(cx > rx + rw) testX = rx + rw;
    if(cy < ry) testY = ry;
    else if(cy > ry + rh) testY = ry + rh;
    float dX = cx - testX;
    float dY = cy - testY;
    float distance = sqrt(dX*dX + dY*dY);
    return (distance < cd/2);
}
