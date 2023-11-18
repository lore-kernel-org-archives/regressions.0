Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F91D5382
	for <regressions@lists.linux.dev>; Sat, 18 Nov 2023 00:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqNNbBxq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D967C43397
	for <regressions@lists.linux.dev>; Sat, 18 Nov 2023 00:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700267535;
	bh=jXKeJgS2efdeMW4uax+hDxFhcDk5npNFT1+zFEUZb2M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fqNNbBxq/JhNPpmAX5TxM3CstlfJzx4HhbdBcNLdN3Q9/6jvFGVLZz6ODssvHXRll
	 C1bN98O9T33eWp18PJ0RX4doINUh9cq/R8ZcEc20UwERb2FSFbL5Zov+m6eLOw5XO1
	 U0G7ve4go2/U2AcRQBfyrcnDNhXxr73zNrB7z/DdLTs2A8gmjboeRkcxWLDePonZMd
	 YHjaAYfb6skwPEoTTg/+IJvU8c2He+NExPPwWYWQ/APgYVtuWcArdciluMchWxdujz
	 VMzqINiboCWbhkUf3kw3wZx8hdoQrUyUiSlDt8/iYqaZmT0ujOkI3o51GKdzc46Hz3
	 fUHcxkHgPIZgQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5079f6efd64so3383079e87.2
        for <regressions@lists.linux.dev>; Fri, 17 Nov 2023 16:32:15 -0800 (PST)
X-Gm-Message-State: AOJu0YxmG2RJqm94ofkYHcHcd6QbnWDhl/BGUk13RrPUom8V8qeftG6U
	J57PD26WSASjgbXj7ptj6i3GZ4uMw+/rcON7xoI=
X-Google-Smtp-Source: AGHT+IGzdR13CFoknC3hQoaKVSXX98FA5eFCg5mgyMyFqXD5N0rpGMQWBThfLNeAn8wHcGTVgGrk+FxYy6kZVWli7lI=
X-Received: by 2002:ac2:4567:0:b0:50a:77e9:d07a with SMTP id
 k7-20020ac24567000000b0050a77e9d07amr745858lfm.44.1700267533576; Fri, 17 Nov
 2023 16:32:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <5727380.DvuYhMxLoT@bvd0> <CAPhsuW4+Ktd7mzTQ6M4n9-=8vgyMDJUi8Xkcv50JXTf_2yqTFA@mail.gmail.com>
 <1956a189-107b-4445-9e53-336f1533c4b9@huaweicloud.com>
In-Reply-To: <1956a189-107b-4445-9e53-336f1533c4b9@huaweicloud.com>
From: Song Liu <song@kernel.org>
Date: Fri, 17 Nov 2023 16:32:01 -0800
X-Gmail-Original-Message-ID: <CAPhsuW6v+acp9jrwt-19fF7BUpLtDTRvVG4FNimpww4ztODHrg@mail.gmail.com>
Message-ID: <CAPhsuW6v+acp9jrwt-19fF7BUpLtDTRvVG4FNimpww4ztODHrg@mail.gmail.com>
Subject: Re: [REGRESSION] Data read from a degraded RAID 4/5/6 array could be
 silently corrupted.
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: Bhanu Victor DiCara <00bvd0+linux@gmail.com>, Xiao Ni <xni@redhat.com>, 
	Mateusz Grzonka <mateusz.grzonka@intel.com>, linux-raid@vger.kernel.org, 
	regressions@lists.linux.dev, jiangguoqing@kylinos.cn, jgq516@gmail.com, 
	"yukuai (C)" <yukuai3@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 5:05=E2=80=AFPM Yu Kuai <yukuai1@huaweicloud.com> w=
rote:
>
> Hi,
>
> =E5=9C=A8 2023/11/17 0:24, Song Liu =E5=86=99=E9=81=93:
> > + more folks.
> >
> > On Fri, Nov 10, 2023 at 7:00=E2=80=AFPM Bhanu Victor DiCara
> > <00bvd0+linux@gmail.com> wrote:
> >>
> >> A degraded RAID 4/5/6 array can sometimes read 0s instead of the actua=
l data.
> >>
> >>
> >> #regzbot introduced: 10764815ff4728d2c57da677cd5d3dd6f446cf5f
> >> (The problem does not occur in the previous commit.)
> >>
> >> In commit 10764815ff4728d2c57da677cd5d3dd6f446cf5f, file drivers/md/ra=
id5.c, line 5808, there is `md_account_bio(mddev, &bi);`. When this line (a=
nd the previous line) is removed, the problem does not occur.
> >
> > The patch below should fix it. Please give it more thorough tests and
> > let me know whether it fixes everything. I will send patch later with
> > more details.
> >
> > Thanks,
> > Song
> >
> > diff --git i/drivers/md/md.c w/drivers/md/md.c
> > index 68f3bb6e89cb..d4fb1aa5c86f 100644
> > --- i/drivers/md/md.c
> > +++ w/drivers/md/md.c
> > @@ -8674,7 +8674,8 @@ static void md_end_clone_io(struct bio *bio)
> >          struct bio *orig_bio =3D md_io_clone->orig_bio;
> >          struct mddev *mddev =3D md_io_clone->mddev;
> >
> > -       orig_bio->bi_status =3D bio->bi_status;
> > +       if (bio->bi_status)
> > +               orig_bio->bi_status =3D bio->bi_status;
>
> I'm confused, do you mean that orig_bio can have error while bio
> doesn't? If this is the case, can you explain more how this is
> possible?

Yes, this is possible.

Basically, a big bio is split by md_submit_bio =3D> bio_split_to_limits, so
we will have two bio's into md_clone_bio(). Let's call them
parent_orig_bio and split_orig_bio. Errors from split_orig_bio will be
propagated to parent_orig_bio by __bio_chain_endio(). If
parent_orig_bio succeeded, md_end_clone_io may overwrite the error
reported by split_orig_bio. Does this make sense?

Thanks,
Song
