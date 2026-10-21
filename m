Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792544771;
	b=1h1YtoLXcCEdHHamKsztFeBsnZN7K/D4eeDO9ORCjyfzokQj86rb79uTn40Mo+/dMKV+
	 oUSrLYN0ZZ3BJRdT43Ela7CR+mD3CpgM3QqkzX6Jtyfrdl2ErPkldMeFfCWkmvZDxHlPL
	 RoSI5vCypBISVfXJKS4Z/cFDTbdRFfij6m4PnDZ+Lh0OslIosUgL0OCurQsafs/hL48+W
	 oiBflKqbiUqWMiQ8+RVsw9DojF4fZY6dzzKFDR3raT+q9X6kiqtL7u4K0dg6KW6UnZoWs
	 JI/FP5++WC5IIG/TAHgw6bq/I4CDTkv/2KwPSHttW3ueooiz1RVa3SjhIHChWGJHtbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792544771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7BuIBRaFV355G0S8fL9PjcEbMxttXic2m2/XMDLcEKc=;
	b=SK6zrOcGh3szG2LpVmnF5LncFm29YfFf/et3xK0g9mAP/WyOV+mhOMODZ+9qUodk2lE4
	 tgnODyepME9LvkV7GiVxbx+Aj/qLt/xp7L45/V5MCHrd4cmZ0f2KvoJ+Gs9hOrPXW7qcg
	 8no4zDVeT+grETHvwWhvZLCIl6ct/FJIq2oAPzAc3cMThr4aJkDWTKkRYMiIA3MqJTNlI
	 iz/Aozg3c0yhKv9Ygk6xxyoyKoSgrz7gngcdXzKmWiaGDnkAwRkhK4rhvQuSm0tB4cEJg
	 J5eVrchW+ai5VYN5/VZee0pbp8GdyytaELOAOuZFDShsoCqoW4s4UqxDDDobKZBy6eA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k7DB2xpU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA434606A319
	for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 01:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA434606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k7DB2xpU
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7cc0892f92cso77619137.3
        for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 18:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792544770; cv=none;
        d=google.com; s=arc-20260327;
        b=gy58ep9o704ZKUo3qoBTD40dDW47YncLrZH0iODEd/6axUiEf3+PUFhx5NbU3et0zZ
         e0rPeegItpQx0ZMbkFDJqFDjhngL+4yPHeKC40tGdPExCVae4v4O2Y7V8D8GimNxqWsp
         oImxrNlkPGJTn2jsZyl7boKUknNsegZBc2rPgmWEPjHHalVJpBHuFZhItkX7fDrJAXrH
         7jSzR9e6PX5CVzXTlCooZhVJD4+IYjhuqF+ZD2hV8AADJgVrw74libJgiMmA0wEzFjCg
         Oax/SD8J7uXgyCnBd7cBee6T2gH7s3GA1a0LfZCg5654a0VbfBilwWzB4rMOZm4ZLCTM
         fW2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7BuIBRaFV355G0S8fL9PjcEbMxttXic2m2/XMDLcEKc=;
        fh=2mg4I+1fCqdB13yCIv44IczEFJFXWhoj+2178RiBvgg=;
        b=n1vbF7ZZhMzS2mdzoG4xVVkZmjq6Mj8BXzlO6qHUz4D5wBF8V7Yv8zlCj+hxbQnPxj
         B2LxWkI8wadt9PS9nkjVy46VX9XlKwRpqtAH4vxOmkjrKV65Bk7HIin5Q4zGaQJ/eZPw
         lRenTU2fftbt6+PunwO0QGfOQxbPkdNsghAcLoPaHueQwzzJolbe+d8esvVw1SzLMoSL
         tWgAycJFBPYzn0CFKR0cVp4gTfp+wdBmMqLXn65pTezM6Xom9LnTu6GIBrKyKFDfhTeb
         sUrcJYA0M81iaNwUIBhUZ5t07L3DXI2I6xOZA5XUCwHkgS7mDNPDjfgvTkVq+KAyoSYm
         mPRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792544770; x=1793149570; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7BuIBRaFV355G0S8fL9PjcEbMxttXic2m2/XMDLcEKc=;
        b=k7DB2xpUo9jBC1N7rnG9jIB2FYqq+nIK5DflXOnJriPwj7lRNwz7pf02h3Im4Wdg+m
         Epq70WlxmS3z2HrLsvhvM6KePFw69+LbOfpq37madvGGtB8zisJh077x9y4i985r3GHp
         8OJNFQHPiHdmHff9kxYazOdXVz11YuJJEN0Uw+8uC/LTHYUTv+1JWlByJ6MAQzTXaqZ/
         0sB3BRd4yCDWKJIEwP7dguUB/u6Cc5RlduhX4sILDWqa2cM4R0gQ2+Z2PtCQ9Vxe1Usp
         /2TiTrfDDvid7lV9ChEs3SFWJT+Yfygv2zkxzz2Ak9lZq5TrSp3CwODRyZvnp49C2U0a
         fozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792544770; x=1793149570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7BuIBRaFV355G0S8fL9PjcEbMxttXic2m2/XMDLcEKc=;
        b=26ayrrcCdd/wtC6/isdzoqy0prP9+lubFf1xg4XH1c+ac6VDRq+flePu1sg7leg6os
         TDXp+9Ucnzg4DQypme4ZB/85Lt9tl0GA1khJ8hU2aaPn8Mb7eLAYvtwIpGlGIu+9pA3n
         a7icsrbpqwAm9YwT4X1VqJPnvyhYkUWjhcwJZ50lrnthtpIw2xalsf1FX8H4z/x5gQQs
         M9xgjqwhb2NJ6eML+UBKVPXYGOx9bw6m2pD8TB9kAmrqinwVXhFTEytk4VPZrDBPzE68
         6j950b3eGUHyRngndekekSHI/P4oKSFXvt4/FWzRba+cGrj/7v7ShhlOjNHNvJG+JjEa
         uFaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOIyNG6UMQ+6BjCadf3g4yDOs13DvP6C30bVjlj7LxAZw5Gr+IMxXui1DpA5lnic8QyTNYubJYOckZbA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIrT2GJl3dCIPadFr7npJDfTSEeKStJhmDecpqANF4Ym5V4NbXd
	NVOLNZ5pu5f5oUsH5p8b6nvKNE74hZL/SWkueSFfGE2JE16xNLOCSq7QtUn4YPXGsFs+t/a8+7k
	GSYgnb87V1wxHbeN7FpZkFaQ9oRNre9E=
