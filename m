Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F72F2D78A
	for <regressions@lists.linux.dev>; Fri, 27 Oct 2023 12:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ImZMoGR2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698410231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NZk9KIdsmuso3KQlnqbaPEbP9tjr8ir7g3ODaI70e5E=;
	b=ImZMoGR2vMV+YZ0tjZumsIeEDur/90+Qrqq0k7OoXNjt2kkxE4dDPsGFVgWdR4jLuCvylS
	1w39G+ZhJr0LjKHKAfWqwsTzSyqI7fRafA396yxWFfRszs2nn4+N7cwK5Bx+ISfZZ4Y10c
	vIX7kXIvteS5wBzlw4v9aNwNc4+8M4A=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-_3weM7waPRC0zswc-Wxx-A-1; Fri, 27 Oct 2023 08:37:07 -0400
X-MC-Unique: _3weM7waPRC0zswc-Wxx-A-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-27e293ff6daso1881609a91.3
        for <regressions@lists.linux.dev>; Fri, 27 Oct 2023 05:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698410226; x=1699015026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZk9KIdsmuso3KQlnqbaPEbP9tjr8ir7g3ODaI70e5E=;
        b=DYj1fu0IuGPbc1JFW0TEfp3txH81SXNMnt4QHeSNqRZ3Z9/zOt/2ZQUYnGZ/qqlC3P
         uVdmd8Ph7vql/ONutdDb9OxKRWlTk/2FGJIvgiv7Ac2f/paCANZGkJQOn96Dspsq+gV1
         bwtUmOQUeZvdyen7w0kyWV7SikwLOiuD1TjUcjfqE7end5wdDvt9T9XIoyAjcSint32x
         ZqPGuLty33/F+WkrkQJVqKtVaaGSMANvm/gziYveIi3Tji5Q34c9DWDk7YC75VZJiadj
         S+prVPG7KeGexj/p31UYNg5Z8p0nwGrmM6S+Pl3MlVWBa1aDJq2JTw0qm6T+hSEdcEv1
         0BLw==
X-Gm-Message-State: AOJu0YzU7pf102s0lfYCsbNhaktxxWWYD23ZLpH55gBp7fi9/BvS/Pg9
	pNKWKlk5InLum4OLWag9xNGPZvN669pyLSeAbqjO46MCcsyOitx3ILBDpH8EYDApNw9OvMiVgsH
	jQBNSNO1ueewaGahKxGnikBgrGfFUQnF6DGLyZzE=
X-Received: by 2002:a17:90a:db92:b0:27d:4f1f:47f5 with SMTP id h18-20020a17090adb9200b0027d4f1f47f5mr2628318pjv.23.1698410226659;
        Fri, 27 Oct 2023 05:37:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4uArItkfbIE+TacSDkk4EhW5nU+csRC7m600pJIU3M+AKlQ6UE8I5QG2tHKN1rBlwidB48swu5c9dHYmYNWw=
X-Received: by 2002:a17:90a:db92:b0:27d:4f1f:47f5 with SMTP id
 h18-20020a17090adb9200b0027d4f1f47f5mr2628295pjv.23.1698410226402; Fri, 27
 Oct 2023 05:37:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230904133321.104584-1-git@andred.net> <20231018111508.3913860-1-git@andred.net>
 <717fd97a-6d14-4dc9-808c-d752d718fb80@ddn.com> <4b0b46f29955956916765d8d615f96849c8ce3f7.camel@linaro.org>
 <fa3510f3-d3cc-45d2-b38e-e8717e2a9f83@ddn.com> <1b03f355170333f20ee20e47c5f355dc73d3a91c.camel@linaro.org>
 <9afc3152-5448-42eb-a7f4-4167fc8bc589@ddn.com> <5cd87a64-c506-46f2-9fed-ac8a74658631@ddn.com>
 <8ae8ce4d-6323-4160-848a-5e94895ae60e@leemhuis.info> <CAOssrKdvy9qTGSwwPVqYLAYYEk0jbqhGg4Lz=jEff7U58O4Yqw@mail.gmail.com>
 <2023102731-wobbly-glimpse-97f5@gregkh>
In-Reply-To: <2023102731-wobbly-glimpse-97f5@gregkh>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Fri, 27 Oct 2023 14:36:55 +0200
Message-ID: <CAOssrKfNkMmHB2oHHO8gWbzDX27vS--e9dZoh_Mjv-17mSUTBw@mail.gmail.com>
Subject: Re: [PATCH v2] Revert "fuse: Apply flags2 only when userspace set the FUSE_INIT_EXT"
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Lawrence <paullawrence@google.com>, 
	Daniel Rosenberg <drosen@google.com>, Alessio Balsini <balsini@android.com>, 
	Amir Goldstein <amir73il@gmail.com>, Bernd Schubert <bschubert@ddn.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 27, 2023 at 12:40=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Oct 25, 2023 at 03:17:09PM +0200, Miklos Szeredi wrote:

> > I don't think the Android use case counts as a regression.
>
> Why not?  In the changelog for this commit, it says:
>
>     There is a risk with this change, though - it might break existing us=
er
>     space libraries, which are already using flags2 without setting
>     FUSE_INIT_EXT.
>
> And that's exactly what Android was doing.  Not all the world uses libfus=
e,
> unfortunatly.

No, this is not about libfuse or not libfuse.   It's about upstream or
downstream.  If upstream maintainers would need to care about
downstream regressions, then it would be hell.

How should Android handle this?  Here's how: they have an internal
patch, which conflicts with the patch they want to revert.  Well, let
them revert that patch in their kernel.  It's not like it's a big
maintenance burden, since it's just a few lines.  This is the sort of
thing that downstream maintainers do all the time.

It's a no-brainer, what are we talking about then?

Thanks,
Miklos

