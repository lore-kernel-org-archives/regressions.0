Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0593B34CD9
	for <regressions@lists.linux.dev>; Tue, 16 May 2023 13:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684244077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=45UqYriNQVtdBFesR+jleqsSy4ksjE6lhJMxVSYplvo=;
	b=jImryifERTRRuLIyl4VEko9QE84zkBWlKRJfKrqxVyrKkdFNbNh1aQa9O8NzWnIyg/h+fo
	SUfHZjqptjJN3yhUyvWKs3MK9Zcz8mNpb/JUZPldGcwG6AcAFfdGTIH7TDrWx2iwcnfXVC
	vxrVUOT/Z8pQD2q0EGqLbx4SSsPF0aI=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-RypaQf-eN-i7iukOFaOemg-1; Tue, 16 May 2023 09:34:36 -0400
X-MC-Unique: RypaQf-eN-i7iukOFaOemg-1
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-ba712bb7b28so5210680276.1
        for <regressions@lists.linux.dev>; Tue, 16 May 2023 06:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684244075; x=1686836075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45UqYriNQVtdBFesR+jleqsSy4ksjE6lhJMxVSYplvo=;
        b=FDQJkj/TEWbV0y0Ll/g9UvTgg0eiXGNgZ0bYXNBXVfP5J5CrnWiTYaf+4zIyXfzH0d
         qsu7LfQkVbUic6YtPgkoWZadST/hcR98DhBiZbt2EqiSeFu2PY3LhSUIk7VYobOgwJIo
         XPiudVDgayAEBHRi1QFH96pvSZj9TqRpc1AfwRksZMfhjhwtAvSiA6FhTTw370PbbsVp
         ojB8eiozxJQNWWJwAqslqhZ0EMT0vGjGojF8LqqnOfWuR42L0Gy3BbYqXJdSzCVPPFLw
         +jijP2AVoBE+XhltLMEuAJ6TgxfdojcMwy61DgI0g9fwQOlbf1wZgS4OkQ8Dg/Zp9+wq
         vgNA==
X-Gm-Message-State: AC+VfDxlEwLHJIS0k7h0kqGbD8w8F5xCV6NcUNOB792sb2EcUEioHvBq
	SZTTSN1QnaKUvB0hYPNYqPtzRx2/xTq5SzmhvUoDqOSZ+xWobIB6Rs9lEQmpkN2iWXWTTjaQENp
	qLkWgOUqGLkcgMuulZHsJItRrBWxPSvgTVf1aZes=
X-Received: by 2002:a0d:d847:0:b0:561:b246:77df with SMTP id a68-20020a0dd847000000b00561b24677dfmr491849ywe.16.1684244075581;
        Tue, 16 May 2023 06:34:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5a8XsAcCfmDEhTwmeBSPI5gRAlk+fKBy37/4QgPjAyDxSQYLttDSUO8ua8sZeUNWVP3Ts21WU0gwhJWqir3M4=
X-Received: by 2002:a0d:d847:0:b0:561:b246:77df with SMTP id
 a68-20020a0dd847000000b00561b24677dfmr491841ywe.16.1684244075332; Tue, 16 May
 2023 06:34:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9b987585-0834-bb8c-3414-283c29f3f2ab@leemhuis.info>
 <bec024d5-4088-00ae-f7b5-7188868b1707@leemhuis.info> <b7717c43-74bf-b91d-d3ce-874493df602c@gmail.com>
In-Reply-To: <b7717c43-74bf-b91d-d3ce-874493df602c@gmail.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Tue, 16 May 2023 15:34:24 +0200
Message-ID: <CAO-hwJ+At1J_yUpX2q_dJekzZ-PoTDAvxmkTk_e4Yu0Z338bEA@mail.gmail.com>
Subject: Re: [regression] Since kernel 6.3.1 logitech unify receiver not
 working properly
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
	Bastien Nocera <hadess@hadess.net>, Jiri Kosina <jikos@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	guy.b@bluewin.ch
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 16, 2023 at 3:25=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> On 5/11/23 18:58, Thorsten Leemhuis wrote:
> > Hi, Thorsten here, the Linux kernel's regression tracker.
> >
> > On 08.05.23 11:55, Linux regression tracking (Thorsten Leemhuis) wrote:
> >> Hi, Thorsten here, the Linux kernel's regression tracker.
> >>
> >> I noticed a regression report in bugzilla.kernel.org. As many (most?)
> >> kernel developers don't keep an eye on it, I decided to forward it by =
mail.
> >>
> >> Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=3D217412 :
> >
> > TWIMC: a few other users (three or four iirc) showed up in that ticket
> > and reported problems with the receiver, albeit the symptoms are not
> > exactly the same for all of them, so there might be more than one probl=
em.
> >
> > I'll try to motivate the affected users to perform a bisection. But
> > would be great if those with more knowledge about this code could
> > briefly look into the ticket, maybe the details the users shared allows
> > one of you to guess what causes this.
> >
>
> Hmm,
>
> You noted in the similar report [1] that developers involved here
> ignore this regressions. I wonder if Linus has to be hired in
> this case, and if it is the case, let's take a look and hear closely what
> he will say.

Sigh... Not answering an email is bad, but maybe you can also
understand that developers can take days off?

And it turns out that I was waiting for Bastien to chime in, but I can
access his calendar too and just found out that he was AFK for the
entire month, except for the first week, which I wasn't aware. May is
a time where people in France have a lot of public holidays and is
also the cut to use those time off or they expire.

For me, I'll also be taking time off the rest of this week, so I won't
be able to have a look at this until next week at the earliest.

Cheers,
Benjamin

>
> Thanks.
>
>
> [1]: https://lore.kernel.org/regressions/8941c5f2-3861-da68-06ca-adc68a37=
e53b@leemhuis.info/
>
> --
> An old man doll... just what I always wanted! - Clara
>

