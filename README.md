# 🧠 Quizz Évolué – Flutter

Application mobile Flutter permettant de comparer deux approches de gestion d’état : **Provider** et **BLoC**, à travers un quizz de culture générale (questions Vrai/Faux).

---

## 📸 Screenshots de l’application

![WhatsApp Image 2025-12-16 at 11 16 44 PM](https://github.com/user-attachments/assets/35a92636-059b-41dc-a467-5f8831f0c5c2)
![WhatsApp Image 2025-12-16 at 11 16 44 PM (1)](https://github.com/user-attachments/assets/c8774312-d1ca-4365-b8bb-44a16cad3769)


---

## 📱 Fonctionnalités

- 🏠 Écran d’accueil avec choix du mode :
  - **Provider**
  - **BLoC**
- ❓ Quizz de culture générale (Vrai / Faux)
- 🔄 Navigation entre les questions
- 🧮 Calcul et affichage du score en temps réel
- 🔁 Possibilité de recommencer le quizz
- 🎨 Interface moderne et cohérente
- 🧩 Même UI et logique métier pour les deux modes

---

## 🎯 Objectif pédagogique

Cette application a été développée dans un cadre académique afin de :

- comprendre et comparer **Provider** et **BLoC**,
- appliquer une **architecture propre et modulaire**,
- séparer la logique métier de l’interface utilisateur,
- illustrer l’évolution de la gestion d’état dans Flutter.

---

## 🛠️ Technologies utilisées

- **Flutter** (Dart)
- **Provider** (ChangeNotifier)
- **Streams** (BLoC fait maison)
- **Material Design 3**


---

## 🔄 Gestion d’état

### 🟢 Provider
- Basé sur `ChangeNotifier`
- Mise à jour automatique de l’interface via `notifyListeners()`
- Simple et rapide à implémenter

### 🔵 BLoC
- Basé sur des **Events** et des **Streams**
- Séparation stricte entre UI et logique métier
- Architecture plus robuste et scalable

---

## ▶️ Lancer l’application

```bash
flutter pub get
flutter run

L’application suit une architecture en couches :

