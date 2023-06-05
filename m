Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722E9323E
	for <regressions@lists.linux.dev>; Mon,  5 Jun 2023 21:01:45 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-977d4a1cf0eso260105466b.1
        for <regressions@lists.linux.dev>; Mon, 05 Jun 2023 14:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1685998903; x=1688590903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEXZS1gc/9CsxEjn+8XGH2gyH4ZVDUPfm5WrWxbF+bY=;
        b=VCRszmJRUeSJ4wuYJqTGvGjobddCFTTNmzO4q/XTgCmEtOaN4ZBJqfkDt1Vt2YVeY4
         xRdjXfpleFTSxezDy2wuqFa9iUtc1QBhLzVC3PvxpG1f2zxrhoi8IzCAdDvHYyrDY3nf
         XSP63yjBHu6UFAR8nmufd6UdfaYM4bY6rEg42qlHvZ+fxrFAhDyffXqDy6wF1nDipDC2
         Q/Q5oSchMTsFX6txNA4f6jVkDwBwFTC9esVlP1spg/kCSkL4FaY9ffqi8JLxDuqF2oaG
         2qK6e8WAvBP/P+vlRiwz95XmIO1xex7vTzuCbTVj8WMsJN0b7HkbXLIoCjCB3ZgfAaKy
         Ol5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685998903; x=1688590903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bEXZS1gc/9CsxEjn+8XGH2gyH4ZVDUPfm5WrWxbF+bY=;
        b=GE3Nuc2Y6Ufb7hSTpvRPe/AEHXkfJreRzbOQ+03Ipp0D/+MjSf97HaCWaMd5A0Odqo
         Nz+H7jjLpzP7YvP02ZFV1F2doiEH8K5mMjvpoxRfoEqZngUmJvr4NpCeTSKBoq48qYnz
         sdC/64fQmY8Z8zeTWwZ4wjZW6mdqcZFZOlG83MsWyRJTrZUO4XOIr5no830nYdBwQ2H0
         Agq/wN3uNuysfZxUFVqzmZT1sgnLZyKWCvur3tkgusr3gdKIENIFWwpOT5Q4H3p9alBp
         B76nF9QU46Hn1nTzKPRp228mdid+KKidF6biSw1+qkrzmYROxH1o9vztQ02MXlzn7NT9
         77sg==
X-Gm-Message-State: AC+VfDy+ZflAm9sE5mSRyt/XTWMRyTsYJI1M66EOQaa75TOC/dsyiisz
	wcxEFMjinF9ltpbOxVgM6ZysxPDFXZKkJ6XJzzs1j5et
X-Google-Smtp-Source: ACHHUZ5muLUUggQcuPVEGkHZGvsnmvfw8pWrKXboQdeoETB8cltqkt7Ji1lOr4ZEv0d9L+FWrIhKDNSiroLSY94B/SA=
X-Received: by 2002:a17:907:3f1f:b0:96f:f451:187f with SMTP id
 hq31-20020a1709073f1f00b0096ff451187fmr89868ejc.7.1685998903000; Mon, 05 Jun
 2023 14:01:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFBinCD0RT0p-jk86W0JuMT3ufohRh1RqWCcM35DKZJpuc10HQ@mail.gmail.com>
 <CAPDyKFqgYnBfm-NespEZF8AJ5Ou4Bya8jLfVEnfyZvfAZ05Q7Q@mail.gmail.com>
 <CAFBinCDjPJHEhN-Jx3DhhhHJ3yi8oEoW7u4-Ld6Rd1+W826ttA@mail.gmail.com>
 <CAPDyKFqKSWJkJwgCO89jgKQ6AB==P9BWkuX6XtKj=ASOH15y9g@mail.gmail.com>
 <CAFBinCDwgYw3v31hP4AtV3+Z1o+esDqMKugRwMMMLqSX0Acjzw@mail.gmail.com>
 <CAPDyKFr+hQo+N31r=3f58taf9sYW0UF0ApCJhwz9vRsyNizcvg@mail.gmail.com>
 <CAFBinCDSv_vdu5887vveotvaOGFrZvaSX4jM+7Q3QvDhTdazzw@mail.gmail.com> <5eb7694f-8c45-bab8-4d4c-2852f125f0eb@leemhuis.info>
In-Reply-To: <5eb7694f-8c45-bab8-4d4c-2852f125f0eb@leemhuis.info>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 5 Jun 2023 23:01:31 +0200
Message-ID: <CAFBinCAh3s6pHa6q20=cB86qJCaYRq3bKwZtwah2_DGLcGFB6g@mail.gmail.com>
Subject: Re: Odroid-C1 regression with commit 4bc31edebde5 ("mmc: core: Set HS
 clock speed before sending HS CMD13")
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-amlogic@lists.infradead.org, 
	linux-mmc@vger.kernel.org, Brian Norris <briannorris@chromium.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Luca Weiss <luca@z3ntu.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

On Fri, Jun 2, 2023 at 3:17=E2=80=AFPM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> for once, to make this easily accessible to everyone.
>
> Ulf, Martin, what happened to this? It looks like we didn't get any
> closer to fixing this regression in the last two weeks. Did it fall
> through the cracks? Or was progress made and I just missed it?
Life got in the way so there's no progress on my end.
I'm hoping that Ulf has some more ideas that I can work with though.


Best regards,
Martin
