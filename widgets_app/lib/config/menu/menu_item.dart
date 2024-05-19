import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String route;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.route,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subtitle: 'varios botones en flutter',
    route: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subtitle: 'varias tarjetas en flutter',
    route: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'Listas',
    subtitle: 'varias listas en flutter',
    route: '/lists',
    icon: Icons.list,
  ),
];
