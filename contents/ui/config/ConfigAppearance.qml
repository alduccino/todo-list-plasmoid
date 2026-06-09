import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import org.kde.kirigami as Kirigami
import org.kde.kcmutils as KCM

KCM.SimpleKCM {
    id: root

    // ── cfg_ properties ───────────────────────────────────────────────
    property bool   cfg_useSystemTheme: false

    property color  cfg_itemBgColor
    property real   cfg_itemBgOpacity
    property real   cfg_itemBlurRadius

    property color  cfg_typeBgColor
    property real   cfg_typeBgOpacity
    property real   cfg_typeBlurRadius

    property color  cfg_inputBgColor
    property real   cfg_inputBgOpacity

    property color  cfg_editBgColor
    property real   cfg_editBgOpacity
    // ─────────────────────────────────────────────────────────────────

    readonly property color previewItem:  Kirigami.Theme.backgroundColor
    readonly property color previewType:  Kirigami.Theme.highlightColor
    readonly property color previewInput: Kirigami.Theme.alternateBackgroundColor
    readonly property color previewEdit:  Kirigami.Theme.positiveTextColor

    ColumnLayout {
        Kirigami.FormLayout {
            id: form
            Layout.fillWidth: true

            // ── Color source ─────────────────────────────────────────
            Kirigami.Separator {
                Kirigami.FormData.isSection: true
                Kirigami.FormData.label: "Color Source"
                Layout.fillWidth: true
            }

            CheckBox {
                id: useSystemThemeCheck
                Kirigami.FormData.label: "Use system Plasma theme:"
                checked: cfg_useSystemTheme
                onCheckedChanged: cfg_useSystemTheme = checked
                text: checked ? "Colors follow the active Plasma color scheme"
                              : "Colors are set manually below"
            }

            // ── Todo item background ──────────────────────────────────
            Kirigami.Separator {
                Kirigami.FormData.isSection: true
                Kirigami.FormData.label: "Todo Item Background"
                Layout.fillWidth: true
            }

            RowLayout {
                Kirigami.FormData.label: "Color:"
                Button {
                    id: itemColorBtn
                    enabled: !useSystemThemeCheck.checked
                    opacity: enabled ? 1.0 : 0.4
                    implicitWidth: 32; implicitHeight: 32
                    background: Rectangle {
                        color: cfg_itemBgColor; radius: 4
                        border.color: Kirigami.Theme.textColor; border.width: 2
                    }
                    onClicked: itemColorDialog.open()
                    ColorDialog {
                        id: itemColorDialog
                        selectedColor: cfg_itemBgColor
                        onAccepted: cfg_itemBgColor = selectedColor
                    }
                }
                Rectangle {
                    visible: useSystemThemeCheck.checked
                    width: 32; height: 32; radius: 4
                    color: root.previewItem
                    border.color: Kirigami.Theme.textColor; border.width: 1
                }
                Label {
                    visible: useSystemThemeCheck.checked
                    text: "backgroundColor"
                    font.family: "monospace"; font.pixelSize: 11
                    color: Kirigami.Theme.disabledTextColor
                }
            }

            RowLayout {
                Kirigami.FormData.label: "Opacity:"
                Slider {
                    id: itemOpacitySlider
                    from: 0; to: 1; stepSize: 0.01
                    value: cfg_itemBgOpacity
                    onMoved: cfg_itemBgOpacity = value
                    implicitWidth: 200
                }
                Label { text: Math.round(itemOpacitySlider.value * 100) + "%" }
            }

            RowLayout {
                Kirigami.FormData.label: "Blur:"
                Slider {
                    id: itemBlurSlider
                    from: 0; to: 64; stepSize: 1
                    value: cfg_itemBlurRadius
                    onMoved: cfg_itemBlurRadius = value
                    implicitWidth: 200
                }
                Label { text: Math.round(itemBlurSlider.value) + " px" }
            }

            // ── Type label ────────────────────────────────────────────
            Kirigami.Separator {
                Kirigami.FormData.isSection: true
                Kirigami.FormData.label: "Type Label (Sub-task Count Pill)"
                Layout.fillWidth: true
            }

            RowLayout {
                Kirigami.FormData.label: "Color:"
                Button {
                    id: typeColorBtn
                    enabled: !useSystemThemeCheck.checked
                    opacity: enabled ? 1.0 : 0.4
                    implicitWidth: 32; implicitHeight: 32
                    background: Rectangle {
                        color: cfg_typeBgColor; radius: 4
                        border.color: Kirigami.Theme.textColor; border.width: 2
                    }
                    onClicked: typeColorDialog.open()
                    ColorDialog {
                        id: typeColorDialog
                        selectedColor: cfg_typeBgColor
                        onAccepted: cfg_typeBgColor = selectedColor
                    }
                }
                Rectangle {
                    visible: useSystemThemeCheck.checked
                    width: 32; height: 32; radius: 4
                    color: root.previewType
                    border.color: Kirigami.Theme.textColor; border.width: 1
                }
                Label {
                    visible: useSystemThemeCheck.checked
                    text: "highlightColor"
                    font.family: "monospace"; font.pixelSize: 11
                    color: Kirigami.Theme.disabledTextColor
                }
            }

            RowLayout {
                Kirigami.FormData.label: "Opacity:"
                Slider {
                    id: typeOpacitySlider
                    from: 0; to: 1; stepSize: 0.01
                    value: cfg_typeBgOpacity
                    onMoved: cfg_typeBgOpacity = value
                    implicitWidth: 200
                }
                Label { text: Math.round(typeOpacitySlider.value * 100) + "%" }
            }

            RowLayout {
                Kirigami.FormData.label: "Blur:"
                Slider {
                    id: typeBlurSlider
                    from: 0; to: 64; stepSize: 1
                    value: cfg_typeBlurRadius
                    onMoved: cfg_typeBlurRadius = value
                    implicitWidth: 200
                }
                Label { text: Math.round(typeBlurSlider.value) + " px" }
            }

            // ── Input box ─────────────────────────────────────────────
            Kirigami.Separator {
                Kirigami.FormData.isSection: true
                Kirigami.FormData.label: "Input Box Background"
                Layout.fillWidth: true
            }

            RowLayout {
                Kirigami.FormData.label: "Color:"
                Button {
                    id: inputColorBtn
                    enabled: !useSystemThemeCheck.checked
                    opacity: enabled ? 1.0 : 0.4
                    implicitWidth: 32; implicitHeight: 32
                    background: Rectangle {
                        color: cfg_inputBgColor; radius: 4
                        border.color: Kirigami.Theme.textColor; border.width: 2
                    }
                    onClicked: inputColorDialog.open()
                    ColorDialog {
                        id: inputColorDialog
                        selectedColor: cfg_inputBgColor
                        onAccepted: cfg_inputBgColor = selectedColor
                    }
                }
                Rectangle {
                    visible: useSystemThemeCheck.checked
                    width: 32; height: 32; radius: 4
                    color: root.previewInput
                    border.color: Kirigami.Theme.textColor; border.width: 1
                }
                Label {
                    visible: useSystemThemeCheck.checked
                    text: "alternateBackgroundColor"
                    font.family: "monospace"; font.pixelSize: 11
                    color: Kirigami.Theme.disabledTextColor
                }
            }

            RowLayout {
                Kirigami.FormData.label: "Opacity:"
                Slider {
                    id: inputOpacitySlider
                    from: 0; to: 1; stepSize: 0.01
                    value: cfg_inputBgOpacity
                    onMoved: cfg_inputBgOpacity = value
                    implicitWidth: 200
                }
                Label { text: Math.round(inputOpacitySlider.value * 100) + "%" }
            }

            // ── Edit popup ────────────────────────────────────────────
            Kirigami.Separator {
                Kirigami.FormData.isSection: true
                Kirigami.FormData.label: "Edit Popup Background"
                Layout.fillWidth: true
            }

            RowLayout {
                Kirigami.FormData.label: "Color:"
                Button {
                    id: editColorBtn
                    enabled: !useSystemThemeCheck.checked
                    opacity: enabled ? 1.0 : 0.4
                    implicitWidth: 32; implicitHeight: 32
                    background: Rectangle {
                        color: cfg_editBgColor; radius: 4
                        border.color: Kirigami.Theme.textColor; border.width: 2
                    }
                    onClicked: editColorDialog.open()
                    ColorDialog {
                        id: editColorDialog
                        selectedColor: cfg_editBgColor
                        onAccepted: cfg_editBgColor = selectedColor
                    }
                }
                Rectangle {
                    visible: useSystemThemeCheck.checked
                    width: 32; height: 32; radius: 4
                    color: root.previewEdit
                    border.color: Kirigami.Theme.textColor; border.width: 1
                }
                Label {
                    visible: useSystemThemeCheck.checked
                    text: "positiveTextColor"
                    font.family: "monospace"; font.pixelSize: 11
                    color: Kirigami.Theme.disabledTextColor
                }
            }

            RowLayout {
                Kirigami.FormData.label: "Opacity:"
                Slider {
                    id: editOpacitySlider
                    from: 0; to: 1; stepSize: 0.01
                    value: cfg_editBgOpacity
                    onMoved: cfg_editBgOpacity = value
                    implicitWidth: 200
                }
                Label { text: Math.round(editOpacitySlider.value * 100) + "%" }
            }
        }
    }
}
