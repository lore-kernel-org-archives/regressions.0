Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567DABA29
	for <regressions@lists.linux.dev>; Wed, 22 Mar 2023 20:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB8FEC4339B
	for <regressions@lists.linux.dev>; Wed, 22 Mar 2023 20:20:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="PIpcYJJX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1679516405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z5+SwuPswYL3502uLq6hayJyZoDC1sf3E/Ormc16ROU=;
	b=PIpcYJJX9hptjh826y5Zn1hijTEsvDVh/1kxhA5t7yY8jKbnkGW/3rbZoRKDCRTbCTys4P
	3QZp7sJr5kpsH2zTiTTlMjtJqloSLUXN+PQif21I15YKfofGKoVtnBSR+AkwAO7vyKxz9L
	MfjhDwRthXZ3JvuQdpcHb0/LNa2VkB8=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 74adf54c (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <regressions@lists.linux.dev>;
	Wed, 22 Mar 2023 20:20:05 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id i6so22497996ybu.8
        for <regressions@lists.linux.dev>; Wed, 22 Mar 2023 13:20:04 -0700 (PDT)
X-Gm-Message-State: AAQBX9exl9yTV8VrT+rrHZilggmvV1rsIl+XAG1Wu+jDseG9IeCTM0iI
	9+5UR5gZeNDLGKxWP1GFBuse4x+hIs+yJspt2/g=
X-Google-Smtp-Source: AKy350bWxTp/xybNZinLNHP3Psjfx3ze++rR/f/Zifi7U6qVfp5MpEnhwyDwi6qNcOLgfT72uieS4Q5S4dRvTCc87PU=
X-Received: by 2002:a05:6902:1081:b0:b21:a3b8:45cd with SMTP id
 v1-20020a056902108100b00b21a3b845cdmr765321ybu.0.1679516401893; Wed, 22 Mar
 2023 13:20:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZBruFRwt3rUVngPu@zx2c4.com> <20230322120907.2968494-1-Jason@zx2c4.com>
 <20230322124631.7p67thzeblrawsqj@orel> <1884bd96-2783-4556-bc57-8b733758baff@spud>
 <20230322192610.sad42xau33ye5ayn@orel> <2a3b08ce-5ab1-41b6-ad58-edbeff7b1acb@spud>
 <ad445951-3d13-4644-94d9-e0989cda39c3@spud>
In-Reply-To: <ad445951-3d13-4644-94d9-e0989cda39c3@spud>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 22 Mar 2023 21:19:50 +0100
X-Gmail-Original-Message-ID: <CAHmME9qEbUP7cq-iofN=ruSWhsHUva+qqavfEpNzDK_BjQVqxw@mail.gmail.com>
Message-ID: <CAHmME9qEbUP7cq-iofN=ruSWhsHUva+qqavfEpNzDK_BjQVqxw@mail.gmail.com>
Subject: Re: [PATCH] riscv: require alternatives framework when selecting FPU support
To: Conor Dooley <conor@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, regressions@leemhuis.info, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 9:05=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Wed, Mar 22, 2023 at 07:44:13PM +0000, Conor Dooley wrote:
> > On Wed, Mar 22, 2023 at 08:26:10PM +0100, Andrew Jones wrote:
> > > On Wed, Mar 22, 2023 at 03:17:13PM +0000, Conor Dooley wrote:
> > > > On Wed, Mar 22, 2023 at 01:46:31PM +0100, Andrew Jones wrote:
> >
> > > > > (It's tempting to just select RISCV_ALTERNATIVE from RISCV, but m=
aybe we
> > > > >  can defer that wedding a bit longer.)
> > > >
> > > > At that point, the config option should just go away entirely, no?
> > >
> > > Ah, yes, and that makes the idea even more attractive, as we could re=
move
> > > several ifdefs.
> >
> > I went and did the cursory check, it's not compatible with XIP_KERNEL s=
o
> > dropping the option entirely probably isn't a possibility :/
>
> What I said is only now sinking in. We're now going to be disabling FPU
> support on XIP kernels with this patch.
> Well, technically not this patch since it wouldn't have built without
> Jason's changes, but that doesn't seem like the right thing to do...

I suppose you could have riscv_has_extension_*() fall back to
something that doesn't use alternatives on XIP kernels.
