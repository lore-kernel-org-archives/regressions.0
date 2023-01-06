Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D001795C1
	for <regressions@lists.linux.dev>; Fri,  6 Jan 2023 20:16:48 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id z9-20020a17090a468900b00226b6e7aeeaso2923617pjf.1
        for <regressions@lists.linux.dev>; Fri, 06 Jan 2023 12:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1b6+blSlpi+vjWL3mlCiVEuXXYZ9HziUUNoX6P7j9pQ=;
        b=MCtmreOLU5QCMBqwsT2/cEYO1O44IiNbm7FquCEv/AJNLZK4Im4+rNNJhU7YFQWH6d
         bc6m697Hzua5lJ/yHQWUaXemsdbIiMDlQyDj1UxLNm5oR/VcdeyRhexA5TC7zlq+JF8F
         AmMLDDL2CB1hk4833Wayj5hxPTr4Y/aG/efWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1b6+blSlpi+vjWL3mlCiVEuXXYZ9HziUUNoX6P7j9pQ=;
        b=FTf66Nd4y/nHe5eN4aH+HV+gc0xRz9jIsg+jfZKMJsBKHvuRG8bZrMrUlu9lp9AnIq
         yf8dqUlBTeOcXv11pRI9I2uimilMKaIPiY5rEgbJiv/p9DGgyJTdHPHL3IndqlkJRQoA
         h0Ht9Nn/zVxlDujmyIoKAEE9kUW7d0u6AlY3S0CKFW7edfsxOJU7e++qtpKfvVJ/PDUB
         q+5pCdBauHxDwLScNDlYdqerUenqiMAi20nIUbT8NKt3hMuso4ReL9rCvDiliceViqc5
         T515iHwPqdSF60LaDbKkrX0WhSPOcDL4KDcbNulJzIF0l60DJwcvh85gdS6apFaVeQJr
         Mn8g==
X-Gm-Message-State: AFqh2kqUqKXpt0E7zUhcGFKtriX91v8RgZe78RYo6zVC1rEEze9/lcez
	duX7ouoADDnuEl7+KzHXNOCTcg==
X-Google-Smtp-Source: AMrXdXvEQUB+SHjyv+f+FLqNC5eWY7MGc+kAWkCHhMaiIWmPE5/w/2GVdE7kgZq5+jWOXkYnNP+bKg==
X-Received: by 2002:a17:902:e0d3:b0:192:e0f1:b166 with SMTP id e19-20020a170902e0d300b00192e0f1b166mr11349346pla.27.1673036208241;
        Fri, 06 Jan 2023 12:16:48 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id iw21-20020a170903045500b00177fb862a87sm1375696plb.20.2023.01.06.12.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 12:16:47 -0800 (PST)
Date: Fri, 6 Jan 2023 12:16:47 -0800
From: Kees Cook <keescook@chromium.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	linux-bcache@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [regression] =?iso-8859-1?Q?Bug=A02167?=
 =?iso-8859-1?Q?85_-_=22memcpy=3A_detected_field-spannin?= =?iso-8859-1?Q?g?=
 write..." warnings with bcache #forregzbot
Message-ID: <202301061216.CF08E5E2@keescook>
References: <19200730-a3ba-6f4f-bb81-71339bdbbf73@leemhuis.info>
 <2e4e65a8-87b4-fac6-ef89-76b118b0cec4@leemhuis.info>
 <202301052218.042D2BFE@keescook>
 <f1ca3cea-01ae-998a-2aa8-c3e40cf46975@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1ca3cea-01ae-998a-2aa8-c3e40cf46975@leemhuis.info>

On Fri, Jan 06, 2023 at 11:57:46AM +0100, Thorsten Leemhuis wrote:
> In that case I'd suggest: I forward any I see to you, but don't add them
>  to the regressions tracked with regzbot.

That would be much appreicated; thank you! :)

-- 
Kees Cook
