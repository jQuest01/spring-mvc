package br.com.casadocodigo.loja.controllers;

import java.util.concurrent.Callable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.models.CarrinhoCompras;
import br.com.casadocodigo.loja.models.DadosPagamento;
import br.com.casadocodigo.loja.models.Usuario;

@Controller
@RequestMapping("/pagamento")
public class PagamentoController {

	@Autowired
	private CarrinhoCompras carrinho;

	@Autowired
	private RestTemplate restTemplate;

	@Autowired
	private MailSender sender;

	@SuppressWarnings("finally")
	@RequestMapping(value = "/finalizar", method = RequestMethod.POST)
	public Callable<ModelAndView> finalizar(@AuthenticationPrincipal Usuario usuario, RedirectAttributes model) {
		return () -> {
			String uri = "http://book-payment.herokuapp.com/payment";

			try {
				String response = restTemplate.postForObject(uri, new DadosPagamento(carrinho.getTotal()),
						String.class);
				System.out.println(response);
				enviaEmailCompraProduto(usuario);
				model.addFlashAttribute("sucesso", response);
			} catch (HttpClientErrorException e) {
				e.printStackTrace();
				model.addFlashAttribute("falha", "Valor maior que o permitido");
			} finally {
				return new ModelAndView("redirect:/produtos");
			}
		};
	}

	private void enviaEmailCompraProduto(Usuario u) {
		SimpleMailMessage email = new SimpleMailMessage();
		email.setFrom("compras@casadocodigo.com.br");
//		email.setTo(u.getEmail());
		email.setTo("guicamposf16@gmail.com");
		email.setSubject("Compra finalizada com sucesso");
		email.setText("Compra aprovada com sucesso no valor de " + carrinho.getTotal());

		sender.send(email);
	}
}