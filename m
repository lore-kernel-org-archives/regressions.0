Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192EA14F135
	for <regressions@lists.linux.dev>; Mon,  9 Sep 2024 04:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725854757; cv=none; b=lx2lmeq/ud1CLMaQm/kzvlI7ofJuGsExTgT470bJ0pAqe66XxYgwBT4cIG8s3y1LsOxc/ronzWGgPbXPwJIqEtq4LxeB0QO557GREgFZm+ECjHqLJdy9QyF33JXkzQxC6O9K67Qx6t1AFgLEBjWW6s6gLHepAHSU6dnEwkvHz/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725854757; c=relaxed/simple;
	bh=7CambRdxJl72z45osL7W3fqqVzpgMRyRPNU6hNJpNIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJRqNBvjz0jEnDPHtA8w7pF4zGrRJOifUO7Jxi4OlqhnRT8AJYZCyrdtLMujQW1oVO99x78a0RyrTXDWJ9AS6pEgLHdwroNxgujxs6shDXRkqfzYtM1unTJu7A1dr0eiIeebKfSHEfaIEx9px8Td05N8NE4HThZ6O6A/ucv43nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z5dvLl1D; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z5dvLl1D"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e1a7c25e350so3708644276.3
        for <regressions@lists.linux.dev>; Sun, 08 Sep 2024 21:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725854755; x=1726459555; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Y2XZicmIZualwCUhlDFNpSmFy2HjzR6Yh2gdcKw5gw=;
        b=Z5dvLl1DyfIcOgxbnPJgwS2IYYT0IEowhfeCW+if1MPihAdlZyA9J8jzi+u/KdWxlZ
         IOTysq6PS6pguiRqMR3hdbT6dKIkChWkmdR7640X2SCRsJ7paWw340/IoIMUDqSYLyCB
         JXxe+oBqHJTxvqzJDBMeH0NwLHEuBcVxUQaiNOl0gbcQUMmD5WboZc1yIEIBe7Z6M6FX
         q+HOxLe//X/PuIV3GoEvqNuftYTLETsOm609ydthyriNvcb4HyfkzjncGDY+VoC1tOpM
         vk15N0V9hrFTth1/VpAjHIJ+LuHci4hV2fxOHlhslyzYsZlLOPAB847t+s8VUXz/OpKq
         BzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725854755; x=1726459555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Y2XZicmIZualwCUhlDFNpSmFy2HjzR6Yh2gdcKw5gw=;
        b=JvcN5dCIIMOsjgSRF4vUXvgYcuQDFQle+RvLYw6n0GlQRnKhJtaOaouGs3TY1r9mu5
         et1a+CkJitRe3xchNdQab25cYCssnyQzvfWlVHNAdsYWEACL7fY8Km3/qIvqpsPKEPRt
         +5JP5vmBmcxs2t4pfPsxllaRpkWxRbcGBgJc0y8agEYCmqRdriryj6xTMocBH/5oFvx1
         OvR480Brq/LFdn/uEALoZxMlmRJIWbMpsrP/UVEsl3AlkWxV3zaLDxDY2I3RkfuS/II6
         Y6DDbzM71D46X53we3uobRN9DyHGSu4uB5S2mHmYB/w0KzufeUciJP1IbiELkYE01fUM
         /qfA==
X-Forwarded-Encrypted: i=1; AJvYcCW36ZeXkewBNA634vCawFG9CU/d5e2gjYIviZr4mNcI2u8dSiwIwPrwLs9q4hb6ZmsH3SxSa9N7bnYK/w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyV8HUHl1LMnRHswH6LlSDhHK4XR+bNS2QfEl1o5d6vyv0FxD+0
	/ulSxlJsmWtv7OP0KdUnZyXSE8UVlwPdQG9M8foWnuW0mj1muUadIDWEdahulqacFFvNhblIkxl
	uDfW35Durfl5I3B7oDdrVvJpCgquGdVvlNWj8
X-Google-Smtp-Source: AGHT+IEaDecNSAZTuzUTKcjIfed8c+2zGuiy9Snz3OkvQ9Wfl/mmUdiCogvvHJc2dP7/xkD/6w5lUbKgCgjZaSjV9BU=
X-Received: by 2002:a05:690c:5203:b0:6be:2044:9367 with SMTP id
 00721157ae682-6db44dc6b5fmr77199477b3.15.1725854754798; Sun, 08 Sep 2024
 21:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <89503333-86C5-4E1E-8CD8-3B882864334A@theune.cc> <2024090309-affair-smitten-1e62@gregkh>
In-Reply-To: <2024090309-affair-smitten-1e62@gregkh>
From: Willem de Bruijn <willemb@google.com>
Date: Mon, 9 Sep 2024 00:05:17 -0400
Message-ID: <CA+FuTSdqnNq1sPMOUZAtH+zZy+Fx-z3pL-DUBcVbhc0DZmRWGQ@mail.gmail.com>
Subject: Re: Follow-up to "net: drop bad gso csum_start and offset in
 virtio_net_hdr" - backport for 5.15 needed
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Christian Theune <christian@theune.cc>, regressions@lists.linux.dev, 
	stable@vger.kernel.org, netdev@vger.kernel.org, mathieu.tortuyaux@gmail.com, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 4:03=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Tue, Sep 03, 2024 at 09:37:30AM +0200, Christian Theune wrote:
> > Hi,
> >
> > the issue was so far handled in https://lore.kernel.org/regressions/Zsy=
MzW-4ee_U8NoX@eldamar.lan/T/#m390d6ef7b733149949fb329ae1abffec5cefb99b and =
https://bugzilla.kernel.org/show_bug.cgi?id=3D219129
> >
> > I haven=E2=80=99t seen any communication whether a backport for 5.15 is=
 already in progress, so I thought I=E2=80=99d follow up here.
>
> Someone needs to send a working set of patches to apply.

The following stack of patches applies cleanly to 5.15.166
(original SHA1s, git log order, so inverse of order to apply):

89add40066f9e net: drop bad gso csum_start and offset in virtio_net_hdr
9840036786d9 gso: fix dodgy bit handling for GSO_UDP_L4
fc8b2a619469 net: more strict VIRTIO_NET_HDR_GSO_UDP_L4 validation

All three are already present in 6.1.109

Please let me know if I should send that stack using git send-email,
or whether this is sufficient into to backport.

The third commit has one Fixes referencing them:

1382e3b6a350 net: change maximum number of UDP segments to 128

This simple -2/+2 line patch unfortunately cannot be backported
without conflicts without backporting non-stable feature changes.
There is a backport to 6.1.y, but that also won't apply cleanly to
5.15.166 without backporting a feature (e2a4392b61f6 "udp: introduce
udp->udp_flags"), which itself does not apply cleanly.

So simplest is probably to fix up this commit and send it using git
send-email. I can do that as part of the stack with the above 3
patches, or stand-alone if the above can be cherry-picked by SHA1.

Thanks,

    Willem
