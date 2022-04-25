Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D37B33D6
	for <regressions@lists.linux.dev>; Mon, 25 Apr 2022 21:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650922512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pqkpreHZ3ia1bBtuPwaW+iRirP2OMqrmhar4b0pBnO4=;
	b=ZsdGymF6+C7WPd/MzVrRueI9d5Af7xfqj15is91438lbis5DoFDIGGrTKUyBN4bWk+I7Ue
	7BgQHODTO0ut4TeTG58jU2FwAh3wgk5SDahWv1xh2eDbEM2s8QL2N2N3vheZS9QiG2xqjp
	FOncR3zdqFQeurQspAyOJ4lwKX/6Xx8=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-P112kcufMoW-xcc0hL47Hg-1; Mon, 25 Apr 2022 17:35:10 -0400
X-MC-Unique: P112kcufMoW-xcc0hL47Hg-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-2eb2bc9018aso138581287b3.18
        for <regressions@lists.linux.dev>; Mon, 25 Apr 2022 14:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pqkpreHZ3ia1bBtuPwaW+iRirP2OMqrmhar4b0pBnO4=;
        b=eJkWPs9UkjbLCeMZsXnq18VcPIsiM9ii2q+x9iULWxw1PVUDMahc+6WYD8Yif3jc2/
         jeYdX6JjUuGbYkaZXl7K9F74RWITzjZdrW//TUyAcq4txVaTzIM2mAmS9sUwcs2ERI73
         JNiamS1s1tFOg3De2qG3xaL11tLlYRdF7PeUjAAfShN78DKlwReLJRzEWHdGfTWCwThI
         f9Kye45OxZQ+iy5ANaxgEZGl1wSQaXPssQz7oQ2tQj2K++9a1WSXxpQeHAmpEP2qQT1D
         wiaeZEj7RuJKed3mBGQ4rGy4OEpJgxAii6S67ad2UEvc6vzJy+3bt0P3bGQxLl6PufWO
         Eq1A==
X-Gm-Message-State: AOAM5325IpH7SZukD26vfxKSPy/s9uR9lZ/QmqZpCFm/KQhm9bwC0JV4
	m7109OZZz4anZFeOUocMER2Aktze9cnxUnlE7RNAQKsCzRR1O3Zrd46zBSgmcLX1flyPNMRYcWD
	cyKT/mDsdVTFVRhbEHfqargsHauXGvK8H1TVTJeg=
X-Received: by 2002:a25:7c05:0:b0:644:dec5:6d6e with SMTP id x5-20020a257c05000000b00644dec56d6emr17770532ybc.598.1650922509383;
        Mon, 25 Apr 2022 14:35:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFgLItvHe1URsoiUCW7gsLEswPF2tcX6tz2ZSc39w9QlWCPdTn6wn183MkClVVeDddMYBNafGT9araXdpeh00=
X-Received: by 2002:a25:7c05:0:b0:644:dec5:6d6e with SMTP id
 x5-20020a257c05000000b00644dec56d6emr17770516ybc.598.1650922509168; Mon, 25
 Apr 2022 14:35:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YkTxox8ZQIDtojfU@google.com> <CAFxkdAq6r2WnwML-pPfdZiajaYZCEcUU3GrXW=+wsA7CxGnJdQ@mail.gmail.com>
 <CAE4VaGBchOMWeHQ8GKiGFv_aCaNGLEvSdLWXZTpE+qC=0bgM3A@mail.gmail.com>
 <YkY6W1NS+1RTw0VB@google.com> <CAE4VaGDAMZqjwumyvbityzEiK30=5a5vuDMjaS+UHM39R-oPRw@mail.gmail.com>
 <YkstxbC3OfzYnSRw@google.com> <CAE4VaGAQZcQzN8D+iwcBnP5vY=Ctmbh+oTikvONHir6JjTgpsw@mail.gmail.com>
 <YmGKrd1BR9HSEy6q@slm.duckdns.org> <YmLznjFdpblHzZiM@google.com>
 <56ac17fd-5f13-840c-09d8-03363af94520@leemhuis.info> <YmMLgHnxoTC1idCE@google.com>
In-Reply-To: <YmMLgHnxoTC1idCE@google.com>
From: Jirka Hladky <jhladky@redhat.com>
Date: Mon, 25 Apr 2022 23:34:58 +0200
Message-ID: <CAE4VaGBnrfU09WU=VCqge8cN49wA31eF9=OYniE3PUrfbNyLsQ@mail.gmail.com>
Subject: Re: PANIC: "Oops: 0000 [#1] PREEMPT SMP PTI" starting from 5.17 on
 dual socket Intel Xeon Gold servers
To: Minchan Kim <minchan@kernel.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	regressions@lists.linux.dev, Justin Forbes <jforbes@fedoraproject.org>, 
	Tejun Heo <tj@kernel.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jhladky@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Minchan,

I have tested the proposed patch and it fixes the issue!

Thanks a lot for your help!
Jirka


On Fri, Apr 22, 2022 at 10:09 PM Minchan Kim <minchan@kernel.org> wrote:
>
> On Fri, Apr 22, 2022 at 08:44:17PM +0200, Thorsten Leemhuis wrote:
> > On 22.04.22 20:27, Minchan Kim wrote:
> > > On Thu, Apr 21, 2022 at 06:47:41AM -1000, Tejun Heo wrote:
> > > [...]
> >
> > Many thx for looking into this.
> >
> > > Jirka, Could you test the patch? Once it's confirmed, I need to resend
> > > it with Ccing stable.
> >
> > When you do so, could you please include a proper "Link:" tag pointing
> > to all reports of the regression, as explained in the Linux kernels
> > documentation (see 'Documentation/process/submitting-patches.rst' and
> > 'Documentation/process/5.Posting.rst'). E.g. in this case:
> >
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=215696
> > Link:
> > https://lore.kernel.org/lkml/CAE4VaGDZr_4wzRn2___eDYRtmdPaGGJdzu_LCSkJYuY9BEO3cw@mail.gmail.com/
>
> Sure. Will do that.
>
> >
> > This concept is not new (Linus and quite a few other developers use them
> > like this for a long time), I just recently improved those documents to
> > clarify things, as my regression tracking efforts rely on this (and
> > there might be other people and software out there that does) -- that's
> > why it's making my work a lot harder if such tags are missing. :-/
> >
> > Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> >
> > P.S.: As the Linux kernel's regression tracker I'm getting a lot of
> > reports on my table. I can only look briefly into most of them and lack
> > knowledge about most of the areas they concern. I thus unfortunately
> > will sometimes get things wrong or miss something important. I hope
> > that's not the case here; if you think it is, don't hesitate to tell me
> > in a public reply, it's in everyone's interest to set the public record
> > straight.
> >
> > > [...]
>


-- 
-Jirka

