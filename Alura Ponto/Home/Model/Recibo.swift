//
//  Recibo.swift
//  Alura Ponto
//
//  Created by Ândriu Felipe Coelho on 29/09/21.
//

import Foundation
import UIKit
import CoreData

@objc(Recibo)
class Recibo: NSManagedObject {
    
    @NSManaged var id: UUID
    @NSManaged var status: Bool
    @NSManaged var data: Date
    @NSManaged var foto: UIImage
    
    convenience init(status: Bool, data: Date, foto: UIImage) {
        let contexto = UIApplication.shared.delegate as! AppDelegate
        self.init(context: contexto.persistentContainer.viewContext)
        self.id = UUID()
        self.status = status
        self.data = data
        self.foto = foto
    }
}


extension Recibo {
    // MARK: Core Data DAO
    
  class func fetchRequest() -> NSFetchRequest<Recibo> {
        return NSFetchRequest(entityName: "Recibo")
    }
    
    func save(_ contexto: NSManagedObjectContext)  {
        
        do {
            try contexto.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
   class func downloadData(_ fetchedResultController: NSFetchedResultsController<Recibo>)
    // class function nao precisa instanciar a classe
    {
        // toda Throw function pode retornar excecoes e necessário usar do + try + catch
        do {
            try fetchedResultController.performFetch()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deletar(_ coreDataContext: NSManagedObjectContext) {
          coreDataContext.delete(self)

          do {
              try coreDataContext.save()
          } catch {
              print(error.localizedDescription)
          }
      }
}
