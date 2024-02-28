import 'package:appwrite/appwrite.dart';
import 'package:wissen/server/constantes.dart';

class UsuarioBLL {
  Future<bool> validarLogin(String login, String senha) async {
    final client = Client().setEndpoint(urlEndpoint).setProject(projectId);
    final databases = Databases(client);

    try {
      await databases.listDocuments(
        databaseId: databaseId,
        collectionId: collectionIdUsuario,
        queries: [
          Query.equal('login', 'andre'),
          Query.equal('senha', '123'),
        ],
      );
      return true;
    } on Exception {
      return false;
    }
  }
}
