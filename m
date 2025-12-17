Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176623396E8
	for <regressions@lists.linux.dev>; Wed, 17 Dec 2025 12:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765973256; cv=none; b=XQ4TmqgPf9sexfN5wSqwCiBT19FvdRkZ8zHuIVq9l2zdd3rV6od1eXoeAgjzpALvSy1edB/ACm9H3xRhqoD7m72HvyWeQg0xAJbx7hV180UVVnhcKLzCvpnYejY3zJw0dcU2Bftk5My/bqI1sc1SPfgmNUtGX9dmqHy5YE+HYNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765973256; c=relaxed/simple;
	bh=/C6iDMsuWNWtsJtSWm9jX3BlZbp1MyNdoyA8DbURccA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KjzTbKeXdUbpIkb5dDXDDfd00T8mtU4Gl7hwy5sLToA92uHS/FIfh2fp5pLwq8WunKhopFhe8g7EK6QyXGJTb17LigMGxcpFFqm4EK6n15BGON36YHeVLVIPuMCSTHcgTJoOPuph3CmK2lXPDFEg7tf4greSNmBwyzxo5npzMqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VGilc0/p; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VGilc0/p"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37b97e59520so45393541fa.2
        for <regressions@lists.linux.dev>; Wed, 17 Dec 2025 04:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765973253; x=1766578053; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wrw8NMfVMXd0m/EneTwTC6u2QNSsWvAtixDYuRgOU1U=;
        b=VGilc0/pzsOjpfWrwnzTXd0xpmmHxbaizEEHliUdHur62dPBDk/PYEPS0w+Qg0R1oj
         7peDA+er0xcck3/lxI4m8E7LTYdi8hDQ4woEknInpLIm72VVuD51yZ3uxub1CDDzWAGe
         gmNDCcN43wkIOJYl4E3KQ4QJH6Vfu9kKlAW9yAGs5rDYO0puhYkrkm+zvYZIAjKqKZEP
         U6+imsB3wAZ/YuqvYFNleYXChqngt2MXA5D+o7NHUuB4mHIxxI/yr/vzG5MSfjdQw47y
         PElX30GE5kriKOQyhPhmWJemGgGOf3vaefd5LjP1a4LOCvu7Rv9THM1kMm2rFIj75cVm
         I6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765973253; x=1766578053;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wrw8NMfVMXd0m/EneTwTC6u2QNSsWvAtixDYuRgOU1U=;
        b=uobdMV6UTWgGN+TC4u2EaRUW5PbsfTq5RIuGPXKlPnNhIloCiWuWBooLqEd1eBoGPL
         KXBh7J+yoTqaxQmhXkElXlEW97nwB53OAqNLQhwmPVhH0ZhUh7x0PC5+T8pk2FTZ4UnE
         hlyYMGARPNzL5lBf/kSvwwAmxZPE9ugTxiBblaJcq7xClkTT9ou48rLDL6e8P5msrvpD
         +Vy+h+qxeX5fE+8E1WkOeu1ppbuAsd3kSto066X08vN/FDGfIWPSYjuRttFHQOXIjhA5
         znsFwNffQFqY3jK5EbT4AGrxcpms+cXCyVMxX/R9lLOmMJiCRyNNFeQ+hlxqbL/HERo+
         TxnA==
X-Forwarded-Encrypted: i=1; AJvYcCW7gOERlXNj8b/c4L7p7fG9btepuWif5qyiRkjyV+RSJUzPJqPdQNhkNm7My9EqJDuBHnp7Z4xh85V2Fg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yym6jtfCTrINDgMhCP1cACXhTxZtdY4MaGe0Yde44u8ymJxDzPQ
	7rh2pXEYvMTtygW3GLF11wwZN6dCFvM4GwkOS2p95kkom2nt4fb260xOWKCFv2UuGnX8zijxNbR
	OiLqy2gr9Eh5NOtqigCPPMdHpONrhlDlskcUvSybx
