Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B843618AF6
	for <regressions@lists.linux.dev>; Wed, 24 May 2023 15:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684942063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pRD5Edte+ebDzPioS2wNC3VCfpjAvpMy1rZvcq/7BjA=;
	b=cIZ7P5O8Oz6G88m4SGuujYaVQTed7kdOPTJTuayRQFytVG0IuRseBTTBW6fPxhL2BJR/zt
	ft6hM8m9/n340LWb7PLWPy0ONIwaz94LOR9488TjilT8x2C1b1Zy9aiMa1iTb/lnlRAhDv
	XKwCc+aopO40CEd+2WAW33/19524zp8=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-gq_ZYWn5Odih-CbPSQgZng-1; Wed, 24 May 2023 11:27:42 -0400
X-MC-Unique: gq_ZYWn5Odih-CbPSQgZng-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-561bad0999aso24832207b3.0
        for <regressions@lists.linux.dev>; Wed, 24 May 2023 08:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684942062; x=1687534062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRD5Edte+ebDzPioS2wNC3VCfpjAvpMy1rZvcq/7BjA=;
        b=C6eYXfXGoDekYqbNWUE9QdntCSuoLcT2KArcj4daqGrdHuFTem/rwWTHIsouIX/KJ/
         T/ZyZj4Fei9ViprlvaTT5u1nBtj22lJ3mxKMNE/14vBww8U3udRm/5bv+cGE10HEApMK
         TWuXEaVfLo8ajwjgwtIzWQJSPuwavtdV/y/+MBPY3oOth/1PWUcbZ4rvG4mPHysBvkEJ
         WYEZ+xxLfknOn3UmlSucp22Q+y8QSS97cXGuh8FVlYZta20iBePDTObycTETljKQc4fj
         68pSkXFepg/lzQMvQgGu2Sn2NdIP+neHhIn4P42NZgVdoSfspQn0UHJzs1BU8qk0yiu5
         QnQg==
X-Gm-Message-State: AC+VfDyh+qRBGdBCcqrOo+ZOPEr0TmsMb4kPO3c1sLcktYJWUhaoL7V7
	MgbD8L/dyEdBvTpXqDGZSGmE6BsGd4O5GVxekhrZq6T5+nVJrNPTxF3w81wwkZGtxAS6Uuk2BHi
	zZAeJxjbtArGH/Dhf1ZZeaGVNSNjKbAGsnbw34yw=
X-Received: by 2002:a25:541:0:b0:ba8:bb80:87 with SMTP id 62-20020a250541000000b00ba8bb800087mr136311ybf.59.1684942061865;
        Wed, 24 May 2023 08:27:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5zOnfgYOls8GO46XNLGEjZ6QHYpl0/ZnDtlEknirvfa2o52TirkADmMFJbv94kbs8hSVE/fMRGbncqq5X8iqQ=
X-Received: by 2002:a25:541:0:b0:ba8:bb80:87 with SMTP id 62-20020a250541000000b00ba8bb800087mr136289ybf.59.1684942061594;
 Wed, 24 May 2023 08:27:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9b987585-0834-bb8c-3414-283c29f3f2ab@leemhuis.info>
 <bec024d5-4088-00ae-f7b5-7188868b1707@leemhuis.info> <b7717c43-74bf-b91d-d3ce-874493df602c@gmail.com>
 <CAO-hwJ+At1J_yUpX2q_dJekzZ-PoTDAvxmkTk_e4Yu0Z338bEA@mail.gmail.com>
 <55dda0bb-fe42-6dee-28ea-00121554d092@leemhuis.info> <CAHk-=whvhkSk6m8_AidhofgR9nq0Md+HbNad5r1RE69tZgbv6Q@mail.gmail.com>
 <nycvar.YFH.7.76.2305231422180.29760@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2305231422180.29760@cbobk.fhfr.pm>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Wed, 24 May 2023 17:27:30 +0200
Message-ID: <CAO-hwJ+MTRu9KxqwQc7UYFBsa0kkrnYfwVB30KsLZnw=wfcOMg@mail.gmail.com>
Subject: Re: [regression] Since kernel 6.3.1 logitech unify receiver not
 working properly
To: Jiri Kosina <jikos@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	=?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
	Bastien Nocera <hadess@hadess.net>, 
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	guy.b@bluewin.ch
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 23, 2023 at 2:31=E2=80=AFPM Jiri Kosina <jikos@kernel.org> wrot=
e:
>
> On Mon, 22 May 2023, Linus Torvalds wrote:
>
> > > FWIW, in case anybody is interested in a status update: one reporter
> > > bisected the problem down to 586e8fede79 ("HID: logitech-hidpp: Retry
> > > commands when device is busy"); reverting that commit on-top of 6.3
> > > fixes the problem for that reporter. For that reporter things also wo=
rk
> > > on 6.4-rc; but for someone else that is affected that's not the case.
>
> FWIW, I was pretty much away for past few weeks as well, same as Benjamin
> as Bastien. Which is unfortunate timing, but that's how things pan out
> sometimes.
>
> > Hmm. It's likely timing-dependent.
> >
> > But that code is clearly buggy.
> >
> > If the wait_event_timeout() returns early, the device hasn't replied,
> > but the code does
> >
> >                 if (!wait_event_timeout(hidpp->wait, hidpp->answer_avai=
lable,
> >                                         5*HZ)) {
> >                         dbg_hid("%s:timeout waiting for response\n", __=
func__);
> >                         memset(response, 0, sizeof(struct hidpp_report)=
);
> >                         ret =3D -ETIMEDOUT;
> >                 }
> >
> > and then continues to look at the response _anyway_.
>
> Yeah; we are zeroing it out, but that doesn't really make things any
> better in principle, given all the dereferences later.
>
> The issue seems to be existing ever since 2f31c52529 ("HID: Introduce
> hidpp, a module to handle Logitech hid++ devices") when this whole driver
> was introduced, as far as I can tell.

Yep, that was on me. But the weird part is that I should be able to
reproduce this locally then, but I don't.

>
> > Now, depending on out hardening options, that response may have been
> > initialized by the compiler, or may just be random stack contents.
>
> Again, as in case of timeout the buffer is just zeroed out, I'd just much
> more expect NULL pointer dereference in such case. Which is not what we
> are seeing here.

Returning -ETIMEDOUT seems good to me FWIW.

>
> > That bug is pre-existing (ie the problem was not introduced by that
> > commit), but who knows if the retry makes things worse (ie if it then
> > triggers on a retry, the response data will be the *previous* response)=
.
> >
> > The whole "goto exit" games should be removed too, because we're in a
> > for-loop, and instead of "goto exit" it should just do "break".
> >
> > IOW, something like this might be worth testing.
> >
> > That said, while I think the code is buggy, I doubt this is the actual
> > cause of the problem people are reporting. But it would be lovely to
> > hear if the attached patch makes any difference, and I think this is
> > fixing a real - but unlikely - problem anyway.

FWIW, Linus, your patch is
Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Feel free to submit it to us or to apply it directly if you prefer as
this is clearly a fix for a code path issue.

I am barely struggling with everything now that I am back from last
week, being sick at the beginning of the week and still not feeling
completely well doesn't help.

Cheers,
Benjamin

> >
> > And obviously it might be helpful to actually enable those dbg_hid()
> > messages, but I didn't look at what the magic config option to do so
> > was.
>
> dbg_hid() is just pr_debug(), which means that on kernels with
> CONFIG_DYNAMIC_DEBUG, this makes use of the dynamic debug facility;
> otherwsie it just becomes printk(KERN_DEBUG...).
>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>

