import 'package:flutter/material.dart';
import 'editor_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> projects = [];

  void _createProject() {
    showDialog(
      context: context,
      builder: (context) {
        final controller = TextEditingController();
        return AlertDialog(
          title: const Text('Nuevo proyecto'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Nombre del proyecto'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            FilledButton(
              onPressed: () {
                if (controller.text.trim().isNotEmpty) {
                  setState(() {
                    projects.add(controller.text.trim());
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Crear'),
            ),
          ],
        );
      },
    );
  }

  void _openProject(String name) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const EditorPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fluxer'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),

          // 🧩 Botón grande para crear nuevo proyecto
          Center(
            child: GestureDetector(
              onTap: _createProject,
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(Icons.add, size: 64),
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          // 🔹 Línea divisora
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Divider(
              thickness: 1.5,
              color: Colors.grey.shade400,
            ),
          ),

          const SizedBox(height: 10),

          // 📂 Lista de proyectos creados
          Expanded(
            child: projects.isEmpty
                ? const Center(
                    child: Text(
                      'Aún no tienes proyectos creados',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: projects.length,
                    itemBuilder: (context, index) {
                      final name = projects[index];
                      return ListTile(
                        leading: const Icon(Icons.folder_open),
                        title: Text(name),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => _openProject(name),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
