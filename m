Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBB921ABAA
	for <regressions@lists.linux.dev>; Fri,  6 Feb 2026 22:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770417512; cv=none; b=f7dQzN9o6X7kE8pK/65LzaMj8yIeGihUSJMUcTNzHohB7I0H3GNyUP3qQrYFLV69ykhX8BTQwmNrEeRLPJQ1801yCgx6WcgmwC2EpTWgI9iLH/nmUzM9tzDVB93NHvBIqppGuZgF2yT+iWOexXSRpTcbwi3sJ+bS5voHdSWI2hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770417512; c=relaxed/simple;
	bh=AyiPwiRO2V8spV6yty/voeQ6dq0l6vHSH1Gj+dIhqRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EYJB48gvo6EoLL7mCKbhrlAOj5dViIOMKMfYYcS0iriEuvs6De4xfF0Fkvn6nkOVs6GolGwOjw7/JuuBYY8HuSg4GGAsfUEMpRiGBR8p8GCVcjwCZQm0lis5ZTvUSVnsgH01I9ef57mBr/c+6l7ZkebZh+lOU0ph8ZtGV8z+cOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=anl/EtXJ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="anl/EtXJ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b872f1c31f1so313363866b.0
        for <regressions@lists.linux.dev>; Fri, 06 Feb 2026 14:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1770417510; x=1771022310; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+fxnvWUAAx6E8WpMbtNGsmfTLGp+0qh9c7bOer733a0=;
        b=anl/EtXJB4PJuPeLNUNFjxgJj5o0A8+RqXYZprITmCyKdDDSXtJfahbenbeEZZzpoD
         iKTEVUhCWW+dddh6bNMEYOuYfuMSzvgtVubV1mPhSSNyxRg1/9+aeEh6BfFtpk99sfj8
         MBVpn46Cm4ozTSa8C9if8q7Y/IZw5/iBCw4n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770417510; x=1771022310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fxnvWUAAx6E8WpMbtNGsmfTLGp+0qh9c7bOer733a0=;
        b=fNhz/uZqYxQWpRoQv3p2fHY7Rwe18Umq8DEgTZtTErfH/sKabmBJBbIZwPzbCoaVI1
         AI+U3DKFRGSK11BzkXj747zXTZHvCW/6/gGxqFkORc/QWMw2z7HsTx6pAtJX0vkgE7MP
         N89tfenmMiS7THRJHezMQBxJPiPFknEFtxSpMk4TAHynCAG5ToKnb7jcRA1rGHA35rgy
         f7iD5sDksnW898czGMS77bFQTO3SdKlUqb2FJKAA9HTCsk86Kc6Bqmfl9V3tSyvZvg9q
         RpENd5L2RDBInj2SLEkuFpLOcxXpZLc+DZVlvfqcybIbjR0TvGm2mOys3FrqE1HVHb/y
         duHw==
X-Forwarded-Encrypted: i=1; AJvYcCVrz+Ko0SkzlpyYnrGV8xF2lVbEJjpZTg/5RIytZ5efBiOBNrUheePTpr+go4z6s4jWnj6QSwb5M+6f1w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjPxhFiqu2EdqOibNVNN3/yTEaR3XgnCSjaGqBk6pylVg4ckVl
	mEmcRNNxc1wlsv0Tu0hQLvphPIvozpQumzTySk45ukEbv+FT/Gm6gi4PBN3thMoxEVglZw1NtnA
	PL8owUrU=
X-Gm-Gg: AZuq6aKxTInTmfLqZRX+x/6VSGPlLQe4L5Fis1UxeQ+novMrIMkj8dbkEsWuUEvF4eP
	/W43S4rOgDywVqg6n5TZ1upzvBZzHRNNAvYBSCVY6mregEZzGYFgm8kyPLMaI4WxO4xzCEeMnlz
	kRTda96uXIvkKpCTHUVVoWgZ/fQ6ed4NTCnY077k7Wa3bWbzRrb2JR/42iY4h63RH66DLTo88zC
	7ypu3+1sSkAvv6pOjJhYiIGww6TdrKwsqaJe+T7h23NQCgNiu4NSqMWjVl/gnXDvDozkrK3g5tB
	MACLNtqcoo5u86uewt1/tIqh7vaZSflY6uhr0bL4zjr3B9KwzIYH/EpZk6ouww/Z7oSh8i3ztF2
	N0OmJiPfZEez9+3gg6CHDov42hYmIZbTinG6GwT7BMGspK1JwpinXxLqfZfn3WLvSs5l05MnU2W
	dWRFM46b5HkRVHOD96T+ChEvxs7Fp2Z887/cjXIn6JhfZlJbXGRW2GeBXNSeWqtPCRh7jaLSM=
