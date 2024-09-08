        // Initialisation de la carte Leaflet avec zoom initial sur l'Europe
        var map = L.map('map').setView([48, 16], 5);

        // Fond de carte ou tuiles (Esri WorldStreetMap)
        L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}', {
            attribution: 'Tiles &copy; Esri &mdash; Source: Esri, DeLorme, NAVTEQ, USGS, Intermap, iPC, NRCAN, Esri Japan, METI, Esri China (Hong Kong), Esri (Thailand), TomTom, 2012'
        }).addTo(map);

        // Définition des icônes
        var img_residences = L.icon({
            //iconUrl: 'img/symbole-de-la-maison.png',
            iconUrl: 'img/apartment.png',
            iconSize: [30, 30],
            iconAnchor: [15, 30],
            popupAnchor: [0, -30],
        });

        var img_voyages = L.icon({
            iconUrl: 'img/voyageur-avec-une-valise.png',
            iconSize: [30, 30],
            iconAnchor: [15, 30],
            popupAnchor: [0, -30],
        });

        var img_fournisseurs = L.icon({
            //iconUrl: 'img/fournisseur.png',
            iconUrl: 'img/book-shop.png',
            iconSize: [30, 30],
            iconAnchor: [15, 30],
            popupAnchor: [0, -30],
        });

        var img_collaborateurs = L.icon({
            //iconUrl: 'img/traiter.png',
            iconUrl: 'img/quill-dessinant-une-ligne.png',
            iconSize: [30, 30],
            iconAnchor: [15, 30],
            popupAnchor: [0, -30],
        });

        var img_baa = L.icon({
            iconUrl: 'img/bibliotheque.png',
            iconSize: [30, 30],
            iconAnchor: [15, 30],
            popupAnchor: [0, -30],
        });

        var img_rj = L.icon({
            //iconUrl: 'img/quill-dessinant-une-ligne.png',
            iconUrl: 'img/home.png',
            iconSize: [30, 30],
            iconAnchor: [15, 30],
            popupAnchor: [0, -30],
        });

        var geoJsonLayer;
        
        const configServeur = document.getElementById('serveur').innerHTML.trim(); //récup de la variable serveur   

        // Chargement du GeoJson
        fetch('geojson/lieux2.geojson')
            .then(response => response.json())
            .then(data => {
                
                geoJsonLayer = L.geoJson(data, {
                    onEachFeature: function (feature, layer) {
                        // Propriété de l'infobulle (tooltip)
                        var infobulle = "<b>" + feature.properties.nom_lieu.split(', ').slice(0, -1).join(', ') + "</b><br/>" +
                            "<div style='text-align: justify;'>" + decrireType(feature.properties.nom_type) + "</div>";
                        if (feature.properties.date_voyage) {
                            infobulle += "<br/><div style='text-align: justify;'><b>Date du séjour :</b> " + feature.properties.date_voyage + "</div>";
                        }
                        if (feature.properties.document) {
                            infobulle += "<br/><div style='text-align: justify;'><b>Lettres mentionnant ce lieu :</b> " + feature.properties.document + "</div";
                        }
                        layer.bindPopup(infobulle);

                        // Icône définie en fonction du type de lieu
                        var icones = [];
                        if (feature.properties.nom_type.includes("Residences")) {
                            icones.push(img_residences);
                        }
                        if (feature.properties.nom_type.includes("Voyages")) {
                            icones.push(img_voyages);
                        }
                        if (feature.properties.nom_type.includes("Fournisseurs")) {
                            icones.push(img_fournisseurs);
                        }
                        if (feature.properties.nom_type.includes("Collaborateurs")) {
                            icones.push(img_collaborateurs);
                        }
                        if (feature.properties.nom_type.includes("BAA")) {
                            icones.push(img_baa);
                        }
                        if (feature.properties.nom_type.includes("ReneJean")) {
                            icones.push(img_rj);
                        }
                        if (icones.length > 0) {
                            
                            var icone = L.divIcon({
                                className: 'custom-div-icon',
                                html: icones.map(i => `<img src="${i.options.iconUrl}" width="25" height="25">`).join(' ')
                            });
                            layer.setIcon(icone);
                        }


                    }
                });

                // Initialisation et ajout du cluster de marqueurs
                var marqueurs = L.markerClusterGroup();

                marqueurs.addLayer(geoJsonLayer);
                
                map.addLayer(marqueurs);

                // Initialiation des filtres de date
                filtrerDate(data.features);

                // Gestion des dates pour les lignes en pointillés
                // attention aux noms de variable (9)
                var datesUniques = {};
                geoJsonLayer.eachLayer(function (layer) {
                    var date = layer.feature.properties.date_voyage;
                    if (date) {
                        if (!datesUniques[date]) {
                            datesUniques[date] = [];
                        }
                        datesUniques[date].push(layer.getLatLng());
                    }
                });

                for (var date in datesUniques) {
                    if (datesUniques[date].length > 1) {
                        L.polyline(datesUniques[date], { color: 'blue', dashArray: '5, 5' }).addTo(map);
                    }
                }
            })
            //.catch(error => console.error('Erreur chargement GeoJSON:', error)); // message d'erreur console
            
        // Fonction pour initialiser les filtres de date
        function filtrerDate(features) {
            var dates = features
                .map(f => f.properties.date_voyage)
                .filter(date => date !== undefined && date !== null && date !== "")
                .sort();
            var uniqueDates = [...new Set(dates)];

            var divFiltreDates = document.getElementById("filtreDates");
            uniqueDates.forEach(date => {
                var checkbox = document.createElement("input");
                checkbox.type = "checkbox";
                checkbox.value = date;
                checkbox.id = date + "Check";
                checkbox.className = "form-check-input";
                checkbox.onclick = updateFiltres;

                var label = document.createElement("label");
                label.htmlFor = date + "Check";
                label.className = "form-check-label";
                label.appendChild(document.createTextNode(date));

                var div = document.createElement("div");
                div.className = "form-check";
                div.appendChild(checkbox);
                div.appendChild(label);

                divFiltreDates.appendChild(div);
            });
        }

        // Fonction pour chercher l'icône en fonction du type de lieu
        function trouverIcone(type) {
            switch (type) {
                case "Residences":
                    return img_residences;
                case "Voyages":
                    return img_voyages;
                case "Fournisseurs":
                    return img_fournisseurs;
                case "Collaborateurs":
                    return img_collaborateurs;
                case "BAA":
                    return img_baa;
                case "ReneJean":
                    return img_rj;
                default:
                    return null;
            }
        }

        // Fonction pour obtenir la description en fonction du type de lieu
        function decrireType(type) {
            switch (type) {
                case "Residences":
                    return "Résidences (domiciles et lieux de villégiature) de Jacques Doucet";
                case "Voyages":
                    return "Voyages de Jacques Doucet";
                case "Fournisseurs":
                    return "Présence de fournisseurs";
                case "Collaborateurs":
                    return "Collaborateurs (dont personnes morales) et correspondants";
                case "BAA":
                    return "Bibliothèque d'Art et d'Archéologie";
                case "ReneJean":
                    return "Lieux de résidence de René-Jean";
                case "Voyages, Fournisseurs":
                    return "Voyages de Jacques Doucet et présence de fournisseurs";
                case "Voyages, Fournisseurs, Collaborateurs":
                    return "Voyages de Jacques Doucet, présence de fournisseurs et de collaborateurs (dont personnes morales)";
                case "Collaborateurs, Residences":
                    return "Résidences de Jacques Doucet (domiciles et villégiatures) et présence de collaborateurs (dont personnes morales)";
                case "Residences, BAA":
                    return "Résidence de Jacques Doucet et emplacement de la Bibliothèque d'Art et d'Archéologie";
                case "Voyages, Collaborateurs":
                    return "Voyages de Jacques Doucet et présence de collaborateurs (dont personnes morales)";
                default:
                    return type;
            }
        }

        // Fonction pour mettre à jour les filtres 
        function updateFiltres() {
            var typesCoches = Array.from(document.querySelectorAll("#filtres input[type=checkbox]:checked")).map(input => input.value);
            var datesCochees = Array.from(document.querySelectorAll("#filtreDates input[type=checkbox]:checked")).map(input => input.value);

            geoJsonLayer.eachLayer(function (layer) {
                var matchType = typesCoches.length === 0 || typesCoches.includes(layer.feature.properties.nom_type);
                var matchDate = datesCochees.length === 0 || datesCochees.includes(layer.feature.properties.date_voyage);

                if (matchType && (matchDate || !layer.feature.properties.date_voyage)) {
                    if (!map.hasLayer(layer)) {
                        map.addLayer(layer);
                    }
                } else {
                    if (map.hasLayer(layer)) {
                        map.removeLayer(layer);
                    }
                }
            });
        }
      


        // Fonction pour zoomer sur Paris
        function zoomParis() {
            map.setView([48.8566, 2.33], 13);
        }


        // Fonction pour dézoomer sur l'Europe
        function zoomEurope() {
            map.setView([48, 16], 5); // reprend le niveau de zoom initial
        }