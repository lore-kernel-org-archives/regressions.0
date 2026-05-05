Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3432578F4A
	for <regressions@lists.linux.dev>; Tue,  5 May 2026 00:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777942611; cv=pass; b=svdwrKM2t877Kw9VG6BEveNusWnybc7P+huaSEtQKGe5XkbUQIpmTBA2NaNgDBiLbr23G+xrjg9XNz7VLeBIBEBpWgm/VbxpqQrHCJocH5G3hcxfexeCFA5uZ0eO00lK0ZA8JVAZ8bl69JP1xEep1HoDMCQEH4KjWfFqSpz89BY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777942611; c=relaxed/simple;
	bh=IeCugNOF/0VrIrRyZUIejh0Dfm8yCouMQlcG/pruqFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=grZTKh51gkNr2YS/YvQm5yv5PKrKmHfCravnMbpKQXf6UoAIWgS3cqxjTd5OJ6v6QiZb/3zFrSjStAOv1kpHdATOZw4YK4JWFbb6yCulFBfIqOMAhGyzu2ZSbaZruCGP3qEQhGVvN+FpHCYuDBLxAsR11vGgDL2qmKb9hiRMteo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZGDz3cw; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZGDz3cw"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67c4aaf76ecso2972403a12.3
        for <regressions@lists.linux.dev>; Mon, 04 May 2026 17:56:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777942608; cv=none;
        d=google.com; s=arc-20240605;
        b=gbyGl8cGva25CmELQXjgMdBpDK2Uv7pBagDWtOCge47EVL1AgDC6Ny6nDT9/clolOB
         b6rEVbiXqKpZvn7goWM9UgL4DcyyB2MlXmppWmao4QmOhXauBN4qttv4AmQDrDai9fj4
         dToXz78pbgb7Qacl3iGiw5Y3+tVC1wiF15Tuvfwbdc0t37uCEszkhj+JOEs2wH2g2rVH
         yoH9yqXpLF48ItVEHAOQVqdzTsrkDyyk4jDdXNbw1LqItXXHJgyKJGGv2a+bhJ3GvUsh
         M91em2jggjwvPO7VVkpKZHZKsBIMo+4uMMoxA5HFCtRgi+f0mFIb4GJfXHeqzWwnqSSW
         xKVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z9uROoH6g0nKwqBk6jm0NS5lhsKYzLExzLhwk9caFeM=;
        fh=9gBHORKGdFEgPPWVp3cgPSu0uBfmOUViB59QFwbLFgI=;
        b=RozPnXdC/2ESeVnt7tQOH2e+s6k0RRQhHxt+C0lQrV8vyJlIE0uY1E03qQYiQNqDIt
         mUNwFQ9QJxdpIWtR4+wF1WJ4abt/MY/yXYvKHIzyDFji7SN5Axd84EKNR4u2HlJTyrQe
         1uTlLqhFr03GCBXj4UhbPLvxHdCbs6s3o3z1F1zsJ4iOkY+cu3EyISGcBy6S8RQz7n3g
         aqBSPMdvrkw/m9aC/RHQPbMHzFyMkHBVp5OBPQV1b7pSMAQb3w9A4F/Tnb+5frh0Ok8p
         O2dr2NK8JT5aNhuta/v19T41Jq+WNuiY/g0Bg5FRAwnOPNDOtmfU12HTpt/2nwohx/Y+
         kZWg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777942608; x=1778547408; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9uROoH6g0nKwqBk6jm0NS5lhsKYzLExzLhwk9caFeM=;
        b=YZGDz3cw4YTk101P//Vjg8D+aHVPM+FWiPEew5hw+rcfSiMDu8D7DJaJ2O+hU2ER5v
         8VynfqIsuuXuo4D2WSKQZxkQE5GrqCihOx+/CpPK7oFjYyf60Y61Jew+Cw4dNHGRCOjQ
         I+IUdTSzZS4628cN5h+9HjLeqXD6RwXTzo1TUn9ptmcajo3rwGP0mH6NqC4eU5u/m3Le
         wILHT80wzSLMqLbe1lncnx/evcRtrBO1BH5zqzk+U/ZMG+gv8oGAkZ9IBYHYUCxDZ22g
         y6UKE5dSj3ICdVlDiFUFG7WCQvzY0uplDDFP79WJ+JXZ2S0A2y+duE6mJyAa1A70+snr
         Y6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777942608; x=1778547408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z9uROoH6g0nKwqBk6jm0NS5lhsKYzLExzLhwk9caFeM=;
        b=Y8UFlL4+QOAek5OpV2DvkfPLd2m8qfKwxGFeyW5O7hCl3S2rknpncmMmHBfiGkH73x
         2+CHEakxTFZ0NfcL3y1wc4gxRr0BRMSuUpWXj13JK6izl9NNj83HJn/LQyQhQazYivch
         q42QQOhaqjUis2MLE2EW1DhBvnRzJt/uAzkTGkuqcznSDuVL7Lg9jROE5KUN/K+30ywc
         oGF0F/qTggpV30YqXbpxfF7JMP0CYIfw656RVvaayNgglYaaaOjhb8cW65Sid8XEgPa4
         oqBlYHkVv0ebODofGc46t+BHp4Hyqq62+KVHlds8xWZayqlac9f2Xo7hQFCUq2SFDfaX
         46SQ==
