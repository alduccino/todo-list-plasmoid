# Todo List Plasmoid

A customizable todo list widget for **KDE Plasma 6** with support for nested sub-tasks, drag-and-drop reordering, and full color/transparency/blur theming — including automatic integration with the active Plasma color scheme.

Based on [ff.qtodo](https://github.com/fightingff/qtodo/tree/customized) by fightingff.

---

## Features

- Add, edit, delete, and reorder todo items
- Nested sub-task lists with a completion counter pill
- Persistent storage via Qt LocalStorage
- **Appearance settings:**
  - Follow the active KDE Plasma color scheme automatically
  - Or set custom colors, opacity, and blur radius independently for:
    - Todo item background
    - Type label (sub-task count pill)
    - Input box background
    - Edit popup background

---

## Requirements

- KDE Plasma 6
- Qt 6.5+

---

## Installation

### Option 1 — Clone and install in one command

```bash
git clone https://github.com/alduccino/todo-list-plasmoid.git /tmp/todo-list-plasmoid && kpackagetool6 --type Plasma/Applet --install /tmp/todo-list-plasmoid
```

### Option 2 — Download zip and install

```bash
curl -L https://github.com/alduccino/todo-list-plasmoid/archive/refs/heads/main.zip -o /tmp/todo-list-plasmoid.zip && \
cd /tmp && unzip todo-list-plasmoid.zip && \
kpackagetool6 --type Plasma/Applet --install /tmp/todo-list-plasmoid-main
```

### After installing

Restart Plasma to make the widget appear in the widget picker:

```bash
killall plasmashell && kstart plasmashell
```

Then right-click your desktop or panel → **Add Widgets** → search for **Todo List**.

---

## Updating

```bash
cd /tmp/todo-list-plasmoid && git pull && \
kpackagetool6 --type Plasma/Applet --upgrade /tmp/todo-list-plasmoid
killall plasmashell && kstart plasmashell
```

---

## Uninstalling

```bash
kpackagetool6 --type Plasma/Applet --remove mike.todolist.plasmoid
```

---

## Customization

Right-click the widget → **Configure** → **Appearance** to access:

| Setting | Description |
|---|---|
| Use system Plasma theme | Automatically use colors from the active KDE color scheme |
| Todo item background | Color, opacity, and blur of each todo card |
| Type label | Color, opacity, and blur of the sub-task count pill |
| Input box | Color and opacity of the text input area |
| Edit popup | Color and opacity of the inline edit dialog |

---

## License

GPL-3.0+
