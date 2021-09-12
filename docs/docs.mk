help: #info: Display makefile help
	@$(PROJECT_ROOT)/docs/help.py

documentation: #info: Renders PlantUML files in docs directory into PNG
	@plantuml docs/*.puml
