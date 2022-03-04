Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E4BC7C
	for <regressions@lists.linux.dev>; Fri,  4 Mar 2022 14:45:40 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id w37so7698104pga.7
        for <regressions@lists.linux.dev>; Fri, 04 Mar 2022 06:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W3JUjUY/2pghrZi3FcJ+ewxZF+VyMxMbAEzz0CsmnUE=;
        b=qY1klgu0tw3GfONCW43gFHNTCxpd5NNdMXHgQOYFSFqan/Ctk9aCxStHD5vEH8YWYK
         m0IGw4Km8IkpOuTbq3KDqSOlOVCwzIa8pdCukIzagRu2+3wrEb28fyRxLtMRVubssc/G
         kTLcO68YuKlriqDQg5Y7RU+OsbmPz/6+ziSFlvimqftp3vuyC5k4HVR5jNz9/EwomAuo
         nB9mIEUxQUl6G+aklPXyXhqUB/vFaH4YCyTzpKADV6JSV/XArJ2YXFladSfGWNCkNRnH
         aEQ0NNenMg9GjVBz9CN/yKPuplWwJ6jaBDopaU8hyxlPUVhqKgLSKDJucq591fKbn6V2
         GPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W3JUjUY/2pghrZi3FcJ+ewxZF+VyMxMbAEzz0CsmnUE=;
        b=io+F5mDXML7HX/ZvOx4rMXQsshpl0CvmWaxUv90CQNO5Y55+Sq7LTlc5uy6OCX++86
         SBafpdUnLAnQfMMVUP4o1FrQtRU5HP+67wdPhDI2Z8QFTkS83+7C+EbfeoJP6ntGELn0
         68RuwGX697H1AUrxblav2PxYLcrPbmQXkA3PZun0sBqcOFwQXiQvCgJpgVvYhmJL1Qwm
         ceMUGV0NnN2c338RZmWTJdDlrzQR75CyEYhUrptUNiZ8D4I9lwxxX6SQel7YX55gOwc7
         do1XMMPnsPd0cAp44n0MOZsWk9Weym7CtQ4241LRDPUGMMPSMi/fvU5GLTeChpe3h+r5
         wtfQ==
X-Gm-Message-State: AOAM531kqDj9hN16pGxhyXcDutbN8R8VB3LISYjEKsrj0thQlVtvp3eY
	3vhXTETAuscadUCq4dLFnqZU2FKZkwNqibYL5DM=
X-Google-Smtp-Source: ABdhPJxQM1i8ziCQZniyVo2E2sPkIsb7GEwHIqb8hZe07ZQrz9PUwcCqkeXXN2jCftTvnmw30m2POPigiWrn5B+KgMI=
X-Received: by 2002:a05:6a00:887:b0:4f2:6d3f:5b53 with SMTP id
 q7-20020a056a00088700b004f26d3f5b53mr44180225pfj.21.1646405140123; Fri, 04
 Mar 2022 06:45:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAO_iuKEL8tHnovpGiQGUxg7JUpZFxHpxhOHbqAMgbt5R4Eftgg@mail.gmail.com>
 <2d1c129b-d473-39e3-69b7-6f36dc1682a6@leemhuis.info> <9312eb18-840f-9a1f-bcb0-8e3a43e45239@leemhuis.info>
 <236d45a6-8b88-c02e-a61d-ce1773fdb0ef@lwfinger.net> <02ef7552-67f5-dbcf-ece6-87b5b49e1bb5@leemhuis.info>
In-Reply-To: <02ef7552-67f5-dbcf-ece6-87b5b49e1bb5@leemhuis.info>
From: Nico Sneck <snecknico@gmail.com>
Date: Fri, 4 Mar 2022 16:45:28 +0200
Message-ID: <CAO_iuKHQ2DdLvSegcoezCzRVHqNFg+HM8qk1fr1n=s9cMz8QFA@mail.gmail.com>
Subject: Re: rtw_8822ce wifi regression after kernel update from 5.15 to 5.16
To: Thorsten Leemhuis <regressions@leemhuis.info>, Larry Finger <Larry.Finger@lwfinger.net>
Cc: Yan-Hsuan Chuang <tony0620emma@gmail.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Larry, Thorsten.

