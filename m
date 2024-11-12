Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996D81DFE4
	for <regressions@lists.linux.dev>; Tue, 12 Nov 2024 03:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731381499; cv=none; b=ri4j9N5konCaCKIMGGJuwPFY2Xxd6K8Dl7xttCYmO0+TzbFn9Xl4qE74n1sfyHXOu9sSuDYTUD9tmmiE2cyTkXVoBB/fJrZRVSQvMEyUnFy/8qHvilV9JsYCqiw6OtF55gWnLFWIqX2nj1wOKYA2gDKP9O5LnDXDo2zn41De6GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731381499; c=relaxed/simple;
	bh=Kz+DjEdznXySwhabk/fkyNPadUJtfFyhxjLJqtBFTMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N07QY+4G8/Hx2FL2dH0gbP0RmoTNQFugVLacpY8Pav00DzMCjCHtrM8MIpwuRZaVjyuqjWwiW+9edIVByTaLfFzdg3QAkLBe5gRBlmIImBldzj8wSI+GHmftvS5XGJiv/xwqhnGVXHFgBWl0C8hPmqMH1UGH/bhRRcbQG//C5fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=utexas.edu; spf=pass smtp.mailfrom=utexas.edu; dkim=pass (2048-bit key) header.d=utexas.edu header.i=@utexas.edu header.b=13hrV4Xy; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=utexas.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=utexas.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=utexas.edu header.i=@utexas.edu header.b="13hrV4Xy"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2110a622d76so45353555ad.3
        for <regressions@lists.linux.dev>; Mon, 11 Nov 2024 19:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=utexas.edu; s=google; t=1731381497; x=1731986297; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kz+DjEdznXySwhabk/fkyNPadUJtfFyhxjLJqtBFTMA=;
        b=13hrV4Xy5JUyPJeZg/f+FD3u3kWpEv1eeoGJ0xXoRtkFmrNa0qeQzgY8nDZ2eC0a1R
         nYcHIuP5ka9I5DfxveLwBuHS2MFC3ZSvzk1W2WcC6sU1t5ZOB4ZdM3LYFwB9zCnLgTNr
         TQeiXF0h54abGn8pQiUxxrDMZb5hoXLTLQI+duBLhogNfm3acTBRWhujzzeY6xzm9E4h
         H/OSpJ8nmWjOmO9T3YMzSzQ2JMJTeuVeQPjfmEDlXVR5NeTl3Tt9BwIBdGyQT8XOlUR5
         ox4hL+7k4EbLxt8Uh8dBgKPh2f4OkroAAHigH0qIJnOQAVconDRJS8EQV9bmM0ALKOht
         Pmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731381497; x=1731986297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kz+DjEdznXySwhabk/fkyNPadUJtfFyhxjLJqtBFTMA=;
        b=VnGCfyfJ5QnaIJJE7rX7KFU/IAc4+3D4R6I6VfGqQoW23B6u7cBgwyMgMrDx6V/FCG
         IAJ4vpWMTjGvoGkgFEBa6PKhvg43nM3J769EkR9nDdT6iEAasX6sMi9V4NxmlMqGTQtB
         wQ6ydXIhD3yHda5rxkFHstJ8qFgubzHGB8cOJ4hKEcz2NfR+szak4nP98xWOoF1h9/9Y
         3gZs7vaGqifqgn3O7t+7Qg2W8toNGkEWaju9Cp5RQyY9JGtgSVOUxqPRlRDPjxdQvSi9
         4CFWSzaDal9fAYHLNLu7wJS7cC6kkEQmlN3daDdB1dYp5z6fnxtZ6F1Dj+/jBbJDSkzY
         klCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSxj5kUOofDRPzF015n5vOcBrgq68H735VBVg6fcg+TBlvs/j8Sd37yHS/7hcShkHPy/bwOE+3Oi6s/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDzn119Tg2oBuf1Gzcc0ifGH3nvMe/n/WovfS+bpUVFKtYongA
	gcobuPl4zKyqznYsRrRpC/66TDmY98iRzCf1NkuwP6Jse6ptCwWvTK6wi4UHtmKr77GcwteNc4b
	0+X99k5YX3rRHKhA6H+n4myje5PDSDLaP6rhHIA==
X-Google-Smtp-Source: AGHT+IGv6tGl/DenUr3w5nLyZlQNxRJrfEo7yfHQCrtrVXjF9Q2uKgWZqYtaSe51UMLmlsaAf8S1EKJ15II6j95pLAA=
X-Received: by 2002:a17:902:cf0a:b0:20c:dbff:b9e5 with SMTP id
 d9443c01a7336-21183d16b33mr213007715ad.33.1731381497040; Mon, 11 Nov 2024
 19:18:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEkK70Tke7UxMEEKgRLMntSYeMqiv0PC8st72VYnBVQD-KcqVw@mail.gmail.com>
 <2024101613-giggling-ceremony-aae7@gregkh> <433b8579-e181-40e6-9eac-815d73993b23@leemhuis.info>
 <87bjzktncb.wl-tiwai@suse.de> <CAEkK70TAk26HFgrz4ZS0jz4T2Eu3LWcG-JD1Ov_2ffMp66oO-g@mail.gmail.com>
 <87cyjzrutw.wl-tiwai@suse.de> <CAEkK70T7NBRA1dZHBwAC7mNeXPo-dby4c7Nn=SYg0vzeHHt-1A@mail.gmail.com>
 <87ttd8jyu3.wl-tiwai@suse.de> <CAEkK70RAWRjRp6_=bSrecSXXMfnepC2P2YriaHUqicv5x5wJWw@mail.gmail.com>
 <87h697jl6c.wl-tiwai@suse.de> <CAEkK70TWL_me58QZXeJSq+=Ry3jA+CgZJttsgAPz1wP7ywqj6A@mail.gmail.com>
 <87ed4akd2a.wl-tiwai@suse.de> <87bjzekcva.wl-tiwai@suse.de>
 <CAEkK70SgwaFNcxni2JUAfz7Ne9a_kdkdLRTOR53uhNzJkBQ3+A@mail.gmail.com>
 <877ca2j60l.wl-tiwai@suse.de> <43fe74e10d1d470e80dc2ae937bc1a43@realtek.com>
 <87ldyh6eyu.wl-tiwai@suse.de> <18d07dccef894f4cb87b78dd548c5bdd@realtek.com>
 <87h6956dgu.wl-tiwai@suse.de> <c47a3841cd554c678a0c5e517dd2ea77@realtek.com>
 <CAEkK70SojedmjbXB+a+g+Bys=VWCOpxzV5GkuMSkAgA-jR2FpA@mail.gmail.com>
 <87ldyctzwt.wl-tiwai@suse.de> <CAEkK70RAek2Y-syVt3S+3Q-kiriO24e8qQGDTrqC-Xt4kHzbCA@mail.gmail.com>
 <b97c52ec20594eecb074d333095a4560@realtek.com>
In-Reply-To: <b97c52ec20594eecb074d333095a4560@realtek.com>
From: Dean Matthew Menezes <dean.menezes@utexas.edu>
Date: Mon, 11 Nov 2024 21:17:39 -0600
Message-ID: <CAEkK70QottpLxq-prAEPe8TtPR=QBdQWuUrjf6ZT6PipcfS9xw@mail.gmail.com>
Subject: Re: No sound on speakers X1 Carbon Gen 12
To: Kailang <kailang@realtek.com>
Cc: Takashi Iwai <tiwai@suse.de>, "stable@vger.kernel.org" <stable@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Linux Sound System <linux-sound@vger.kernel.org>, 
	Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Yes, it works!
