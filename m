Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BB819E49
	for <regressions@lists.linux.dev>; Wed, 21 Jun 2023 18:08:55 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-988a076a7d3so553661266b.3
        for <regressions@lists.linux.dev>; Wed, 21 Jun 2023 11:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1687370933; x=1689962933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h4Ucd0qvaN4RbTaMub1cXvd79JxnZbAQ50t+Lut4dXs=;
        b=F+9rPl8kM1cTRgwBD7y5l2+OIyTmPj+r4+80xkIxPVbZ85r+grot89w/imibqZVvHy
         m1ktqIJeFLejg2Ju3ftAoNwKBy47y08A2Ty8WKYIot+/yqzniwYfw4UFUhvckBszvTfO
         Ju3g8EjIJRbPtW+hfJY+lToEpueZdhJTc9zbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687370933; x=1689962933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h4Ucd0qvaN4RbTaMub1cXvd79JxnZbAQ50t+Lut4dXs=;
        b=WdhYqytAAgY9uXJiCgDlhCpYfUXYOz/gbFsrsZixt7MmM/GWU5icyDoNw5UKJzhcTs
         QTGY+3BsDG9GpMUwKLQEUq3Lz9nsVkPBAZV8pJNX1NJKzTqay6k3g/bHf18RcsXF7vPt
         IzxdwWgKCqM0ClAgfcGinldT6zZzgG/qaaCLQ6Jfck/vDNZy2EUxOlc6NmU8sWjYREPs
         c63qKWJda3bmNx2gJe4Ye06f4FWAS/PFBu61D2Pre9TdwG1iD3g3zYA9N27ljm/6y4Ew
         qFMcPT75NHzIK4Rs+vxHiXGCj0cEEmSrLeHHasIjYQTPVzI9zTx/4zRW4NmciHP6+WHr
         MldQ==
X-Gm-Message-State: AC+VfDyRpXg3ScEU7iag9baARKxBZRVnpgb4e0gmN2kwpcf6Rz4MXFTE
	DPBOGPx6pKBN6nM4SoC7Dl/Oij9STljjm7fxl0WW47k7
X-Google-Smtp-Source: ACHHUZ7MwWy+U+rf09ds26UIQKNJlTElzU9lswQ7vifJa2FT3z3WB+kV5EMmNIOthE+uKvMLjraI1Q==
X-Received: by 2002:a17:907:2687:b0:987:4e89:577f with SMTP id bn7-20020a170907268700b009874e89577fmr12734532ejc.24.1687370933664;
        Wed, 21 Jun 2023 11:08:53 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id dt16-20020a170906b79000b009829f31dd08sm3458794ejb.50.2023.06.21.11.08.52
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 11:08:53 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-510d6b939bfso8338124a12.0
        for <regressions@lists.linux.dev>; Wed, 21 Jun 2023 11:08:52 -0700 (PDT)
X-Received: by 2002:aa7:c90f:0:b0:51a:50f2:4e7a with SMTP id
 b15-20020aa7c90f000000b0051a50f24e7amr7543192edt.13.1687370932607; Wed, 21
 Jun 2023 11:08:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <GQUnKz2al3yke5mB2i1kp3SzNHjK8vi6KJEh7rnLrOQ24OrlljeCyeWveLW9pICEmB9Qc8PKdNt3w1t_g3-Uvxq1l8Wj67PpoMeWDoH8PKk=@proton.me>
 <ZHFaFosKY24-L7tQ@debian.me> <NVN-hJsvHwaHe6R-y6XIYJp0FV7sCavgMjobFnseULT1wjgkOFNXbGBGT5iVjCfbtU7dW5xy2hIDoq0ASeNaXhvSY-g2Df4aHWVIMQ2c3TQ=@proton.me>
 <ZIcmpcEsTLXFaO0f@debian.me> <oEbkgJ-ImLxBDZDUTnIAGFWrRVnwBss3FOlalTpwrz83xWgESC9pcvNKiAVp9BzFgqZ0V-NIwzBZ7icKD8ynuIi_ZMtGt7URu3ftcSt16u4=@proton.me>
 <e2ca75ef-d779-4bad-84a5-a9f262dbe213@lunn.ch> <FNzHwp9-AyweVwIMndmih6VuBD0nsyRp3OM72bmOxpeYszF680jFPJjENIknT32FeaqfVBtVSQFw-5mgE3ZXeksVD8VCFbxwojxP3mSZ9DQ=@proton.me>
 <9517bb70-426c-0296-b426-f5b4f075f7c8@leemhuis.info> <CAHk-=wiK5oDqgt6=OHLiiAu4VmLy4qn8WQdhvFo+sm26r4UjHw@mail.gmail.com>
In-Reply-To: <CAHk-=wiK5oDqgt6=OHLiiAu4VmLy4qn8WQdhvFo+sm26r4UjHw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 21 Jun 2023 11:08:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjGubMs+yoCS44bM1x4=CxDWvJeauquCcE5qLzNmToozw@mail.gmail.com>
Message-ID: <CAHk-=wjGubMs+yoCS44bM1x4=CxDWvJeauquCcE5qLzNmToozw@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Boot stall from merge tag 'net-next-6.2'
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Andrew Lunn <andrew@lunn.ch>, 
	Linux Stable <stable@vger.kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Sami Korkalainen <sami.korkalainen@proton.me>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Jun 2023 at 10:56, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I'll just revert it for now.

Btw, Thorsten, is there a good way to refer to the regzbot entry in a
commit message some way? I know about the email interface, but I'd
love to just be able to link to the regression entry. Now I just
linked to the report in this thread.

Maybe you don't keep a long-term stable link around anywhere, and you
just pick up on reverts directly, but I suspect it would be nice to be
able to just link to any regression entry directly.

            Linus
