Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F5A482F4
	for <regressions@lists.linux.dev>; Mon, 11 Dec 2023 14:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfiERTiI"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-425a1e571f0so25345481cf.3
        for <regressions@lists.linux.dev>; Mon, 11 Dec 2023 06:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702304441; x=1702909241; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3I6cPTRKEBckLzS6mTa93tZdFjE9SWaMkbdX9OqNe4=;
        b=YfiERTiIdrKPRX6DTBRP1054gW1NOl9M7vMtjDArJOdz21kPy+VDoxJAwnNHp0ajmz
         FNE89J3GVVPJdSVZYy0l4ScPd59QIQyKNjkd4S5e/QwZbrWDhYbFpOhYRVgYvAF2rzwy
         eqQsuBTbzHEzO5rr/KBMdnVmSXzy5AiXvVGOGS9urLWyeP1Xue8lCN0V+VXK6pF9zDAc
         o+KFVuMEpsXADfJy57wiXif7R2CvfHu5mSyRpwVD+r4BZkbdaJRhxfjtSPU+z1IvolXL
         rhJRBKsc+iqxJWM0H/z1XVY1cVukxmsvUTumKi1umg35cOGVfYlX2oagwa3O5E1IfzD1
         +XYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702304441; x=1702909241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3I6cPTRKEBckLzS6mTa93tZdFjE9SWaMkbdX9OqNe4=;
        b=erTk8uKNgOX8BDnRY0p8hxY3Zdc1Xc+0Kj1rq1wZvYAWlJTO/YjaP3gY85CSRHxQwR
         Of+Nacn1aJlCLPsfh8mmEEWnMsuu1Awe1h5Xo+7t32K5TOVEsH5XHclGOWkO8UqIVfmU
         GKJ9j+jZgEc9+h6PkiA6GgMHNBjr42iiBLIdeoFLIlMYXe76GurErdf9pTPl/QE0mBO4
         qYBj9xktwTN2GHY3h/PO+LDTbEM+YuVd70CRJBOB9mgOLtVY5RUV/DzrmFGwZrqu5zu4
         jMKr+Z2QvkUDhKINDTCF5gn+382KafQF9SKDk5CIZFH1kQ1h6T6/AQi90jl3c9cZNqHa
         Pljw==
X-Gm-Message-State: AOJu0YyUUVeO7W/JwjpJisYcKpj/RW/8e/M/Qzobom2m0nrkL9BHi+uP
	8zsw6CArPy+0fM3PdnjTTcaLhW8LbA5PbkaEHMM=
X-Google-Smtp-Source: AGHT+IFfehgEX1FxRZShfIaQW0njVcZGe3XlSwh8ahjC8fDC5CdrelT7t/hTaOnLXLIl1IYUwkns+o6F+YEdwPM76rk=
X-Received: by 2002:ad4:4a07:0:b0:67a:a721:d796 with SMTP id
 m7-20020ad44a07000000b0067aa721d796mr5323783qvz.124.1702304440776; Mon, 11
 Dec 2023 06:20:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACW2H-4FpZAizkp+U1aS94V_ODn8NUd1ta27BAz_zh0wo63_rQ@mail.gmail.com>
 <CAGxU2F6C8oUY4B38y17Ti9u9QdYqQKamM+S2nofjYe5b9L1tBQ@mail.gmail.com>
In-Reply-To: <CAGxU2F6C8oUY4B38y17Ti9u9QdYqQKamM+S2nofjYe5b9L1tBQ@mail.gmail.com>
From: Simon Kaegi <simon.kaegi@gmail.com>
Date: Mon, 11 Dec 2023 09:20:29 -0500
Message-ID: <CACW2H-7xr8-kDWJ9xqzx7c1Ud3QhqL2w+BGYpjOEdnkj9_Kzhg@mail.gmail.com>
Subject: Re: [REGRESSION] vsocket timeout with kata containers agent 3.2.0 and
 kernel 6.1.63
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	Bobby Eshleman <bobby.eshleman@bytedance.com>, "David S. Miller" <davem@davemloft.net>, 
	Sasha Levin <sashal@kernel.org>, jpiotrowski@linux.microsoft.com, 
	Michael Tsirkin <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Greg, Stefano,

tldr; withdrawing the regression -- rust-vmm vsock mistake
--

We're not strictly tied to the 6.1.x tree but generally stick with the
long term releases because we patch every week or so and want less to
change if possible.

I think you're exactly right re: rust-vmm's vsock. We're using cloud
hypervisor and just tried updating to a fixed version and everything
is working as expected.
https://github.com/rust-vmm/vm-virtio/issues/204 (thanks Stefano)

Thanks all... nothing to see.
- Simon

On Mon, Dec 11, 2023 at 3:39=E2=80=AFAM Stefano Garzarella <sgarzare@redhat=
.com> wrote:
>
> On Mon, Dec 11, 2023 at 5:05=E2=80=AFAM Simon Kaegi <simon.kaegi@gmail.co=
m> wrote:
> >
> > #regzbot introduced v6.1.62..v6.1.63
> > #regzbot introduced: baddcc2c71572968cdaeee1c4ab3dc0ad90fa765
> >
> > We hit this regression when updating our guest vm kernel from 6.1.62 to
> > 6.1.63 -- bisecting, this problem was introduced
> > in baddcc2c71572968cdaeee1c4ab3dc0ad90fa765 -- virtio/vsock: replace
> > virtio_vsock_pkt with sk_buff --
> > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit=
/?h=3Dv6.1.63&id=3Dbaddcc2c71572968cdaeee1c4ab3dc0ad90fa765
> >
> > We're getting a timeout when trying to connect to the vsocket in the
> > guest VM when launching a kata containers 3.2.0 agent. We haven't done
> > much more to understand the problem at this point.
>
> It looks like the same issue described here:
> https://github.com/rust-vmm/vm-virtio/issues/204
>
> In summary that patch also contains a performance improvement, because
> by switching to sk_buffs, we can use only one descriptor for the whole
> packet (header + payload), whereas before we used two for each packet.
> Some devices (e.g. rust-vmm's vsock) mistakenly always expect 2
> descriptors, but this is a violation of the VIRTIO specification.
>
> Which device are you using?
>
> Can you confirm that your device conforms to the specification?
>
> Stefano
>
> >
> > We can reproduce 100% of the time but don't currently have a simple
> > reproducer as the problem was found in our build service which uses
> > kata-containers (with cloud-hypervisor).
> >
> > We have not checked the mainline as we currently are tied to 6.1.x.
> >
> > -Simon
> >
>
