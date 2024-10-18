Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956FB18CC1C
	for <regressions@lists.linux.dev>; Fri, 18 Oct 2024 23:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729293330; cv=none; b=d9b5oOw6b6QJIl2yyC3mMeW4QP/8HCnZQMwzBLsZNjq24eRaDv+PSLbsjsUkNwnbLKLAdzdCiUKj0AcUussuMUYppoHPCC9S4vnHh0h6nohMnG4IoBOXbERFAtmsgKnmz04JdfWwMdWrYGIZWiAh/kGRZtjkzWuQJQ9fn6aAeII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729293330; c=relaxed/simple;
	bh=WmM4mn1uG+W/QaiKQsfsqfIu6rhTJ+JkhO0oc8Vsrjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nx6FYa+7eARzlG7Dpvi5TdqUyRL9YwYyaOm49MsjRfLJOTeldIK67aBe7sIITygCSSnU2JCkDyIT3H/S/HEX+XGuF6eoG+dVPrPXXpTOSfPKKo0hb+DObyna2mgdARepxmlGlVMoY0HBT6qbzheZAXAulbdf3IVxLr/TNvzitbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=utexas.edu; spf=pass smtp.mailfrom=utexas.edu; dkim=pass (2048-bit key) header.d=utexas.edu header.i=@utexas.edu header.b=c2YWeDPD; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=utexas.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=utexas.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=utexas.edu header.i=@utexas.edu header.b="c2YWeDPD"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71e93d551a3so1787814b3a.1
        for <regressions@lists.linux.dev>; Fri, 18 Oct 2024 16:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=utexas.edu; s=google; t=1729293328; x=1729898128; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WmM4mn1uG+W/QaiKQsfsqfIu6rhTJ+JkhO0oc8Vsrjg=;
        b=c2YWeDPDjD+tCWdVWQ4DV8xXNl5lxxqlNAS+qdYnLw6b27UNext+70+ikLkzY76Y22
         Ww8v8LgXgD03Sxb5sCvbqgU4B+9buG8Hp8BgCEsMHli+yjrY+JflYaFCFS8MUz3LGLZK
         raLY1BhL8ylwXSm2XE7eoknbSHFjiii2EBvU+6qYvyeIRTC+3nww8A7iTF6qYBsxoVD1
         jMlpjTuZZP7SjyJrvDFxZ047ICE4+Onl/n76zW+StaFIj1Zw8xggTuLp/XPqJxYOrcHC
         ZnOcAWpai6Tc0BB/5XNatN591vabbakfqXfe1pUHhqRUmjw4wURm88lQNkmEsL+NWXsp
         VJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729293328; x=1729898128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WmM4mn1uG+W/QaiKQsfsqfIu6rhTJ+JkhO0oc8Vsrjg=;
        b=BKbHnEj+rasXnsSag5E9WoD03/mzWMnd+DL5QQQb5Rf1yCuMreDSvUiPWUY5HAo+8K
         /Do1NJkfOkBVc/D9HuGmQaPifwE2VbulQmFiZS0z6SMD66GYUDcVYqLzrcUn7yF3KsLM
         4vhQLYWHOQa0ddA3MOJmy0aQQTO4R+pnQ71LvHyPk0YWCv8ZAWAbJFwy0uUr6SkpPP2Z
         fOxFaSO4Dp0PDs7l+OVU0ZxzhbGA8ny7uHq65XqnTo6fUmYPD1hT1SNTJ34tMkJsL3WU
         w+7n/NDLNRgfmyrbU0cumbjPuSm1x1tyz5nNqLLbONbKrVU1HAfStZikb1W7sJJOg2/s
         HF8w==
X-Forwarded-Encrypted: i=1; AJvYcCW3kOA5RN9hCozkvM9jvQEZdFAuPPLk/BXhtPp2GGaetLArkS1R4he0RDi3y3Tr9xkjPJarjD9KnmZxkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMXhCBduulWLRCsL0M7p3Qv3EaZSALUV/vEA6gzScaeGf5jCyF
	FttHiRqyWmpS9zFt8G3m6qSvK4koMfB6uM7ov2cpGHpIzX4j/jAnq/xdN5upqXyO/Rc5D0fK6KO
	1dB1JwNB55JjEhPClReobO5J2rcy4XjP6nd5vbg==
X-Google-Smtp-Source: AGHT+IHy0LHp2WpuZYGexp0T+Ju3IBaRu7XGQRgALvxfryYO/CTNmMzVsBhM8KF5jWh1WNbD0P1cW0f5eHkYYwt+r6U=
X-Received: by 2002:a05:6a00:3c8d:b0:71e:e3:608 with SMTP id
 d2e1a72fcca58-71ea3224f36mr5582634b3a.26.1729293327633; Fri, 18 Oct 2024
 16:15:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEkK70Tke7UxMEEKgRLMntSYeMqiv0PC8st72VYnBVQD-KcqVw@mail.gmail.com>
 <2024101613-giggling-ceremony-aae7@gregkh> <433b8579-e181-40e6-9eac-815d73993b23@leemhuis.info>
 <87bjzktncb.wl-tiwai@suse.de> <CAEkK70TAk26HFgrz4ZS0jz4T2Eu3LWcG-JD1Ov_2ffMp66oO-g@mail.gmail.com>
 <87cyjzrutw.wl-tiwai@suse.de>
In-Reply-To: <87cyjzrutw.wl-tiwai@suse.de>
From: Dean Matthew Menezes <dean.menezes@utexas.edu>
Date: Fri, 18 Oct 2024 18:14:51 -0500
Message-ID: <CAEkK70T7NBRA1dZHBwAC7mNeXPo-dby4c7Nn=SYg0vzeHHt-1A@mail.gmail.com>
Subject: Re: No sound on speakers X1 Carbon Gen 12
To: Takashi Iwai <tiwai@suse.de>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Linux Sound System <linux-sound@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

I tried the patch on the Thinkpad X1 Carbon Gen 12 but it didn't work.
There is still no sound from the speakers.
