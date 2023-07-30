Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D20D1FDA
	for <regressions@lists.linux.dev>; Sun, 30 Jul 2023 19:41:36 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-522462d8416so5351215a12.1
        for <regressions@lists.linux.dev>; Sun, 30 Jul 2023 12:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1690746095; x=1691350895;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WJYbyaefc/2i9vxMYh4LV8u/phkvsoN38kGEgw8r95o=;
        b=ZFinl3Ub1kG9Lvrxl6tLZjUeBmttI5Q4iFpVN7jUfAnzKby0EEosMEoeZbdMFTjjgX
         H0Ln4yhBjS/Uueg9rig4PpsVTbMWGU7EHzhVNTCCN3HtPTzBZg0Jn7lWTycdW0eBK2+D
         p77Zjc8GI5th9dnIof/eq2TuTMr9/oR7kPi3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690746095; x=1691350895;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WJYbyaefc/2i9vxMYh4LV8u/phkvsoN38kGEgw8r95o=;
        b=hFq9xrPoSR31MdjjPmJsoWriczim9MLOxDMHOwqBtxP3BNDXW6b6QN0HVoqZSCCV7R
         gojWzkQ/SlQ6E1te56VjiSul0xbuGuhbNaziSE2ZDI8g8k8XFYhociKC1DBbE5RG8k0Y
         c38qY3yJ43ROhcC8j4bHa/DttxVQlBgvBUrS5BDsBpQCV2fmn4deG3PlZzCt8kUf2iu/
         LbNBimVpCgcMC+Cqr//O0cWQlD6P/qYO6L7/l+m/S+67KVtvA8rkxCpBIbU2lhboNbyq
         TKTfl6XDXuMCSi8SPzdICVGY4bN4HgLdEv7uoUE4sDji9gNBfJcQ93JI0G8Ds3zJAD6R
         WjAg==
X-Gm-Message-State: ABy/qLaTjtXA4Sv5hbtipR++KDlpA8H+K4dWHEmlL5ubb/UAVlWSolqx
	uxpbe5HLBbw+KxIbEfwqiiUzFCeXH8w5cmRAvNCm6A==
X-Google-Smtp-Source: APBJJlE6V6kUoOhY8CHPZcOE6egse/+SQ2jEO2ox63iooprt0D4f4YjpRgoGGRPxp9VUWGGCENMFhA==
X-Received: by 2002:a05:6402:50d:b0:51d:d4c0:eea5 with SMTP id m13-20020a056402050d00b0051dd4c0eea5mr5910098edv.40.1690746094735;
        Sun, 30 Jul 2023 12:41:34 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id u11-20020aa7d88b000000b0052229d203a4sm4549627edq.36.2023.07.30.12.41.33
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jul 2023 12:41:33 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51e2a6a3768so5370061a12.0
        for <regressions@lists.linux.dev>; Sun, 30 Jul 2023 12:41:33 -0700 (PDT)
X-Received: by 2002:aa7:c795:0:b0:522:28fa:3009 with SMTP id
 n21-20020aa7c795000000b0052228fa3009mr6411013eds.13.1690746093501; Sun, 30
 Jul 2023 12:41:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169073747103.4140879.6035275932676410922@leemhuis.info>
In-Reply-To: <169073747103.4140879.6035275932676410922@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 30 Jul 2023 12:41:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj2+Mcvdr3PPvUvchhZRCtLdjSFbK7S5R3N2DrEUCz6jw@mail.gmail.com>
Message-ID: <CAHk-=wj2+Mcvdr3PPvUvchhZRCtLdjSFbK7S5R3N2DrEUCz6jw@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2023-07-30]
To: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>, Rafael Wysocki <rafael@kernel.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Mario Limonciello <mario.limonciello@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, 30 Jul 2023 at 10:20, Regzbot (on behalf of Thorsten Leemhuis)
<regressions@leemhuis.info> wrote:
>
> One thing you might be interested in: seems the Ryzen keyboard problems
> that a9c4a912b7d ("ACPI: resource: Remove "Zen" specific match and
> quirks") [v6.5-rc1] was supposed to fix once and for all kinda came
> back, as the new approach apparently still doesn't work on all machines:

Gaah.

We must be doing something fundamentally wrong in the irq overrides,
this is ridiculous. One step forwards, two steps back.

Right now all our entries in that override table say "don't override".

In fact, right now they all seem to be about the legacy keyboard irq.
I get the feeling that we are just doing something horribly horribly
wrong wrt the override thing, and that all these quirks come from
that.

I get the feeling that maybe we simply should strive to use the values
the BIOS has _programmed_, not the DSDT or MADT values at all? After
all, the BIOS has presumably set things up so that the keyboard works,
so us taking values from the BIOS tables (which are clearly
unreliable) is a bit suspect.

IOW, maybe we should simply never touch the irq setup for irq 1?

Does anybody have any idea what MS does?

             Linus