Sorry I'm a bit late, been really busy with work lately. Haven't had
time to continue bisecting, hopefully I can find some time this
sunday.

I still think this is a kernel regression - I don't believe I'm using
the driver from Larry's repo. This is a stock Fedora 35 installation,
I've not installed the driver from Larry's repo, and I don't believe
Fedora packages it by default.

The reason I used "rtw_8822ce" in the title is because "rtw_8822ce" is
printed by my kernel. However, thinking about it a bit, I think that
string may not be the driver name, but rather, maybe the device name
printed by the kernel?

See here: https://github.com/torvalds/linux/blob/38f80f42147ff658aff218edb0a88c37e58bf44f/drivers/net/wireless/realtek/rtw88/mac.c#L968
>rtw_warn(rtwdev, "timed out to flush queue %d\n", prio_queue);
It prints the rtwdev variable, which in my case is "rtw_8822ce".

And looking some more, I can see this:
https://github.com/torvalds/linux/blob/38f80f42147ff658aff218edb0a88c37e58bf44f/drivers/net/wireless/realtek/rtw88/rtw8822ce.c#L24
>.name = "rtw_8822ce",
So at least some name inside the driver itself is "rtw_" instead of "rtw88_".

Furthermore, here's what lsmod has to say:
>[nico@fedora linux]$ lsmod | grep 88
>rtw88_8822ce           16384  0
>rtw88_8822c           487424  1 rtw88_8822ce
>rtw88_pci              28672  1 rtw88_8822ce
>rtw88_core            167936  2 rtw88_pci,rtw88_8822c
>mac80211             1179648  2 rtw88_pci,rtw88_core
>kvm                  1036288  1 kvm_amd
>cfg80211             1024000  2 rtw88_core,mac80211

So I still believe this is a regression somewhere in the net stack -
maybe in wireless/ or wireless/rtw88/, but could be elsewhere as well,
as there are quite a few moving pieces involved with this machinery. I
tried to trace the logic leading to the function
"__rtw_mac_flush_prio_queue", but it becomes pretty difficult
considering all the places where the struct "ieee80211_ops rtw_ops"
member ".flush" in mac80211.c is handled. Add to that my poor
understanding of C, and the difficulty of bisecting this, it's not
easy to pinpoint where the regression came from. I'll try latest -RC,
and if it doesn't work, I'll try bisecting the net merge commits as
soon as I have time.

p.s. sorry for top posting, writing this in a hurry in gmail web client.

On Fri, Mar 4, 2022 at 8:33 AM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Hi, this is your Linux kernel regression tracker.
>
> On 28.02.22 23:07, Larry Finger wrote:
> > On 2/28/22 08:30, Thorsten Leemhuis wrote:
> > [...]
> >
> > Your use of rtw_8822ce in the title finally registered on me. With that
> > driver in use, that means that you are using my GitHub repo; however,
> > newer kernels have the driver built in, but with names such as
> > rtw88_8822ce. The difference in the name is deliberate.
>
> Many thx for this, the names already had made me a bit suspicious, but
> wasn't aware of this!
>
> > If you want to
> > use the GitHub version, you must blacklist the ones from the kernel.
> >
> > To check this, run 'lsmod | grep 88'. If you see a mixture of rtw_xxx
> > and rtw88_xxx, then this is your problem.
>
> Nico didn't reply to your mail, so I'll assume for now that this is not
> a kernel regression:
>
> #regzbot invalid: seems it's a regression in a external module of
> similar name
>
> @Yan-Hsuan Chuang: sorry for the noise!
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>
> P.S.: As the Linux kernel's regression tracker I'm getting a lot of
> reports on my table. I can only look briefly into most of them and lack
> knowledge about most of the areas they concern. I thus unfortunately
> will sometimes get things wrong or miss something important. I hope
> that's not the case here; if you think it is, don't hesitate to tell me
> in a public reply, it's in everyone's interest to set the public record
> straight.
>
>
>
