const rgbToHex = require("./rgbToHex");

const getColorMapEntry = (color, quantity, label, opacity) =>
  `  <ColorMapEntry color="${color}" quantity="${quantity}" label="${quantity}" opacity="${opacity}"/>`;

module.exports = (colors, minValue, maxValue) => {
  const increment = (maxValue - minValue) / (colors.length - 1);
  const colorsHex = rgbToHex(colors);
  const colorMapEntries = colorsHex.map((color, index) =>
    getColorMapEntry(
      color,
      (minValue + increment * index).toFixed(2),
      `${color}`,
      1
    )
  );
  return `<ColorMap>\n${colorMapEntries.join("\n")}\n</ColorMap>`;
};

const values = [
  "0,0,100",
  "5,5,130",
  "20,20,165",
  "30,42,195",
  "33,70,225",
  "37,110,249",
  "48,153,255",
  "75,200,255",
  "140,235,255",
  "200,250,255",
  "255,255,255",
  "255,250,170",
  "255,237,80",
  "255,210,30",
  "255,160,10",
  "250,105,4",
  "240,53,1",
  "210,16,0",
  "165,3,0",
  "135,0,0",
  "110,0,0"
];

console.log(module.exports(values, -2, 45));
