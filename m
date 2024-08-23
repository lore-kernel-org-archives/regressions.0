Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD39746E
	for <regressions@lists.linux.dev>; Fri, 23 Aug 2024 18:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724438580; cv=none; b=t/jQw73KR8Qex48eJmghyleugZ/xOdO9GCRKiZjvMWvfYGBJkcVqrz9SgkWvchpObeVkl9hgS8ohOJ8mjuIYgs5YbIlXmpPEUqUFVT8bFKU2QVvYeUd4wGC6FeAgkmDXrc3sLKLiRP5o7V+Cdoqv+0bgu7D2oGqX44Yhi18lUso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724438580; c=relaxed/simple;
	bh=vDPsqzAoxenIzuwcubdWFxYwhXNsFjnpCK8a2v37uUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QmFCEn58M+1GLq4CN8VDZy24dqmyA4hTuTWFkOwzegPOIY8SntMGLwBcaOG9Diu501y3fs9kivcogVUwsgMIqz2oC0JVTWKh+ppBurJUhFKCAkACMquZO51V4dW5fvlChyb6og5zNomI3GsgJk9eEMKXNOEz/z1DqA/ExXPhOas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSWR8Vld; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSWR8Vld"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dff1ccdc17bso2387335276.0
        for <regressions@lists.linux.dev>; Fri, 23 Aug 2024 11:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724438578; x=1725043378; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDPsqzAoxenIzuwcubdWFxYwhXNsFjnpCK8a2v37uUA=;
        b=SSWR8VldMZC1QdqUm98buwf7ezXvcwFODGQo9zKItm8Rrz/C+wCiVXD318z8D3/1v/
         0K6AXRfcVx11inBvjZAj7/ndR7ThUf9p3F9+C7+cXiwADca2thoQI9P3gFaYEW3PEV2S
         hrZ4TB2fQwr9noLMMLTQOCEpWxPyvEDemnRRaTzgV/IQeNUcaAn1ZwtETdLmrL7keS/b
         7BnRR7ic5g765sr/JJOgxdCWFv4i9FHp+n8oGperFbB8rILn0ZoUIAo0R41331f/FT2l
         R8t9Rlfrgmk01GURNTVSi25RO18nlgmAokhMPomEnDfRIkfxNdT2u8zDRqHfOVXTGpQr
         Crjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724438578; x=1725043378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDPsqzAoxenIzuwcubdWFxYwhXNsFjnpCK8a2v37uUA=;
        b=wHGjGuj6W/6Eh+rbQ7Zet55/P4VHsXrAX4mPi6vohN1w6t852KSpJMtofpxNoD0JLV
         i94S2+9oPK5ZLD36Gnpj+VoENGssa7j8O4mFiGCtMZrWTehLVBJz/IpDXP77Qo3e9/b7
         M+hM9OttkV/iC72VfF2kYiudPwnB/y7P1Oh7k4oY9bso4lhOl7eYkWFzeI+y+8f6xqao
         nsaZDWPDFkuVV4kLKYp+VQTqE8zWXlaRrxQzfJjG1Et0D/UkkF6VWoFotZXEzMsHakNJ
         zExbqfnYFjcAH8Wf8ZzEIz+iB+m1dAtl9tY3Z0RrCSqxTKmobam8EU5uo53w1dMtd0Ug
         ASIw==
X-Forwarded-Encrypted: i=1; AJvYcCWEF2vOoEIixT5FheeAXVeOKi+EVIH3a4IOutuRCYqGQ0ITZAkZnFfJSK6qzo9OQhp+NcFAWQbXW5zWAg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyARziQM0PTg4ABx6azy4oK/30aaEsvVEAIn8FWzSkuZbgQPMGz
	449L+T8joXzf6X9g7UJzWJRBI/g+gjtouaVLRQGe5142M7kBVf2bMmaNsdM/Zkl+CK48W6mjB1V
	FClIsmM7dp72sK28WWsCeVu/yXUo=
