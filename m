Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2D81BDE2
	for <regressions@lists.linux.dev>; Fri, 13 Oct 2023 17:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NUzN6CW/"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-405361bba99so23476375e9.2
        for <regressions@lists.linux.dev>; Fri, 13 Oct 2023 10:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1697219318; x=1697824118; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xDPc1YioSb3KUnMIDBSq84//2Atay2Wv50Tb3yT+Q0Q=;
        b=NUzN6CW/mNNhMoTnZ7Hhg7C1wu7IC0soK0dFZ7jwUcFk2x+iC4SlQmsCXY3MlcvKOX
         hLtoN5feMZFSORVP9ozyi91GaZ45xR5YtdhmWcetxF5NwuA2nuLblvxhog1fpgpfRgEq
         T4bQIMEza0TNVrFpF7W0NnvvjL9KBmbbuPQtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697219318; x=1697824118;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xDPc1YioSb3KUnMIDBSq84//2Atay2Wv50Tb3yT+Q0Q=;
        b=ptYvY4/JYGgEW86weEbsTDpngyJadzIOdAKZobT22DmtH1nxVXlp1poiKBUuriXUiP
         0LeIiyM5pPUNpRTY+NEzBb78ro+4FfojJVhtNYUOdqZK+jsMGMCKOpgA+RinDapcW7Pk
         pC2v5Zbq4e54e9b3AQtkczRtc1pgGEgRKt75QT9NbFIvSzx0WddDvb0BSEoZ/bz5rMtL
         NrYm1+NF0vmOxtt328HbRQ1NsGmKbLD1bsSkfluUzRPDCC5R9CsSPcNbIkVQiHb3hqWU
         VQM4c5kgGHdtcqPza+gmFKABPTnUW+PQChV6GDslJwgZ3i8G8fgnmii1g6ZZuBjHAFlQ
         /d+A==
X-Gm-Message-State: AOJu0Yy5JY8MXy6xgKrB0dDM+zK41aDNM34NIrMoTKpx+UTEB0UgkSgm
	pU/eLGGv8kNy0UgH2cUuu/Uq0sASDW/f9ooeWBPuHg==
X-Google-Smtp-Source: AGHT+IF8cR3RxKL9sGqUGc/VhwWq42e9CJtZLw7MQp/2GhZk7rEC7jvF0UaustdWKzHtFSABd+P46g==
X-Received: by 2002:a5d:56c8:0:b0:321:4de3:fd5c with SMTP id m8-20020a5d56c8000000b003214de3fd5cmr23561696wrw.51.1697219318299;
        Fri, 13 Oct 2023 10:48:38 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id e20-20020a056402089400b005330e1e7da0sm11632065edy.92.2023.10.13.10.48.37
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Oct 2023 10:48:37 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-53e04b17132so3637022a12.0
        for <regressions@lists.linux.dev>; Fri, 13 Oct 2023 10:48:37 -0700 (PDT)
X-Received: by 2002:a17:907:7702:b0:9ae:5523:3f84 with SMTP id
 kw2-20020a170907770200b009ae55233f84mr22085726ejc.72.1697219316989; Fri, 13
 Oct 2023 10:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <e6d1dae8-e28a-455a-a851-661c825fbdcf@gmail.com> <9787bd09-91b3-4a79-9ca9-e7199c925f36@leemhuis.info>
In-Reply-To: <9787bd09-91b3-4a79-9ca9-e7199c925f36@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 13 Oct 2023 10:48:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj99i00K5ZD_OJj3d8rLG07bnTH=0_GxpzxrSzNF-WYQQ@mail.gmail.com>
Message-ID: <CAHk-=wj99i00K5ZD_OJj3d8rLG07bnTH=0_GxpzxrSzNF-WYQQ@mail.gmail.com>
Subject: Re: [regression] some Dell systems hang at shutdown due to "x86/smp:
 Put CPUs into INIT on shutdown if possible" (was Fwd: Kernel 6.5 hangs on shutdown)
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Thomas Gleixner <tglx@linutronix.de>, Yanjun Yang <yangyj.ee@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Ashok Raj <ashok.raj@intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Oct 2023 at 05:05, Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> Thomas, turns out that bisection result was slightly wrong: a recheck
> confirmed that the regression is actually caused by 45e34c8af58f23
> ("x86/smp: Put CPUs into INIT on shutdown if possible") [v6.5-rc1] of
> yours. See https://bugzilla.kernel.org/show_bug.cgi?id=217995 for details.

That commit does look pretty dangerous.

If *anything* is done through SMI after the code does that
smp_park_other_cpus_in_init() sequence, I wouldn't be surprised in the
least if the machine is hung.

That's made worse since it looks like the shutdown sequence isn't
necessarily run on the boot CPU, so the boot CPU itself may be in
INIT, and any SMI quite possibly ends up treating that CPU specially.

Who knows what SMI does, but the fact that the affected machines seem
to be mainly from one particular manufacturer does tend to imply it's
something like that.

And the code does do a fair amount *after* shutting down cpu's. Not
just things like calling x86_platform.iommu_shutdown(), but also
things like possibly the tboot shutdown sequence (which almost
*certainly* is some SMI thing).

I dunno. Thomas - I htink the argument for that commit was fairly
theoretical, and reverting it seems the obvious thing, unless you have
some idea of what might be wrong.

               Linus
