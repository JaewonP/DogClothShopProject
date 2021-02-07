package com.dogcutie.shop;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan(value = {"com.dogcutie.shop.mapper"})
public class WebConfig {

}
