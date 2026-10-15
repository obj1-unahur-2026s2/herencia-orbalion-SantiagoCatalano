class Equipo{
  var nombre 
  method nombre() = nombre
  var nivelEnergiaBase 
  method nivelEnergiaBase() = nivelEnergiaBase
  var entrenador 
  method entrenador() = entrenador 


  const tecnologiasComplementarias = []

  method agregarTecnologia(a) {
    tecnologiasComplementarias.add(a)
  }

  method energiaTotal() = nivelEnergiaBase + tecnologiasComplementarias.filter({a => a.activa()}).sum({a => a.valorEnergetico()})
  
  method esEliteGalactico() = entrenador.esElite()



}

class Luminico inherits Equipo {
  var radiacion
  method radiacion() = radiacion

  method nombresCristales() = tecnologiasComplementarias.map({a => a.nombre()})
  method cantCristales() = tecnologiasComplementarias.size()
  override method energiaTotal() = if(radiacion > 5000){super()}else{super() * 1.1}

  method esDePrestigioUniversal() = if(self.cantCristales() >= 3 && self.esEliteGalactico() && tecnologiasComplementarias.any({a => a.activa()})){true}else{false}

}

class Sintetico inherits Equipo{
  var nivelProcesamiento
  method nivelProcesamiento() = nivelProcesamiento

  var modulosActivos 
  method modulosActivos() = modulosActivos
    
  var certificado = true 
  method certificado() = certificado

  override method energiaTotal() = if(modulosActivos > 5){super() * 1.2}else{super()}

  method esDePrestigioUniversal() = if(certificado && modulosActivos > 3 && tecnologiasComplementarias.all({a => a.activa()})){true}else{false}
}

class EquipoEterico inherits Equipo{
  var fluctuacionDimensional
  method fluctuacionDimensional() = fluctuacionDimensional

  var portalesEnergeticos
  method portalesEnergeticos() = portalesEnergeticos

  method esDePrestigioUniversal() = if(fluctuacionDimensional > 75 && portalesEnergeticos >= 2 && tecnologiasComplementarias.count({a => a.activa()})>= 2){true}else{false}

  override method energiaTotal() = if(self.esDePrestigioUniversal()){super() * 1.15}else{super()}
}

class Entrenador{
  var ciclosSolares
  method ciclosSolares() = ciclosSolares

  var estaSintonia
  method estaSintonia() = estaSintonia

  var precision
  method precision() = (precision.max(0)).min(100)

  const listaRoles = ["Estratega Cuantico", "Arquitecto de Energia", "Guia Mental"]
  var rol
  method rol() = rol
  method cambiarRol(nuevoRol) {
    if(listaRoles.contains(nuevoRol)){
      rol = nuevoRol
    }else{
      self.error("Rol no homologado por la FOZ")
    }
  }

  method esElite() {
    if(self.rol() == "Estratega Cuantico" && self.precision() > 80 && self.ciclosSolares() > 10){
      return true
    }else if(self.ciclosSolares() > 10 && self.rol() == "Arquitecto de Energia" && self.estaSintonia() == true){
      return true
    }else if(self.ciclosSolares() > 10 && self.rol() =="Guia Mental"){
      return true
    }else{return false}
      
  }
  }


class TecnologiaEspecial {
  const nombre
  const valorEnergetico
  const activa
  method nombre() = nombre
  method valorEnergetico() = valorEnergetico
  method activa() = activa
}





























