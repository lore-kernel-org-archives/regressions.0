Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AEC17ADE9;
	Tue, 10 Sep 2024 18:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725994109; cv=none; b=Hq3PgDqdI0jegV++qvfPXaSY39ZEJ2Lm5M5xAAq5xYWlniYWdVqaH4tAHIiGAajboAimHDFD8Mp4c9YeOy4gAininN350MhsQd6bYTifd7nXvDv5rxt+Hwvo4u1mV6FJrTbOIAUuJK/SMOCkqHDt//QXfSkF58d+xO3rQoymuD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725994109; c=relaxed/simple;
	bh=d/xjSlwYNHaCmAEJ52/LetuJr/79SrxTHSb7l1iYHbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JSnxkMKUFit29988xmBJ0YH5UBJXI9h2FU3zZBBajPzqQSKMsJDBRHVzEcul5VOiZd4tp7+mWgQKuV1mW57binE0mZx6w+h4rgH3Wa+06CQP/KJOOBO3e6NKprHYV61bpqxaZzNNpvqfNYWpm1BUabLdVxZp6aYGCKQHEQwZgx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHq1c+OK; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHq1c+OK"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6d49cec2a5dso54860667b3.3;
        Tue, 10 Sep 2024 11:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725994107; x=1726598907; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/xjSlwYNHaCmAEJ52/LetuJr/79SrxTHSb7l1iYHbQ=;
        b=eHq1c+OK6TYRN+6+4b59DpRPIKf1C6lisqY+bqL8F48UNw9jsCro3QcBDT5VxysYxp
         V5HqP6fwAQDpSveNVxobX+B6RvzqmmF71nCXUB6S1vRo5QUx3a3nK5gb0A2EdBlr5UDB
         nSSx70FvDJRypsjBkkPj62BlWHxAM6AJDjhuYlk22NwjRTnO3VkLnsSId02fyEUlGn2x
         ONhUZkSVVO12G9lstuvP3AM9nUyPvyCB8oSFvjtxi+H1gsLe4q6z6w0ztHxgrCt80pNN
         vhls3zjrYVNF8Rfq35vnXcAG0bYdfM1YMS+2TF4QI/VOTqMveswpcWPvQrO00/wHdyyp
         vn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725994107; x=1726598907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/xjSlwYNHaCmAEJ52/LetuJr/79SrxTHSb7l1iYHbQ=;
        b=sk9Ih12aTvNW6YjAp2dWmkeVwLBx/M8a9c+SJm+SSVz8YC1yy6cfiYVsCkVxc+Bxal
         zRgZ4oUmE9wm2HiQymCMCCOpDlHLVhmHSn1i1bEh0MD+lXvX8fr/AQGNJtZIDHGDaZTp
         LluU2293VkNztboe7MZOYU+EAyVAzT/FT0A27imA9O709GmoyeXOEHOs0/u0zMb7GlUr
         ogI/Mxm43h3hMRBzAf0zZ3/CMvUGFHeQYTNeijrDO/9PZ8UjIZF07F45zmZOWuctq2nt
         4AFMnxmV0CeRPbBf/eBAoX3wCr9/m0pmVwb1fmd4q5j1JxGokQmC+IB8z7VwgRlDukjc
         dWJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyF4i7rY7BFxp9wfeIxA6l1RQaN2Adi6pWVelB524UhNfPmh38P27Wh/lx9HW+X9ts0K1w9PVfsOJX/+0=@lists.linux.dev, AJvYcCXPZjRH8wev6vxQsuMjDBonG790TM2cPZkG+nSSGxCX89/VLCMPq5bbx18JcceC/N5oLMvNpFRmJOo2b9h9EzM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxEw3PyyYhLhQ2NBvRLfxjxjSHTPSeNHv+qK9kXT59Gh6IZYk5X
	vgeJOXoNTwVkbSmBj8ConeTpzYXMeiQ6qC3lpEYqwTmSv90e3Zg9xFeuYEJcRBqrE7EQGZoY93u
	q3/7wQjfmJLJNs8uqdFPzo+bukes=
X-Google-Smtp-Source: AGHT+IFAr+8UZL5HRuL9rkDVnK7n4fTwY7nIMZfqU/kfjldcZ7+fHI5Jwzd1hLqSNjwRpN6xh0YAP7kz2ZQjZ4kX+4A=
X-Received: by 2002:a05:690c:dc6:b0:6b0:52a6:6515 with SMTP id
 00721157ae682-6db44d6c4a8mr192458857b3.6.1725994106631; Tue, 10 Sep 2024
 11:48:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CALvjV29jozswRtmYxDur2TuEQ=1JSDrM+uWVHmghW3hG5Y9F+w@mail.gmail.com>
 <20240909080200.GAZt6reI9c98c9S_Xc@fat_crate.local> <SJ1PR11MB60831AF34B75030EBA3D5721FC992@SJ1PR11MB6083.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB60831AF34B75030EBA3D5721FC992@SJ1PR11MB6083.namprd11.prod.outlook.com>
From: Hugues Bruant <hugues.bruant@gmail.com>
Date: Tue, 10 Sep 2024 11:48:15 -0700
Message-ID: <CALvjV28edz1zzFeduytOMoVDyeXOKoxPiwcFp6Mbxz1ODSq17g@mail.gmail.com>
Subject: Re: [REGRESSION] soft lockup on boot starting with kernel 6.10 /
 commit 5186ba33234c9a90833f7c93ce7de80e25fac6f5
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, "stable@vger.kernel.org" <stable@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yu, Fenghua" <fenghua.yu@intel.com>, 
	"Chatre, Reinette" <reinette.chatre@intel.com>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Brian Norris <briannorris@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	"chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 9:10=E2=80=AFAM Luck, Tony <tony.luck@intel.com> wro=
te:
>
> > I have discovered a 100% reliable soft lockup on boot on my laptop:
> > Purism Librem 14, Intel Core i7-10710U, 48Gb RAM, Samsung Evo Plus 970
> > SSD, CoreBoot BIOS, grub bootloader, Arch Linux.
> >
> > The last working release is kernel 6.9.10, every release from 6.10
> > onwards reliably exhibit the issue, which, based on journalctl logs,
> > seems to be triggered somewhere in systemd-udev:
> > https://gitlab.archlinux.org/-/project/42594/uploads/04583baf22189a0a8b=
b2f8773096e013/lockup.log
> >
> > Bisect points to commit 5186ba33234c9a90833f7c93ce7de80e25fac6f5
>
> Does that Intel Core i7-10710U even execute the RDT code? Most client par=
ts
> don't support RDT. You can check if yours does by looking for "rdt_a" in
> /proc/cpuinfo.
Thanks for the suggestion. You're right, I do not see `rdt_a` in `/proc/cpu=
info`
