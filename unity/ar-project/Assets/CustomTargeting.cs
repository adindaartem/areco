using UnityEngine;
using Vuforia;
using UnityEngine.SceneManagement;

public class ActivateTargets : MonoBehaviour
{
    void Start()
    {
        VuforiaApplication.Instance.OnVuforiaStarted += ActivateTarget;
    }

    void ActivateTarget()
    {
        ImageTargetBehaviour imageTarget = GetComponent<ImageTargetBehaviour>();
        var scene = SceneManager.GetActiveScene().name;
        var name = imageTarget.name;

        imageTarget.enabled = false;

        if(scene == "Forest") {
            if (name == "ForestTarget") {
                imageTarget.enabled = true;
            }
        } else if (scene == "Marine") {
            if (name == "MarineTarget") {
                imageTarget.enabled = true;
            }
        } else if (scene == "Desert") {
            if (name == "DesertTarget") {
                imageTarget.enabled = true;
            }
        } else if (scene == "Grassland") {
            if (name == "GrasslandTarget") {
                imageTarget.enabled = true;
            }
        } else if (scene == "Tundra") {
            if (name == "TundraTarget") {
                imageTarget.enabled = true;
            }
        }
    }
}