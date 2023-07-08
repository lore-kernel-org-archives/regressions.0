Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AF3A941
	for <regressions@lists.linux.dev>; Sat,  8 Jul 2023 19:42:13 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-bb3a77abd7bso3659754276.0
        for <regressions@lists.linux.dev>; Sat, 08 Jul 2023 12:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688845332; x=1691437332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4+Mach9lmHdREdY4lG7rnRYsyltEKjNy1tDSuyLngc=;
        b=WyDa+IEtTiffPeWHVWO2qzdkJXMbVkoixl5g2Oiio+Xc5RgmDl/+4NKv/Bms/JvY91
         Ea8FYlatqHWfN5yu11/zHTAxAEQMS3yy7iahdbV0GCIcaVA+gf9LiAKAeQJl3OcMd51r
         1sHYJ4js0rfpGcBpvE6TbF95yVUDE8B12gn2nYBCV3LxO1bZ5B6bFVYJ9LIRwvn2YVGL
         qJ5siqqNwKalWAOQEK/TzkYgb3k43V9HP4rK/RUwcPd6haOjOhjEl3ldtEF618o53U4p
         ZfrcJ/K1SLyM1hT/NDjfeoetYv67/RaGtibykxFbZwYrF+eQODkqklj9XH+mU6xkPTeU
         tAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688845332; x=1691437332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4+Mach9lmHdREdY4lG7rnRYsyltEKjNy1tDSuyLngc=;
        b=O42uH9xPLdyhILS1BQF4Xt0z41xSt7cRR2PY/UnnsLqx9Z2l7dgP1YoBwfsc93V1aj
         JHlQng7F7R4MddOUmAWQud3XsY+ZoT6m8+rFqgF/YKnZs2HfW/chS35JC5wqkKpe+XSt
         1R0mpdrvk9n9Qn9If9nJxuVYv303WTNWMoP9ZdpNdvkNclf+ORet5SNbSbb5F08IV1/9
         lYupXsfvHpIzaZ39QXuKbqExrZBvL1LtVpZG3LQo+2Gi0ssV/2ijefO9+UiQkDLNi7tx
         ByrrFjmFJ8jqFh5USapzEDpCRb0MmLnqoS0highUOhXPA9K/ej+jm/xjo43ZF4L3dR8H
         kvJg==
X-Gm-Message-State: ABy/qLY+4EUR8TBUCgEGZ8vEv36eDeeLKJADF5YItLrtDqBWuDXliP6S
	a1wNZGFOtfETzU/q2SVVCaZa+vy04sCO58JPY9gR0w==
X-Google-Smtp-Source: APBJJlEHZ+EH0adEDxcnlKd156qF4LQIYNxL5d/up1So8zPv6Qcmz7Vx+oucSWoCMFYT5ihbobbETD/Hx0H9XJC2ppM=
X-Received: by 2002:a25:7086:0:b0:b8f:5639:cb8a with SMTP id
 l128-20020a257086000000b00b8f5639cb8amr8776346ybc.9.1688845332211; Sat, 08
 Jul 2023 12:42:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com>
 <5c7455db-4ed8-b54f-e2d5-d2811908123d@leemhuis.info> <CAJuCfpH7BOBYGEG=op09bZrh1x3WA8HMcGBXXRhe6M5RJaen5A@mail.gmail.com>
 <CAJuCfpH7t7gCV2FkctzG2eWTUVTFZD7CtD14-WuHqBqOYBo1jA@mail.gmail.com>
 <2023070359-evasive-regroup-f3b8@gregkh> <CAJuCfpF=XPpPYqp2Y1Vu-GUL=RBj4fyhXoXzjBY4EKtBnYE_eQ@mail.gmail.com>
 <2023070453-plod-swipe-cfbf@gregkh> <20230704091808.aa2ed3c11a5351d9bf217ac9@linux-foundation.org>
 <CAJuCfpE_WjRQoDT1XnvBghCH-kpqk+pfcBJGyDnK7DZLMVG5Mw@mail.gmail.com>
 <2023070509-undertow-pulverize-5adc@gregkh> <7668c45a-70b1-dc2f-d0f5-c0e76ec17145@leemhuis.info>
 <20230705084906.22eee41e6e72da588fce5a48@linux-foundation.org>
 <df1d7d39-56f3-699c-0d0f-fcc8774f182e@leemhuis.info> <CAHk-=whKd05V49AbZGF=inYmhU6H_yNvvw1grWyhQfQ=9+5-VQ@mail.gmail.com>
 <20230708103936.4f6655cd0d8e8a0478509e25@linux-foundation.org>
 <CAHk-=wh498i3s+BgOF=pUOF=Qe_A0A16-mFcH2YGy+iZXvNChQ@mail.gmail.com>
 <CAJuCfpFLc1yoZm9uqRcmcwtFNGHYKyjxrc71tzXennpGB7QbYQ@mail.gmail.com>
 <CAHk-=wi-99-DyMOGywTbjRnRRC+XfpPm=r=pei4A=MEL0QDBXA@mail.gmail.com>
 <CAJuCfpHszCAc5hDdsxry+1xh3kz+=jsYdBCXKQez-Th9LESSZA@mail.gmail.com> <CAHk-=wi=+qS+5v_7mVxKWUSOKaxzC2V8N7hyFVt1qTWGM_pmAQ@mail.gmail.com>
In-Reply-To: <CAHk-=wi=+qS+5v_7mVxKWUSOKaxzC2V8N7hyFVt1qTWGM_pmAQ@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 8 Jul 2023 12:41:58 -0700
Message-ID: <CAJuCfpF_J+wXzjFRSO_HrzyMft2j32enWKCX0iFGmH6DM7a-rw@mail.gmail.com>
Subject: Re: Fwd: Memory corruption in multithreaded user space program while
 calling fork
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Jacob Young <jacobly.alt@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, 
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 8, 2023 at 12:23=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, 8 Jul 2023 at 12:17, Suren Baghdasaryan <surenb@google.com> wrote=
:
> >
> > Do you want me to disable per-VMA locks by default as well?
>
> No. I seriously believe that if the per-vma locking is so broken that
> it needs to be disabled in a development kernel, we should just admit
> failure, and revert it all.
>
> And not in a "revert it for a later attempt" kind of way.
>
> So it would be a "revert it because it added insurmountable problems
> that we couldn't figure out" thing that implies *not* trying it again
> in that form at all, and much soul-searching before somebody decides
> that they have a more maintainable model for it all.

Got it. I hope that's not the case and so far we haven't received an
indication that the fixes were insufficient.

>
> If stable decides that the fixes are not back-portable, and the whole
> thing needs to be disabled for stable, that's one thing. But if we
> decide that in mainline, it's a "this was a failure" thing.

The patches applied cleanly to 6.4.y stable branch the last time I
checked, so should not be a problem.
Thanks,
Suren.

>
>            Linus
