Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4144C1857
	for <regressions@lists.linux.dev>; Thu, 30 Mar 2023 04:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680152121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AyTbRFMs97cAScAt4h83Kngqndm2W6jMyHVf8nQ7nPc=;
	b=FR3FtfNpHY/W3sHQed6kcOZLNjJtg2TqS6Kjb1i5nNzoZJrD5fJvP3MhVgjjtP3/G7c6gZ
	XTWLAZ+iwehEBY4Rr9MJ6QkXNj218U23xWB7gQdDrUBKUhXH+HLAbDRuKW1hIP2jEPheHS
	SQ9DpOXGGxXQo1/I/YrOWzeDoGnIa2Y=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-Ax0IqSygMCu5LpSeLEalQg-1; Thu, 30 Mar 2023 00:55:20 -0400
X-MC-Unique: Ax0IqSygMCu5LpSeLEalQg-1
Received: by mail-pf1-f199.google.com with SMTP id o14-20020a62f90e000000b0062d87d997eeso5019891pfh.18
        for <regressions@lists.linux.dev>; Wed, 29 Mar 2023 21:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680152119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AyTbRFMs97cAScAt4h83Kngqndm2W6jMyHVf8nQ7nPc=;
        b=44ODVK3aUWF7A9EGDWgG2/l+AQFXvTkXK740vLu8mKYaAJkTo/9ItWjJxyPMsfEdsQ
         LFjyeHZ5bOu9OgFXjqZq9WFeuTR6/NiFOwN4dic9tzZhQdC4iXQNAJM3yw2v4W8t8HxF
         4DGuaf1gK0BnndtspvJq7qCWuQeJbaoWYRX+qttlQNpNtCz5gbX37l+rTCNl7lJLVDaI
         wi/pi2scdZLh94pCqKaQsOIeWbZfYeTllXV0fxisnE6+Bfh9Jy3e0/LZ6VG5qKHz7HRC
         r7W5YtyjS52Tod2FfPAA27nXF1KMqO0mDr4o7L4mmdFnt6dzTeKF2YDlKMGS+B5/BN1B
         O9Rw==
X-Gm-Message-State: AAQBX9fCqCm2kMKIx0iZpSLaQqQD8/Mrf8ae9/6ydsGgudWfeif1HVKb
	j+Gtt0bSl/iO0s9tbJ2p6ovhwPW9mgrG15hsGXoEd+W7OQXLjJI2dO/8l5ijy7HJ0JwcjXtlyKc
	7wJz9qdH1QlyFUYG5lsFv8OeuC5xeQPIt7KodL1U=
X-Received: by 2002:a17:903:455:b0:1a2:6e4d:782c with SMTP id iw21-20020a170903045500b001a26e4d782cmr1824096plb.13.1680152119326;
        Wed, 29 Mar 2023 21:55:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZYn0YlGsE5d5/SvE3Xa4cQ9vWiHdShQwzms32z6+pM0mJhEaSXBrBGrhkAmiD4sB8++tb6bmQuv0Phxtq0AvQ=
X-Received: by 2002:a17:903:455:b0:1a2:6e4d:782c with SMTP id
 iw21-20020a170903045500b001a26e4d782cmr1824087plb.13.1680152118983; Wed, 29
 Mar 2023 21:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <167875238571.8008.9808655454439667586@noble.neil.brown.name>
 <CALTww2916uiO8_ViJQXutO2BPasFmiUJtfz8MxW0HKjDzwGFeQ@mail.gmail.com>
 <167945548970.8008.8910680813298326328@noble.neil.brown.name>
 <168012671413.8106.6812573281942242445@noble.neil.brown.name>
 <CALTww28X1NQecTY3Jbkz_wbHc_N7GOw3hJLEyb2YnxAmQ8PRFw@mail.gmail.com> <168014613094.14629.7292916705339147692@noble.neil.brown.name>
In-Reply-To: <168014613094.14629.7292916705339147692@noble.neil.brown.name>
From: Xiao Ni <xni@redhat.com>
Date: Thu, 30 Mar 2023 12:55:07 +0800
Message-ID: <CALTww29CN4iqmneiAG31kZDBubCMop=gg299hdW-TXCNq1c4gQ@mail.gmail.com>
Subject: Re: [PATCH - mdadm] mdopen: always try create_named_array()
To: NeilBrown <neilb@suse.de>
Cc: Jes Sorensen <jes@trained-monkey.org>, 
	Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>, Song Liu <song@kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, linux-raid <linux-raid@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Nikolay Kichukov <hijacker@oldum.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2023 at 11:15=E2=80=AFAM NeilBrown <neilb@suse.de> wrote:
>
> On Thu, 30 Mar 2023, Xiao Ni wrote:
> > On Thu, Mar 30, 2023 at 5:52=E2=80=AFAM NeilBrown <neilb@suse.de> wrote=
:
> > >
> > > On Wed, 22 Mar 2023, NeilBrown wrote:
> > > > On Wed, 22 Mar 2023, Xiao Ni wrote:
> > > >
> > > > >
> > > > > Second, are there possibilities that the arguments "dev" and "nam=
e" of
> > > > > function create_mddev
> > > > > are null at the same time?
> > > >
> > > > No.  For Build or Create, dev is never NULL.  For Assemble and
> > > > Incremental, name is never NULL.
> > > >
> > >
> > > I should clarify this a bit.  For Assemble and Incremental, "name" is
> > > never NULL *but* it might be an empty string.
> > > So:
> > >         if (name && name[0] =3D=3D 0)
> > >                 name =3D NULL;
> > >
> > > might cause it to become NULL.  So you cannot assume there is always
> > > either a valid "dev" or a valid "name".  "dev" might be NULL, and "na=
me"
> > > might be "".
> > >
> > > NeilBrown
> > >
> >
> > Hi Neil
> >
> > The input argument name should be the metadata name. For incremental
> > and assemble, why are there possibilities that the metadata name is
> > invalid? A raid device should have a valid metadata name, right?
>
> "should" do, yes.  But you can never completely trust data on disk.  It
> is safest to be prepared for "name" being "".
>
> NeilBrown
>

That's right, thanks for this explanation :)

--=20
Best Regards
Xiao Ni