X-Forwarded-Encrypted: i=1; AFNElJ8W0iCvMajllWr/XTXavuyfd/fCWGLe3FrSsf2Q36irhyUcw0ClGLa3gGziI5QTyTDcsPLEsjDcTVlF3g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxbp78oIKbXz3hIOUjNuJ32wFdVp4BihEcHuL/dUXNv7vkL0F/Q
	GhbnIb//16Mf9Je25iQo44Xw44vaplmktZBCeFpUixunzmEItylUBi2nuizSTT8r7blOcahb41y
	RVl2JLfvlj6fXutvkrYHN4JqfC63q10Y=
X-Gm-Gg: AeBDiesqzD+1v/TIVDZAVJGR0ns4/QAwJ90mD+eNo9y6wXFnhNS35rvMqAyWkJVOnCf
	IX1V5uLcUyvOq0at3hW67rR3exdqjsi7kquUmXcqtZPb8Q/m7N73OWivWZloYCTCtcT7a49CPiY
	ZbbvtAfMypNx10FY2KSgVUbHR7X+bbQQIDZXdS2NELLW8QBMam8iwVkATuJVewzTHN509qgRETW
	z1RMM3CyUzqeXqZjEyZRC4prBcrhiJnJv5LZb6+WK7QGvlcF44CyPRz4zNPzcflrzVhSj3f6rp0
	Lft8bjQMmNItpw+MAe2H1JqESoT0MxnnWCjlATU+tOqMU4/t48xdOfXJbelpGxLb0jdoKZtBQ2q
	3gYHJdl4+JV5ot6siYZSeZkg7+7XgqQnu+v940/rvqhvb08zVEzwUqPWH3doQ1E4cWqC2
X-Received: by 2002:a05:6402:796:b0:678:a507:e837 with SMTP id
 4fb4d7f45d1cf-67c17e27044mr3972403a12.1.1777942608385; Mon, 04 May 2026
 17:56:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <177793914437.2560.9287713196857718000@997d03828cfd> <0a8be4da-73f4-42cc-b026-c3ac031f3268@infradead.org>
In-Reply-To: <0a8be4da-73f4-42cc-b026-c3ac031f3268@infradead.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 4 May 2026 17:56:35 -0700
X-Gm-Features: AVHnY4IKrnDSsi15lQasC7pxxX_wLSKZMiIfF54CrEwOmOtvnCw9EXINHRwtjj0
Message-ID: <CAKxU2N9WxA9tg0EqDQ0bzxpB79Sa+zh7HgGs_u-witFcuCsQew@mail.gmail.com>
Subject: Re: [REGRESSION] next/master: (build) variable 'num_ports' is
 uninitialized when used here [-Werror,-Wun...
To: Randy Dunlap <rdunlap@infradead.org>
Cc: kernelci@lists.linux.dev, kernelci-results@groups.io, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, regressions@lists.linux.dev, 
	gus@collabora.com, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 5:18=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
> [add more people/list]
>
> commit 8bdb0b3830ea
> Author: Rosen Penev <rosenp@gmail.com>
> Date:   Fri Apr 24 18:42:01 2026 -0700
>     usb: typec: intel_pmc_mux: combine kzalloc + kcalloc
>
>
> On 5/4/26 4:59 PM, KernelCI bot wrote:
> >
> >
> >
> >
> > Hello,
> >
> > New build issue found on next/master:
> >
> > ---
> >  variable 'num_ports' is uninitialized when used here [-Werror,-Wuninit=
ialized] in drivers/usb/typec/mux/intel_pmc_mux.o (drivers/usb/typec/mux/in=
tel_pmc_mux.c) [logspec:kbuild,kbuild.compiler.error]
> > ---
> >
> > - dashboard: https://d.kernelci.org/i/maestro:4c562376c15477320ad9a138b=
83a5256431b57cb
> > - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git
> > - commit HEAD:  9d0d467c3572e93c5faa2e5906a8bbcd70b24efd
> > - tags: next-20260504
> >
> > Please include the KernelCI tag when submitting a fix:
> >
> > Reported-by: kernelci.org bot <bot@kernelci.org>
> >
> >
> > Log excerpt:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > /tmp/kci/linux/drivers/usb/typec/mux/intel_pmc_mux.c:740:3: error: vari=
able 'num_ports' is uninitialized when used here [-Werror,-Wuninitialized]
> >   740 |                 num_ports++;
> >       |                 ^~~~~~~~~
> > /tmp/kci/linux/drivers/usb/typec/mux/intel_pmc_mux.c:735:14: note: init=
ialize the variable 'num_ports' to silence this warning
> >   735 |         u8 num_ports;
> >       |                     ^
> >       |                      =3D '\0'
That =3D 0 is correct and was an oversight on my part. The original code
initialized to 0 because of kzalloc.
> > 1 error generated.
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >
> >
> > # Builds where the incident occurred:
> >
> > ## x86_64_defconfig+kselftest+x86-board on (x86_64):
> > - compiler: clang-21
> > - config: None
> > - dashboard: https://d.kernelci.org/build/maestro:69f922810e4ee292cbd1a=
001
> >
> >
> > #kernelci issue maestro:4c562376c15477320ad9a138b83a5256431b57cb
> >
> > --
> > This is an experimental report format. Please send feedback in!
> > Talk to us at kernelci@lists.linux.dev
> >
> > Made with love by the KernelCI team - https://kernelci.org
> >
>
> --
> ~Randy
>
