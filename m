Received: from mx1.mythic-beasts.com (mx1.mythic-beasts.com [46.235.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847AF3212
	for <regressions@lists.linux.dev>; Mon,  4 Sep 2023 23:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sorrel.sh;
	s=mythic-beasts-k1; h=From:To:Subject:Date;
	bh=5ya9GFvoiOZ3eDqN3x0kvIb4vIxMJkc0ruZbcotFYXY=; b=cmS9BiemwAm7N/Lyk7qvEy+eJh
	BRYeRg0934Q4e1Jg4CPP1wRuC27I29HAwtWG+JhV80LJ2qFGLhZhqfDiu9TWFYn4m80ai0aNqUIl+
	M7PjnnqedJ6+MPl1Xte7PoYWxRQ5+q6+sDRYDl37mmQl2qZoZKBoysiWT7WJLhv6S4mC7DK08STGh
	IFyUexOAuW1enhp+U/EfE26qxLhWpV7Ne7+D83BpPgaOaHtqiXUxl6yh1fkA6+t9hcIJqlXh7y8qk
	SD3Gtd6EfFepwOlWJ3me02ZwoJ1NHRRrvQtUR/SuK3rdO5RyiriBRMWVqZ4QH5RTYb0gkAAWCDGGS
	Ll8F2TWQ==;
Received: by mailhub-cam-d.mythic-beasts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ash@sorrel.sh>)
	id 1qdIYH-002QxT-K8; Tue, 05 Sep 2023 00:00:13 +0100
Message-ID: <46e9cbcc-8fbc-4f58-9ec9-b17dfdf25a5f@sorrel.sh>
Date: Tue, 5 Sep 2023 00:00:11 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] rust midir MIDI library causes kernel oops
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, regressions@lists.linux.dev
References: <8a555319-9f31-4ea2-878f-adc338bc40d4@sorrel.sh>
 <87msy1ip6l.wl-tiwai@suse.de>
Content-Language: en-US
From: Ash Holland <ash@sorrel.sh>
In-Reply-To: <87msy1ip6l.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BlackCat-Spam-Score: 0
X-Spam-Status: No, score=-0.1

On 04/09/2023 22:49, Takashi Iwai wrote:
> Yes, that was a bad change.  Could you try the fix below?
> 
> 
> thanks,
> 
> Takashi
> 
> -- 8< --
> --- a/sound/core/seq/seq_memory.c
> +++ b/sound/core/seq/seq_memory.c
> @@ -187,8 +187,12 @@ int snd_seq_expand_var_event(const struct snd_seq_event *event, int count, char
>   	err = expand_var_event(event, 0, len, buf, in_kernel);
>   	if (err < 0)
>   		return err;
> -	if (len != newlen)
> -		memset(buf + len, 0, newlen - len);
> +	if (len != newlen) {
> +		if (in_kernel)
> +			memset(buf + len, 0, newlen - len);
> +		else
> +			clear_user((__force void __user *)buf + len, newlen - len);
> +	}
>   	return newlen;
>   }
>   EXPORT_SYMBOL(snd_seq_expand_var_event);

That patch seems to work fine! Many thanks.

-- 
Ash Holland, she/her

