import { batOpts, log, print, printHeader } from "../lib.ts";
import { Args, LoadImpl, ModeImpl, State } from "../types.ts";

const parseRgItem = (args: Args) => {
  const item = args._.at(0)?.toString();
  if (!item) {
    throw `parseRgItem: No item given`;
  }
  const file = item.split(":").at(0);
  if (!file) {
    throw `parseRgItem: Parse error: file not found: ${item}`;
  }
  const line = item.split(":").at(1);
  if (!line) {
    throw `parseRgItem: Parse error: line not found: ${item}`;
  }
  log({ item, line });
  return { file, line: Number(line) };
};

// Loader
const rgargss = ([] as string[])
  .concat(["--column"])
  .concat(["--line-number"])
  .concat(["--no-heading"])
  .concat(["--color=never"])
  .concat(["--smart-case"]);

const loadRg: LoadImpl = async (s, argss) => {
  printHeader(s);
  const query = argss.query.toString();
  try {
    const p = Deno.run({
      cmd: ["rg"].concat(rgargss, query),
      cwd: s.cwd,
    });
    await p.status();
  } catch (e) {
    log(e.toString());
    throw e;
  }
};

const previewRgItem = async (s: State, args: Args) => {
  const { file, line } = parseRgItem(args);
  const start = Math.max(Number(line) - 15, 0);
  const batExtraargss = [
    "--line-range",
    `${start}:`,
    "--highlight-line",
    `${line}`,
  ];
  print(`  [${file}]`);
  log(["bat"].concat(batOpts, batExtraargss, [file]));
  await Deno.run({
    cmd: ["bat"].concat(batOpts, batExtraargss, [file]),
    cwd: s.cwd,
  }).status();
  return;
};

export const rg: ModeImpl = {
  mode: "rg",
  load: loadRg,
  preview: previewRgItem,
  defaultRunner: "nvim",
  modifyRunnerArgs: {
    nvim: (_, args) => {
      const { file, line } = parseRgItem(args);
      return Object.assign(args, { _: [file], line });
    },
    vifm: (s, _args) => {
      return { _: [s.cwd] };
    },
  },
};
