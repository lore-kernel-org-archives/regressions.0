Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8F0196C88
	for <regressions@lists.linux.dev>; Fri, 14 Jun 2024 12:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718367305; cv=none; b=NR1WnwFz7tP1h/6xKeRMqyXZIX93XrunXbpdaW+UkgT2hOktePS47JXrSc25eLP10u+N7frTLOEuF+oZ/+NhulPnJEABIwky/o93EcRBIuEDwsAUn73cwcJkEUVqnlYJBBAWE72Bhlt+JqEhB3PazTnwOli0ig33e9Q7muUzb3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718367305; c=relaxed/simple;
	bh=bT5WI50G/xe0b9CL3tlQRNjDOMccYX8o9ugjNQ5PcwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mrjXGUTZBY5Hq9RT2lwjIcMoyCPjoCdkte/FJ+cUlekIfoA35yTKxQn3Ond6wYIyNcEszbebWQLtQeVXRRoPHLF2ToDKKrAfR9P7yrEk+yHblGxdCg/+qF7YYUtUEzkjPHk2heDowBQxCs1tev4mh4Z3NL3PhJaQMiNB0HFryOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjkturUO; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjkturUO"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52bc121fb1eso2618408e87.1
        for <regressions@lists.linux.dev>; Fri, 14 Jun 2024 05:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718367302; x=1718972102; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LX4EUljvFqSnOBU+TT5aydICyOEMY1+G4VpnprRU4mo=;
        b=XjkturUO5OAYyhySvyoZmWBZmqetU3l5KxRAuz+jhlsKGf1H9gU+45zoNJp8nod5rZ
         K+JoH9RCw+w6z+JcqPuHdskxUfp+TcPqfAFFgSMuqM2EhwZ0IoYDEZnRff3dua6X+AH0
         PcGxh4ZJum0g7LN6wPSpnxyPe5/3M99ADgTU4+SA9rxQdlkFeVtlHOBYWUiA/WVzbjYw
         8OeLaeDAJ7e1VyHYA4m2vFGEtv3EjFe3Xe8NJAWjg96RpgZu/2X2Z/VCookXTUOPEQvs
         2nXho8vueOcswiazoOBveQOmdr9T2yRXw+/I7k974MUF64n9lOkIR7hm+5Su8SXUgPkD
         Odvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718367302; x=1718972102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LX4EUljvFqSnOBU+TT5aydICyOEMY1+G4VpnprRU4mo=;
        b=VTtNluBzpsLuxDs1zKRKd3Xw35qqrFywfJptaNA7b1GWAIgwnjdWv+B1TNEPZSTneN
         u9UbRZY5H9QW/DIZnrd9BRs+d+s40UNxw5PMiW5WTfHvQ9HLgrxiOznWZaXsaGdnCfJq
         U4Vuu3TSBL/8k3j99lWxzOCzoRcEHNezMP8K4J91FnhVYBJfGbsVhy8e33wxALEuaYwj
         WovchuJGIRXFwzH9yRUKkV1ce9n+cTfwUjAMH4Gxi1dv3bpp2rASdrFQ0CjsNlCE5y25
         Hkr/1s/1knKdy814Lxj/Nia7h3/Eo8MZvkzlzCBfaHYpEF6sTvcl+FZz1NDscw/r54F2
         VL6A==
X-Forwarded-Encrypted: i=1; AJvYcCXm7tlP5UwF5IgtSXjDj04gze6nYzTyOfRMN5sqi7aE2pv7l//f8RUAoMAMKbjcNjq5Kg0iWCwYFw/SE5q6ltelZ+yYeqQODo8Slgo=
X-Gm-Message-State: AOJu0YyzNmv/3H/sSckzaeVhAYEWTWlK4GHdGF362QS3OKXaUooM4qJm
	l0P120+/nBLStaWgwt6X1Rna+RCYcIKXZZUlYAemXReP2/x/roJC6iwIvjcVSfU61gk/4iTiGVY
	8hFOP6jxYs08sVpZjxTRHqi/hfms=
X-Google-Smtp-Source: AGHT+IEnSljkcDo4Wfe0Fr61DdCGe1zBjBWU2kejP8zs+dh2KgULXRKoka6ALHY8M0+zg9FByfz4kXlhX6OCrrwltRI=
X-Received: by 2002:ac2:4181:0:b0:516:d219:3779 with SMTP id
 2adb3069b0e04-52ca6e99397mr1518697e87.58.1718367301474; Fri, 14 Jun 2024
 05:15:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYveCjzej3SDZR=PBASc=ycdL7xvWENonYCOXCjRJe8+oQ@mail.gmail.com>
In-Reply-To: <CA+G9fYveCjzej3SDZR=PBASc=ycdL7xvWENonYCOXCjRJe8+oQ@mail.gmail.com>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Fri, 14 Jun 2024 14:14:50 +0200
Message-ID: <CANk7y0hEQVTRTZWCJiC8d8pmQVy7fvdL_qQM_Sa__YuBa-5s=A@mail.gmail.com>
Subject: Re: selftests: ftrace: WARNING: at arch/arm64/kernel/stacktrace.c:112 arch_stack_walk
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Nianyao Tang <tangnianyao@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Stephen Boyd <swboyd@chromium.org>, Puranjay Mohan <puranjay@kernel.org>, 
	James Morse <james.morse@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Naresh,

Thanks for finding this.

On Thu, Jun 13, 2024 at 3:16=E2=80=AFPM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> The following kernel warning noticed on arm64 qemu-arm64 and rk3399-rock-=
pi-4
> device while running selftests ftrace tests on Linux next-20240613.
>
> This is always reproducible on qemu-arm64 and rock-pi-4 device with
> kselftest merge configs
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> Test log:
> -------
> kselftest: Running tests in ftrace
> TAP version 13
> 1..1
> # timeout set to 0
> # selftests: ftrace: ftracetest-ktap
> # unlink: cannot unlink
> '/opt/kselftests/default-in-kernel/ftrace/logs/latest': No such file
> or directory
> # TAP version 13
> # 1..141
> # ok 1 Basic trace file check
> <4>[   96.183553] ------------[ cut here ]------------
> <4>[ 96.187100] WARNING: CPU: 1 PID: 538 at
> arch/arm64/kernel/stacktrace.c:112 arch_stack_walk


29c1c24a2707 ("function_graph: Fix up ftrace_graph_ret_addr()") made
the ftrace_graph_ret_addr() use the
'idx' pointer to optimise the stack unwinding but arm64, riscv, and
some other architectures pass `NULL` for this
parameter. The fix for this is to pass a valid pointer to
ftrace_graph_ret_addr() like x86_64 is doing.

I will send a patch to fix this unless someone else has already sent one.

Thanks,
Puranjay
