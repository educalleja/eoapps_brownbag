module.exports = rgbList =>
  rgbList.map(colorRGB => {
    const vs = colorRGB.split(",");
    const red = parseInt(vs[0]);
    const green = parseInt(vs[1]);
    const blue = parseInt(vs[2]);
    return `#${red.toString(16).padStart(2, "0")}${green
      .toString(16)
      .padStart(2, "0")}${blue.toString(16).padStart(2, "0")}`;
  });
