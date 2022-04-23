Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F374915A4
	for <regressions@lists.linux.dev>; Sat, 23 Apr 2022 01:03:21 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id q14so11501541ljc.12
        for <regressions@lists.linux.dev>; Fri, 22 Apr 2022 18:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g096DpfSCcf8IWJKS1josNtXLu3tIDY7masJQNFWcAg=;
        b=AQYaKU5/J5+aM5TlCj8JWxqEyNRrWADeSBitRwGal1ELDw+cu8iXPNVIYHG5rXsFKr
         EttNL829nFI/wGAfiIXCY1eNMdjdRPK/3HU5lHecTvmamw0HZg8jKDTcyxWmvbvs+/HQ
         Zc3NjzjDRQt7nWoj0trGeL7HrH1BccrnLvfSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g096DpfSCcf8IWJKS1josNtXLu3tIDY7masJQNFWcAg=;
        b=0dVcNzUH2jaMk0uDP9eEtKVSclcQ/Q+mxPHz1ZBLU7X/3hMhh36HFlIo3Tev45ialy
         y2rRt6X8kK9/N3seBDQFE6agL4wxT92zprZbvqbvzRFVCAwML8dRXuU0BN7fhMgg2Esd
         CFw9tCNv+EgxpAkxxTN4C11AMEWLnczcGflVQ5U95O5iSR1bJFELRyXd5/KcHb6dHx7x
         iTYQ/DA3wUhaA+eZeqfLW5G1zQ7LHIbPbLBpRbTscZ/1DWVkllDMH8lxJ9bYbcvHdibC
         w5/v3cxWf7cyQ0uIFv4poLt/9suWX2T1J5zOCAxSw0JKIHmuXfR/uome+Y7Br6SuUyr9
         waug==
X-Gm-Message-State: AOAM531h11ubpKyxjgYCxwF3JwhEVzUxoc6Co1JtjeZtDomxawMrf0cD
	SivGf2MIxPisUsU4C53Ko+GLqq04F4hjsaxhZrk=
X-Google-Smtp-Source: ABdhPJwqtydyQbHYkZy+W2mH+AjcPfJmfqoVo5bBA+C2lHYtp7u553h1wgeA9CcUxX/HjAI46lEbHg==
X-Received: by 2002:a2e:92c9:0:b0:24d:b719:23bd with SMTP id k9-20020a2e92c9000000b0024db71923bdmr4264119ljh.304.1650675799741;
        Fri, 22 Apr 2022 18:03:19 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id x5-20020a0565123f8500b0045cb9e46b1csm409585lfa.268.2022.04.22.18.03.17
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 18:03:17 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id q14so11501458ljc.12
        for <regressions@lists.linux.dev>; Fri, 22 Apr 2022 18:03:17 -0700 (PDT)
X-Received: by 2002:a2e:9041:0:b0:24a:ce83:dcb4 with SMTP id
 n1-20020a2e9041000000b0024ace83dcb4mr4454046ljg.291.1650675796759; Fri, 22
 Apr 2022 18:03:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220422131452.20757-1-mario.limonciello@amd.com>
In-Reply-To: <20220422131452.20757-1-mario.limonciello@amd.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 22 Apr 2022 18:03:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh-F2KtXkQueVJRNqWr7O737NzN=8mYA_r-h-16=VxLQA@mail.gmail.com>
Message-ID: <CAHk-=wh-F2KtXkQueVJRNqWr7O737NzN=8mYA_r-h-16=VxLQA@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] Fix regression in 5.18 for GPIO
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Natikar Basavaraj <Basavaraj.Natikar@amd.com>, Gong Richard <Richard.Gong@amd.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	Greg KH <gregkh@linuxfoundation.org>, stable <stable@vger.kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Shreeya Patel <shreeya.patel@collabora.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 22, 2022 at 6:15 AM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> This patch is being sent directly to you because there has been
> a regression in 5.18 that I identified and sent a fix up that has been
> reviewed/tested/acked for nearly a week but the current subsystem
> maintainer (Bartosz) hasn't picked it up to send to you.

Applied.

I'm not sure the "cc: stable" makes much sense since the bug was
introduced in this release, but I assume you added it because the
problem commit was also marked for stable.

The "Fixes:" tag should take care of it, but I left that cc:stable alone.

           Linus
