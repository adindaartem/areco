using UnityEngine;
using UnityEngine.SceneManagement;

public class GameManager : MonoBehaviour
{
    public void changeScene(string name)
    {
        SceneManager.LoadScene(name, LoadSceneMode.Single);
    }
}
