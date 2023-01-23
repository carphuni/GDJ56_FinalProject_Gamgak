package com.gamgak;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan("com.gamgak.web.csk.member.model")
public class MapperConfig {

}
