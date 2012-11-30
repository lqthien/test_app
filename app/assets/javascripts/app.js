function moveTo(x, y) {
  $(".board-cell").removeClass("char1");
  $(".board-cell").eq(x * 10 + y).addClass("char1");
}

function currentPos() {
  pos = $(".char1");
  posIndex = $(".board-cell").index(pos);
  var e = new Object();
  e.x = parseInt(posIndex / 10);
  e.y = posIndex % 10;
  return e;
}

function move(direction) {
  pos = currentPos();
  currX = pos.x;
  currY = pos.y;
  switch(direction) {
    case "up":
      if(currX > 0)
        moveTo(currX - 1, currY);
      return;
    case "down":
      if(currX < 9)
        moveTo(currX + 1, currY);
      return;
    case "left":
      if(currY > 0)
        moveTo(currX, currY - 1);
      return;
    case "right":
      if(currY < 9)
        moveTo(currX, currY + 1);
      return;
    default:
      alert("Default");
  }
}

function handleKey(key) {
  if(key.keyCode != 0) {
    switch(key.keyCode) {
      case 38:
        move('up');
        return true;
      case 40:
        move('down');
        return true;
      case 37:
        move('left');
        return true;
      case 39:
        move('right');
        return true;
      default:
        return false;
    }
    return false;
  }
  return false;
}