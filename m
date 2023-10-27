Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FACE358AD
	for <regressions@lists.linux.dev>; Fri, 27 Oct 2023 14:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HPnzN/Tg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698415541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qmiVVEtRZXlvZiCEBDmIRly02OLScsCRxyCghuB2vJE=;
	b=HPnzN/TgmnTvk9LO8GBD920+sr6JcceWOwd1hFCBkxIEmnHxHcpZz8ElQq9M0QDxbEYnMs
	L165fwfsHLci1eJAiX1Hmd+kON5CHdioOyU3m3aAzxPOLMGqFEWl+FvQNKFS3ObTGCTK7p
	PTz86KgN0Z/RRtKtQ7PZQqTHt7LCwPY=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-Q84iz8k-NEa7kxbAlmuBqg-1; Fri, 27 Oct 2023 10:05:39 -0400
X-MC-Unique: Q84iz8k-NEa7kxbAlmuBqg-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2801ff79244so27092a91.2
        for <regressions@lists.linux.dev>; Fri, 27 Oct 2023 07:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698415538; x=1699020338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qmiVVEtRZXlvZiCEBDmIRly02OLScsCRxyCghuB2vJE=;
        b=Xxwv589yS3Dn2kz4k+qyDjn7SKSYx/LFRkVOluefM1vGCemSiAxfuQdUubejsi8ptC
         dKkpbu8IhobkQ1rM5NSgZscP6x3b7VWWhq0MGpOL/XCf7MynhheWHusiQQy9kMXQAm5B
         vh12jNluBwoRaBVXghTjEYTwSSy9UoHw79tEPsg15zaEcYTeeuY3rhHBUuGLj0aWSIcG
         cQQeGzYfG5KEDpRmA7K8C3J5UxuqOjOPe14M139SlbMfh4zuIGgEBSq/vBfPXiN70Evq
         i2VlB6tFhbManON+mpWYKf7cGHfxxqCQEYwpiE4/LMUWUOGS06AE1P81SewEtz+VQdgS
         zl7w==
X-Gm-Message-State: AOJu0YxCoXTIjZFoTZLda4+sIZpMpcDwuy50porZQmXIDfGq0YthD/ro
	Mx0cWSwoyA0JhrRz4i141rC2kuHBKFVTxPEiZTvEZAHJoruwX3k7Dzh86kQAPlkygfzH6jWJA2I
	avRmlEGIYklSiWoOQGd2vErDfWU2SIOYjHbPZL1o=
X-Received: by 2002:a17:90a:4f48:b0:27d:166b:40f6 with SMTP id w8-20020a17090a4f4800b0027d166b40f6mr2532538pjl.41.1698415538768;
        Fri, 27 Oct 2023 07:05:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFz7lrTl+zAdmgTnAvT/azIXBCe0/XGufVtBRSSehgdm4mTofu5iqEwH7u2CGPh9s/wxC1dldLVGTED5Rv21bY=
X-Received: by 2002:a17:90a:4f48:b0:27d:166b:40f6 with SMTP id
 w8-20020a17090a4f4800b0027d166b40f6mr2532514pjl.41.1698415538507; Fri, 27 Oct
 2023 07:05:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <717fd97a-6d14-4dc9-808c-d752d718fb80@ddn.com> <4b0b46f29955956916765d8d615f96849c8ce3f7.camel@linaro.org>
 <fa3510f3-d3cc-45d2-b38e-e8717e2a9f83@ddn.com> <1b03f355170333f20ee20e47c5f355dc73d3a91c.camel@linaro.org>
 <9afc3152-5448-42eb-a7f4-4167fc8bc589@ddn.com> <5cd87a64-c506-46f2-9fed-ac8a74658631@ddn.com>
 <8ae8ce4d-6323-4160-848a-5e94895ae60e@leemhuis.info> <CAOssrKdvy9qTGSwwPVqYLAYYEk0jbqhGg4Lz=jEff7U58O4Yqw@mail.gmail.com>
 <2023102731-wobbly-glimpse-97f5@gregkh> <CAOssrKfNkMmHB2oHHO8gWbzDX27vS--e9dZoh_Mjv-17mSUTBw@mail.gmail.com>
 <2023102740-think-hatless-ab87@gregkh> <CAOssrKd-O1JKEPzvnM1VkQ0-oTpDv0RfY6B5oF5p63AtQ4HoqA@mail.gmail.com>
 <689f677b84b484636b673b362b17a6501a056968.camel@linaro.org>
 <CAOssrKfP+t-cy322ujizQofgZkPZsBu1H4+zfbWNEFCmTsXwug@mail.gmail.com> <afe378bf254f6c4ac73bb55be3fa7422f2da3f5f.camel@linaro.org>
In-Reply-To: <afe378bf254f6c4ac73bb55be3fa7422f2da3f5f.camel@linaro.org>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Fri, 27 Oct 2023 16:05:27 +0200
Message-ID: <CAOssrKeJB7BZ7fA6Uqo6rHohybmgovc6rVwDeHbegvweSyZeeA@mail.gmail.com>
Subject: Re: [PATCH v2] Revert "fuse: Apply flags2 only when userspace set the FUSE_INIT_EXT"
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Lawrence <paullawrence@google.com>, 
	Daniel Rosenberg <drosen@google.com>, Alessio Balsini <balsini@android.com>, 
	Amir Goldstein <amir73il@gmail.com>, Bernd Schubert <bschubert@ddn.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 27, 2023 at 3:39=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> On Fri, 2023-10-27 at 15:24 +0200, Miklos Szeredi wrote:
> > On Fri, Oct 27, 2023 at 3:14=E2=80=AFPM Andr=C3=A9 Draszik
> > <andre.draszik@linaro.org> wrote:
> >
> > > The patch in question has broken all users that use the higher
> > > flags
> > > and that don't use your version of libfuse, not just Android.
> > > You're
> > > filtering them out now when you didn't at the time that those
> > > ('official) high flags were added. There are a couple more high
> > > flags
> > > than just the one that Android added.
> >
> > Okay.  Where are all those users?
>
> That's not the point. The point is the kernel<->user API has rendered
> them too non-working.

It is a very important point.  A theoretical bug isn't a regression.
Nor is a broken test case BTW.

Please read section 'What is a "regression" and what is the "no
regressions rule"?' in
Documentation/admin-guide/reporting-regressions.rst.

 Thanks,
Miklos

