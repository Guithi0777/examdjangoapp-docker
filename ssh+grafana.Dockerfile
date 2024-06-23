FROM grafana/grafana
    
# Ajout des configurations et des tableaux de bord Grafana

COPY grafana/dashboards.yml /grafana/
COPY grafana/grafana.ini /grafana/
COPY grafana/datasource.yml /grafana/

# Démarrage du service SSH et exécution de bash
#CMD ["tail", "-f", "/dev/null"]

