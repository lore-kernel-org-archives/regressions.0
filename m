Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B173C1D
	for <regressions@lists.linux.dev>; Sat, 27 Aug 2022 11:54:58 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-324ec5a9e97so93825937b3.7
        for <regressions@lists.linux.dev>; Sat, 27 Aug 2022 04:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=BzV2AXq+Ho6KJgZb1KQV/+OAvu+Kaqh1M4kfdYU3AUw=;
        b=bCNznnDVlk7YuZJ3pN2iFFsE0u883l00/dubc+61ZFFE4dqTni4oK8vv1BGGYOY6TX
         1m3mzCpFlSX98Hb0Tb7MOtyh6ugp/7iTpop1IJml9rlZgp3jL4phm9cpWtJuYpWGP3xc
         pUb+ZOziFIjHspq2ZuqOIkkh+37BGss9OOWbC4YBnKAylt5vxkPY707W13RL2kWcjeri
         Mx1e6e9ef3beWwuMWVZcYiPG5wJrihupoZBj/s1wzNENsyE/Zg7NlcwVBa988yysqTTv
         VndkrUy5jxWq4rqrAcXI3Sc4mee6P8ZYUaaIPIxkeOPQWJJnnTko6LurXX+jCIWoC1In
         nyIw==
X-Gm-Message-State: ACgBeo1WJyMsOn1a6Alkp7Gh7PZkqY06fzvEDyhHEiLtquw0maa3JTUp
	IPdHt+YZhpSz1ACBl9DLCCg5j6cUHsexqJLqD1w=
X-Google-Smtp-Source: AA6agR7waLYGFI+lm7Yo7luzQmmfTw58MnR6hWTlUv64MghUKwD8DY2nzgj+Ez14Z5Bucui5ulOo0WFY2e7BZEiHmjM=
X-Received: by 2002:a81:4850:0:b0:33c:922b:5739 with SMTP id
 v77-20020a814850000000b0033c922b5739mr3422119ywa.515.1661601297642; Sat, 27
 Aug 2022 04:54:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <d0433877-2971-b54d-fcbe-2837ae9248be@leemhuis.info>
In-Reply-To: <d0433877-2971-b54d-fcbe-2837ae9248be@leemhuis.info>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Sat, 27 Aug 2022 13:54:44 +0200
Message-ID: <CAJZ5v0iaAOH9MF5YziW_AjxKjP1uAfRYWvDapgbTbsStUG-g0Q@mail.gmail.com>
Subject: Re: [Regression] Bug 216360 - No power to DVD drive
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, bhealey@live.co.uk
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 26, 2022 at 12:13 PM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Hi Rafael. Could you help me out if you have a minute? I noticed
> a regression report in bugzilla that nobody looked at yet. According to
> the reporter the DVD drive's drawer of a small form factor system won't
> open anymore since v5.16; the device is not even mentioned anymore in
> the dmesg output. For details see:
>
> https://bugzilla.kernel.org/show_bug.cgi?id=216360
>
> Is that an ACPI problem and thus something you would handle?

I honestly don't think so.

> If not: in which direction would you shove this?

See https://bugzilla.kernel.org/show_bug.cgi?id=216360#c6

This issue is not reported against the mainline kernel, so it should
be handled by whoever provided the kernel the reporter is using.

Cheers!
