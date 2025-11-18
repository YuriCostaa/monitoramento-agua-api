package com.example.monitoramentoagua.domain;

// import com.fasterxml.jackson.annotation.JsonIgnore; // <-- 1. REMOVIDO
import jakarta.persistence.*;
import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "leitura")
public class Leitura {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cod_leitura")
    private Integer codLeitura;

    @Column(name = "valor_medido", nullable = false, precision = 10, scale = 3)
    private BigDecimal valorMedido;

    @Column(name = "data_hora_leitura", nullable = false)
    private LocalDateTime dataHoraLeitura;

    @ManyToOne(fetch = FetchType.EAGER) // <-- 2. ALTERADO DE LAZY PARA EAGER
    @JoinColumn(name = "num_serie_hidrometro", nullable = false)
    // @JsonIgnore // <-- 3. REMOVIDO
    private Hidrometro hidrometro;
}