X-Received: by 2002:a17:907:3f16:b0:b88:6164:6421 with SMTP id a640c23a62f3a-b8edf1b0204mr249224466b.16.1770417510347;
        Fri, 06 Feb 2026 14:38:30 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edacf0fcesm115620166b.46.2026.02.06.14.38.28
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 14:38:28 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b872f1c31f1so313361166b.0
        for <regressions@lists.linux.dev>; Fri, 06 Feb 2026 14:38:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXDP6gTgdg/ur/PlmbqNiiILtVAi1OHUa3Jb+Iqm021iac5BzkCvB13jzmtPJVvNFQXJNYTu/BsjaUvuA==@lists.linux.dev
X-Received: by 2002:a17:907:7f8a:b0:b89:9631:2425 with SMTP id
 a640c23a62f3a-b8edf1ea78bmr246142266b.19.1770417508316; Fri, 06 Feb 2026
 14:38:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <99a9c69a-fc1a-43b7-8d1e-c42d6493b41f@broadcom.com>
 <73641ce4-9387-48c6-8904-74997f9bb7ac@leemhuis.info> <cjacqm5kz67e3nrjfxhpe4lepr27cnbmykdixknta4r2wh7ugq@3wne235ikkb7>
 <eef847de-7ef5-4491-91f2-7437dcb573cb@leemhuis.info> <kv4bv3jng2iap3qwvk36pciggiho4yhavnfvsisri67jkdt6kr@szokbl6qdibl>
 <87jywq18yt.ffs@tglx> <uc62gsttzmh5o35uh7viy326bqwpq5gxmcxqqyqb4zp4blp7tg@v3kfsotqtaay>
 <CAHk-=wivx7pi+h+hGmvNFAJm6StQLiQ-b8DdsE5J=LMOWae8Ng@mail.gmail.com>
 <2aoadlgueumiq6hf74baskvk5eomsil7jfsxg4vf4ofaggbecl@7seilp4ou5nl>
 <CAHk-=wgeoGrqgd4n7CntnF8hCPr3qvVVgzF7evhacyqstByYmg@mail.gmail.com> <nchtwtwjqwm444au4rsojawomqslolr3hb4ao4rwsi3t7hqawe@ktggphxq2rhd>
In-Reply-To: <nchtwtwjqwm444au4rsojawomqslolr3hb4ao4rwsi3t7hqawe@ktggphxq2rhd>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Feb 2026 14:38:12 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjzFZMAoJkrOg7LWsQcVOuZhOgMFWGC-sBHOACE8B4+Mw@mail.gmail.com>
X-Gm-Features: AZwV_Qg-yaT857YLD_LYPh6lZi0YO4Bhb0fSlCaJosM8q5T84L3TZDoC6XUookE
Message-ID: <CAHk-=wjzFZMAoJkrOg7LWsQcVOuZhOgMFWGC-sBHOACE8B4+Mw@mail.gmail.com>
Subject: Re: [PATCH] x86/vmware: Fix hypercall clobbers
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Thomas Gleixner <tglx@glx-um.de>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Ajay Kaher <ajay.kaher@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Peter Zijlstra <peterz@infradead.org>, Justin Forbes <jforbes@fedoraproject.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Feb 2026 at 14:25, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> Here ya go:

I'm going to change that commit message to make it clear that it's a
QEMU bug, plain and simple. There's no point in claiming this fixes a
kernel bug when it's a pure workaround for a bug elsewhere.

               Linus
