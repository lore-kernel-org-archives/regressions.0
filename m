Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E47DF52
	for <regressions@lists.linux.dev>; Thu, 25 May 2023 11:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685013576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5F4e37hxoARs4fANzF7y1sP1lg39Ahh3is7WLZy58tg=;
	b=Tr+VSfrYAOscrLeJP4znX4ZiUNN0+Kd6V3CqCTbemAyONb0PjzGPe6VbYSLbEnIVjTo9jP
	1bRn2Biky1H64YKDjmxV/GljNW+vY1X7AY0Ienl0ja12/VG/8B6/cHL7x5Dv2aTU04Bf3z
	SRM5FfKGe/BA4cPDXE4/TKbs33emlrQ=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-QgR5VKpePBSmAQyyZsW6rw-1; Thu, 25 May 2023 07:19:33 -0400
X-MC-Unique: QgR5VKpePBSmAQyyZsW6rw-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-561eb6c66f6so7214987b3.0
        for <regressions@lists.linux.dev>; Thu, 25 May 2023 04:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685013573; x=1687605573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5F4e37hxoARs4fANzF7y1sP1lg39Ahh3is7WLZy58tg=;
        b=iHEFy1BZ+ix9JTUBUb/CMCJ9JcOhp8TYntf6Mli4lyB56NE1UKstz46aWAS3jM6cxm
         UEJNUj47kM5yOimuhJLqVe0u9aEFroUvwx3gZp5KwzzZpTWxZj/JeAm55ooo1pxqIWoW
         T6FgtZZTbQxI57K61hglqHa1Z3Kp3C7QB7I0b6k6OoynCBx68PH+4xxFjygNiJGtyTHn
         0q9Lp9QcTvOkLSc+GFQn3u46MePlR+v0v8qnQSjvhnVFsrDtqZLL+37XvWHmy93O5OCp
         Y32VCy5MaDtpHBYmvsOkgiQ7i77tXjx4MBAseQcNrlQb1NC4OmWflynFSQEo0DMalFWm
         411g==
X-Gm-Message-State: AC+VfDxXd07p6i3ulIgH51+/ft7UBrUgic8CAEYzWHb+9xUxVRFjTWDx
	FxPJWetnlH+5gQz+vunGdxRv9GqoJ8oxkLWSuwRIHlQeoIhxA0cHYldEIMpt+X71jUsKh91H4Cw
	9dtAHeZxY5tPOx0yiCchfUnJiHjpou0bKDBk+sqQ=
X-Received: by 2002:a81:ab50:0:b0:559:f0f3:a70c with SMTP id d16-20020a81ab50000000b00559f0f3a70cmr19851885ywk.12.1685013573175;
        Thu, 25 May 2023 04:19:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6uB9DAQkrMEquIR6syhwbVUNGJWsd/VlbaeioKuhEaPtSmmy9bo7FcYhuxxAEI9jgxoQgmmwWiMV2nq6b9mj8=
X-Received: by 2002:a81:ab50:0:b0:559:f0f3:a70c with SMTP id
 d16-20020a81ab50000000b00559f0f3a70cmr19851866ywk.12.1685013572969; Thu, 25
 May 2023 04:19:32 -0700 (PDT)
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
 <nycvar.YFH.7.76.2305231422180.29760@cbobk.fhfr.pm> <CAO-hwJ+MTRu9KxqwQc7UYFBsa0kkrnYfwVB30KsLZnw=wfcOMg@mail.gmail.com>
 <nycvar.YFH.7.76.2305251308471.29760@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2305251308471.29760@cbobk.fhfr.pm>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Thu, 25 May 2023 13:19:21 +0200
Message-ID: <CAO-hwJJW1TDuZ2YXLf4pZhKO4UnM4ibUNsH=rpCyVjwNqixZtQ@mail.gmail.com>
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

On Thu, May 25, 2023 at 1:10=E2=80=AFPM Jiri Kosina <jikos@kernel.org> wrot=
e:
>
> On Wed, 24 May 2023, Benjamin Tissoires wrote:
>
> > > > That bug is pre-existing (ie the problem was not introduced by that
> > > > commit), but who knows if the retry makes things worse (ie if it th=
en
> > > > triggers on a retry, the response data will be the *previous* respo=
nse).
> > > >
> > > > The whole "goto exit" games should be removed too, because we're in=
 a
> > > > for-loop, and instead of "goto exit" it should just do "break".
> > > >
> > > > IOW, something like this might be worth testing.
> > > >
> > > > That said, while I think the code is buggy, I doubt this is the act=
ual
> > > > cause of the problem people are reporting. But it would be lovely t=
o
> > > > hear if the attached patch makes any difference, and I think this i=
s
> > > > fixing a real - but unlikely - problem anyway.
> >
> > FWIW, Linus, your patch is
> > Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> >
> > Feel free to submit it to us or to apply it directly if you prefer as
> > this is clearly a fix for a code path issue.
>
> It would be nice to hear from the people who were able to reproduce the
> issue whether this makes any observable difference in behavior though. I
> don't currently think it would, as it fixes a potential NULL pointer
> dereference, which is not what has been reported.

Well, yes, I didn't mean it would fix the bug. But this is an obvious
fix that we need to take given that we now see it :)

>
> Has anyone of the affected people tried to bisect the issue?

I just checked the BZ linked above, and... it still doesn't work
(which is not surprising):
https://bugzilla.kernel.org/show_bug.cgi?id=3D217412#c33

Cheers,
Benjamin

