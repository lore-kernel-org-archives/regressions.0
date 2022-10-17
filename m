Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090EA4699
	for <regressions@lists.linux.dev>; Mon, 17 Oct 2022 17:25:53 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id m6so11755475pfb.0
        for <regressions@lists.linux.dev>; Mon, 17 Oct 2022 10:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U3yR8f2xGvnli4f6ljBEzHE0/kF8yCV4PFdQwKaLXf8=;
        b=QoIvjpCnmFoa2ARcBy18v3g97+Kq4GhV1zgaEn3giz/25KAkeBFHrUCNRSwvStqAmd
         HaKma3a8oi7+x+/YcpxgZ4dEJ2jjef28CRhb4FO31EozmCmi57Wizm5tgH9zQUohtgUb
         XOEnpGoUGVKXgB6GIFDNXl5RfBqr6SWEK+pLuda/hu/D/VCHF7JTg2c/0mcv8zNc6BJp
         IxrVPEB0NUKyUzerU+ve2lkP2ZV9xO+jftZs0fXAcyZVAxom2rzOGbsNeyZGPOn7DsKv
         UosQM0bIlCRhIM626CItHXM8ZLbBUZByY6wQMKlimRqpqrYu4Pm8HaJawMQI55nzI5sn
         718g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3yR8f2xGvnli4f6ljBEzHE0/kF8yCV4PFdQwKaLXf8=;
        b=rQotuNjhF5sevJWhOzhE+qcFNHlFJ36QA0MjAnIPviIWiGzTWywxOtUtMakuGDUf51
         Dyg9xkKpIxMkN9K2IX6ICkKGNIqEzUQeoONGx36h+jggj3P9hwtR8Xa8Qu/5f6OM0r/u
         8e3N5+6jR/V6DYBBkJ/ZEIVs2644yrvJh7ZH6SOltexF/2deL3/S51ZodK9dHSzNsoix
         pBq3lG0xQFRtGm+iYleyx/Jst4fd0CYfGhfoPtVUZE5KKcJb/5Tn9cRdWFx4G5qxECR7
         mvb8hnUl2D+3SJLcmH5XQnttt6O6/W16p20NY7LjbENJPgW1hK+uHKIHNpGa0ia0luL8
         VJtQ==
X-Gm-Message-State: ACrzQf2luV5Tg2RPRRI0B69CJRbVyCofkvK/cYMEc641tcXB/+ou0PB/
	ox1n+p1ZdrBV5+uKe90akqKK4yqNMbFCCrYRxqM=
X-Google-Smtp-Source: AMsMyM50HGv/JVPt9Mg/1/yqJb7RQkP63Y5aESVoSPDp5m6sqFcrlTPsLXWA8wnS7FJd/DQQNi7B/Ce1ADPrxbCb+fc=
X-Received: by 2002:a05:6a00:27a0:b0:566:9cd9:3843 with SMTP id
 bd32-20020a056a0027a000b005669cd93843mr13605761pfb.17.1666027553549; Mon, 17
 Oct 2022 10:25:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <8702a833-e66c-e63a-bfc8-1007174c5b3d@leemhuis.info>
 <20221015205936.5735-1-phillip@squashfs.org.uk> <2d1ca80c-1023-9821-f401-43cff34cca86@gmail.com>
 <c5980bcb-f345-ff2e-a29b-75e53a6b8708@gmail.com> <a1d46bd2-9603-f89a-ec85-ebcd25db8882@gmail.com>
In-Reply-To: <a1d46bd2-9603-f89a-ec85-ebcd25db8882@gmail.com>
From: Phillip Lougher <phillip.lougher@gmail.com>
Date: Mon, 17 Oct 2022 18:25:35 +0100
Message-ID: <CAB3wodeqmuE0iZeSddWSGuJ49rKUjSPb9xxsx189hdL9aMn_pQ@mail.gmail.com>
Subject: Re: BISECT result: 6.0.0-RC kernels trigger Firefox snap bug with
 6.0.0-rc3 through 6.0.0-rc7
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Phillip Lougher <phillip@squashfs.org.uk>, regressions@leemhuis.info, 
	mirsad.todorovac@alu.unizg.hr, linux-kernel@vger.kernel.org, 
	marcmiltenberger@gmail.com, regressions@lists.linux.dev, srw@sladewatkins.net
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 17, 2022 at 1:37 PM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> On 10/17/22 16:45, Bagas Sanjaya wrote:
> > On 10/16/22 19:21, Bagas Sanjaya wrote:
> >>
> >> No Verneed warnings so far. However, I need to test for a longer time
> >> (a day) to check if any warnings are reported.
> >>
> >
> > The regression still occurs with this patch applied. Let's see if
> > reverting the offending commit helps.
> >
> Sorry for speaking late about my triggering cause.
>
> As the background, on my Debian 11 computer, I have lxd snap installed.
> I use lxd to channel my sysadmin side by spinning up containers and
> installing server applications there (LAMP, email, DNS).
>
> Back to triggering cause. I can trigger the regression when the network
> connection drops (when Firefox shows connection problem page). Then
> I run `lxd list` to list container instances and I get the Verneed
> regression error.
>

This appears to be both deterministic, and appears to show something
happening in the Firefox snap triggers an error in the Lxd snap.

This will then not be a Squashfs issue.  Firefox running in one
Squashfs filesystem
can't trigger a failure in another Squashfs filesystem.  This has to be caused
by something else.

Thanks

Phillip
