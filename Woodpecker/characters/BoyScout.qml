import QtQuick
import QtQuick3D

Node {
    id: boyScout

    // Public API
    property real walkSpeed: 1.0
    property int direction: 1   // 1 = right, -1 = left
    property bool walking: false

    scale.x: direction
    scale.y: 1
    scale.z: 1

    // =====================
    // BODY
    // =====================
    Model {
        id: torso
        source: "#Cylinder"
        scale: Qt.vector3d(0.6, 1.2, 0.4)
        materials: DefaultMaterial { diffuseColor: "#6b8e23" } // scout green
    }

    // =====================
    // HEAD
    // =====================
    Model {
        source: "#Sphere"
        y: 1.5
        scale: Qt.vector3d(0.5, 0.5, 0.5)
        materials: DefaultMaterial { diffuseColor: "#f2c9ac" }
    }

    // =====================
    // HAT
    // =====================
    Model {
        source: "#Cylinder"
        y: 1.8
        scale: Qt.vector3d(0.55, 0.15, 0.55)
        materials: DefaultMaterial { diffuseColor: "#8b4513" }
    }

    // =====================
    // LEFT LEG
    // =====================
    Node {
        id: leftLeg
        x: -0.25
        y: -1.1

        Model {
            source: "#Cylinder"
            scale: Qt.vector3d(0.2, 0.9, 0.2)
            materials: DefaultMaterial { diffuseColor: "#654321" }
        }
    }

    // =====================
    // RIGHT LEG
    // =====================
    Node {
        id: rightLeg
        x: 0.25
        y: -1.1

        Model {
            source: "#Cylinder"
            scale: Qt.vector3d(0.2, 0.9, 0.2)
            materials: DefaultMaterial { diffuseColor: "#654321" }
        }
    }

    // =====================
    // LEFT ARM
    // =====================
    Node {
        id: leftArm
        x: -0.7
        y: 0.3

        Model {
            source: "#Cylinder"
            scale: Qt.vector3d(0.15, 0.8, 0.15)
            materials: DefaultMaterial { diffuseColor: "#f2c9ac" }
        }
    }

    // =====================
    // RIGHT ARM
    // =====================
    Node {
        id: rightArm
        x: 0.7
        y: 0.3

        Model {
            source: "#Cylinder"
            scale: Qt.vector3d(0.15, 0.8, 0.15)
            materials: DefaultMaterial { diffuseColor: "#f2c9ac" }
        }
    }

    // =====================
    // WALK ANIMATION
    // =====================
    SequentialAnimation {
        id: walkAnim
        running: walking
        loops: Animation.Infinite

        ParallelAnimation {
            NumberAnimation { target: leftLeg; property: "rotation.x"; from: -30; to: 30; duration: 400 }
            NumberAnimation { target: rightLeg; property: "rotation.x"; from: 30; to: -30; duration: 400 }

            NumberAnimation { target: leftArm; property: "rotation.x"; from: 30; to: -30; duration: 400 }
            NumberAnimation { target: rightArm; property: "rotation.x"; from: -30; to: 30; duration: 400 }
        }

        ParallelAnimation {
            NumberAnimation { target: leftLeg; property: "rotation.x"; from: 30; to: -30; duration: 400 }
            NumberAnimation { target: rightLeg; property: "rotation.x"; from: -30; to: 30; duration: 400 }

            NumberAnimation { target: leftArm; property: "rotation.x"; from: -30; to: 30; duration: 400 }
            NumberAnimation { target: rightArm; property: "rotation.x"; from: 30; to: -30; duration: 400 }
        }
    }
    function startWalking(dir) {
        direction = dir
        walking = true
    }

    function stopWalking() {
        walking = false
    }


}

