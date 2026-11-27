Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795794558;
	b=YEjIKFueUNoPjpdg25MNFDGHjbe7eREUVM9hRsEcyif3Gz8CZQs87sB3FMjtq4eT+53I
	 n0uI18atSlnvOCkUM8DVY7jbyOLsPoG/+Li369K34/9o2BldjtI5PbYaYIYdOygRq7Me3
	 txPQKZF29XOCRuMyjnijkg25c9bguiuz29JjNw8XJk7Eta2+j8JaZZa8DhL0nZdeupGoC
	 SjQWP2g4OEV3AJ1v/DZoyaXMK7ZEZGgz6UkUi8iCGeNML/Tv5NZFgkoEqNFs6ro7UHKsl
	 Fv9C8sLz6bw1ihxpIG0h0GyXgrS0MOejEMLEH3EKsq65A4OYk5pvv58GG/ZlowKQM7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pm/8tep73L9V4TMW2Ch55CTSshK2JxETa/tNsbYXksY=;
	b=jORvmOH21unlzXn5OxfFwvT7gd7/1jKNsDeX8hJYNvt9wOIakVRl2mva//aE7vesoVOA
	 Xhc0kqHgZOZfvn4lq0y9RRRmvdzZEBylGni+I8iN+Z5Ge/LQdt8zT3LKvXdzuJZhKkF1Z
	 AXQjz6ccOAlw8IdSQ8MzoZWUOxe4G2KN0H3alxzESE0xYKAmLLvVYJemtp+aT6alDTib3
	 kYCDIJn963XZ3lqF/OtaNVTvqSrY4jici6PJH0GMREI4NPqBY/HeXM5Lg6bRC8yBfHfcg
	 eSuUXkJrzlX5nESvKlrkF60RetEM7qUI/ytZITjfjLwUo7KzFSKQrNIA3ObR/HFTcyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E9UhvXUS;
	arc=fail smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FCC606A31E
	for <regressions@lists.linux.dev>; Fri, 27 Nov 2026 15:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66FCC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E9UhvXUS
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-55c5b6584ceso60214941cf.2
        for <regressions@lists.linux.dev>; Fri, 27 Nov 2026 07:49:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795794557; cv=none;
        d=google.com; s=arc-20260327;
        b=KQ9S+YMclvKJPFDRkIYFB2MJUyrALSO8v8iwgodCmq8p011oyYgOOPwliKUyZEeo6S
         u4TS8YlG5Gp7dUdIY/yxBouVdVPBWkEIsqHpv/D75mPI6rrJm3eZLRIuJ5dcz3SLfxef
         GUnS/4zpLEOi7G4RJ9rpQ8+0G4d5YIoPnhv3iof1L+kkMt6TBLjSzclkTdUB9qrHIqWp
         /xfRUccB8K6QRlofPFd9m14h0ZZfbdA0JIBNzwPI1PsrPnPXRR6iu4aiRv1EZci13KGf
         e5uoqvywpwTTAAS+DmqA5xdj6rzlGeyuqrJI/B9jj4Dp3tVZd/XQfCz9cFmGg9TTOAC1
         TetA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pm/8tep73L9V4TMW2Ch55CTSshK2JxETa/tNsbYXksY=;
        fh=QASMwmca5nD9zXFzXjpqMhu1sJwYYZTDVn+r+YHbGSs=;
        b=exvyrkiHTLTqHMewe2cr7RNWNw4aq/caKlbOqqoRRDC2P2wd5LljwasZG4h+k+4DK0
         ZTK39z3lOZxIcRaIYvxkjKYlUorZ4lRpMFyHteP4RQimAJN3QLqeMfcIDyu1Pxf0QNY4
         U6rdKKloxKvXXZLJ6ZF5QQ3uHAff3qUm8PAxn1pKbewAAKVaKS2deICtZ7xfXi79NNok
         PIM8CH2M3qAL7GygWEakMthyJfxTWIaY/yCvK8DDnQyayuqHcYmXK2ctaDps9fRD73bW
         eW734iRDZdF8RCaeuR63SEcMennOXB+xFKPfjXpYCb3PVbz+Ea0yYQ12+DRUGIWnElow
         ZE6Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795794557; x=1796399357; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pm/8tep73L9V4TMW2Ch55CTSshK2JxETa/tNsbYXksY=;
        b=E9UhvXUS+uvLG4YB50GFMium22LZANKyb7ApIvEs0hmIFfIo6+AxAYCC8nMZlr3tjH
         QZtMRPKpzfW+pfIK0XMlzm7x2zLqOMUAqsFIQU0uTJd+r2Vaoi0nNwoQaPTnurmvPMaF
         vNWCfkeX/lsurGxqOU+KUx688LZvO8gogKdRe0HLYW99N/GAKM0W0KZtZc9gCA1uPUgg
         4DuPFOOabAlzsVYKvXOcfTkHBtyDGxZ0XdywYGPNeZUfy4a4KE9+riC9yj0o5wPhusJU
         DRLZemz8AvSrwtV8HXIxsJF1QPyF7LRwldvLwQqN1bpEUYfY1orPM/URWdSDNEyjSDbx
         /W3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794557; x=1796399357;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pm/8tep73L9V4TMW2Ch55CTSshK2JxETa/tNsbYXksY=;
        b=B4JwUzPGAsAycmpFWVlHBvDiijgW6AYbs/Hntbi0zVSi+MJJaApEWnvJZ1y1l49WrQ
         pptn2Rq81whp5TVlcMLA5fSLEyun0luMdOKLFRL7atONLAlvKH6INYBv/QUqvuF0fejI
         lGtW3+HzXQBltnqsI+dWQ6TlEVSC7ifxmIuQYB41eKWIMgu1ArryziPgvyJDGfjW9j11
         Zwnat2sFoDTuQdbQWuRwc8GDigzSMDkwFBQEe+jGV+t+0FFjA5Z4HThz8wx8kSRyDKvE
         luH6AR2f+P3xheuLRqw7rJMCBKPAz3y/RPbWKRqU6dv/9sq7+WggZxDstN2GdFuXjOkG
         5OQA==
