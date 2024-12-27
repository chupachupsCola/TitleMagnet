package dto;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
@Getter
public class Post {
	private Integer id;
	private String title;
	private String source;
	private String author;
	private String publisherName;
	private String url;
}