X-Google-Smtp-Source: AGHT+IGP5XOWs22Ob+Od8cQep7S+t0IxbSv28R6vyQfhdmlVTie8ZZ9QOHt1cMUuQWZzMD4Z85T69CYO082JM6cj92s=
X-Received: by 2002:a05:6902:1501:b0:e13:c854:2a2 with SMTP id
 3f1490d57ef6-e17a83b28d3mr4049002276.11.1724438577951; Fri, 23 Aug 2024
 11:42:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <BD22A15A-9216-4FA0-82DF-C7BBF8EE642E@gmail.com>
 <6f65e3a6-5f1a-4fda-b406-17598f4a72d5@leemhuis.info> <ZsiLElTykamcYZ6J@casper.infradead.org>
 <02D2DA66-4A91-4033-8B98-ED25FC2E0CD6@gmail.com>
In-Reply-To: <02D2DA66-4A91-4033-8B98-ED25FC2E0CD6@gmail.com>
From: Takero Funaki <flintglass@gmail.com>
Date: Sat, 24 Aug 2024 03:42:47 +0900
Message-ID: <CAPpoddere2g=kkMzrxuJ1KCG=0Hg1-1v=ppg4dON9wK=pKq2uQ@mail.gmail.com>
Subject: Re: [regression] oops on heavy compilations ("kernel BUG at
 mm/zswap.c:1005!" and "Oops: invalid opcode: 0000")
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosryahmed@google.com>, 
	Nhat Pham <nphamcs@gmail.com>, Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2024=E5=B9=B48=E6=9C=8824=E6=97=A5(=E5=9C=9F) 0:07 Piotr Oniszczuk <piotr.o=
niszczuk@gmail.com>:
>
>
>
> > Wiadomo=C5=9B=C4=87 napisana przez Matthew Wilcox <willy@infradead.org>=
 w dniu 23.08.2024, o godz. 15:13:
> >
> > I wouldn't be surprised if this were dodgy ram.
>
>
> Well - that was my initial hypothesis.
>
> in fact i had few of them. Ranked (and ordered) like this:
> 1. downstream kernel patches
> 2. hw (ram) issue
> 3. kernel bug
>
> So full history was:
> -build myself archlinux 6.10.2 kernel; upgrade builder OS (only kernel; n=
othing else)
> -run normal devel process and (to my surprise) discover interrupted CI/CD=
 builds by kernel oops
> -downgrade to 6.8.2 and done 4 full builds (full takes 8..9h of constant =
12c/24/t compile). all good.
> -prepare vanilla 6.10.6 (to exclude potential downstream (ArchLinux) root=
 causes)
> -run normal devel process and still discover oops
> -make sure hw is ok by week of test with 6.8.2 (recompiling for 3 archite=
ctures on 4 OS (3 in kvm). This was almost 5 full days of 12c/24 compiling.=
 All good
> -because last steep was all good - decide to go to you :-)
>
> sure - this is possible that 6.8.2 had luck with my ram and 6.10.6 had no=
 luck=E2=80=A6.but i personally don=E2=80=99t believe this is a case=E2=80=
=A6.
>
> btw: we can go with elimination strategy.
> So what i need to change/disable to be closer to finding root cause?
> swap?
> now it is swapfile on system nvme
>
>

Hello,

I=E2=80=99m encountering a similar crash and trace in the issue I posted on=
 Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=3D219154

If this is the same issue caused by virtio_net corrupting memory, you
should be able to reproduce the crash by sending data to the VM over
virtio interface while it is actively allocating memory (e.g., using
iperf3 -s on the VM and running iperf -c from another host).

In my case, as Thorsten suggested, reverting bisected commit
f9dac92ba908 (virtio_ring: enable premapped mode regardless of
use_dma_api) along with two related commits in this series resolved
the issue:
https://lore.kernel.org/all/7774ac707743ad8ce3afeacbd4bee63ac96dd927.172361=
7902.git.mst@redhat.com/
