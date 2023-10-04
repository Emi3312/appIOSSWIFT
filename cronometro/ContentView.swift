//
//  ContentView.swift
//  holaMundo2
//
//  Created by Porfirio Emiliano Osorio Rios on 26/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var elapsedTime = 0 //Almacenar el tiempo en ms
    @State private var isTimerRunning = false //Indicar si esta corriendo el cronometro
    @State private var timer: Timer? //Intancia de timer para contar el tiempo transcurrido
    
    var body: some View {
        VStack {
            Text("Cronómetro")
                .font(.largeTitle)
                .padding()
            
            Text(formattedTime(elapsedTime))
                .font(.system(size: 80))
                .padding()
            
            HStack {
                Button(action: startTimer) {
                    Text("Iniciar")
                        .font(.title)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                Button(action: stopTimer) {
                    Text("Parar")
                        .font(.title)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                Button(action: resetTimer) {
                    Text("Reiniciar")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
            }
            .padding()
        }
    }
    
    //Se inicia cuando se da al boton "Iniciar"
    func startTimer() {
        //Mientras el timer no este corriendo se ejecuta lo siguiente
        if !isTimerRunning {
            //Creamos un timer que se ejecuta cada 0.01ms
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                self.elapsedTime += 1 //Actualizamos tiempo de variable
            }
            isTimerRunning = true //Indicamos que el cronometro esta en ejecucion
        }
    }
    
    func stopTimer() {
        //Paramos el tiempo con invalidate
        timer?.invalidate()
        isTimerRunning = false //Indicamos que no esta corriendo el cronometro
    }
    
    func resetTimer() {
        //Paramos el timer
        timer?.invalidate()
        isTimerRunning = false //Indicamos que ya no corre
        elapsedTime = 0 //Restablecemos la variable que contenia el tiempo transcurrido
    }
    
    //damos formato al tiempo que mostraremos al usuario
    func formattedTime(_ time: Int) -> String {
        let minutes = (time / 6000) % 60
        let seconds = (time / 100) % 60
        let milliseconds = time % 100
        return String(format: "%02d:%02d.%02d", minutes, seconds, milliseconds)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
