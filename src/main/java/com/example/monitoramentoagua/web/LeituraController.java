package com.example.monitoramentoagua.web;

import com.example.monitoramentoagua.domain.Leitura;
import com.example.monitoramentoagua.dto.AtualizarLeituraDTO; // 1. IMPORTE O DTO DE ATUALIZAÇÃO
import com.example.monitoramentoagua.dto.CriarLeituraDTO;
import com.example.monitoramentoagua.service.LeituraService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus; 
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*; 
import java.util.List;

@RestController
@RequestMapping("/api/leituras")
@RequiredArgsConstructor
public class LeituraController {

    private final LeituraService leituraService;

    // Endpoint: POST /api/leituras
    @PostMapping
    public ResponseEntity<Leitura> criarNovaLeitura(@RequestBody CriarLeituraDTO dto) {
        Leitura leituraCriada = leituraService.criarLeitura(dto);
        return ResponseEntity.status(201).body(leituraCriada); 
    }

    // Endpoint: GET /api/leituras
    @GetMapping
    public ResponseEntity<List<Leitura>> listarTodasLeituras() {
        List<Leitura> leituras = leituraService.listarLeituras();
        return ResponseEntity.ok(leituras);
    }

    // Endpoint: DELETE /api/leituras/{id}
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletarLeitura(@PathVariable Integer id) {
        leituraService.deletarLeitura(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
    }

    // --- 2. ADICIONE ESTE MÉTODO NOVO ---
    // Endpoint: PUT /api/leituras/{id}
    @PutMapping("/{id}")
    public ResponseEntity<Leitura> atualizarLeitura(
            @PathVariable Integer id,
            @RequestBody AtualizarLeituraDTO dto) {
        
        // O LeituraService já tinha este método, só precisávamos do endpoint
        Leitura leituraAtualizada = leituraService.atualizarLeitura(id, dto);
        return ResponseEntity.ok(leituraAtualizada);
    }
}