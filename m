Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E90579CC
	for <regressions@lists.linux.dev>; Tue,  4 Jul 2023 20:23:06 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5702415be17so66803617b3.2
        for <regressions@lists.linux.dev>; Tue, 04 Jul 2023 13:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688502185; x=1691094185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9a6W0nI5dldeYBTATPhb2dlI8SAsLd6hrxr67cmhZ5Q=;
        b=jDLrG9hng7j9RZclbFbYt97jBiLanCA13I7xQd6CkeRzUmalZDSbrdf2iqtWNylUD+
         he7LFrNVAAX6/RsVaQATwUviDjceHMnTodzS8pJ56besYOvmt0sGvf+m9cp7F4zTWlXt
         1Nn1uAaFkkZfVwf7W4qNBfyAxnoGb+K6dY8HXtuSq/IVryIoXxrHmTjbCF2HbLyMHC7t
         4J2H/VpJMhQ8PJMc/WuW/F6iogspk3v0wJAJjiQgDB0mKQlhcKfx8F0JdjFAms9aqIHp
         jhfxwMNkFV5nkmLM2Lw/6uzJq+1LbrOFfoT8WnNAa0btOX0BFG3bnIdsuXWXo/yFNbvj
         gACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688502185; x=1691094185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9a6W0nI5dldeYBTATPhb2dlI8SAsLd6hrxr67cmhZ5Q=;
        b=Q5guG4cUwCO+zjl1aOIGUJLopOhpZDw6BkBE+Zf15a0sxAFgMmujI7y1UPBGqTlMjm
         brRsvzXiDSwe7+61Hmx38b+XvTLlraoFbUB/lny+KQh03xSEzo1msksKYM4PMd21rUGQ
         c1v09W8wTQXL9z4oX1d20d+Xnb9XfJQV1ClgwjgkFtv8uuHpOyRbTaemSX+2ZzEm+ADn
         cdgiOy3y6tOtKgLsjnJKlAMHmdBwsn2WkMdd1FQkTcz3Z3R4c/iXjDCGxTjTEq7PaHSI
         GM7HHNMLHl/U43ZIuWTHCa1RcstcGj3Fw6mkkzryIXLfN2FJcp4h3Nzx/PEulsqzeOc8
         5faQ==
X-Gm-Message-State: ABy/qLZOI4u3udzAcuFEUw1x4tcE5rmLozEFtZ46Q9fCSd+1DWokQVXs
	13ed9lqsFJHIFMetfzLJ6V/MJf764G52ShezApQuGA==
X-Google-Smtp-Source: APBJJlFRxBYFIFi7jQMlJ9b0aiDIcQomVwZEpqQvAEHweseoYSsNoIUfOa0SIsLsBQ7oqNCMb6nS8RBbzB0YIz4DlUs=
X-Received: by 2002:a81:8344:0:b0:56d:325c:442 with SMTP id
 t65-20020a818344000000b0056d325c0442mr12799162ywf.31.1688502185180; Tue, 04
 Jul 2023 13:23:05 -0700 (PDT)
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
In-Reply-To: <20230704091808.aa2ed3c11a5351d9bf217ac9@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 4 Jul 2023 13:22:54 -0700
Message-ID: <CAJuCfpE_WjRQoDT1XnvBghCH-kpqk+pfcBJGyDnK7DZLMVG5Mw@mail.gmail.com>
Subject: Re: Fwd: Memory corruption in multithreaded user space program while
 calling fork
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Jacob Young <jacobly.alt@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, 
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 4, 2023 at 9:18=E2=80=AFAM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Tue, 4 Jul 2023 09:00:19 +0100 Greg KH <gregkh@linuxfoundation.org> wr=
ote:
>
> > > > > > Thanks! I'll investigate this later today. After discussing wit=
h
> > > > > > Andrew, we would like to disable CONFIG_PER_VMA_LOCK by default=
 until
> > > > > > the issue is fixed. I'll post a patch shortly.
> > > > >
> > > > > Posted at: https://lore.kernel.org/all/20230703182150.2193578-1-s=
urenb@google.com/
> > > >
> > > > As that change fixes something in 6.4, why not cc: stable on it as =
well?
> > >
> > > Sorry, I thought since per-VMA locks were introduced in 6.4 and this
> > > patch is fixing 6.4 I didn't need to send it to stable for older
> > > versions. Did I miss something?
> >
> > 6.4.y is a stable kernel tree right now, so yes, it needs to be include=
d
> > there :)
>
> I'm in wait-a-few-days-mode on this.  To see if we have a backportable
> fix rather than disabling the feature in -stable.

Ok, I think we have a fix posted at [2]  and it's cleanly applies to
6.4.y stable branch as well. However fork() performance might slightly
regress, therefore disabling per-VMA locks by default for now seems to
be preferable even with this fix (see discussion at
https://lore.kernel.org/all/54cd9ffb-8f4b-003f-c2d6-3b6b0d2cb7d9@google.com=
/).
IOW, both [1] and [2] should be applied to 6.4.y stable. Both apply
cleanly and I CC'ed stable on [2]. Greg, should I send [1] separately
to stable@vger?

[1] https://lore.kernel.org/all/20230703182150.2193578-1-surenb@google.com/
[2] https://lore.kernel.org/all/20230704200656.2526715-1-surenb@google.com/

>
