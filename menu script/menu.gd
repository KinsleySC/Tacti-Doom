extends Node

# Cette fonction est appelée quand la scène est prête
func _ready() -> void:
	# Si tu veux connecter les boutons par code, tu peux le faire ici
	# sinon les signaux peuvent être connectés depuis l'éditeur
	pass


# ----- BOUTON NIVEAU 1 -----
func _on_button_pressed() -> void:
	print("BOUTON NIVEAU 1 CLIQUÉ !!!")
	var scene_path = "3Dscene.tscn"
	if ResourceLoader.exists(scene_path):
		get_tree().change_scene_to_file(scene_path)
	else:
		print("Erreur : scène '3Dscene.tscn' introuvable !")
		
func lancer_ma_video():
	$VideoPlayer.play()  # démarre la vidéo au lancement de la scène


	
func _on_Menu_pressed() -> void:
	pass # Replace with function body.
	
	
func _on_button_5_pressed() -> void:
	print("BOUTON NIVEAU CREDIT CLIQUÉ !!!")
	var scene_path = "res://node_2d.tscn"
	if ResourceLoader.exists(scene_path):
		get_tree().change_scene_to_file(scene_path)
		
		
		



func _on_button_4_pressed() -> void:
	print("BOUTON PARAMETRE CLIQUE")
	var scene_path = "res://parametre.tscn"
	if ResourceLoader.exists(scene_path):
		get_tree().change_scene_to_file(scene_path)
		
	


func _on_button_3_pressed() -> void:
	print("BOUTON QUITTER CLIQUÉ !!!")
	get_tree().quit()
	
