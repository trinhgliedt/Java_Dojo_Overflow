package com.tgliedt.dojooverflow.controllers;

import java.util.Arrays;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tgliedt.dojooverflow.models.Answer;
import com.tgliedt.dojooverflow.models.Question;
import com.tgliedt.dojooverflow.models.Tag;
import com.tgliedt.dojooverflow.servives.AnswerService;
import com.tgliedt.dojooverflow.servives.QuestionService;
import com.tgliedt.dojooverflow.servives.TagService;

@Controller
public class QuestionController {

	private final TagService tagService;
	private final QuestionService questionService;
	private final AnswerService answerService;
	
	public QuestionController(TagService ts, QuestionService qs, AnswerService as) {
		this.tagService = ts;
		this.questionService = qs;
		this.answerService = as;
	}
	
	@RequestMapping("/questions")
	public String showQuestionDashboard(Model model) {
		model.addAttribute("questions", questionService.findAll());
		return "questionsDashboard.jsp";
	}
	
	@RequestMapping("/questions/{id}")
	public String showQuestion(@PathVariable("id") Long id, Model model, @ModelAttribute("answer") Answer answer) {
		model.addAttribute("question", questionService.findById(id));
//		System.out.println("question.answers" + questionService.findById(id).getAnswers());
		for (Answer answer1: questionService.findById(id).getAnswers()) {
			System.out.println("question.answer: " + answer1.getAnswer());
		}
		return "newAnswer.jsp";
	}
	
	@RequestMapping("/questions/new")
	public String showNewQuestion() {
		return "newQuestion.jsp";
	}
	
	@PostMapping("/questions/{id}/newAnswer")
		public String createAnswer(@PathVariable Long id, @Valid @ModelAttribute("answer") String answerString, BindingResult result, Model model) {
		System.out.println("line 56 create Answer");
		if(result.hasErrors()) {
			System.out.println("line 58 create Answer");
			model.addAttribute("question", questionService.findById(id));
			return "questionsPage.jsp";
		}else {
			System.out.println("line 62 create Answer");
			Question q = questionService.findById(id);
			Answer newAnswer = new Answer(answerString);
			newAnswer.setQuestion(q);
			newAnswer.setAnswer(answerString);
			answerService.create(newAnswer);
			model.addAttribute("question", questionService.findById(id));
			return "redirect:/questions/"+id;
		}
	}
	
	@PostMapping("/questions/new")
	public String createQuestion(@RequestParam("question") String question, @RequestParam("tags") String tags, RedirectAttributes redirectAttributes) {
		//Check to make sure question isn't empty
		if(question.isEmpty()) {
			redirectAttributes.addFlashAttribute("error", "Question cannot be empty");
			return "redirect:/questions/new";
		}
		Question q = new Question(question);
		//Make sure tags are present
		if(!tags.isEmpty()) {
			String[] allTags = tags.split(",");
			System.out.println(Arrays.toString(allTags).toLowerCase());
			//Check to make sure input contains no more than 3 tags
			if(allTags.length > 3) {
				redirectAttributes.addFlashAttribute("error", "You can only add up to 3 tags");
				return "redirect:/questions/new";
			}
			for(String tag : allTags) {
				//Check if tag already exists
				Tag t = tagService.findBySubject(tag);
				if(t != null) {
					q.addTag(t);
				}else {
					Tag newTag = new Tag(tag.trim().toLowerCase());
					tagService.create(newTag);
					q.addTag(newTag);
				}
			}
		}
		questionService.create(q);
		return "redirect:/questions";
	}
}