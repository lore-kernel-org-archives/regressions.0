Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEECC2F21
	for <regressions@lists.linux.dev>; Tue, 11 Apr 2023 20:45:03 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-54ee0b73e08so184129867b3.0
        for <regressions@lists.linux.dev>; Tue, 11 Apr 2023 13:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681245903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgS6IEmvWs5WBVd7nSRmmrb6udze83mNz8YT1MPLDCw=;
        b=GdSPoHYWHmtNABB1G6TVf4ymN/dF9UJquIdJ9tvM9Pasonho5T92PYWxjrVhIzKZHD
         Q/cLvb85bMTzJm2p11YMPa+cGC3qfFX+DkR43XX3h0egvZZIGgk+YWA8gqQwfMBTqV1C
         C5PD4IP02UVOLhnsrrbHimnVveJssROD44RQliKa5z+Ev8ItEzhsf484wS/ns35KWdFA
         quyneT7fHRJRKAGktD67mL5ym+yG+uH7A9UwT6Qz7AMTTdC24SuvBoHMs+0FLeIgzqhd
         DOCDqTik0rBEP9xTCjVRPCttcH0ltT+H75ispCFOk8gFL42yLf/1FDDwe0dwlRzmgPwQ
         KbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681245903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DgS6IEmvWs5WBVd7nSRmmrb6udze83mNz8YT1MPLDCw=;
        b=k7vtn6EZyqAnNm9PfVyU5Jwa3v8OzjUuvyGXRU5ZeU77WXt6V15PIi1jXfl91CfeOf
         nAvLr22kiMOPsB6nBP0IkSUf3GWwvNgi/Q2/so03Rgbt1jQOjq1NKow6GMq5XHrXuExq
         3G+TDd7P7kN+gZkazP7AOIGbPhDsZZHafCKQA4+sqRkL0MKVZGAuQmqIJe9DvrxISiD0
         BBBiVFOnL8cBx8r4NRgk2EEvKdMKF/ftsLqFkr59DfkAJ7vvVOel2+aMvLVq+PcbFSIm
         4BGlq8lpQIMPpRS6NvlBN7U+uzTZCBDfZZfPaqMeeIHaQ2C03rZui44f0J39L6F1fNyO
         68DQ==
X-Gm-Message-State: AAQBX9efQRkfXaNOxI81SnmbBRfrKI6hJH8WKSCwMV3c6FI+Ay9UK0u1
	ctUCx0FxKGxQMPZ85mdF9PchQY5Zab2lpq3BON8yfg==
X-Google-Smtp-Source: AKy350Z+vv84TfPXjGXWUbXDW7zPAcZWRO2q/uRnM/9iQT/1/Y97Z4uyZuZxOjgZXA883a13iohrKJ6ZnyDUyKogSXc=
X-Received: by 2002:a81:ae5b:0:b0:541:693f:cdd1 with SMTP id
 g27-20020a81ae5b000000b00541693fcdd1mr8623016ywk.9.1681245902804; Tue, 11 Apr
 2023 13:45:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230320093259.845178-1-korneld@chromium.org> <d1d39179-33a0-d35b-7593-e0a02aa3b10a@amd.com>
 <ed840be8-b27b-191e-4122-72f62d8f1b7b@amd.com> <37178398-497c-900b-361a-34b1b77517aa@leemhuis.info>
 <CAD=NsqzFiQBxtVDmCiJ24HD0YZiwZ4PQkojHHic775EKfeuiaQ@mail.gmail.com>
 <36c7638f-964b-bee6-b44b-c8406e71dfec@leemhuis.info> <CAD=Nsqx2Gy08HHzjRoWxS7u559hUgi_GGRis0UDFxrUqLYjTfg@mail.gmail.com>
In-Reply-To: <CAD=Nsqx2Gy08HHzjRoWxS7u559hUgi_GGRis0UDFxrUqLYjTfg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Apr 2023 22:44:51 +0200
Message-ID: <CACRpkdYoALVKFPoxxac=c9x3vRhYge+VAUSqKdkqSvgvS+PiXw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Disable and mask interrupts on resume
To: =?UTF-8?Q?Kornel_Dul=C4=99ba?= <korneld@chromium.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, gregkh@linuxfoundation.org, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	upstream@semihalf.com, rad@semihalf.com, mattedavis@google.com, 
	stable@vger.kernel.org, Sasha Levin <sashal@kernel.org>, 
	"Gong, Richard" <richard.gong@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 11, 2023 at 3:35=E2=80=AFPM Kornel Dul=C4=99ba <korneld@chromiu=
m.org> wrote:
> On Tue, Apr 11, 2023 at 3:29=E2=80=AFPM Linux regression tracking (Thorst=
en
> Leemhuis) <regressions@leemhuis.info> wrote:

> > Linusw, what's your preferred course to realize this revert quickly?
> >
> >  * someone (Kornel?) sends a revert with a commit msg for review, which
> > you then apply and pass on to the other Linus?
> >
> >  * someone (Kornel?) sends a revert with a commit msg for review that
> > immediately asks the other Linus to pick this up directly?
> >
> >  * we ask the other Linus directly to revert this (who then has to come
> > up with a commit msg on his own)?
>
> Would you like me to send a reverting change?
> I can do this right away.

Yeah that is best.

> The commit message would contain something like:
>
> This patch introduces a regression on Lenovo Z13, which can't wake
> from the lid with it applied.

Looks good!

Thorsten: thanks for watching over this issue, we'll have it
resolved pronto.

Yours,
Linus Walleij
