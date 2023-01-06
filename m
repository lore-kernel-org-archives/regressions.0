Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B2B2773C
	for <regressions@lists.linux.dev>; Fri,  6 Jan 2023 19:07:43 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-4bf16baa865so34098827b3.13
        for <regressions@lists.linux.dev>; Fri, 06 Jan 2023 11:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xXu0UrxATTjQV5tOMZWsigK936HnNawUgyg/NFmPfog=;
        b=WcF+YXOaqvpE/ecoEANu1yF1O+Aukjs7Um8ujF3uWejFh8Ota9tqhXwPE/nYYpPO9x
         YAFPfTmjZPQBY1g17l1dVR0vtyz6t//giJBIlDkMhndMs1nkqUyzyOlsm/w6aKY/UF/E
         ZWEm2doRox7auXvyEHevuIoxPtagRQmAOYrvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xXu0UrxATTjQV5tOMZWsigK936HnNawUgyg/NFmPfog=;
        b=19sSDqoHqOD5wAmBECSLf9htZN8HN/Ug4Cd2md1CFe+EpSEWqpfTBo7/LBWYMY/wJP
         UqpmlkIasoHwP2XpVo+Neq1jXEV6051PcCBj7I3gMhOx9qIa0wmmbtLOHxIlxpOjcRP3
         v3dUcsZGEUM9loJA/i5exR0Mo1dT82PdUVcRLbUWMg1K3QDvJDuMlUEzWbRUxZfuyf9h
         LcAKAG8D2P9y/4UtbRK3zBH6UWAOt3nJ0j59QbER8hk04aZ2TN1YoF+tgcLr7OyrgdhE
         t0TcyRQ7ITArsIX6H+70DY1F12q6MhGKXwwevRlrNeq541mvv4Jj46mAgJ6BEqbz9TPQ
         1pOQ==
X-Gm-Message-State: AFqh2krsU235WGsIXUj5TjOsYGH+JIrclQWL4iPAVZdeOCZUJYwXYtBG
	s6eWrU1FGf9Y8H/NnfrUryHE0G9qTYW7RC6/
X-Google-Smtp-Source: AMrXdXs1kROMekDHRDlPxhLKBl0lpd0vMjTV98YWri0SEBLj1L3S9mflXt5KgJvQk3uq0CsUkPFiFg==
X-Received: by 2002:a81:1dd4:0:b0:477:7758:666e with SMTP id d203-20020a811dd4000000b004777758666emr35074430ywd.48.1673032061962;
        Fri, 06 Jan 2023 11:07:41 -0800 (PST)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id t2-20020a37ea02000000b006fb9bbb071fsm953454qkj.29.2023.01.06.11.07.41
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 11:07:41 -0800 (PST)
Received: by mail-qk1-f171.google.com with SMTP id c9so1177798qko.6
        for <regressions@lists.linux.dev>; Fri, 06 Jan 2023 11:07:41 -0800 (PST)
X-Received: by 2002:a05:622a:428c:b0:3a6:8b84:47ce with SMTP id
 cr12-20020a05622a428c00b003a68b8447cemr1560637qtb.678.1673031606753; Fri, 06
 Jan 2023 11:00:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y7dPV5BK6jk1KvX+@zx2c4.com> <20230106030156.3258307-1-Jason@zx2c4.com>
In-Reply-To: <20230106030156.3258307-1-Jason@zx2c4.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Jan 2023 10:59:50 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjin0Rn6j+EvYV9pzrbA0G2xnHKdp_EAB6XnansQ8kpUA@mail.gmail.com>
Message-ID: <CAHk-=wjin0Rn6j+EvYV9pzrbA0G2xnHKdp_EAB6XnansQ8kpUA@mail.gmail.com>
Subject: Re: [PATCH v2] tpm: Allow system suspend to continue when TPM suspend fails
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Peter Huewe <peterhuewe@gmx.de>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Jan Dabros <jsd@semihalf.com>, 
	regressions@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
	linux-integrity@vger.kernel.org, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Johannes Altmanninger <aclopte@gmail.com>, stable@vger.kernel.org, 
	Vlastimil Babka <vbabka@suse.cz>, tbroch@chromium.org, semenzato@chromium.org, 
	dbasehore@chromium.org, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 5, 2023 at 7:02 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> In lieu of actually fixing the underlying bug, just allow system suspend
> to continue, so that laptops still go to sleep fine. Later, this can be
> reverted when the real bug is fixed.

So the patch looks fine to me, but since there's still the ChromeOS
discussion pending I'll wait for that to finish.

Perhaps re-send or at least remind me if/when it does?

Also, a query about the printout:

> +       if (rc)
> +               pr_err("Unable to suspend tpm-%d (error %d), but continuing system suspend\n",
> +                      chip->dev_num, rc);

so I suspect that 99% of the time the dev_num isn't actually all that
useful, but what *might* be useful is which tpm driver it is.

Just comparing the error dmesg output you had:

  ..
  tpm tpm0: Error (28) sending savestate before suspend
  tpm_tis 00:08: PM: __pnp_bus_suspend(): tpm_pm_suspend+0x0/0x80 returns 28
  ..

that "tpm tpm0" output is kind of useless compared to the "tpm_tis 00:08" one.

So I think "dev_err(dev, ...)" would be more useful here.

Finally - and maybe I'm just being difficult here, I will note here
again that TPM2 devices don't have this issue, because the TPM2 path
for suspend doesn't do any of this at all.

It just does

        tpm_transmit_cmd(..);

with a TPM2_CC_SHUTDOWN TPM_SU_STATE command, and doesn't even check
the return value. In fact, the tpm2 code *used* to have this comment:

        /* In places where shutdown command is sent there's no much we can do
         * except print the error code on a system failure.
         */
        if (rc < 0 && rc != -EPIPE)
                dev_warn(&chip->dev, "transmit returned %d while
stopping the TPM",
                         rc);

but it was summarily removed when doing some re-organization around
buffer handling.

So just by looking at what tpm2 does, I'm not 100% convinced that tpm1
should do this dance at all.

But having a dev_err() is probably a good idea at least as a transitional thing.

                  Linus
