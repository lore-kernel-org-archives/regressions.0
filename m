Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74D7173
	for <regressions@lists.linux.dev>; Thu, 30 Mar 2023 00:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680135059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nJwwoseYXfDmJDLphLxlCuqi1MgqvP9f+lM5hWiKTuQ=;
	b=EnChsljgEa3sc3f8Veh74LEyv8pQQm+CY3hZ9xNJinUktgOqIYvII9G7VffxxHy1zT2KCW
	viL5aa+Z5i2bXAkM+Dyx/9Bm3N7cluIQbvWm1xns2zsppaGqJT2ZfHyti+xWtgl0CC6eoF
	Bth0KenU5kScWSF7Upwz45hmBn3wWFM=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-5rbTdooGNYe4TdV0Z7m21g-1; Wed, 29 Mar 2023 20:10:58 -0400
X-MC-Unique: 5rbTdooGNYe4TdV0Z7m21g-1
Received: by mail-pf1-f197.google.com with SMTP id x68-20020a628647000000b0062624c52117so7993779pfd.14
        for <regressions@lists.linux.dev>; Wed, 29 Mar 2023 17:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680135056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJwwoseYXfDmJDLphLxlCuqi1MgqvP9f+lM5hWiKTuQ=;
        b=UUVcrSvX050Wi++FeTXi9EShpa/hvuQQccnGncTWz74NLvEFjWGnf4yh04f+uQQh1y
         uX4NOr2l7svk1q9zWabMXgVUMAvxnhd4suV3x2kSPTDeJUsKO+EVaS34X6hFoQyerDPl
         vwA/QDoDWg+n6/frpWPu38aiN7iDWspjNMVypviWVlLzcjBCya9gP96MUViKf7A+g67f
         Hy9IQvNL2yDsqTY7lR5w2abos9uJahQFV+1igHrXSBpR23Hqp1tybyt53rT2VsE9LMbL
         hEgo7FYRKAFdQJj7309kv8xfvtSzuI/7kcVgxOxdvv8XPQW2tS47AkFj1+lvYDof7h5v
         rIhA==
X-Gm-Message-State: AAQBX9cVtEHV4tCfxHKy8DkD6xBR0+W/WYJ14/LD87r4E5Eg4RNlOw0k
	KGAZSUzIlJDCFZhpnZyPMMokUNdjwLmotNKN1Ne+bekebUOyuldF2s9wfwvMHvApd/gC5PRSnSh
	IBcroHbmiR+60BstMjraj7oIxcurZEuMWfcaiBC2G+o9DlrV4DQ==
X-Received: by 2002:a17:903:2442:b0:19f:3aa9:bbb7 with SMTP id l2-20020a170903244200b0019f3aa9bbb7mr7677572pls.13.1680135056746;
        Wed, 29 Mar 2023 17:10:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350YsEMj7r4L0z/wLASuJ8/zR4+nsT4Ssmbi1Yix7c8rVlq1R49pcvGXt96xxwz/5uYgKuTH3WDKxIrj1E+swa+s=
X-Received: by 2002:a17:903:2442:b0:19f:3aa9:bbb7 with SMTP id
 l2-20020a170903244200b0019f3aa9bbb7mr7677566pls.13.1680135056463; Wed, 29 Mar
 2023 17:10:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <167875238571.8008.9808655454439667586@noble.neil.brown.name>
 <CALTww2916uiO8_ViJQXutO2BPasFmiUJtfz8MxW0HKjDzwGFeQ@mail.gmail.com>
 <167945548970.8008.8910680813298326328@noble.neil.brown.name> <168012671413.8106.6812573281942242445@noble.neil.brown.name>
In-Reply-To: <168012671413.8106.6812573281942242445@noble.neil.brown.name>
From: Xiao Ni <xni@redhat.com>
Date: Thu, 30 Mar 2023 08:10:45 +0800
Message-ID: <CALTww28X1NQecTY3Jbkz_wbHc_N7GOw3hJLEyb2YnxAmQ8PRFw@mail.gmail.com>
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

On Thu, Mar 30, 2023 at 5:52=E2=80=AFAM NeilBrown <neilb@suse.de> wrote:
>
> On Wed, 22 Mar 2023, NeilBrown wrote:
> > On Wed, 22 Mar 2023, Xiao Ni wrote:
> >
> > >
> > > Second, are there possibilities that the arguments "dev" and "name" o=
f
> > > function create_mddev
> > > are null at the same time?
> >
> > No.  For Build or Create, dev is never NULL.  For Assemble and
> > Incremental, name is never NULL.
> >
>
> I should clarify this a bit.  For Assemble and Incremental, "name" is
> never NULL *but* it might be an empty string.
> So:
>         if (name && name[0] =3D=3D 0)
>                 name =3D NULL;
>
> might cause it to become NULL.  So you cannot assume there is always
> either a valid "dev" or a valid "name".  "dev" might be NULL, and "name"
> might be "".
>
> NeilBrown
>

Hi Neil

The input argument name should be the metadata name. For incremental
and assemble, why are there possibilities that the metadata name is
invalid? A raid device should have a valid metadata name, right?


--=20
Best Regards
Xiao Ni