X-Gm-Gg: AYBFou0BEe2OPjUXzyiR/bGk89YdvayCQx4NbzG7Z81Ua09+orqTl/b9+T5S8tCuQ+T
	Vz7j5e9GikV4nSDLGW263bw2eFYpu8QBza2WfvXIddqvZF7u4MG+W+n1J5LB+EHtRakHbDTXfvH
	P4clNmoAxmG5X9Ktvmoqa53BdcZMjl2ESEsjvX22E0PDZLvHKUZ4GX+OwALOnfk5HC1QJgCT8oj
	uwhHg0Y3eGU0YXoQJ+SwtWPQCT9yedP5tEkLI/6HKiJQTFjwZQURWUfEpT+jERZ8SxcaQJCpfyR
	7QL50eRoOdXUrtVdLh5jqur+gQy576UEW8u67FJR2UJBU2KFpx2e67UTPZmK4qfXyC0WUvbfzaQ
	NqM/Aps3y9HVrGz6TaR8OghLsaGX9nw0Ik+c7YP3NqXzjsUDwxwWRdovJjDS/7mTjfpQ=
X-Received: by 2002:a05:6102:424d:b0:7c3:72b7:7fc0 with SMTP id
 ada2fe7eead31-7cc9265d04cmr248159137.13.1792544769708; Tue, 20 Oct 2026
 18:06:09 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAO+rqLhpPvY0NLrAnZjFXz0gOXnA6zsXxK8xCgtA42XUkSsAeg@mail.gmail.com>
In-Reply-To: <CAO+rqLhpPvY0NLrAnZjFXz0gOXnA6zsXxK8xCgtA42XUkSsAeg@mail.gmail.com>
From: mixalhs <mike.michalo@gmail.com>
Date: Wed, 21 Oct 2026 03:05:56 +0200
X-Gm-Features: AclHuK96Iv7sIfj-K6HeA-KwHJZMws-qCNnMG4ml62R5k6M1hxvGPFUJiD8ad3M
Message-ID: <CAO+rqLi_Bh1AFTJqp-Ddvs1Y+sxzq8ULgb_fYWmDmCM3weE_2w@mail.gmail.com>
Subject: Re: ksmbd: Kerberos login fails on 7.3 with released ksmbd-tools
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Also reproduced on the v7.3 release (c03c1a1450): ksmbd-tools 3.5.7
fails with NT_STATUS_LOGON_FAILURE, ksmbd-tools master logs in.

#regzbot introduced: a47634cd729b ^

Michalis

On Wed, Oct 21, 2026 at 2:39=E2=80=AFAM mixalhs <mike.michalo@gmail.com> wr=
ote:
>
> Hi Namjae,
>
> Kerberos session setup fails on 7.3 with the latest released
> ksmbd-tools (3.5.7), and ksmbd-tools master fails the same way on 7.2.
>
> struct ksmbd_spnego_authen_response gained a __u64 session_expiry field
> before payload[] in 7.3 (commit a47634cd729b, not in 7.2), making it
> 168 bytes; in ksmbd-tools 3.5.7 it is still 156 bytes.  ksmbd-tools
> only gained the field on master on Oct 18 (4c0ca83), after 3.5.7, and
> always sends the new layout.  ipc_validate_msg() requires
> msg_sz =3D=3D sizeof(*resp) + session_key_len + spnego_blob_len, so any
> mismatch is dropped.
>
> Tested with a local MIT KDC and smbclient --use-kerberos=3Drequired, same
> realm and user throughout:
>
>                     ksmbd-tools 3.5.7    ksmbd-tools master
>   7.2 (mainline)    login OK             NT_STATUS_INVALID_PARAMETER
>   7.3 (ksmbd-next)  NT_STATUS_LOGON_FAILURE   login OK
>
> In both failing cases ksmbd.mountd logs "Authenticated user `testuser'"
> and the kernel logs "SPNEGO_AUTHEN_REQUEST failure".  NTLM logins are
> not affected.
>
> From the code, 6.6.y, 6.12.y and 6.18.y also require the old 156-byte
> size, so a ksmbd-tools release built from master would break Kerberos
> there as well (only 7.2 tested).
>
> Would you like the kernel to accept the old response size again, with
> ksmbd-tools sending the new layout only to kernels that support it?
> I'd be more tan happy to write and test the kernel side. :)
>
> Thanks,
> Michalis
