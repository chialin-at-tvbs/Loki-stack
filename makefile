.PHONY: install
install: ## Intall helm charts
	helm upgrade \
		--install \
		--create-namespace \
		--namespace grafana \
		--values grafana/values.yaml \
		grafana grafana/grafana \
	
	helm upgrade \
		--install \
		--create-namespace \
		--namespace loki \
		--values loki/values.yaml \
		loki grafana/loki
	
	helm upgrade \
		--install \
		--create-namespace \
		--namespace fluent-bit \
		--values fluent-bit/values.yaml \
		fluent-bit fluent/fluent-bit

.PHONY: uninstall
uninstall: ## Uninstall helm charts
	helm uninstall -n grafana grafana
	helm uninstall -n loki loki
	helm uninstall -n fluent-bit fluent-bit

.PHONY: add-deps-repos
add-deps-repos: ## Add dependencies repositories
	helm repo add grafana https://grafana.github.io/helm-charts
	helm repo add fluent https://fluent.github.io/helm-charts

