Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A6D3DFED
	for <regressions@lists.linux.dev>; Fri, 27 Oct 2023 18:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WHjToOQX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698431038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f1GFRFSXrJZnqwU7bWQb2Id5cyqADGdT0GyV9+GmOAk=;
	b=WHjToOQXdzwR+1Cc5kSS6kqVbbKrDZkz7+XVTev1x3uM9mGDg4pdeVaTAwYX+n4JNIDIpt
	ZyC6wgkGg75QPZhZqBWgtrq6q6yQwV+2WjIBIJ5n18zOL3oPKu9IJ9+KTPf3AY4kITKnep
	fpKzmlc6DclQL1QrKlbNt97njODChVA=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-v05JjWu7MTCAB8MK4GarIw-1; Fri, 27 Oct 2023 14:23:47 -0400
X-MC-Unique: v05JjWu7MTCAB8MK4GarIw-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2800ef7d1ddso676413a91.3
        for <regressions@lists.linux.dev>; Fri, 27 Oct 2023 11:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698431026; x=1699035826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1GFRFSXrJZnqwU7bWQb2Id5cyqADGdT0GyV9+GmOAk=;
        b=LTiVVSN6z210Ixll1nJJQco0lFRpWZ0q8rGvjH0I0LhD+2LL0Fsb3OXZZ9tLFQ1tYl
         A4MsASRNArkbN66e7SUM68bNEkIIMBslwJrwuZHd7vK913AuJEEdPFgjG3LsX9xg40kx
         q87talUzoP0PMA5p0lnZ3vNfPW0LI9Ndz1lSfK7imS3PWxuyHfWWGkjcxI2DVUqKd4EA
         vgpWXKLI2yTAyx4fIKQxWlEBpbUhbSqz1DgoAozJPKHwWHI9f8P7qJJk0m1KpmTAXwrB
         bAFR+j6Y61U6Zl77PxM8iTtkR6RXscqDtixWuIvUiB0xBTiXFMZKyRiXEuQ90LecWZ3Z
         +Vyw==
X-Gm-Message-State: AOJu0YwVkG6O+VIPLXvxuQKeea+TpzznbWP/DeD4U/Qmg6H3PbjrSiEy
	zwY9VD/TTVY8hGizFLyzMV/6ehhaUR20yx0MjqJ9H6ulysmC6QaUB368iLyCeUvuKdZDR63fEEi
	KMhpGbJiAS6+jy+UIxX2FdtsASFz8J9gf4O+IrHQ=
X-Received: by 2002:a17:90b:3644:b0:280:1508:fbbb with SMTP id nh4-20020a17090b364400b002801508fbbbmr1868674pjb.23.1698431026274;
        Fri, 27 Oct 2023 11:23:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG50FlCwAd54tu9bXNQ2lOanyMl7ApDN5fYTheNDi/qcr0Q8FcDhYQnCfYRD6hGz6A5X4B1bh6MAyLWI8uU85M=
X-Received: by 2002:a17:90b:3644:b0:280:1508:fbbb with SMTP id
 nh4-20020a17090b364400b002801508fbbbmr1868659pjb.23.1698431026001; Fri, 27
 Oct 2023 11:23:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <fa3510f3-d3cc-45d2-b38e-e8717e2a9f83@ddn.com> <1b03f355170333f20ee20e47c5f355dc73d3a91c.camel@linaro.org>
 <9afc3152-5448-42eb-a7f4-4167fc8bc589@ddn.com> <5cd87a64-c506-46f2-9fed-ac8a74658631@ddn.com>
 <8ae8ce4d-6323-4160-848a-5e94895ae60e@leemhuis.info> <CAOssrKdvy9qTGSwwPVqYLAYYEk0jbqhGg4Lz=jEff7U58O4Yqw@mail.gmail.com>
 <2023102731-wobbly-glimpse-97f5@gregkh> <CAOssrKfNkMmHB2oHHO8gWbzDX27vS--e9dZoh_Mjv-17mSUTBw@mail.gmail.com>
 <2023102740-think-hatless-ab87@gregkh> <CAOssrKd-O1JKEPzvnM1VkQ0-oTpDv0RfY6B5oF5p63AtQ4HoqA@mail.gmail.com>
 <2023102757-cornflake-pry-e788@gregkh>
In-Reply-To: <2023102757-cornflake-pry-e788@gregkh>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Fri, 27 Oct 2023 20:23:34 +0200
Message-ID: <CAOssrKc6zpsTox58CMvWHAU7EhM1REEk6J9SbV5DaBzurpmr5Q@mail.gmail.com>
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

On Fri, Oct 27, 2023 at 3:12=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:

> So because Android userspace is sending a flag value that is not in the
> upstream table, this breakage is ok?  Or do you mean something else, I'm
> getting confused.

From my POV the regression in the Android kernel was due to the
Android patch that added those flags.

Not all flags are equal, some applications use a specific set of flags
and another set of applications use another set.  Non-Android apps
won't use the flag that Android added, for obvious reasons.

I still don't see why we'd need to revert this patch due to
regressions in Android.  Maybe I'm really dumb, but I just don't get
it.

Thanks,
Miklos