X-Gm-Gg: AY/fxX5ocLwNQb2BbAD8g2RqMWz8kWbMga55ymOqhTFJl0rly+IPsmB4wpB0CExS3Jc
	qYrnwD4FvQsrrLN7Kgyl7A3q7Ztjb2Ddy4Hwzq86TQBRSelJ871Wd+H1LnVc6gOFQ2lrbm3NRpS
	Ap+V+x1AuTqiwn7/REMch0DBDgv6ClqtNI2LXH4AnjcCiQOXjcJd9tm0k442bEh6TpBu/gdHz2r
	lFh05abGILyiIHFoQcIng797iq9wT/A1NgIUsU+0vL45xxTFYsAedDxCdKzMFffQLhDZhrJpAX7
	PgDetHLeYs+ISes97pSDrzCBsQ==
X-Google-Smtp-Source: AGHT+IHcyxmaEqxPNTJeFQ9rSqg0coCBpBqDqCydEpvzt4sHNnvAPo/qVF0Id6c4Dd3wZTP5wMeiZy1QcCDxZMQn9X0=
X-Received: by 2002:a2e:b8c4:0:b0:37f:b5c8:7cc0 with SMTP id
 38308e7fff4ca-37fd08c7ae4mr69014591fa.33.1765973252871; Wed, 17 Dec 2025
 04:07:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aS22QhwdrHN24ToD@levanger> <CACT4Y+Z8aCz0XcoJx9XXPHZSZHxGF8Kx9iUbFarhpTSEPDhMfg@mail.gmail.com>
 <20251217083202.GA2118121@ax162> <CACT4Y+bsiPfmL-yV99mLCA4n7ukYwS-6E7kTcLg1EOxOQ_cZjg@mail.gmail.com>
 <CACT4Y+aFSLS95qtpWQ0UjVU3wZ+svi2igLh_SoOqQec_Zwg7Mw@mail.gmail.com> <20251217104517.GA3546346@ax162>
In-Reply-To: <20251217104517.GA3546346@ax162>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 17 Dec 2025 13:07:21 +0100
X-Gm-Features: AQt7F2oK8riDkyvsDFvxguXHuYCyEQFEXq9uXi1ebq2AiLQokciAat8X6OdSJ2U
Message-ID: <CACT4Y+ZCvNu+-_FT=FMA6icB6x+2_E5-zo--PDnwR5X7tQ7O7w@mail.gmail.com>
Subject: Re: [GIT PULL] kbuild changes for v6.19
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, patso@likewhatevs.io, 
	Justin Stitt <justinstitt@google.com>, eddyz87@gmail.com, 
	Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Dec 2025 at 11:45, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Wed, Dec 17, 2025 at 11:16:37AM +0100, Dmitry Vyukov wrote:
> > Yikes! I am trying to workaround this, but this is PITA.
> > Entries are not in order, + there are now multiple entries for the
> > same source file (yes, files include themselves). This is plain
> > broken, and hard to workaround. Even if I find the entry that is
> > correct, I can't really tell about it to a clang tool since it accepts
> > just the source file name, and there are multiple entries for the same
> > file name.
> >
> > Does anybody see a reasonable way to undo what this commit is doing?
>
> Does
>
>   $ git revert 9362d34acf91a706c543d919ade3e651b9bd2d6f
>
> not work for you? It is a clean revert for me.

I am not typing commands in the console, I work on an automated system
that does not have a notion of "also do these custom changes to the
source tree at this particular point in the process".

> > Thinking about this: I think included source files should be treated
> > as include files by anything, rather than added to the database. They
> > _are_ include files, and systems should handle include files already.
>
> The commit message of 9362d34acf91 mentions that clangd does not work
> properly with the files that are included in kernel/sched/build_policy.c
> (such as kernel/sched/ext.c) because there are no entries for them in
> compile_commmands.json (so it does not know how to build them),

The same stands for e.g. include/linux/sched.h.
kernel/sched/ext.c is just not a source file, it is a header file effectively.

> which is
> what 9362d34acf91 was trying to fix. I don't use clangd or
> compile_commands.json, so I can't say if there is a way for the tool
> itself to fix this. Again, unless Pat can come up with some way to work
> around this (which I do not personally see at this point), I think we
> would be better off just reverting 9362d34acf91 outright and calling the
> situation of including .c files within other .c files broken for
> compile_commands.json and returning to the status quo from 6.18 and
> earlier.
>
> Cheers,
> Nathan