X-Forwarded-Encrypted: i=1; AL+hErFh9gdlP1JLl/RdGMgAe74tUw+CzFsU7uc+lDi4WFY+DPKgiSBbJYF6RWbrkvcYUhxlUGmfJWgaIOzRUw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8QmLnH33/T69+ZwyRUaF6vi8cRfEoqdMGpzRjlctLnHXrUXfI1
	FrsiRXkbOpb0icAI/aa+ewIc045xsMEnD3DJSBOhEmrCePDy5bXKGSbI4ArBXEM6iXBSoMh375j
	n56mOv8T4vy/WtNVzjMR0HS7jMuFdJOU=
X-Gm-Gg: AZFdTZeOhWgGyV9Zs/XFXB2zCh80L93ZZmK8m3lQZs+SGXQHax9G2VTKExM4dglS/RS
	FlpT60mXPTXCtsW1KrwLikKyvwOhNx9UoXC2ZqhURyj6Tl0LKQlPKlcVgfR3GPpyT88RYWjzeC5
	UYR+6e5loehrtcTXOi2VeGj4KzWAmBrmpj67l+M4Er8vJjQFnA246wlRyVMR/desakHUKeXfuwC
	JL6Qc7V1FE+BZmQbuzfFq3VNEocgbY1jEx2eVfEbQHggDwlehkodA3VknN6+U5Q7NyrbYBSt02u
	VjOYoBOuXyb/iv+uck8gxd+D2DnqEYdpD3cGVCRMt/IQBDEWA4J6t3VO3csI54apCKU0JM9yFES
	Ha0kTHOawlrsm4sEMhnalzazHq4vKeAghOu7Dr0cejQ69ijOSPqXmYecLFUA6Ma2z5mI/uUhWpl
	SPmkvftYO4M04UFJmX0v4U4Qo2yH+WO2g8MkrzSRJEzwu6kUG5GBXOzAD7Onie2IvFYY5/K+LBW
	gLtITENJz2wlwpt2tqgLr2aMapDH1/Tog==
X-Received: by 2002:ac8:5754:0:b0:535:a5fa:edff with SMTP id
 d75a77b69052e-55d76a59807mr476389711cf.63.1795794557235; Fri, 27 Nov 2026
 07:49:17 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261126031506.165973-1-kaynak.oguzhan0@gmail.com> <awkzEjrVEz2jB1Ma@z790sl>
In-Reply-To: <awkzEjrVEz2jB1Ma@z790sl>
From: =?UTF-8?Q?O=C4=9Fuzhan_Kaynak?= <kaynak.oguzhan0@gmail.com>
Date: Fri, 27 Nov 2026 18:49:05 +0300
X-Gm-Features: Aa3M54oG8qNSkma9SYEe5bEWuLV762AYfcjKVO9GWl8LUMyf097tEckGvgVUriY
Message-ID: <CAAKAQ7KpM5hT-Q0mdJr-0VnHy1DeFBoODjYM-FCoXiS+5DW+cA@mail.gmail.com>
Subject: Re: [PATCH] ntb: ntb_tool: accept hexadecimal addresses in
 peer_mw_trans again
To: Koichiro Den <den@valinux.co.jp>
Cc: Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>, 
	Allen Hubbe <allenbh@gmail.com>, ntb@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, regressions@lists.linux.dev, 
	yangqixiao <yangqixiao@inspur.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Koichiro Den <den@valinux.co.jp>, 27 Kas 2026 Cum, 11:01 tarihinde =C5=9Fun=
u yazd=C4=B1:
>
> On Thu, Nov 26, 2026 at 06:15:06AM +0300, Oguzhan KAYNAK wrote:
> > -     n =3D sscanf(buf, "%llu:%zu", &addr, &wsize);
> > +     n =3D sscanf(buf, "%lli:%zu", &addr, &wsize);
>
> Just to clarify, do we have any rule about negative values for the addres=
s part,
> like in "-1:4096"? 21fbdc4d0b1e mentions "-1" as a possible input for the=
 size
> part, but doesn't mention it for the address part. (For either part, "-1"=
 is
> really odd, but that's not the point.) As you mention, your patch starts
> accepting it for the address part again. Perhaps we should keep rejecting=
 it
> there?
>
> If so, to cover the cases broguht up so far, perhaps it would be an optio=
n to
> split the input at ":" with strsep() and use kstrtou64() with base 0 for =
the
> address?

Good point, thanks. A negative address was rejected before my patch,
so it should stay that way. v2 does what you suggested: strsep() at ':'
and kstrtou64() with base 0 for the address. I did not carry your
Reviewed-by over, since the code changed.

v2: https://lore.kernel.org/all/20261127154157.3541-1-kaynak.oguzhan0@gmail=
.com/

Oguzhan
