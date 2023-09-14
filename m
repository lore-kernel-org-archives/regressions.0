Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5271E1CFBD
	for <regressions@lists.linux.dev>; Thu, 14 Sep 2023 08:44:00 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d81a4b96a86so122519276.1
        for <regressions@lists.linux.dev>; Thu, 14 Sep 2023 01:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694681039; x=1695285839; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyRbwpOpfrs+RuO3IQbIOlbvQDpCbgtuM9CKt0JcRkU=;
        b=ZZjEL6Dan3QBLotcKFNQSq86ZPqpgjO6zjIEajpwJRq0i1YYwB4TQ9f+Z7tEiEGsSK
         VM1hFfaDlmaPmGNgK0tor9Kyv+p7itBUbt1f2MxegDJlMJQbUwFCNcZoBWDzBSD7lEe4
         cH1598gPoLqEQYsdUDfwWGOAQx5ZhSC0OW3QOjztQfE4g7VOMIOAj56jWj3yTKrfqkpz
         XK/b6P/7AdSS3EZNR3hGu1g2rlQv2kKd2IaMkTUOCUrY2AulU7aXWIJjQPAUyRICA8pm
         CtnBHPaUl30DfFeus0PjTSa3boMWYSdguCMCqTCNSg13AgxAeujq6rUqqWB9uY14aBcT
         M4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694681039; x=1695285839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyRbwpOpfrs+RuO3IQbIOlbvQDpCbgtuM9CKt0JcRkU=;
        b=h64oLdvcEdl2ixArtsi5MqqFj+2BhsgaSi/oqEx1JHJ48FQ5LzW5etN0G+N2N/gh4B
         GPl4Te5QA8p27rJv7qj9KL5Nn2HgqeRJ7l8pEfpls4ItIuGK4YUUHOSNzPrijbdrOlxw
         DngbQZjneoZ/wfvhWOY9O/yuDCHUKsnxjqLUpdAcJJ/LqjQe0DHJ2hiiHxJXxwhCw+c3
         zd5qbndEbBP1LkftJYoRueBClTm7wmVHFVVOLRLl10pQbc8yZxcunX32VMjWK0UcFl62
         VxiVtDeRoK2DWhIxDnHza3mb1uSZLkxbJEpTLg6RLYHZwa4rbxWiCQ05qyc9p773xhta
         6odg==
X-Gm-Message-State: AOJu0YzngI7ebncfoQClkCtzvl/5yn9SzUd05sK0oNhjnS7tW+Z3A2aX
	P5P4rTEtVWmReeiQJxz38/BcyEsWiiJVOY1wxiP9qw==
X-Google-Smtp-Source: AGHT+IHNsbytI0Dr2hoERfT8MqScDXywJXb+TtAKRnD8EbiehyDqHD7t7j5azaOOoe/2EMhhy+8J4pR0F1GQpYY4cc4=
X-Received: by 2002:a25:6806:0:b0:d81:61c8:aef5 with SMTP id
 d6-20020a256806000000b00d8161c8aef5mr3478844ybc.40.1694681039250; Thu, 14 Sep
 2023 01:43:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230829165627.156542-1-mario.limonciello@amd.com>
 <20230829165627.156542-4-mario.limonciello@amd.com> <1d891d34-053a-368d-cf47-bcaf35284c79@redhat.com>
 <07353676-bad0-44f8-a15a-4877f1898b6b@amd.com> <811225f8-c505-7344-ac18-882472ee0348@redhat.com>
 <d232c11d-901f-4ebc-b408-bed042ed8da9@amd.com> <6734c409-89f1-89a1-3096-4054be29faf1@redhat.com>
 <f0ceff1c-ba5f-4c6b-ac0e-c4195f477500@amd.com> <CACRpkdYGxreyD8NVuKs2G44htR8EixdvGr3+ma=HrxHUP3NDQg@mail.gmail.com>
 <4246946d-40e3-7df7-3fc4-9aa10e1dee10@redhat.com> <b9f879d5-55b8-401d-b154-8066cb66d20f@amd.com>
 <0522393f-9f0c-4c59-b961-9b8d865a645d@amd.com>
In-Reply-To: <0522393f-9f0c-4c59-b961-9b8d865a645d@amd.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Sep 2023 10:43:48 +0200
Message-ID: <CACRpkdamAs=c6YBW2jgQ48kUPHqUGT=b89NSXYYttf0RbnpctQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: amd: Add a quirk for Lenovo Ideapad 5
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Hans de Goede <hdegoede@redhat.com>, regressions@lists.linux.dev, 
	Shyam-sundar.S-k@amd.com, Basavaraj.Natikar@amd.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lucapgl2001@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 11:21=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:

> 2. In better news updating the BIOS fixed the issue in both Linux and
> Windows, no kernel patches needed.
>
> So no further work will be done on this series.

Is it easy for users to update BIOS? I.e. does
fwupdmgr update work?

Or does it require flashing special USB drives with FAT filesystems...?

Because I'm not sure all users will do that. Or even be aware that
they should. In that case detecting the situation and emitting
a dev_err() telling the user to update their BIOS would be
desirable I think?

Yours,
Linus Walleij
